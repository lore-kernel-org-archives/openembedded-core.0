Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.18750.1626637455433873528
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jul 2021 12:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SzyMhx5n;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id d2so19098368wrn.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jul 2021 12:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FMB/GeCOImJZ3FPpY54fuoSDwqxV52GSSNrZcWYW1tY=;
        b=SzyMhx5nixuRnU7cgwLeAgIzeI1XvqURY4bqfZu0uYHRH7DrjAsAw11imiB1omk640
         dSiLhRtQS66Ymo1v8h/27Xsh9jP9DQsAUQuGCcGUPHfS08hg3JYIWbzPQwFa2H1HDPZP
         SqkgZzDc17W0UWyfey7FEehLtSIif5/xgGh+RQkbq60XixlWeIn0NxeRmx53BWVsU8A0
         +UPG2KvzhbZEaJ6sxbSt0AlzQdOSiKb7qbdqAOylKH455gukxirAI9gtnEuRgNZ1qFjj
         gX+Ufku9jrSsHeYkAqk0ZD307nJoG97U9zz1MLY2fZLLptJJYWU5hykkqN7xGYPefQHb
         Xdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FMB/GeCOImJZ3FPpY54fuoSDwqxV52GSSNrZcWYW1tY=;
        b=oQvk3O0o9BpQHJwAmi+I/d0tv11krNxF4kdkWajt/TuL09p0IjDTe3ccrl+2RAjQTm
         +JWmVlsjmR69sK6b37FbaPWpMfT1BcrSBp9b0+J7qgoG9rPCJ3MpUpZNbxEJigknw4m1
         3D2F4p0RvMxSt1pSMHm63AX7wfHEeULULcaU93K42Te5uwzb8v9Gl51ezDAWQwHWFFKl
         hntuN0RFb8kD52ZVaAO0BuqaKUMaDg0ycK+PS8xfmhW4usImuaWTvrJqpJ5JmrbaYziO
         yr4lNtwRDdBMMflD+t4K5SqWhUREK95PNuNRYWJWfOI/hTfIXqWjEHC4mPA6emzYzUvG
         VL6g==
X-Gm-Message-State: AOAM531plwEAuNiJm5TFbJtb1bUaiL83o93xK8p+nMDcyM4tu6QwHStB
	k74byjd/BXDC6/Tz4wAZTUhh9cTq++g=
X-Google-Smtp-Source: ABdhPJxscJueswbzBfvKiAW0pvGuX9Srg70gQYDR5XNeR3qP6akAIGC7Htz1HFMHVUxeVa7unJNNMg==
X-Received: by 2002:adf:d086:: with SMTP id y6mr26896552wrh.247.1626637453879;
        Sun, 18 Jul 2021 12:44:13 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f023f50e1b6aa3d339b6f56.dip0.t-ipconnect.de. [2003:f0:7f02:3f50:e1b6:aa3d:339b:6f56])
        by smtp.gmail.com with ESMTPSA id m32sm17243268wms.23.2021.07.18.12.44.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jul 2021 12:44:13 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa: upgrade 21.1.4 -> 21.1.5
Date: Sun, 18 Jul 2021 21:44:05 +0200
Message-Id: <20210718194405.495824-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bug fixes
  * [build error] macros.h:88:26: error: size of unnamed array is negative
  * Game Issue: Nuclear Throne crashes in RadeonSI
  * Crash in glLinkProgram while trying to craft the link error
  * Shader compilation memory leaks
  * Wolfenstein II: The New Colossus - Screen goes black in some cases
  * SpaceEngine in Steam Proton cannot start with Mesa >=20.3
  * [bisected] KDE plasma menu text renders like stretched strangely [amdgpu]
  * Luna Sky Crashes on Launch
  * Mesa crashes on undefined texture behaviour
  * Mesa crashes on undefined texture behaviour
  * cache_test uses uninitialized stack memory

Changes
  * nir: Fix constant folding for irhadd/urhadd
  * ac/surface: Handle non-retiled displayable DCC correctly for modifiers.
  * ir3: Fix infinite loop in scheduler when splitting
  * glsl: Prohibit implicit conversion of mem parameter in atomicOP functions
  * draw: fix tessellation output vertex size calculation
  * .pick_status.json: Update to e4f762ac346f31fc1fd201aecdc375348be5075f
  * zink: mark a bunch of zink-piglit-quick_gl tests as flakes
  * .pick_status.json: Update to c704bb630d21e0a30500e9d8f42493ede3cc55ae
  * .pick_status.json: Mark e5d158881b3e12270521d7081b4bba0ac2108d2e as denominated
  * softpipe: add missing sentinel to debug option array
  * iris: Don’t leak the surface if uncompressed re-interp fails
  * intel/perf: use the right popcount for 64bits
  * ac/surface/tests: fix the ARM build
  * radeonsi,radv: fix a late alloc deadlock with <= 6 CUs per SA
  * Convert most remaining free-form fall-through comments to FALLTHROUGH
  * osmesa: Replace default case FALLTHROUGH annotation by following return
  * Fix up leftover “state_trackers” references to “frontends”
  * radeonsi: fix fb_too_small condition
  * radeonsi/gfx7: always sync pfp/me
  * ac/surface: don’t print stencil info if tex has no stencil
  * radeonsi/driconf: add workaround for SpaceEngine
  * st/mesa: fix size miss match for some check
  * freedreno: Consolidate needs_flush and clearing last_fence
  * freedreno/a6xx: Fix framebuffer_barrier crash
  * radv: disable DCC for DOOM 2016 and Wolfenstein II
  * aco: fix shared_atomic_comp_swap if the second source isn’t a VGPR
  * nir: return progress from nir_lower_packing
  * nir/ifind_msb_rev: fix input check
  * broadcom/compiler: fix add vs. mul
  * util/tests: initialise key in cache_test
  * mesa: don’t crash on incorrect texture use
  * i965: don’t crash on incorrect texture use
  * util/driconf: add new ignore_write_to_readonly_var workaround
  * util: add some workarounds for the game Luna Sky
  * glsl: force_glsl_version to shaders with no defined version
  * util/radeonsi: add radeonsi workaround for Nuclear Throne
  * st/xa: Mark default xa_get_pipe_format case unreachable.
  * intel: fix leaking memor
  * y on shader creation

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mesa/{mesa-gl_21.1.4.bb => mesa-gl_21.1.5.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.1.4.bb => mesa_21.1.5.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_21.1.4.bb => mesa-gl_21.1.5.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.1.4.bb => mesa_21.1.5.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.1.4.bb b/meta/recipes-graphics/mesa/mesa-gl_21.1.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.1.4.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.1.5.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 6a102585a1..6a0df4fa2e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
-SRC_URI[sha256sum] = "1f177f44098164b65731c5ded4c928fd58b14f6c9d2087aa0e37bc79bf79e90b"
+SRC_URI[sha256sum] = "022c7293074aeeced2278c872db4fa693147c70f8595b076cf3f1ef81520766d"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.1.4.bb b/meta/recipes-graphics/mesa/mesa_21.1.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.1.4.bb
rename to meta/recipes-graphics/mesa/mesa_21.1.5.bb
-- 
2.31.1

