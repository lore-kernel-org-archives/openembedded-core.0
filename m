Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.61408.1594051867569662362
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=OVeIbn5C;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.65, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f65.google.com with SMTP id md7so2093604pjb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=jc3VoNps38gP52N34cu3yGytqUlELOuNHCAWIKCD/g0=;
        b=OVeIbn5Ccu/3Z6BhJyU/jVm0me89ZvFQzRvn7saRtwxgrZOTE9gSgCUK0cSNids6N6
         LY4szr4t6A/gTSYAnGaALl6vZ6St8rWk3Y4gSb13iaaIeaCVuWMHqhpxytM5luxRex7v
         yOh3p4vxhaXg+gr6tmp9Y2GQSZAvfJYtbLG/YqbWYZMa/azdY0+InxoH7Qt/q/l0EOac
         E898WP9S9oY3ip+QlvmJcl/uYb947UizM/fdIsCqftSWL56kBSQxt2HSbcsUV4T0vkU6
         GgkBCVbZjL9b6xvu3AmpEvFknU8PRs3muTO2hUXV3x9q4J1toi7cf7s3xcQtYqiTNVZ/
         Hrpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=jc3VoNps38gP52N34cu3yGytqUlELOuNHCAWIKCD/g0=;
        b=bOi/ZmtbysNos6Z9v6LYxSrTE9DivIwbmLRe9icjoS1+MNJ3jR3oxtDtEq2xvMEDp9
         TKHhEq8UQ6G24+z4pvHOY8QkDGzh/dCYNOHB573k64aUDx1kMayWOVqkgC/bfHHJ+7xN
         F4lehOJeKIseZizalF2RGmEQbv1ebuImFvETOTOo9u/WXfcgplJBSGpU0/vcpxjnWKp9
         fkS+HCZu6QivQYiuBdOuQEdCN+ir2Fkbz5T7ul3Td35aba1hD82bL9UjP3QP5GNKTeVJ
         1R3fe8HgNzxoJv1rlMhK+53aMtUnlaQPVPfkoVc9ZT2rEchlnmccbKTwFfrOnY9UIOZU
         V8Tw==
X-Gm-Message-State: AOAM530Hn3Ju81Lz2Kj2Jkl3sma5L/1WuTTHcOopOv2SrKAH7BUHj1ki
	UEAFK3/FLq7Zj+JRYprD5OHTF2eD7gWDtA==
X-Google-Smtp-Source: ABdhPJwZGqUZEt7jpsWbK99taIpnxQSNBuHBVlw6S33GCrRXA0K+prr2DpLyx1TbUHaAgPZXXwKSYQ==
X-Received: by 2002:a17:90a:de8d:: with SMTP id n13mr19893914pjv.95.1594051866560;
        Mon, 06 Jul 2020 09:11:06 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.11.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:11:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/25] libdrm: upgrade 2.4.100 -> 2.4.101
Date: Mon,  6 Jul 2020 06:10:03 -1000
Message-Id: <43b397c4a41ba17155fb1f57f3f0b015bb4c65b2.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Version update to fix autobuilder oe_selftest failures on Ubuntu 18.04 and 20.04

2020-06-29 20:57:58,686 - oe-selftest - INFO - runtime_test.TestImage.test_testimage_virgl_gtk_sdl (subunit.RemotedTestCase)
2020-06-29 20:57:58,687 - oe-selftest - INFO -  ... FAIL

musl-ioctl.patch
removed since it is included in 2.4.101

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 015e631cd18d982df03d4c829c0f8229a2face38)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../drm/libdrm/musl-ioctl.patch               | 35 -------------------
 .../{libdrm_2.4.100.bb => libdrm_2.4.101.bb}  |  7 ++--
 2 files changed, 3 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-graphics/drm/libdrm/musl-ioctl.patch
 rename meta/recipes-graphics/drm/{libdrm_2.4.100.bb => libdrm_2.4.101.bb} (92%)

diff --git a/meta/recipes-graphics/drm/libdrm/musl-ioctl.patch b/meta/recipes-graphics/drm/libdrm/musl-ioctl.patch
deleted file mode 100644
index e3d6c5b853..0000000000
--- a/meta/recipes-graphics/drm/libdrm/musl-ioctl.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 46c0fd6c827a8cb4d04e067bf04fab579ac4712e Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 18 Jun 2018 15:07:03 +0100
-Subject: [PATCH] tests/nouveau/threaded: adapt ioctl signature
-
-POSIX says ioctl() has the signature (int, int, ...) but glibc has decided to
-use (int, unsigned long int, ...) instead.
-
-Use a #ifdef to adapt the replacement function as appropriate.
----
- tests/nouveau/threaded.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/tests/nouveau/threaded.c b/tests/nouveau/threaded.c
-index 3669bcd3..e1c27c01 100644
---- a/tests/nouveau/threaded.c
-+++ b/tests/nouveau/threaded.c
-@@ -36,7 +36,11 @@ static int failed;
- 
- static int import_fd;
- 
-+#ifdef __GLIBC__
- int ioctl(int fd, unsigned long request, ...)
-+#else
-+int ioctl(int fd, int request, ...)
-+#endif
- {
- 	va_list va;
- 	int ret;
--- 
-2.11.0
-
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.100.bb b/meta/recipes-graphics/drm/libdrm_2.4.101.bb
similarity index 92%
rename from meta/recipes-graphics/drm/libdrm_2.4.100.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.101.bb
index 4859425672..8ec566faa9 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.100.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.101.bb
@@ -10,10 +10,9 @@ LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c5
 PROVIDES = "drm"
 DEPENDS = "libpthread-stubs"
 
-SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
-           file://musl-ioctl.patch"
-SRC_URI[md5sum] = "f47bc87e28198ba527e6b44ffdd62f65"
-SRC_URI[sha256sum] = "c77cc828186c9ceec3e56ae202b43ee99eb932b4a87255038a80e8a1060d0a5d"
+SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz"
+SRC_URI[md5sum] = "e6a6f1b88963210b3d62acd7310a1cc7"
+SRC_URI[sha256sum] = "ddf31baa8e49473624860bd166ce654dc349873f7a6c7b3305964249315c78a7"
 
 inherit meson pkgconfig manpages
 
-- 
2.17.1

