// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "myProject",
    platforms: [
       .macOS(.v11)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor", from: "4.34.0"),
        //.package(url: "https://github.com/vapor/leaf", from: "4.0.0"),
        .package(url: "https://github.com/tib/leaf", from: "4.0.0-rc"),
        .package(url: "https://github.com/vapor/fluent", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent-sqlite-driver", from: "4.0.0"),
        .package(url: "https://github.com/binarybirds/liquid", from: "1.1.0"),
        .package(url: "https://github.com/binarybirds/liquid-local-driver", from: "1.1.0"),
        .package(url: "https://github.com/lukaskubanek/LoremSwiftum", from: "2.2.1"),
        .package(name: "MyProjectApi", path: "../MyProjectApi"),
    ],
    targets: [
        .target(name: "App", dependencies: [
            .product(name: "Leaf", package: "leaf"),
            .product(name: "Fluent", package: "fluent"),
            .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
            .product(name: "Liquid", package: "liquid"),
            .product(name: "LiquidLocalDriver", package: "liquid-local-driver"),
            .product(name: "LoremSwiftum", package: "LoremSwiftum"),
            .product(name: "MyProjectApi", package: "MyProjectApi"),
            .product(name: "Vapor", package: "vapor"),
        ],
        exclude: [
            "Modules/Blog/Views",
            "Modules/Frontend/Views",
            "Modules/User/Views",
            "Modules/Admin/Views",
        ]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor"),
        ])
    ]
)
