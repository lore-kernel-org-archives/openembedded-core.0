Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.7060.1593257698674307313
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2020 04:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PsMaED/c;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id a6so11936849wrm.4
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2020 04:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cg09yP63RODU0nvu0VtlnRsfh/cfhH6EXq7HzSyM568=;
        b=PsMaED/c3k5n+e6z8FuGvRzyWNr+HCNBIXu0/R39jp6sV1Bjqj4NsdsiyOW/ud9hTi
         Y+Ccm1vswod8oDKXD7Mx8jUU4LG/wwf3gB3CGhPf74NY9tZL1LBWOqQxeOO1AYpdvpW7
         yOs6PNXpFkASW9oXfrw3U14zq4j6AqLNGhExKlyUYAKixrJJuaW15BV9uYYbC+MJLccZ
         jfOF7YehNFqIiLSKhJyTPxkCPirjt5Z4c9aPFCH0CjbeNWvKnHpu8HcK8SwJOfuqZXfk
         YSBdMq3Z+BCYTVXbwqUvN2nUYGBc2wPMiQ2S+C400bu6SKPBDDuu+3duP3UnmjppZCuK
         7Xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cg09yP63RODU0nvu0VtlnRsfh/cfhH6EXq7HzSyM568=;
        b=oTXsBAt4+smkAPRG9pBP0o62CEXnEfsNsZ/91s3Amx9p4dD9wILyl4gZnSAKh6j9Y9
         BtV7bDlB7PWspkOw9y+sxQp2dl+ezYk/ZE4WjA/hq4DQcdW1hzlP3KYL/om2O5eZiq4t
         g3/GsVGfihJG9ocykfPknP0BAxyYcJQy4eHNmmwBQt1Swrbo+YQGQDE1qG8hD8EBG9xP
         Nv+1AiYxCM6zXiJvic6pH9B4CPXOlDwtJdUABI5sbBCGiG5LXtNYssRTEO3k6/RPEsDe
         kH5ZkY6lo0ydurAPkGarAautrR81EDweApMOp+hfWgJJ7ESb70evXfVFeJsEc+n5hC6D
         0zRA==
X-Gm-Message-State: AOAM531HnJRLAdOJKCdb7WSa96g6tyeq03oLjl76hIcG4lArXig61Q8B
	H6b6E7RvFnhz4BuIrFyEHwK4fAeu
X-Google-Smtp-Source: ABdhPJwHK/dktB1BuZA5jlIYReW4NPssyXAHbJF64KMrCXZiiS12rffMXLCZ2l6mzCyUmW1Sjvy8qw==
X-Received: by 2002:adf:f608:: with SMTP id t8mr8362748wrp.308.1593257696768;
        Sat, 27 Jun 2020 04:34:56 -0700 (PDT)
Return-Path: <max.oss.09@gmail.com>
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch. [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id n14sm19369678wro.81.2020.06.27.04.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2020 04:34:56 -0700 (PDT)
From: "Max Krummenacher" <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [[OE-core][Patch] cogl-1.0: : don't require eglmesaext.h
Date: Sat, 27 Jun 2020 13:34:17 +0200
Message-Id: <20200627113417.25595-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting with 1.22.8 cogl code unconditionally includes eglmesaext.h.
Change configure.ac so that eglmesaext.h is only included if it actually
exists.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 ...figure.ac-don-t-require-eglmesaext.h.patch | 77 +++++++++++++++++++
 meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0/0001-configure.ac-don-t-require-eglmesaext.h.patch

diff --git a/meta/recipes-graphics/cogl/cogl-1.0/0001-configure.ac-don-t-require-eglmesaext.h.patch b/meta/recipes-graphics/cogl/cogl-1.0/0001-configure.ac-don-t-require-eglmesaext.h.patch
new file mode 100644
index 0000000000..16ab2d7797
--- /dev/null
+++ b/meta/recipes-graphics/cogl/cogl-1.0/0001-configure.ac-don-t-require-eglmesaext.h.patch
@@ -0,0 +1,77 @@
+From ca94946110f4aaeeb0cbc75e11a619b21f295056 Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Thu, 25 Jun 2020 11:27:40 +0000
+Subject: [PATCH] configure.ac: don't require eglmesaext.h
+
+E.g. the Vivante EGL implementation does not provide eglmesaext.h.
+
+The commit moves the check for header file existence outside of the
+check for existence of a egl packageconfig and makes the existence
+of eglmesaext.h optional.
+
+fixes commit fb1acfec ("Fix building against libglvnd-provided EGL headers")
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/cogl/-/merge_requests/28]
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+---
+ configure.ac | 36 +++++++++++++++++-------------------
+ 1 file changed, 17 insertions(+), 19 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 12798e9f..f7fa40e2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1212,22 +1212,6 @@ AS_IF([test "x$NEED_EGL" = "xyes" && test "x$EGL_CHECKED" != "xyes"],
+         PKG_CHECK_EXISTS([egl],
+           [COGL_PKG_REQUIRES="$COGL_PKG_REQUIRES egl"],
+           [
+-            AC_CHECK_HEADERS(
+-              [EGL/egl.h],
+-              [],
+-              [AC_MSG_ERROR([Unable to locate required EGL headers])])
+-            AC_CHECK_HEADERS(
+-              [EGL/eglext.h],
+-              [],
+-              [AC_MSG_ERROR([Unable to locate required EGL headers])],
+-              [#include <EGL/egl.h>])
+-            AC_CHECK_HEADERS(
+-              [EGL/eglmesaext.h],
+-              [],
+-              [AC_MSG_ERROR([Unable to locate required EGL headers])],
+-              [#include <EGL/egl.h>
+-#include <EGL/eglext.h>])
+-
+             AC_CHECK_LIB(EGL, [eglInitialize],
+               [COGL_EXTRA_LDFLAGS="$COGL_EXTRA_LDFLAGS -lEGL"],
+               [AC_MSG_ERROR([Unable to locate required EGL library])])
+@@ -1236,9 +1220,23 @@ AS_IF([test "x$NEED_EGL" = "xyes" && test "x$EGL_CHECKED" != "xyes"],
+           ]
+           )
+ 
+-        COGL_EGL_INCLUDES="#include <EGL/egl.h>
+-#include <EGL/eglext.h>
+-#include <EGL/eglmesaext.h>"
++        AC_CHECK_HEADERS(
++          [EGL/egl.h],
++          [COGL_EGL_INCLUDES="#include <EGL/egl.h>"],
++          [AC_MSG_ERROR([Unable to locate required EGL headers])])
++        AC_CHECK_HEADERS(
++          [EGL/eglext.h],
++          [COGL_EGL_INCLUDES="$COGL_EGL_INCLUDES
++#include <EGL/eglext.h>"],
++          [AC_MSG_ERROR([Unable to locate required EGL headers])],
++          [$COGL_EGL_INCLUDES])
++        AC_CHECK_HEADERS(
++          [EGL/eglmesaext.h],
++          [COGL_EGL_INCLUDES="$COGL_EGL_INCLUDES
++#include <EGL/eglmesaext.h>"],
++          [],
++          [$COGL_EGL_INCLUDES])
++
+         AC_SUBST([COGL_EGL_INCLUDES])
+       ])
+ 
+-- 
+2.20.1
+
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
index 78f6b0e7a3..b9446fab38 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
+++ b/meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
@@ -1,5 +1,6 @@
 require cogl-1.0.inc
 
+SRC_URI += "file://0001-configure.ac-don-t-require-eglmesaext.h.patch"
 SRC_URI[archive.sha256sum] = "a805b2b019184710ff53d0496f9f0ce6dcca420c141a0f4f6fcc02131581d759"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
-- 
2.20.1

