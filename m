Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.39513.1602506203355084243
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 05:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fdem6AsB;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id g12so18984105wrp.10
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 05:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bEUOIMXzIlAWHpKv8E1Rh8n+MHsFOJ8sFiGhRnM+z6E=;
        b=fdem6AsBVZWTd5SX1eG8Z0XWpHmR5HpqWvnld0NRQTZxd0RPJVV9USDWsLRkLZs2KB
         owv2Jqf6EWjWvcO36C3WxGsNS5JOVScQepwla/S+rtQJe1vGlqATfIT+XWdy1ZOAcSZy
         A3wGrgsBKRGPFPmKXc6XLcunf0FPjg+PxUR2yaS+HHShLJXOyK9OzLRapVX5ZbLMQ6fs
         ncwlG6KKznLT96AeSfS3yJAGVo1aDRxILtD8KNWqeroqsWAOA21FdwLzAjiDQEQLXlwp
         COvjaZ3oZCpE9huqGpJB+TzyC2uhPVe3lMtumX2gDXR+wxMI6e91PbFMfEB0tmMfoBb3
         ZuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bEUOIMXzIlAWHpKv8E1Rh8n+MHsFOJ8sFiGhRnM+z6E=;
        b=XhNrBMxaA/mV5sy3eD4EIjFyykDrB2/U2wGeXoC0fL802BQ+MACG+8xdszOuq+IfvA
         tmU5Y6NokgOMunRQMrAkkdiaUZMZxYZA+rbJ1a9+CduDTAMpdEtAcotCmDq49vLeVERO
         5qsRY/xCqDlh2BComKRyzRp8n+Rmb6nfQ1Ct6ojlnGbkKCQDq58ji0rcvJb0CD+Ew6XS
         bzRBQVhU76Nfx4S5T4WeidbI86UYgwnE6OtYdKFATXUga8UhJB6oq+E2jBXH/PY4FEUh
         bjboJ96IOuY7SMhCEN0Zt6v/sV6UxvLhCXVprUQsmYMgM4SMtVERLlQD3QguoDBSJqIU
         MyeA==
X-Gm-Message-State: AOAM531/fFElb1Kf3iq3HiROojel7SHJqAWkj3Z+vPVP1hs6xSkQCoPM
	GkNO0XA9Oah4x7MF9GL1RlIfjQZzw3UQqQ==
X-Google-Smtp-Source: ABdhPJyx1YphnUIwNCsk8ZWOq/H86FSBI5CpjPLWeksYkk4AbyOEfV5zpxIObT2UdE0XNN7pyz2oeA==
X-Received: by 2002:adf:9dd1:: with SMTP id q17mr23298116wre.317.1602506201493;
        Mon, 12 Oct 2020 05:36:41 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id i14sm23076089wml.24.2020.10.12.05.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 05:36:40 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 03/13] gstreamer1.0-plugins-good: upgrade to version 1.18.0
Date: Mon, 12 Oct 2020 13:36:10 +0100
Message-Id: <20201012123620.2095778-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012123620.2095778-1-quaresma.jose@gmail.com>
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

    * 0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.patch
      Removed since these are included in 1.18.0

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...defines-GLsync-to-fix-compile-on-som.patch | 70 -------------------
 ...t-gstqtgl.h-instead-of-gst-gl-gstglf.patch | 10 +--
 ...bb => gstreamer1.0-plugins-good_1.18.0.bb} | 17 ++---
 3 files changed, 15 insertions(+), 82 deletions(-)
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
index 3d423154e0..368a597fd7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch
@@ -1,4 +1,4 @@
-From d08234a659bec1fd5c984fedefbeb8192af07839 Mon Sep 17 00:00:00 2001
+From bf8b2fa0f6870589d036f0f33c140a3f85b530a0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 31 Mar 2020 21:23:28 -0700
 Subject: [PATCH] qt: include ext/qt/gstqtgl.h instead of gst/gl/gstglfuncs.h
@@ -20,13 +20,15 @@ In file included from /mnt/b/yoe/build/tmp/work/cortexa7t2hf-neon-vfpv4-yoe-linu
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+%% original patch: 0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch
 ---
  ext/qt/gstqsgtexture.cc | 2 +-
  ext/qt/qtwindow.cc      | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/ext/qt/gstqsgtexture.cc b/ext/qt/gstqsgtexture.cc
-index 2b314e0..12b15dd 100644
+index a05d26e..4cc9fc6 100644
 --- a/ext/qt/gstqsgtexture.cc
 +++ b/ext/qt/gstqsgtexture.cc
 @@ -27,7 +27,7 @@
@@ -39,7 +41,7 @@ index 2b314e0..12b15dd 100644
  
  #define GST_CAT_DEFAULT gst_qsg_texture_debug
 diff --git a/ext/qt/qtwindow.cc b/ext/qt/qtwindow.cc
-index 62d26b6..bf68ebb 100644
+index 9360c33..0dfd3f1 100644
 --- a/ext/qt/qtwindow.cc
 +++ b/ext/qt/qtwindow.cc
 @@ -25,7 +25,7 @@
@@ -52,5 +54,5 @@ index 62d26b6..bf68ebb 100644
  #include "gstqsgtexture.h"
  #include "gstqtglutility.h"
 -- 
-2.26.0
+2.28.0
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
similarity index 84%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
index 17c9421394..860b31106f 100644
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
@@ -23,6 +20,7 @@ RPROVIDES_${PN}-soup += "${PN}-souphttpsrc"
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
+    ${@bb.utils.contains('TUNE_FEATURES', 'm64', 'asm', '', d)} \
     bz2 cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup speex taglib v4l2 \
 "
 
@@ -30,6 +28,7 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
 X11ENABLEOPTS = "-Dximagesrc=enabled -Dximagesrc-xshm=enabled -Dximagesrc-xfixes=enabled -Dximagesrc-xdamage=enabled"
 X11DISABLEOPTS = "-Dximagesrc=disabled -Dximagesrc-xshm=disabled -Dximagesrc-xfixes=disabled -Dximagesrc-xdamage=disabled"
 
+PACKAGECONFIG[asm]        = "-Dasm=enabled,-Dasm=disabled,nasm"
 PACKAGECONFIG[bz2]        = "-Dbz2=enabled,-Dbz2=disabled,bzip2"
 PACKAGECONFIG[cairo]      = "-Dcairo=enabled,-Dcairo=disabled,cairo"
 PACKAGECONFIG[dv1394]     = "-Ddv1394=enabled,-Ddv1394=disabled,libiec61883 libavc1394 libraw1394"
@@ -54,6 +53,7 @@ PACKAGECONFIG[wavpack]    = "-Dwavpack=enabled,-Dwavpack=disabled,wavpack"
 PACKAGECONFIG[x11]        = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
 
 EXTRA_OEMESON += " \
+    -Ddoc=disabled \
     -Daalib=disabled \
     -Ddirectsound=disabled \
     -Ddv=disabled \
@@ -62,6 +62,7 @@ EXTRA_OEMESON += " \
     -Doss4=disabled \
     -Dosxaudio=disabled \
     -Dosxvideo=disabled \
+    -Drpicamsrc=disabled \
     -Dshout2=disabled \
     -Dtwolame=disabled \
     -Dwaveform=disabled \
-- 
2.28.0

