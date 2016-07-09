Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 50AB7601B8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jul 2016 09:19:59 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id w75so10736519wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jul 2016 02:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=JouYuoJn8/tV1Y9dmxKZzzJ3h3mgGFwmczrSOJeVv3c=;
	b=y1bbMpRnmB18ZSRlSif3493aOB57U7yzrrwkWL5gnXSxCOU7kRQpkprm90+l1oSrgN
	FK/O2OnD80mHhM93rzvaAZOCVS40Sj0n7UQ+TFnJ5F/Vin1O047lOCBAlDFdt8Gk8iF4
	dq2s6B43HI878CJ5OcRsl3Q4GHJFIiT9s+gnWqOU8DMbLhl9hC6T8evCt+uKNcHnWSuo
	ar6jgJrI/zcpqR83APc8LjECtiSwrURvzzKJwNYwhdmFpx2fiS1fimZOJJOyeLmEOFPN
	oWFXIu18IaIuzVLA1NdIkJuF5X8kDmx7LwST/CwtiTWAA0Dck8nkfKMxic/IcE88g4Qc
	e/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JouYuoJn8/tV1Y9dmxKZzzJ3h3mgGFwmczrSOJeVv3c=;
	b=NYhebv5BQmeHjIpPqv8Whu4bZF6BIiU1hWo8WWRSY8WM4oySIjBtFBdVj6bDpmtqWM
	A/+WJeZsJLUlcVhtDoqPsl6odP7CbKRjg8BLTiHT2xQW23igdfjkVGTsvfKXSeLgXSPO
	snkc21dDyyLYUVoe/hVnQIuN7orqYtRNGrV1jasdh42hCOn821AzCe7st45H7Fj7Bmxi
	eoqtCrnWCda1Co9141GGb3pHwLNDi5upNI5Rcogw3Y98w+yEzWmn1O/6QKhpaMy5dppY
	+tYhN4uEPvogSrB7s950OghD1lckGgi+BOb+0ATe1h+dpBvsYfRYlH9597faYs2FOtMI
	NuTw==
X-Gm-Message-State: ALyK8tKQqIzHAOLTuWbHLN42BjbgNWtjnB8D0vsiaYgvabkzKsanBB/qCCCE4T3y4HMlmQ==
X-Received: by 10.28.94.18 with SMTP id s18mr2524598wmb.42.1468055999517;
	Sat, 09 Jul 2016 02:19:59 -0700 (PDT)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id h4sm2938495wjw.25.2016.07.09.02.19.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jul 2016 02:19:58 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jul 2016 11:19:30 +0200
Message-Id: <1468055970-3187-1-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.5.5
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-fsl-arm][PATCH] gstreamer1.0-plugins-bad: remove patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Jul 2016 09:20:01 -0000

With the upgrade to gstremaer 1.8.x this patch does no longer apply.
Upstream changed to install the headers required, so the patch is also
no longer needed:
https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit?h=1.8&id=c87a7e266732ab9a0bd0e5a5c104b06d0f1a2072

Updated to 1.8 in oe-core:
http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-multimedia/gstreamer?id=6a326f2b37b0b49e1144428becda32400498c024

or the poky git:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-multimedia/gstreamer?id=79ca8d031e5a706f00d5c97ba23b496e6d700b7e

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 ...ll-gstaggregator-and-gstvideoaggregator-h.patch | 61 ----------------------
 .../gstreamer/gstreamer1.0-plugins-bad_%.bbappend  |  6 ---
 2 files changed, 67 deletions(-)
 delete mode 100755 recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-PATCH-install-gstaggregator-and-gstvideoaggregator-h.patch

diff --git a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-PATCH-install-gstaggregator-and-gstvideoaggregator-h.patch b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-PATCH-install-gstaggregator-and-gstvideoaggregator-h.patch
deleted file mode 100755
index 52e2d9a..0000000
--- a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-PATCH-install-gstaggregator-and-gstvideoaggregator-h.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 853d7f2ca821682c1e1e594b23ff654505e07054 Mon Sep 17 00:00:00 2001
-From: Mingke Wang <mingke.wang@freescale.com>
-Date: Wed, 1 Jul 2015 10:19:25 +0800
-Subject: [PATCH] [PATCH] install gstaggregator and gstvideoaggregator header
- file
-
-intall the header file of gstaggregator and gstvideoaggregator
-so that we can use them outside of gstreamer-plugins-bad package
-
-Upstream-Status: Inappropriate [i.MX specific]
-
-Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
-
-diff --git a/gst-libs/gst/base/Makefile.am b/gst-libs/gst/base/Makefile.am
-old mode 100644
-new mode 100755
-index 0d55368..7268095
---- a/gst-libs/gst/base/Makefile.am
-+++ b/gst-libs/gst/base/Makefile.am
-@@ -6,11 +6,12 @@ libgstbadbase_@GST_API_VERSION@_la_SOURCES = \
- libgstbadbase_@GST_API_VERSION@_la_CFLAGS = $(GST_CFLAGS) \
- 	-DGST_USE_UNSTABLE_API
- 
-+libgstbadbase_@GST_API_VERSION@includedir = $(includedir)/gstreamer-@GST_API_VERSION@/gst/base
-+libgstbadbase_@GST_API_VERSION@include_HEADERS = \
-+        gstaggregator.h
-+
- libgstbadbase_@GST_API_VERSION@_la_LIBADD = $(GST_LIBS)
- libgstbadbase_@GST_API_VERSION@_la_LDFLAGS = $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS) $(GST_LT_LDFLAGS)
- 
--noinst_HEADERS =	\
--	gstaggregator.h
--
- EXTRA_DIST = 
- 
-diff --git a/gst-libs/gst/video/Makefile.am b/gst-libs/gst/video/Makefile.am
-old mode 100644
-new mode 100755
-index 4f0f09f..3c5da6b
---- a/gst-libs/gst/video/Makefile.am
-+++ b/gst-libs/gst/video/Makefile.am
-@@ -16,11 +16,14 @@ libgstbadvideo_@GST_API_VERSION@_la_CFLAGS = \
- 	$(GST_PLUGINS_BASE_CFLAGS) \
- 	$(GST_BASE_CFLAGS)
- 
-+libgstbadvideo_@GST_API_VERSION@includedir = $(includedir)/gstreamer-@GST_API_VERSION@/gst/video
-+libgstbadvideo_@GST_API_VERSION@include_HEADERS = \
-+        gstvideoaggregatorpad.h \
-+        gstvideoaggregator.h
-+
- libgstbadvideo_@GST_API_VERSION@_la_LIBADD = \
- 	$(top_builddir)/gst-libs/gst/base/libgstbadbase-$(GST_API_VERSION).la \
- 	$(GST_PLUGINS_BASE_LIBS) -lgstvideo-$(GST_API_VERSION) \
- 	$(GST_BASE_LIBS) $(GST_LIBS) $(ORC_LIBS) $(LIBM)
- 
- libgstbadvideo_@GST_API_VERSION@_la_LDFLAGS = $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS) $(GST_LT_LDFLAGS)
--
--noinst_HEADERS = gstvideoaggregatorpad.h gstvideoaggregator.h
--- 
-1.7.9.5
-
diff --git a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend
index 11c4eb9..89aaafb 100644
--- a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend
+++ b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend
@@ -1,6 +1,5 @@
 # Vivante EGL headers require the correct preprocessor
 # defines to be set for each platform
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 CFLAGS_append_mx6 = " -DLINUX \
                       ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', \
@@ -10,11 +9,6 @@ PACKAGECONFIG_GL_mx6sl = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', \
                            bb.utils.contains('DISTRO_FEATURES', 'x11', \
                                     'opengl', '', d), '', d)}"
 
-SRC_URI_append_mx6 = " file://0001-PATCH-install-gstaggregator-and-gstvideoaggregator-h.patch"
-SRC_URI_append_mx6ul = " file://0001-PATCH-install-gstaggregator-and-gstvideoaggregator-h.patch"
-SRC_URI_append_mx7 = " file://0001-PATCH-install-gstaggregator-and-gstvideoaggregator-h.patch"
-
-
 PACKAGE_ARCH_mx6 = "${MACHINE_SOCARCH}"
 PACKAGE_ARCH_mx6ul = "${MACHINE_SOCARCH}"
 PACKAGE_ARCH_mx7 = "${MACHINE_SOCARCH}"
-- 
2.5.5


