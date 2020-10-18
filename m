Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.18807.1603023026017683817
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 05:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rYDgO1a6;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id t9so8293100wrq.11
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2020 05:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I/ktP63qqaMLl+LCZkcCEmlBdI12vQdj+pu/FIQ7qmo=;
        b=rYDgO1a6WZAi2ws2T6YmZ5zPaWsnlFG4iXwLeD40IpJS7kGT+DtE0WCjMa7exrOabb
         3Go9HpEcv2oGqUajuJoGc6qsdIc8nZYCucnNpu5tAWB/g+Tf13QznLmqExScScqrTPhr
         XpCYXi1p/LP+4j90nlf1LJ6z1fOhfjmD3V7LMwvQtEL7kLHdFH4zdawdKotqM2G6L32M
         Lab/3DTPPNe3xbBql3duu48JYuVnCThWHvaPtXBmi7qui7SRKZ4zMFNYLYVX0wZFGsCj
         AO9UA49PKG3+AtjHtqLmR+Qc960LvVENXEaiOC4xvMgbm17WjOmlUEnNCQzOcBzr3xNC
         SWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I/ktP63qqaMLl+LCZkcCEmlBdI12vQdj+pu/FIQ7qmo=;
        b=ZiqrSM3lkgrxKi8fZnZyvBv/RjV++LvPt7vDu3wKM+Tby7aLwAhug0W7JJZg7BkETn
         b2LK5SWzQY5q8scLWVu+jPB5g7773NKgpe0qXr9WWtTK5c6s+KsN1y8Iz2eZ0VTfYh9B
         fVsfemiNyhwjOeiQ8EXfItGVcMuUVNHnaboSJapTMSZjyMU7quq/4tF369lZG/nW4mWP
         00UHrNeSw2VG/Ws90zr6hOC44z1pyNdCWmV7YjDugaSqixp6q4MmpR9ABwkC4OCZBEg3
         TzHZcML+0AzrrSyBVlI3SY+64CSfjHC6F8RgYeUNm+gL2wA3KNkpifOaV/POimQpt99e
         yvOg==
X-Gm-Message-State: AOAM530oP72MqIgB2QcOVTSpuu4xp4md8uEBEgJDX24RnHExB+i4dJ+D
	glQLCOAoEgXg5NYSAgvF46SDzUzmAJIXag==
X-Google-Smtp-Source: ABdhPJyAsy3saNG/E2oy2FibV5jzdwFLCILq2AhFtaryRgey7a2AAsmDhAX60bXog7H3EKSASIML8g==
X-Received: by 2002:a5d:4dc1:: with SMTP id f1mr8754478wru.42.1603023024256;
        Sun, 18 Oct 2020 05:10:24 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id z18sm9511084wrs.82.2020.10.18.05.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:10:23 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 05/20] gstreamer1.0-plugins-good: upgrade to version 1.18.0
Date: Sun, 18 Oct 2020 13:09:47 +0100
Message-Id: <20201018121002.1417335-6-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018121002.1417335-1-quaresma.jose@gmail.com>
References: <20201018121002.1417335-1-quaresma.jose@gmail.com>
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
2.28.0

