Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.977.1603478628109084907
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 11:43:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RGzwFvhg;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id w23so1615457wmi.4
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 11:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IsY96sw6lMmpf2reulR+TqzDOOe+yH5jnvPcKflK+6U=;
        b=RGzwFvhgEagcV3wcsmjppKkHrZfxvOxdRP08sVTX/otMOrwClZEfYU7/Qch6uz3vcu
         KgR891ZNIQFJF4CJaUMQfR5fPHOrqgD/nvDp6LRnXzLrXqervAQ6vaOKlikIGmkSWI47
         kKVXhr46hHiZqFDrlRurl0TrUb6melosRro7/1Ri7NQmJ53lQfT66twajD0H+GVMPnqo
         8AzmwNTBzJGftyHDlekAuyoFBGZn1eUgLUU6yZNSUh0BTGaMrrVnVMMEj1q9Y9HsasI7
         rW6153Wqitq+B7n9CsF2ilzPLoSuZ3+ryVLfJooUcmhEGXg0u8+KH9bYEZ0lC6dgGRZC
         YSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IsY96sw6lMmpf2reulR+TqzDOOe+yH5jnvPcKflK+6U=;
        b=A0xg2+jin0wlND07tVM5pvJdfJCjpUViOik5nHUeaAuPzVOMGwAPk0X/NvybVmwEOJ
         KpKW6LKOhug4NkhFPHaUVVPs3q7t0CLqqrzq1j744zwXolux1cJ1nWSG3Ni2/OkV+Erb
         EZd+rrdXTOs/7tmlYgCyIu/x88CwMulZPHopDa46AbqgQC+s9tnl0mWLHjYmEUr5vkEu
         NExj2klY7jhMlW6T47MF0QHNh5ZT3/er+t3PQZTOF8riLjDIHvhD00M3NXz5DCFeYTUc
         /iQ+ART1+MZl2lWpwg5fYo+SgRHFeuB6LpPt5Hmk6ilYtrRyCgXokuGWISUydjO4t+gf
         BG0A==
X-Gm-Message-State: AOAM532XHdTFjCFkQlwR61m/tE2/rZ68YWCCGoxxfem1kfGmQjni2+aQ
	rQ9GYzbdgIt6hi/Y3C9qyfjxhUy9M9H14A==
X-Google-Smtp-Source: ABdhPJxpjeeuwq7jghVl5neq13btEfeu0vPwvPkBo1REMynjO3dUnolMgmFhd/PN8UOKBCQr6w088w==
X-Received: by 2002:a7b:cb10:: with SMTP id u16mr3651721wmj.20.1603478626356;
        Fri, 23 Oct 2020 11:43:46 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b7sm4999302wrp.16.2020.10.23.11.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 11:43:45 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 05/21] gstreamer1.0-plugins-good: upgrade to version 1.18.0
Date: Fri, 23 Oct 2020 19:41:16 +0100
Message-Id: <20201023184132.3208737-6-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201023184132.3208737-1-quaresma.jose@gmail.com>
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

    * 0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.patch
      Removed since these are included in 1.18.0

License-Update: remove file://common/coverage/coverage-report.pl
Upstream dont have it any more.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...defines-GLsync-to-fix-compile-on-som.patch | 70 -------------------
 ...t-gstqtgl.h-instead-of-gst-gl-gstglf.patch |  8 +--
 ...bb => gstreamer1.0-plugins-good_1.18.0.bb} | 14 ++--
 3 files changed, 10 insertions(+), 82 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.16.2.bb => gstreamer1.0-plugins-good_1.18.0.bb} (84%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.patch
deleted file mode 100644
index 136848763b..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 3e0d5577444b32579bdf5b69d720a322322ff7bc Mon Sep 17 00:00:00 2001
-From: Milian Wolff <milian.wolff@kdab.com>
-Date: Tue, 26 Nov 2019 15:08:20 +0100
-Subject: [PATCH] qmlgl: ensure Qt defines GLsync to fix compile on some platforms
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-By explictly including QtGui/qopengl.h we force the code path that
-defines GLsync in the Qt-specific way. Without that, some platforms
-failed to compile the qmlgl plugin, since neither Qt nor gstreamer
-defined GLsync then, leading to e.g.:
-
-```
-make[4]: Entering directory '/.../gst-plugins-good-1.16.1/ext/qt'
-  CXX      libgstqmlgl_la-qtitem.lo
-In file included from gstqtgl.h:32,
-                 from qtitem.h:27,
-                 from qtitem.cc:28:
-/.../usr/include/gstreamer-1.0/
-gst/gl/gstglfuncs.h:93:17: error: expected identifier before ‘*’ token
-   ret (GSTGLAPI *name) args;
-                 ^
-/.../usr/include/gstreamer-1.0/
-gst/gl/glprototypes/sync.h:27:1: note: in expansion of macro
-‘GST_GL_EXT_FUNCTION’
- GST_GL_EXT_FUNCTION (GLsync, FenceSync,
- ^~~~~~~~~~~~~~~~~~~
-```
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/commit/3e0d5577444b32579bdf5b69d720a322322ff7bc]
----
- ext/qt/gstqtgl.h | 18 +++++++++++-------
- 1 file changed, 11 insertions(+), 7 deletions(-)
-
---- a/ext/qt/gstqtgl.h
-+++ b/ext/qt/gstqtgl.h
-@@ -22,14 +22,7 @@
- #include <QtGui/qtgui-config.h>
- #endif
- 
--/* qt uses the same trick as us to typedef GLsync on GLES2 but to a different
-- * type which confuses the preprocessor. Instead of trying to reconcile the
-- * two, we instead use the GLsync definition from Qt from above, and ensure
-- * that we don't typedef GLsync in gstglfuncs.h */
- #include <gst/gl/gstglconfig.h>
--#undef GST_GL_HAVE_GLSYNC
--#define GST_GL_HAVE_GLSYNC 1
--#include <gst/gl/gstglfuncs.h>
- 
- /* The glext.h guard was renamed in 2018, but some software which
-  * includes their own copy of the GL headers (such as qt) might have
-@@ -46,6 +39,17 @@
- #endif
- #endif
- 
-+/* pulls in GLsync, see below */
-+#include <QtGui/qopengl.h>
-+
-+/* qt uses the same trick as us to typedef GLsync on GLES2 but to a different
-+ * type which confuses the preprocessor. Instead of trying to reconcile the
-+ * two, we instead use the GLsync definition from Qt from above, and ensure
-+ * that we don't typedef GLsync in gstglfuncs.h */
-+#undef GST_GL_HAVE_GLSYNC
-+#define GST_GL_HAVE_GLSYNC 1
-+#include <gst/gl/gstglfuncs.h>
-+
- #if defined(QT_OPENGL_ES_2)
- #include <QtGui/QOpenGLContext>
- #include <QtGui/QOpenGLFunctions>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch
index 3d423154e0..788d752058 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch
@@ -1,4 +1,4 @@
-From d08234a659bec1fd5c984fedefbeb8192af07839 Mon Sep 17 00:00:00 2001
+From bf8b2fa0f6870589d036f0f33c140a3f85b530a0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 31 Mar 2020 21:23:28 -0700
 Subject: [PATCH] qt: include ext/qt/gstqtgl.h instead of gst/gl/gstglfuncs.h
@@ -26,7 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ext/qt/gstqsgtexture.cc b/ext/qt/gstqsgtexture.cc
-index 2b314e0..12b15dd 100644
+index a05d26e..4cc9fc6 100644
 --- a/ext/qt/gstqsgtexture.cc
 +++ b/ext/qt/gstqsgtexture.cc
 @@ -27,7 +27,7 @@
@@ -39,7 +39,7 @@ index 2b314e0..12b15dd 100644
  
  #define GST_CAT_DEFAULT gst_qsg_texture_debug
 diff --git a/ext/qt/qtwindow.cc b/ext/qt/qtwindow.cc
-index 62d26b6..bf68ebb 100644
+index 9360c33..0dfd3f1 100644
 --- a/ext/qt/qtwindow.cc
 +++ b/ext/qt/qtwindow.cc
 @@ -25,7 +25,7 @@
@@ -52,5 +52,5 @@ index 62d26b6..bf68ebb 100644
  #include "gstqsgtexture.h"
  #include "gstqtglutility.h"
 -- 
-2.26.0
+2.28.0
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
similarity index 84%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
index 17c9421394..c112f336b2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
@@ -1,19 +1,16 @@
 require gstreamer1.0-plugins-common.inc
 
-SRC_URI = " \
-            https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
-            file://0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.patch \
-            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
-            "
+SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
+           file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
+           "
 
-SRC_URI[md5sum] = "bd025f8f14974f94b75ac69a9d1b9c93"
-SRC_URI[sha256sum] = "40bb3bafda25c0b739c8fc36e48380fccf61c4d3f83747e97ac3f9b0171b1319"
+SRC_URI[md5sum] = "c437bf42bf830bc0f482c7d088fb37a5"
+SRC_URI[sha256sum] = "6329bc377a3afea5cf1ab329a91cc4a906f075781780d1edc59e8bea8c1a8bac"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
 DEPENDS += "gstreamer1.0-plugins-base libcap zlib"
@@ -54,6 +51,7 @@ PACKAGECONFIG[wavpack]    = "-Dwavpack=enabled,-Dwavpack=disabled,wavpack"
 PACKAGECONFIG[x11]        = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
 
 EXTRA_OEMESON += " \
+    -Ddoc=disabled \
     -Daalib=disabled \
     -Ddirectsound=disabled \
     -Ddv=disabled \
-- 
2.29.0

