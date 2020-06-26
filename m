Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.2897.1593155971489066529
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZhWvPTdJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id l12so8328728ejn.10
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JIce/QuQxSGqZ0yaxIMLLezO1SFo+AErGmQWrblJvoY=;
        b=ZhWvPTdJdgSsUvOT7GzobtbOXnuhEPe52qT1yJ5cCbuCE/mYGcFbOjJuW8IUhvkoJw
         khhVX8Xh5TWRvLu3ofkLfX6+E0TzaiGQItppEsqHy+uRoxvt/g5AWS+I/VIBSp8MKTiz
         RIkr0jM3LxHR9uHeGKNzrd8qh86NXqUtVFOHhv3R8O6ylnAApXVbs24HG2ZodUv/3Yzx
         fmwt6Il7dS2n3raSsnSnxt7/S/TeMZsDjMC5iqF6gfDAtiX9b5+gW8FnP+gWuni2Bza9
         trqWQfVbW3x0TuIZm1MCSL92XdZpW3F2TeJGTmrp+XkD+K/d+Zsf4udtu3+Mf0btHhQ7
         /sEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JIce/QuQxSGqZ0yaxIMLLezO1SFo+AErGmQWrblJvoY=;
        b=BmJq1Kt1QOqPYYNmZ5Aykl4xa1xc6yJ0vibkMCufzzFBbzKRTTLndt+RSjiUqb6cpj
         0YLqH8NPTjays6ji7LUFbPnb0zjHp+iwm92x+voIXeimJ5Ws4rZCRWADh5CnTal3MFPs
         xkLK7P1XuEDe+hPj07q3EOqviYXEVLjOXyrpnSXmGl3LtjQnOlrQHewmzvU/d9BsNOVf
         LvGazSaqgg83dC3SYsErwQQS95M/HsNss4VY3IqMhAqVC53VB+FRkKIm9tdYPBex6q1T
         Y8UUpBa/iFDqmq4FsjHH3uDlfzQdvgG+dISrMujNPHFjtHlqE06qtbb0R2c27byVdvpz
         UyFQ==
X-Gm-Message-State: AOAM531SUVWLQgVHPUBK29FPZhFHv0o+xu63iktsCGh9a6elTrsXidDj
	iNXhgkKDdC9iabSqp8Hs5+4nzsCXnRA=
X-Google-Smtp-Source: ABdhPJxtlUUcLZdhqvzk0AP7o/B1l9x+O1HRy0YBVMqFrSrmXIw05Lo+cPfEZPOIjn7Buo+WbQB9pA==
X-Received: by 2002:a17:907:20ee:: with SMTP id rh14mr1388021ejb.395.1593155969768;
        Fri, 26 Jun 2020 00:19:29 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:28 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 27/30] mesa: update 20.0.7 -> 20.1.2
Date: Fri, 26 Jun 2020 09:18:41 +0200
Message-Id: <20200626071844.29134-27-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0002-meson.build-make-TLS-ELF-optional.patch | 12 ++++++------
 ...x_t-for-formatted-output-of-timespec-me.patch | 16 +++++++---------
 .../{mesa-gl_20.0.7.bb => mesa-gl_20.1.2.bb}     |  0
 meta/recipes-graphics/mesa/mesa.inc              |  3 +--
 .../mesa/{mesa_20.0.7.bb => mesa_20.1.2.bb}      |  1 +
 5 files changed, 15 insertions(+), 17 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_20.0.7.bb => mesa-gl_20.1.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_20.0.7.bb => mesa_20.1.2.bb} (95%)

diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
index cd35a1f850..91e59d14ed 100644
--- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
+++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
@@ -1,4 +1,4 @@
-From df835389699b32bb6610b39972502e323f8e09e5 Mon Sep 17 00:00:00 2001
+From dd1d15c75f6ff8ee96cf1e7b74e582bff3183ef6 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 13:08:31 -0800
 Subject: [PATCH] meson.build: make TLS ELF optional
@@ -15,10 +15,10 @@ Signed-off-by: Alistair Francis <alistair@alistair23.me>
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 09e3759..a954118 100644
+index 261b588..311436e 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -387,7 +387,7 @@ if with_egl and not (with_platform_drm or with_platform_surfaceless or with_plat
+@@ -392,7 +392,7 @@ if with_egl and not (with_platform_drm or with_platform_surfaceless or with_plat
  endif
  
  # Android uses emutls for versions <= P/28. For USE_ELF_TLS we need ELF TLS.
@@ -28,10 +28,10 @@ index 09e3759..a954118 100644
  endif
  
 diff --git a/meson_options.txt b/meson_options.txt
-index 626baf3..637ff14 100644
+index ab43150..d7b1555 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -341,6 +341,12 @@ option(
+@@ -355,6 +355,12 @@ option(
    value : true,
    description : 'Enable direct rendering in GLX and EGL for DRI',
  )
@@ -42,5 +42,5 @@ index 626baf3..637ff14 100644
 +  description : 'Enable TLS support in ELF',
 +)
  option(
-   'I-love-half-baked-turnips',
+   'prefer-iris',
    type : 'boolean',
diff --git a/meta/recipes-graphics/mesa/files/0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch b/meta/recipes-graphics/mesa/files/0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch
index 901feca556..dacb1ea1c8 100644
--- a/meta/recipes-graphics/mesa/files/0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch
+++ b/meta/recipes-graphics/mesa/files/0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch
@@ -1,4 +1,4 @@
-From 38a313474e127d61e749866423e708fc86ed9ec5 Mon Sep 17 00:00:00 2001
+From 281a636353666bfdd373c62591e744087e750e89 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 4 Dec 2019 14:15:28 -0800
 Subject: [PATCH] vc4: use intmax_t for formatted output of timespec members
@@ -13,13 +13,14 @@ error: format specifies type 'long' but the argument has type 'time_t' (aka 'lon
 
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/merge_requests/2966]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/gallium/drivers/v3d/v3d_bufmgr.c | 4 ++--
  src/gallium/drivers/vc4/vc4_bufmgr.c | 4 ++--
  2 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/src/gallium/drivers/v3d/v3d_bufmgr.c b/src/gallium/drivers/v3d/v3d_bufmgr.c
-index b3e4d053cc0..c514bf00bf0 100644
+index 31a0803..cc2e2af 100644
 --- a/src/gallium/drivers/v3d/v3d_bufmgr.c
 +++ b/src/gallium/drivers/v3d/v3d_bufmgr.c
 @@ -80,8 +80,8 @@ v3d_bo_dump_stats(struct v3d_screen *screen)
@@ -27,27 +28,24 @@ index b3e4d053cc0..c514bf00bf0 100644
                  struct timespec time;
                  clock_gettime(CLOCK_MONOTONIC, &time);
 -                fprintf(stderr, "  now:               %ld\n",
--                        time.tv_sec);
+-                        (long)time.tv_sec);
 +                fprintf(stderr, "  now:               %jd\n",
 +                        (intmax_t)time.tv_sec);
          }
  }
  
 diff --git a/src/gallium/drivers/vc4/vc4_bufmgr.c b/src/gallium/drivers/vc4/vc4_bufmgr.c
-index 5ec360934c0..bf05f6cadd6 100644
+index a786e8e..975d49e 100644
 --- a/src/gallium/drivers/vc4/vc4_bufmgr.c
 +++ b/src/gallium/drivers/vc4/vc4_bufmgr.c
-@@ -107,8 +107,8 @@ vc4_bo_dump_stats(struct vc4_screen *screen)
+@@ -99,8 +99,8 @@ vc4_bo_dump_stats(struct vc4_screen *screen)
  
                  struct timespec time;
                  clock_gettime(CLOCK_MONOTONIC, &time);
 -                fprintf(stderr, "  now:               %ld\n",
--                        time.tv_sec);
+-                        (long)time.tv_sec);
 +                fprintf(stderr, "  now:               %jd\n",
 +                        (intmax_t)time.tv_sec);
          }
  }
  
--- 
-2.24.0
-
diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.0.7.bb b/meta/recipes-graphics/mesa/mesa-gl_20.1.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_20.0.7.bb
rename to meta/recipes-graphics/mesa/mesa-gl_20.1.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 965e12d17e..4fe5f025eb 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -23,8 +23,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            "
 
-SRC_URI[md5sum] = "609cb7664204e031d4c65c602c652a28"
-SRC_URI[sha256sum] = "fe6e258fe772c3cd2ac01741bf7408058c3ac02d66acff9a6e669bd72e3ea178"
+SRC_URI[sha256sum] = "283dff72814c8a80ce1ff8271e3f055895d26f4da3f4362acc49193e635780cb"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_20.0.7.bb b/meta/recipes-graphics/mesa/mesa_20.1.2.bb
similarity index 95%
rename from meta/recipes-graphics/mesa/mesa_20.0.7.bb
rename to meta/recipes-graphics/mesa/mesa_20.1.2.bb
index d17d9eb04b..96e8aa38d6 100644
--- a/meta/recipes-graphics/mesa/mesa_20.0.7.bb
+++ b/meta/recipes-graphics/mesa/mesa_20.1.2.bb
@@ -1 +1,2 @@
 require ${BPN}.inc
+
-- 
2.27.0

