Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.39642.1629210785729805054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 07:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SCtBn9JU;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id h24-20020a1ccc180000b029022e0571d1a0so2285263wmb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 07:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VSCdG9n2WOZVBpd/Yp70gPqSnXbZMiS3JvMgXxJ36/I=;
        b=SCtBn9JUVrr+Wc8PNXHVHPOOcYcu9xlAG/GctIzm3uPYRupZiVXPnQcvFfN0dvcDqc
         MFyCe8EOrbdv8Eaf0I3/JzUUAAeLNy/9TPFW6k9GdDTtD4U+1cCDe+2IInzlNOekmcev
         M4UHLamEC/YFuiD6myLmMIffsMcrS6p0L8hVv7c1ZegPZjhkjuRHdWDeSYxPsO0j9/JG
         dDsRs+TrOh9EZURI8d0Wdr5fYnXgtH7Z5xuSEflZxYtwJT+TQNG1AXCjMw2FQmxq7S+n
         3zAFU6FV77uDyJZ2wkxLBQ3ghgKu8B3x23r4BRBNqhLE4ZoQIYj91RzpoKxvBs2TcZax
         Xcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VSCdG9n2WOZVBpd/Yp70gPqSnXbZMiS3JvMgXxJ36/I=;
        b=RHEJasRAuBeX3IcPLgeXiXoArkwlNUQDMQDnuFgWQvhmrHKKIceWJ0wMCO8FB3yzqO
         jiMOQvJQOUBsvfhRly9Pz/X8pxlXUTbPoMGBCRCyYW1dUT5VpXZOphCsQ9CaJ/ca9/jQ
         3k3zi15kMmIDU5nnwzCCG+ObrvHqgoTzrDmBe6sjYPlgZjmgn6Rfz/PB9RzFMKLBaOTj
         G3MFPIYO5YTQYAW+NWhfqUdCoWsx1TL2OxK7MNj8hJMc36mmIAJyfiFV/macKpChUmUx
         baDwkjANPKwNTef8nZ2RiHLc4GcLmsIRH+TJQzU2T1PigOeRFwk4KMMuy/KAM4YrOyiI
         t5ag==
X-Gm-Message-State: AOAM531SHO6SLBzASSjrSmkcYQjfkIxCrqdkT3eMaCeOlNl3a5Hxlx5R
	qLO+eum0W+/hDq83t6eIJFedTqBD6qw=
X-Google-Smtp-Source: ABdhPJzi1UYbxYJDiGgmfd24g9QFu9ua7kWMLG9W0yOXvtbuRPH0AP2fY+xyvknv3PD2OgWTzyyymQ==
X-Received: by 2002:a05:600c:2f8f:: with SMTP id t15mr3780855wmn.114.1629210783902;
        Tue, 17 Aug 2021 07:33:03 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f36922767bcc991e678b398.dip0.t-ipconnect.de. [2003:f0:7f36:9227:67bc:c991:e678:b398])
        by smtp.gmail.com with ESMTPSA id l18sm2799779wmc.30.2021.08.17.07.33.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 07:33:03 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] mesa: upgrade 21.1.5 -> 21.1.7
Date: Tue, 17 Aug 2021 16:32:54 +0200
Message-Id: <20210817143255.2529848-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Joshua's vc4/v3d/dma-patch was applied in 21.1.7

Release notes 21.1.7:

Bug fixes
    Miscompilation of a switch case
    [radeonsi][regression] CPU is being used ~10 times more than usual after c5478f9067f.
    dEQP-VK.wsi.android.swapchain.create#image_swapchain_create_info crash on Android R
    The image is distorted while use iGPU(Intel GPU) rendering and output via dGPU (AMD GPU)
    lima: regression in plbu scissors cmd
    Incorrect rendering
Changes
    pan/bi: Restrict swizzles on same cycle temporaries
    nir/lower_mediump_io: Don’t remap base unless needed
    nir/lower_mediump: Fix metadata in all passes
    util/fossilize_db: Update parsed_offset correctly.
    util/fossilize_db: Reset file position to parsed_offset on cache_offset read failure.
    util/fossilize_db: Flush files after header write.
    util/fossilize_db: Be conservative about header length check for locking.
    util/fossilize_db: Only allocate entries after full read.
    util/fossilize_db: Use uint64_t for file size.
    util/fossilize_db: Unlock the cache file if the entry already exists.
    util/fossilize_db: Add extra flock mutex.
    radv: Allocate space for inline push constants.
    vulkan/wsi/x11: do not inherit last_present_mode
    ir3: Preserve gl_ViewportIndex in the binning shader
    teximage: return correct desktop GL error for compressedteximage
    intel/fs: restrict max push length on older GPUs to a smaller amount
    virgl: disable anisotropic filtering.
    freedreno/ir3: Add build id to the disassembler test
    .pick_status.json: Update to 7055282231cdad23e7b23fb49a2f953a99797f8a
    .pick_status.json: Update to 2f06642b06c94f07f4bfe3df32b25659428c9144
    .pick_status.json: Mark 6ccf11ac2b951963407601b5b1109b45a972e48e as denominated
    .pick_status.json: Update to 2f06642b06c94f07f4bfe3df32b25659428c9144
    .pick_status.json: Update to 353e6323936b812884fa677c25bdba91554881b7
    .pick_status.json: Update to 4128acdee32eadfef1fb8c3c3ce2e512a267cdf4
    pick-ui: drop assert that optional argument is passed
    pick-ui: show nomination type in the UI
    pick-ui: show commit date
    lima: avoid crash with negative viewport values
    zink: make codegen compatible with python 3.5
    mesa/main: Check for fbo attachments when importing EGL images to textures
    v3d, vc4: Fix dmabuf import for non-scanout buffers
    gallium/hud: initialize query
    nv30: fix emulated vertex index buffers
    gallium: Reset {d,r}Priv in dri_unbind_context
    loader/dri3: create linear buffer with scanout support
    anv: fix submission batching with perf queries
    anv: don’t try to access Android swapchains
    renderonly: don’t complain when GPU import fails
    etnaviv: always try to create KMS side handles for imported resources
    glsl: evaluate switch expression once
    zink: use array size in spirv bo length calculations
    etnaviv: fix gbm_bo_get_handle_for_plane for multiplanar images
    clover/spirv: Properly size 3-component vector args
    clover/nir: Set constant buffer pointer size to host
    gallium/va: don’t use key=NULL in hash tables
    amd/registers: fix fields conflict detection
    radeonsi: don’t create an infinite number of variants
    nir/algebraic: fix imod by negative power-of-two
    radv: fix selecting the first active CU when profiling with SQTT
    etnaviv: fix renderonly check in etna_resource_alloc
    etnaviv: fail in get_handle(TYPE_KMS) without a scanout resource
    freedreno: fail in get_handle(TYPE_KMS) without a scanout resource
    panfrost: fail in get_handle(TYPE_KMS) without a scanout resource
    lima: fail in get_handle(TYPE_KMS) without a scanout resource
    nine: Fix assert in tx_src_param
    intel/compiler: make sure swizzle is applied to if condition
    glsl: Add operator for .length() method on implicitly-sized arrays
    glsl: Properly handle .length() of an unsized array
    gallium/vl: don’t leak fd in vl_dri3_screen_create

Release notes 21.1.6:

Bug fixes
    [RADV] FSR in Resident Evil: Village looks very pixelated on Polaris
    Crash in update_buffers after closing KDE “splash screen” downloader
    Crash in update_buffers after closing KDE “splash screen” downloader
    radeonsi: persistent, read-only buffer maps are slow to read
    substance painter flickering with jagged texture and masks shown black
    radv: FP16 mode in FidelityFX FSR doesn’t look right
    [RADV] Blocky corruption in Scarlet Nexus and vkd3d-proton 2.4
    Radeon RX580 and 5700 XT: Reloading ARB assembly shaders causes very glitchy rendering

Changes
    targets/graw-xlib: Add missing dep_x11
    egl/surfaceless: try kms_swrast before swrast
    meson: allow egl_native_platform to be specified
    freedreno/computerator: Fix local_size typo
    aco/optimizer: ensure to not erase high bits when propagating packed constants
    egl/wayland: Error on invalid native window
    egl/wayland: Allow EGLSurface to outlive wl_egl_window
    softpipe/aniso: move DDQ calculation to after scaling.
    llvmpipe: add support for time elapsed queries.
    .pick_status.json: Mark a9c9a9938d6d2ead6f08ccf5256c95801fbc864f as backported
    .pick_status.json: Update to 376fb4f55f080929df8ca5a2a975fc88a00eec06
    .pick_status.json: Update to 1d6c790f9f6c373e667de955822b1048c7073ba3
    .pick_status.json: Update to 73262d4bd4a4637a332264a165c62ce3209d03fb
    zink: remove duplicate format-mapping on little-endian
    vulkan: do not map zero-sized region of memory
    vulkan: allocate host-visible memory for swapchain images
    nir/gcm: Clear out pass_flags before starting
    iris: Re-emit MEDIA_VFE_STATE for variable group size shaders
    anv: Handle errors properly in anv_i915_query
    v3d/driconf: Expose non-MSAA texture limits for mutter and gnome-shell
    lavapipe: Use common Vulkan format helpers
    broadcom/compiler: emit TMU flush before a jump
    nv50/ir/nir: fix smem size for GL
    radeonsi: don’t expose no-attachment MSAA 16x on all 1 RB chips due to issues
    st/mesa: always use PIPE_USAGE_STAGING for GL_MAP_READ_BIT usage
    egl/android: include “util/compiler.h” for FALLTHROUGH macro
    util/foz: stop crashing on destroy if prepare hasn’t been called
    radeonsi: Check aux_context on si_destroy_screen()
    mesa: clear shader_info::is_lowered in prog_to_nir
    mesa: fix bindless uniform samplers update
    aco: don’t create v_madmk_f32/v_madak_f32 from v_fma_legacy_f16
    freedreno/ir3: Don’t force RTNE if rounding mode is undefined
    radv: only init the TC-compat ZRANGE metadata for the depth aspect
    glsl: replace some C++ code with C
    util: add workaround for Full Bore
    glsl: relax rule on varying matching for shaders older than 4.20
    lima: handle fp16 vertex formats

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...mabuf-import-for-non-scanout-buffers.patch | 72 -------------------
 .../{mesa-gl_21.1.5.bb => mesa-gl_21.1.7.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  3 +-
 .../mesa/{mesa_21.1.5.bb => mesa_21.1.7.bb}   |  0
 4 files changed, 1 insertion(+), 74 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-v3d-vc4-Fix-dmabuf-import-for-non-scanout-buffers.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_21.1.5.bb => mesa-gl_21.1.7.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.1.5.bb => mesa_21.1.7.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-v3d-vc4-Fix-dmabuf-import-for-non-scanout-buffers.patch b/meta/recipes-graphics/mesa/files/0001-v3d-vc4-Fix-dmabuf-import-for-non-scanout-buffers.patch
deleted file mode 100644
index 1a8771028b..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-v3d-vc4-Fix-dmabuf-import-for-non-scanout-buffers.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 303c02a31df4e2b8f6090e75982922a9cba33e4c Mon Sep 17 00:00:00 2001
-From: Joshua Watt <JPEWhacker@gmail.com>
-Date: Tue, 27 Jul 2021 11:41:53 -0500
-Subject: [PATCH] v3d, vc4: Fix dmabuf import for non-scanout buffers
-
-Failure to create a buffer for scanout should not be fatal when
-importing a buffer. Buffers allocated from a render-only device may not
-be able to scanned out directly but can still be used for other
-rendering purposes (e.g. as a texture).
-
-Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12081]
----
- src/gallium/drivers/v3d/v3d_resource.c | 13 +++++--------
- src/gallium/drivers/vc4/vc4_resource.c |  3 ---
- 2 files changed, 5 insertions(+), 11 deletions(-)
-
-diff --git a/src/gallium/drivers/v3d/v3d_resource.c b/src/gallium/drivers/v3d/v3d_resource.c
-index 602ba6d8447..02dc29ae6a0 100644
---- a/src/gallium/drivers/v3d/v3d_resource.c
-+++ b/src/gallium/drivers/v3d/v3d_resource.c
-@@ -433,10 +433,11 @@ v3d_resource_get_handle(struct pipe_screen *pscreen,
-                 return v3d_bo_flink(bo, &whandle->handle);
-         case WINSYS_HANDLE_TYPE_KMS:
-                 if (screen->ro) {
--                        assert(rsc->scanout);
--                        bool ok = renderonly_get_handle(rsc->scanout, whandle);
--                        whandle->stride = rsc->slices[0].stride;
--                        return ok;
-+                        if (renderonly_get_handle(rsc->scanout, whandle)) {
-+                                whandle->stride = rsc->slices[0].stride;
-+                                return true;
-+                        }
-+                        return false;
-                 }
-                 whandle->handle = bo->handle;
-                 return true;
-@@ -929,10 +930,6 @@ v3d_resource_from_handle(struct pipe_screen *pscreen,
-                         renderonly_create_gpu_import_for_resource(prsc,
-                                                                   screen->ro,
-                                                                   NULL);
--                if (!rsc->scanout) {
--                        fprintf(stderr, "Failed to create scanout resource.\n");
--                        goto fail;
--                }
-         }
- 
-         if (rsc->tiled && whandle->stride != slice->stride) {
-diff --git a/src/gallium/drivers/vc4/vc4_resource.c b/src/gallium/drivers/vc4/vc4_resource.c
-index 61e5fd7e5a6..bf3f7656ff8 100644
---- a/src/gallium/drivers/vc4/vc4_resource.c
-+++ b/src/gallium/drivers/vc4/vc4_resource.c
-@@ -320,7 +320,6 @@ vc4_resource_get_handle(struct pipe_screen *pscreen,
-                 return vc4_bo_flink(rsc->bo, &whandle->handle);
-         case WINSYS_HANDLE_TYPE_KMS:
-                 if (screen->ro) {
--                        assert(rsc->scanout);
-                         return renderonly_get_handle(rsc->scanout, whandle);
-                 }
-                 whandle->handle = rsc->bo->handle;
-@@ -689,8 +688,6 @@ vc4_resource_from_handle(struct pipe_screen *pscreen,
-                         renderonly_create_gpu_import_for_resource(prsc,
-                                                                   screen->ro,
-                                                                   NULL);
--                if (!rsc->scanout)
--                        goto fail;
-         }
- 
-         if (rsc->tiled && whandle->stride != slice->stride) {
--- 
-2.32.0
-
diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.1.5.bb b/meta/recipes-graphics/mesa/mesa-gl_21.1.7.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.1.5.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.1.7.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 4f446daaa6..145d08487c 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,10 +19,9 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-meson.build-make-TLS-ELF-optional.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
-           file://0001-v3d-vc4-Fix-dmabuf-import-for-non-scanout-buffers.patch \
            "
 
-SRC_URI[sha256sum] = "022c7293074aeeced2278c872db4fa693147c70f8595b076cf3f1ef81520766d"
+SRC_URI[sha256sum] = "e9e67c10654f2e4bf15b944bb048007a614292aa4792b1b7512eb700b7b3a7bb"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.1.5.bb b/meta/recipes-graphics/mesa/mesa_21.1.7.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.1.5.bb
rename to meta/recipes-graphics/mesa/mesa_21.1.7.bb
-- 
2.31.1

