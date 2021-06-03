Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.643.1622735005933248521
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 08:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p7IeGLX0;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id jt22so9917922ejb.7
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 08:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uG2Qz5ICQWZKX1urRTSvrE+3WLAbNg9eEOdZQjJxtu4=;
        b=p7IeGLX0PMagtp1cXSpHCbaq7OiRXpD3vf+B6wHJ4yRiXLuNX4rHp8TPW3UOjkhnYI
         6Luab5EBgfS/6iCxzdg0ND504jtC60cPjHm8jRL1eILF9xhtCHU65j6UJ8TQx+OULFvp
         58TQ+PwZvqUumu8PPGTtv5nvpGQQnYQmQW8afGfAOvAVncBp7A2/MCg4Shue7tjOLEun
         6JV8pmmsc/6C8DpPvzDm8Sp4dI0ZIZyPS/EcDNPdu5CWbszGuS+nK6hppq0Wk54loOWc
         qraNsQxd12jJjLaeCMvAot9FPGgL/WGGs4qjhrO4Yap0XCMVjVDMLhuJDncjWFE037Yf
         xBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uG2Qz5ICQWZKX1urRTSvrE+3WLAbNg9eEOdZQjJxtu4=;
        b=laFmlUldumh4PC8gHptuEoP6yo1ogS/hjBexkV3HxPqjXKA0t4rLqE7/yy+49F/CgJ
         15jAG/kmHgTQRSQKYWP1qgltGXuguohxOcWLG6+427fu4KMUe33CIGvBO7t/7psoKKxh
         aAEWGyi1+qCvvZBBaU2+sZMFyLY/6BzRPO/hkQnaAX25HEPEXUDIY8izLWUWk5coZeoX
         NXwvaxVvKnm8LzPpKOwn6dUSj/qtgR52O1H4lzSh+odilT7fMfPbh6Tg5ZY0lW5W0xlN
         QvSW3N10Uj6g8L9R/ygYQWOqqK3qxH/fsV7mSSbDHLxVcuXsa32auCvols1RifkWjJfz
         XWqA==
X-Gm-Message-State: AOAM532AskHLGzhFUMZB3vxTmrz6RcqKZwVYnjTPk6x1J9u+tIWeeyku
	FuQizsy6sLIos3BtRe71tWAXIf5JeOacIA==
X-Google-Smtp-Source: ABdhPJx33ElpIkJNKHpgcC5s91YqAPWxQSS4j2P3LU9n4KDQRe14rAs4W7zsws2c4oe22d/HZW6jdg==
X-Received: by 2002:a17:906:b34e:: with SMTP id cd14mr19391ejb.69.1622735004338;
        Thu, 03 Jun 2021 08:43:24 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f11f861d707ea86d7bc33dd.dip0.t-ipconnect.de. [2003:f0:7f11:f861:d707:ea86:d7bc:33dd])
        by smtp.gmail.com with ESMTPSA id d17sm1644338ejp.90.2021.06.03.08.43.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 08:43:23 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] mesa: upgrade 21.1.1 -> 21.1.2
Date: Thu,  3 Jun 2021 17:43:06 +0200
Message-Id: <20210603154313.2894136-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes:
Adam Jackson (1):
      zink/ntv: Don't call free() on ralloc'd memory

Alyssa Rosenzweig (3):
      panfrost: Fix the reads_dest prototype
      panfrost: Fix is_opaque prototype
      panfrost: Increase tiler_heap max allocation to 64MB

Anuj Phogat (1):
      intel/gfx12+: Add Wa_14013840143

Charmaine Lee (1):
      svga: fix texture rectangle sampling when no sampler view declaration is defined

Emma Anholt (2):
      i915g: Disable 3D-pipeline clears.
      i915g: Add support for the .Absolute flag on TGSI srcs.

Eric Anholt (1):
      i915g: Stop advertising support for indirect addressing in the FS.

Eric Engestrom (9):
      .pick_status.json: Update to 17861aff9614abfea3b8a8f111a114b26b351915
      pick-ui & .pick_status.json: rename `master_sha` to `main_sha`
      .pick_status.json: Update to b663c544177e9547793ee405887f0d41c50e6d1d
      .pick_status.json: Update to 507e8907af913ab7b89211240568b8002b3475f1
      .pick_status.json: Update to 3179daf61393ee8a0fac943b94335b114e34873b
      .pick_status.json: Update to 761383720617b46617bd278ec6015c9520f43f5c
      .pick_status.json: Update to 1199d86b2cccc38a101e63bdf9b60a7391f96092
      docs: add release notes for 21.1.2
      VERSION: bump for 21.1.2

Erik Faye-Lund (2):
      zink: use actual const for const offset
      util/prim_restart: revert part of bad fix

Erik Kurzinger (1):
      vulkan/device_select: avoid segfault on Wayland if wl_drm is unavailable

Georg Lehmann (1):
      radv: Fix compatible image handle type for dmabufs.

Ian Romanick (2):
      nir/algebraic: Remove some optimizations of comparisons with fsat
      nir/algebraic: Invert comparisons less often

Icecream95 (1):
      panfrost: Fix polygon list size computations

Italo Nicola (1):
      panfrost: fix GL_EXT_multisampled_render_to_texture regression

Jason Ekstrand (3):
      anv: Plumb the shader into push constant helpers
      anv: Support pushing shader constants
      intel/vec4: Don't spill fp64 registers more than once

José Fonseca (1):
      draw: Allocate extra padding for extra shader outputs.

Juan A. Suarez Romero (1):
      vc4: initialize array

Kenneth Graunke (2):
      i965: Don't advertise Y-tiled modifiers for scanout buffers on Gfx8-
      iris: Don't advertise Y-tiled modifiers for scanout buffers on Gfx8

Marek Olšák (3):
      ac/gpu_info: set has_zero_index_buffer_bug for Navi12 too
      radeonsi: add a gfx10 hw bug workaround with the barrier before gs_alloc_req
      radeonsi: disable DFSM on gfx9 by default because it decreases performance a lot

Mike Blumenkrantz (4):
      util/prim_restart: fix util_translate_prim_restart_ib
      aux/vbuf: prevent uint underflow and assert if no vbs are dirty
      aux/trace: fix set_inlinable_constants hook
      zink: remove weird lod hack for texturing

Nanley Chery (2):
      anv,iris: Port the D16 workaround stalls to BLORP
      intel/isl: Fix HiZ+CCS comment about ambiguates

Neha Bhende (2):
      svga: Add target and sampler_return_type info into shader key
      svga: Use shader_key info to declare resources if TGSI shader is missing it

Rhys Perry (3):
      aco: disallow SGPRs on DPP instructions
      radv: add radv_absolute_depth_bias
      radv: workaround incorrect depthBiasConstantFactor by Path of Exile

Robert Tarasov (1):
      iris: Check data alignment for copy_mem_mem

Samuel Pitoiset (4):
      aco: fix derivatives/intrinsics with SGPR sources
      radv: fix fast clearing DCC if one level can't be compressed on GFX10+
      aco: fix emitting discard when the program just ends
      radv: enable RADV_DEBUG=invariantgeom for Monster Hunter World

SureshGuttula (1):
      frontends/va/picture:Fix wrong reallocation even surface is protected

cheyang (1):
      virgl:Fix the leak of hw_res used as fence

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mesa/{mesa-gl_21.1.1.bb => mesa-gl_21.1.2.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.1.1.bb => mesa_21.1.2.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_21.1.1.bb => mesa-gl_21.1.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.1.1.bb => mesa_21.1.2.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.1.1.bb b/meta/recipes-graphics/mesa/mesa-gl_21.1.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.1.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.1.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 32cc997c9e..5700cc9673 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
-SRC_URI[sha256sum] = "eec25ea379054e8911bc5de816aeb50f581b5b708414725003d2f00386b38dd2"
+SRC_URI[sha256sum] = "23b4b63760561f3a4f98b5be12c6de621e9a6bdf355e087a83d9184cd4e2825f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.1.1.bb b/meta/recipes-graphics/mesa/mesa_21.1.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.1.1.bb
rename to meta/recipes-graphics/mesa/mesa_21.1.2.bb
-- 
2.31.1

