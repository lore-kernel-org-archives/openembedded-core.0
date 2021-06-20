Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.33871.1624198011370220704
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jun 2021 07:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AmJ9RhXf;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id t7so15289765edd.5
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jun 2021 07:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WTWB3zTqGpnR+pBvL04OZsG50+Afc3leDPX/43lH0TM=;
        b=AmJ9RhXfLrh4Tmv30M3XhHacBYVYvoBN7hIcNVuBsMeZH6bP4H0v7eX09hD/d/s9ax
         oI8fEBose08gj2FtxnlaQMF/16XNV37iXJYeYucvBSbOI0vsFwQ6BirWKJ1q6gFCITZe
         OVp9f7KMAqguhacKiGz9t6MqTcsF1HhIEBe6GULBsPaCZCOHE3L7DrCNmVRp3mage6FV
         YdH9HTGYFQk6fiFAH/5RBXuubzJ1hIm8dkFkX+vwFVlkVCLuz238nkobGBymU8QcxGBX
         XQw+omWZmvyTiX9wZOSwd9V3KpOP321afWQ8Hfdrg++CuJ3JvFZmHazH785RP35VCNDW
         2mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WTWB3zTqGpnR+pBvL04OZsG50+Afc3leDPX/43lH0TM=;
        b=YW6C4ScRH9HUJqcMEFpgS4d9M2aobwRfjRUWY6GRWTvtSuFq+eKKqYa1HzTXD8Ehzs
         eWXpCDkwtlLwl/nn2iTBIqq00OGlezUFExNi9kfGs+23Tac5pv3ccXb7TMJ6/dngSWpx
         q0jQxVb/Wv3jQ/7gLT0CXvU9/vr1CYC9GdAPjO+TgLmClOnHMC68Q2pN3f0vVCEzeOLo
         Jf0TbqnZXL+J4yurBACV3GoTvzyxWJkHj6Qqt9jxNkq1NpXUBav5u4GRpPcajTeypV30
         l3SRntAPqoHVJvCIAKWBBZdw0pi0aGXoen6GOQd2W9FB2OYLusOh9zNpUb9cXg1TzM0Z
         j6hQ==
X-Gm-Message-State: AOAM532c0CqzLrZqm3gf6/z1M903LQHrDQDk9xcku6FFJuF4211s17KS
	2lvR0jblfiJF/eYmayayLE3DzE8AM31MNg==
X-Google-Smtp-Source: ABdhPJx5G1RfCw/CFGuzDk4KmFZ8kqEADoOndWDUAz3r/QnSYlTwhSK+mASOX/9XXoi7kGtSPOBksg==
X-Received: by 2002:a05:6402:31ba:: with SMTP id dj26mr16026302edb.71.1624198009720;
        Sun, 20 Jun 2021 07:06:49 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f15a332e0160e0aca11a057.dip0.t-ipconnect.de. [2003:f0:7f15:a332:e016:e0a:ca11:a057])
        by smtp.gmail.com with ESMTPSA id de6sm3851461edb.77.2021.06.20.07.06.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 07:06:48 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa: upgrade 21.1.2 -> 21.1.3
Date: Sun, 20 Jun 2021 16:06:41 +0200
Message-Id: <20210620140641.3002-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changelog:

Bug fixes
* radv: ACO miscompiles a specific DIRT 5 shader
* Segfault in mtx_unlock/amdgpu_bo_slab_destroy
* [radeonsi] Incorrect rendering when using glDisable(GL_MULTISAMPLE) with multisample backbuffer
* kwin_x11 ring gfx_0.0.0 timeout
* [i965] regression: piglit.spec.arb_depth_buffer_float.fbo-depthstencil-gl_depth32f_stencil8-drawpixels

Changes
* classic/xlib: Fix the build after !9817
* radv: Don’t skip barriers that only change queues.
* radv: Actually return correct value for read-only DCC compressedness.
* radv: Allow DCC images to be compressed with foreign queues.
* llvmpipe: add the interesting bit of cpu detection to the cache.
* zink: Correct compiler issue with have_moltenvk member having been moved.
* .pick_status.json: Update to db83dc619c96c35a039f2d8a32e1a179c0f00d64
* .pick_status.json: Update to f884c2e3be363903a59dbee01868c7ad0bf0f346
* .pick_status.json: Update to 561f9ae74b2b7da06bb4830aaca8d017a3dd2746
* llvmpipe: fix edge-rule logic for lines
* anv: Clear all pending stall after pipe flush
* util: Zero out all of mask in util_set_thread_affinity
* panfrost: Use first_tiler to check if tiling is needed
* intel/vec4: Also use MOV_FOR_SCRATCH for swizzle resolves
* anv: Handle OOM in the pinned path in anv_reloc_list_add
* sparc: Avoid some redefinition warnings
* zink: ci updates
* anv: fix availability for copying timestamp query results
* util/vbuf: fix buffer overrun in attribute conversions
* zink: fix caching of shader variants with inlined uniforms
* zink: use scissor region for discarding clears during blit
* zink: fix typo that’s definitely not at all embarrassing or anything like that
* svga: Initialize pipe_shader_state for transform shaders
* docs/install: remove one extra when
* frontend/dri: set PIPE_BIND_PROTECTED later
* frontend/dri: fix bool/int comparison
* radeonsi: fix encryption check for buffers
* radeonsi: add a gfx10 bug workaround for NOT_EOP
* radeonsi: dirty msaa_config on rs->multisample_enable change
* winsys/amdgpu: don’t read bo->u.slab.entry after pb_slab_free
* aco: do not clause NSA instructions
* aco: don’t create 4 and 5 dword NSA instructions on GFX10
* aco: use v1b/v2b for ds_read_u8/ds_read_u16
* egl: zero is a valid fd
* freedreno/ir3: Fix use after free
* radv: enable RADV_DEBUG=invariantgeom for SotTR DX11/DX12 versions
* radv: emit PA_SC_CONSERVATIVE_RASTERIZATION_CNTL only on GFX9+
* aco: fix range checking for SSBO loads/stores with SGPR offset on GFX6-7
* aco: fix emitting literal offsets with SMEM on GFX7
* radv: do not launch an IB2 for secondary cmdbuf with INDIRECT_MULTI on GFX7
* radv: fix aligning the image offset by using align64()
* util/format: Change the pointer offset.
* aco/ra: Fix off-by-one-error in print_regs
* travis: Download XQuartz from GitHub.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mesa/{mesa-gl_21.1.2.bb => mesa-gl_21.1.3.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.1.2.bb => mesa_21.1.3.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_21.1.2.bb => mesa-gl_21.1.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.1.2.bb => mesa_21.1.3.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.1.2.bb b/meta/recipes-graphics/mesa/mesa-gl_21.1.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.1.2.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.1.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 5700cc9673..86a02047d1 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
-SRC_URI[sha256sum] = "23b4b63760561f3a4f98b5be12c6de621e9a6bdf355e087a83d9184cd4e2825f"
+SRC_URI[sha256sum] = "cbe221282670875ffd762247b6a2c95dcee91d0a34c29802c75ef761fc891e69"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.1.2.bb b/meta/recipes-graphics/mesa/mesa_21.1.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.1.2.bb
rename to meta/recipes-graphics/mesa/mesa_21.1.3.bb
-- 
2.31.1

