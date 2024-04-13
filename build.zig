const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const static_library = b.addStaticLibrary(.{
        .name = "static_library",
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(static_library);

    static_library.installHeader(.{ .path = "lib/zstd.h" }, "zstd.h");
    static_library.installHeader(.{ .path = "lib/zdict.h" }, "zdict.h");
    static_library.installHeader(.{ .path = "lib/zstd_errors.h" }, "zstd_errors.h");

    static_library.addCSourceFiles(.{
        .files = &.{
            "lib/compress/zstd_compress_superblock.c",
            "lib/compress/zstdmt_compress.c",
            "lib/compress/zstd_double_fast.c",
            "lib/compress/zstd_fast.c",
            "lib/compress/zstd_compress_sequences.c",
            "lib/compress/zstd_ldm.c",
            "lib/compress/hist.c",
            "lib/compress/zstd_compress.c",
            "lib/compress/zstd_lazy.c",
            "lib/compress/zstd_compress_literals.c",
            "lib/compress/huf_compress.c",
            "lib/compress/zstd_opt.c",
            "lib/compress/fse_compress.c",

            "lib/dictBuilder/cover.c",
            "lib/dictBuilder/divsufsort.c",
            "lib/dictBuilder/fastcover.c",
            "lib/dictBuilder/zdict.c",

            "lib/decompress/zstd_ddict.c",
            "lib/decompress/huf_decompress.c",
            "lib/decompress/zstd_decompress.c",
            "lib/decompress/zstd_decompress_block.c",

            "lib/common/entropy_common.c",
            "lib/common/fse_decompress.c",
            "lib/common/debug.c",
            "lib/common/xxhash.c",
            "lib/common/pool.c",
            "lib/common/threading.c",
            "lib/common/zstd_common.c",
            "lib/common/error_private.c",
        },
    });
}
