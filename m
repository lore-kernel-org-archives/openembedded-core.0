Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.31782.1612175014106429327
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 02:23:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=cFN25BrX;
 spf=pass (domain: blade-group.com, ip: 209.85.128.43, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f43.google.com with SMTP id o5so2486525wmq.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 02:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jOfTgzNp/Dd055Qbjc1Fx5/yHNabq3Pn6niIWOQ5VoU=;
        b=cFN25BrXIVv1QqN122Q9QsWOsnKbzpk3Z0c8hVERmRLyj9NSngZr0Nm7DyBlaEEgLs
         ejcEr+TrrBlXn2Tu75vmflS9bI9Wj41fwKIMZWk12OL+2dO+TZcpNmdu2u2/ahx6Gc5u
         YLkGhTNxQoWGKGwUihWt7PP1pe/nUXhYt2gqyDO/p5CtraZ1QldDvRB3zGPXZEMkuH66
         m229def3w3KOTB/WSi0eT5DgUeYYANJlCAVOXVQT7zOLcNBpxnnTgV/28QRLxr7f2kKQ
         YFgN22FpOdaLYBLyRK3PKNly710nMNUf0rUh3g/XPEzVpdk6fOsdMid/yHQjg+ALx7g0
         eWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jOfTgzNp/Dd055Qbjc1Fx5/yHNabq3Pn6niIWOQ5VoU=;
        b=pce/9fR9RqzAOOCU/yMz1kPX1HsZuu+y8F3Wp0awp8N6vmMtSEyrbB2NK19/zXzDtw
         hKybR+DzrM6iqW0M6xDjj6RBEz3e4WZoPhWAIMb32AuqXIAAkTZ22L4kkfSdnIaP1dpi
         J80bKd6wflN9wJU3FlLIFJNuBdxT0MCfzAspb9+t+DLhKHRvsqjKJvuqeq1iolilZuox
         hI8pU1KC+zanXNcz5e4O1YRnbUkMcKVIMn3C9nPfRiLEmBB4pl5TReZ4x4IozhnPQKQT
         DflBiD47eon1YST306dbm0p8YFi8wbd8Wcv+opeLjAF3ITQRqNzefJmjE0FAL5lrn82n
         Xq1w==
X-Gm-Message-State: AOAM532AOxZbEbe9WKO0dV/5PfRA3mPGJF5erocWWpGyu0JbasR0tT6N
	xdsCFL5jHDBSHBiAmnxiUKYC4qjkeKKu2A==
X-Google-Smtp-Source: ABdhPJyQzNzQf6KQWO1OWE8tb1k+5l/ZPMnP0kRiqtJteR84j0dsl5GBAP1ntyJW3fYkhEZtfXJWog==
X-Received: by 2002:a1c:ddd4:: with SMTP id u203mr13944215wmg.83.1612175012452;
        Mon, 01 Feb 2021 02:23:32 -0800 (PST)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id m18sm25747663wrx.17.2021.02.01.02.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 02:23:31 -0800 (PST)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>,
	=?UTF-8?q?Romain=20Roff=C3=A9?= <romain.roffe@blade-group.com>
Subject: [PATCH] libsdl2: upgrade to 2.0.14
Date: Mon,  1 Feb 2021 11:23:00 +0100
Message-Id: <20210201102300.3789714-1-yann@blade-group.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

This version does not support tslib any more, as can be seen by the
failed AUH run.

Originally-by: Romain Roffé <romain.roffe@blade-group.com>
Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 .../libsdl2/directfb-renderfillrect-fix.patch | 33 -------------
 ...ectfb-spurious-curly-brace-missing-e.patch | 49 -------------------
 .../{libsdl2_2.0.12.bb => libsdl2_2.0.14.bb}  |  6 +--
 3 files changed, 1 insertion(+), 87 deletions(-)
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.12.bb => libsdl2_2.0.14.bb} (91%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch b/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch
deleted file mode 100644
index 83d4f4b1ec..0000000000
--- a/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-# HG changeset patch
-# User Sam Lantinga <slouken@libsdl.org>
-# Date 1590793369 25200
-# Node ID a90089f75990e8b07a1dcf931c5f8a580ae343bf
-# Parent  a9b4bd264f3cbedc4f3287b3ec6b32311370ba85
-Fixed bug 5146 - SDL_RenderFillRect doesn't work in DirectFB
-
-Lacky
-
-It looks like refactoring of SDL2 internal API has broken SDL_RenderFillRect for DirectFB. In new version function SDL_RenderFillRect returns 0, but rectangle is not visible.
-
-Replacing "count" with "len" in the argument list for SDL_memcpy in DirectFB_QueueFillRects fixes problem.
-
---
-
-The patch was imported from the libsdl Mercurial repository
-(https://hg.libsdl.org/SDL) as of changeset id a90089f75990.
-
-Upstream-Status: Backport
-
-Signed-off-by: Mark Jonas <toertel@gmail.com>
-
-diff -r a9b4bd264f3c -r a90089f75990 src/video/directfb/SDL_DirectFB_render.c
---- a/src/video/directfb/SDL_DirectFB_render.c	Thu May 21 00:06:09 2020 -0400
-+++ b/src/video/directfb/SDL_DirectFB_render.c	Fri May 29 16:02:49 2020 -0700
-@@ -626,7 +626,7 @@
-     }
-
-     cmd->data.draw.count = count;
--    SDL_memcpy(verts, rects, count);
-+    SDL_memcpy(verts, rects, len);
-     return 0;
- }
diff --git a/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch b/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch
deleted file mode 100644
index aa351a89ba..0000000000
--- a/meta/recipes-graphics/libsdl2/libsdl2/directfb-spurious-curly-brace-missing-e.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-# HG changeset patch
-# User Fabrice Fontaine <fontaine.fabrice@gmail.com>
-# Date 1585069551 25200
-# Node ID 769f800952179633ec6c3e6bc1bc1d40e401750a
-# Parent  63387e8920f58f608288f247824ec5f4c286691f
-src/video/directfb/SDL_DirectFB_render.c: fix build
-Build with directfb is broken due to a spurious '}' and a missing 'E'
-since version 2.0.12 and https://hg.libsdl.org/SDL/rev/2d5b5a5ccbfb:
-
-/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src/video/directfb/SDL_DirectFB_render.c: In function 'SetBlendMode':
-/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src/video/directfb/SDL_DirectFB_render.c:202:9: error: case label not within a switch statement
-  202 |         case SDL_BLENDMODE_MUL:
-      |         ^~~~
-
-/home/buildroot/autobuild/run/instance-2/output-1/build/sdl2-2.0.12/src/video/directfb/SDL_DirectFB_render.c:205:67: error: 'DSBF_DSTCOLOR' undeclared (first use in this function); did you mean 'DSBF_DESTCOLOR'?
-  205 |             SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DSTCOLOR));
-      |                                                                   ^~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/83ccefee68c2800c0544e6f40fa8bc8ee6b67b77
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
---
-
-The patch was imported from the libsdl Mercurial repository
-(https://hg.libsdl.org/SDL) as of changeset id 769f80095217.
-
-Upstream-Status: Backport
-
-Signed-off-by: Mark Jonas <toertel@gmail.com>
-
-
-diff -r 63387e8920f5 -r 769f80095217 src/video/directfb/SDL_DirectFB_render.c
---- a/src/video/directfb/SDL_DirectFB_render.c	Mon Mar 23 14:10:25 2020 -0700
-+++ b/src/video/directfb/SDL_DirectFB_render.c	Tue Mar 24 10:05:51 2020 -0700
-@@ -198,11 +198,10 @@
-             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf, DSBF_SRCCOLOR));
-
-             break;
--        }
-         case SDL_BLENDMODE_MUL:
-             data->blitFlags = DSBLIT_BLEND_ALPHACHANNEL;
-             data->drawFlags = DSDRAW_BLEND;
--            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DSTCOLOR));
-+            SDL_DFB_CHECK(destsurf->SetSrcBlendFunction(destsurf, DSBF_DESTCOLOR));
-             SDL_DFB_CHECK(destsurf->SetDstBlendFunction(destsurf, DSBF_INVSRCALPHA));
-
-             break;
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
similarity index 91%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
index 5fa99821c4..872592fdae 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
@@ -18,14 +18,11 @@ PROVIDES = "virtual/libsdl2"
 
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
-           file://directfb-spurious-curly-brace-missing-e.patch \
-           file://directfb-renderfillrect-fix.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[md5sum] = "783b6f2df8ff02b19bb5ce492b99c8ff"
-SRC_URI[sha256sum] = "349268f695c02efbc9b9148a70b85e58cefbbf704abd3e91be654db7f1e2c863"
+SRC_URI[sha256sum] = "d8215b571a581be1332d2106f8036fcb03d12a70bae01e20f424976d275432bc"
 
 inherit autotools lib_package binconfig-disabled pkgconfig
 
@@ -64,7 +61,6 @@ PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[kmsdrm]     = "--enable-video-kmsdrm,--disable-video-kmsdrm,libdrm virtual/libgbm"
 PACKAGECONFIG[opengl]     = "--enable-video-opengl,--disable-video-opengl,virtual/libgl"
 PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
-PACKAGECONFIG[tslib]      = "--enable-input-tslib,--disable-input-tslib,tslib"
 PACKAGECONFIG[wayland]    = "--enable-video-wayland,--disable-video-wayland,wayland-native wayland wayland-protocols libxkbcommon"
 PACKAGECONFIG[x11]        = "--enable-video-x11,--disable-video-x11,virtual/libx11 libxext libxrandr libxrender"
 
-- 
2.29.2

