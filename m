Return-Path: <crg7475@mailbox.org>
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	by mail.openembedded.org (Postfix) with ESMTP id 254737F7CB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 12:54:40 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 47bPP40NDJzQlBH
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 13:49:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1576414166; bh=NqmWB+mmS+e40Sx
	wAXa2aahs9cL5nPgxu0RiEWyT5BI=; b=EKkMVUkJFVy88UHJ6YIBAPPJfZ3s46O
	TtkcpPakPOCn/aIlRVBCvUhfOgI6vb+o8GAePKB19gP2GjJGNGgf1WKYt24CPkwu
	3T/f/SNTg8b3iqqaaY/udhjd0TAwFLL+3plRPPZkDd8WAUOGg728wb1ATumOhXCk
	/N5pwakYO/xrbh/WkonHn7W2B+k8dHatG6UBVwXmQhVDDMaevvHn8pjYjC+Pikw6
	mb68d4nmkYm4j1+HXRiuNpV0RRCh3esAH+wLpPGnOC6IAgP8H13sPUP8BEuDhJAK
	zbkrMjA7oNSy9n8FRPA+6aUPCB/Avd1N1Z1I2so5gYSu8dhB8J740Fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1576414167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=wt8S9S2VDj7/TwvWnu5RH46C+v7e+nXSBFgleo0NnGc=;
	b=EyhOiFdaKeTQmvUrUP/kSpMWn41PDyT7fcC+M3jr5I5JbSo77GR7PsoWK0IBYb++xXXxFJ
	I3JHcvwTM+iYBM/r/fIGW9pmodoFDKP6abVKJtawlK57ljH7M0B7ZQMsXMZcYYmlo06EWx
	8gqDqRK56Hnov7Fty9qgmAKGpXmWXZ8J1vGj0y0OsQQK5zOHIS2rMjJN0AiIerXlH11emE
	5JqT0t1DuUv5rVlP4BcOEC5cv3outt1w9ZTRozEBsuis30jzD5U9jiuu1Ayq3HfWroY1rr
	YNzr5J/bf+/CBlpYn3Kr5IzdOibwF821REnTukfqmiWIfsVor9zpgrApPcs6tw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by gerste.heinlein-support.de (gerste.heinlein-support.de
	[91.198.250.173]) (amavisd-new, port 10030)
	with ESMTP id zW03XkClwLih
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 13:49:26 +0100 (CET)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Dec 2019 13:49:06 +0100
Message-Id: <20191215124910.24946-8-crg7475@mailbox.org>
In-Reply-To: <20191215124910.24946-1-crg7475@mailbox.org>
References: <20191215124910.24946-1-crg7475@mailbox.org>
Subject: [WIP][PATCH 08/12] gstreamer1.0-vaapi: Transition to meson based builds
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
X-List-Received-Date: Sun, 15 Dec 2019 12:54:40 -0000

* Removed autotools/M4 related patch
  0001-gst-vaapi-Makefile.am-Add-EGL_CFLAGS-to-libgstvaapi-.patch.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...le.am-Add-EGL_CFLAGS-to-libgstvaapi-.patch | 33 -------------------
 .../gstreamer/gstreamer1.0-vaapi_1.16.1.bb    | 26 ++++++++++-----
 2 files changed, 17 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-gst-vaapi-Makefile.am-Add-EGL_CFLAGS-to-libgstvaapi-.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-gst-vaapi-Makefile.am-Add-EGL_CFLAGS-to-libgstvaapi-.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-gst-vaapi-Makefile.am-Add-EGL_CFLAGS-to-libgstvaapi-.patch
deleted file mode 100644
index d7b8984953..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-gst-vaapi-Makefile.am-Add-EGL_CFLAGS-to-libgstvaapi-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5403a89e6a7ac72a23e0221075c0c19b5f85a021 Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Wed, 13 Jun 2018 09:09:25 -0300
-Subject: [PATCH] gst/vaapi/Makefile.am: Add EGL_CFLAGS to libgstvaapi CFLAGS
-Organization: O.S. Systems Software LTDA.
-
-We need this to pass correctly EGL CFLAGS when building with EGL support.
-
-Upstream-Status: Pending
-
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
----
- gst/vaapi/Makefile.am | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/gst/vaapi/Makefile.am b/gst/vaapi/Makefile.am
-index b299ac98..d6cab71f 100644
---- a/gst/vaapi/Makefile.am
-+++ b/gst/vaapi/Makefile.am
-@@ -24,6 +24,10 @@ libgstvaapi_LIBS += $(top_builddir)/gst-libs/gst/vaapi/libgstvaapi-glx.la
- endif
- 
- if USE_EGL
-+libgstvaapi_CFLAGS += \
-+	$(EGL_CFLAGS)	\
-+	$(NULL)
-+
- libgstvaapi_LIBS += $(top_builddir)/gst-libs/gst/vaapi/libgstvaapi-egl.la
- endif
- 
--- 
-2.17.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.bb
index b8c2126d9b..a78807cc19 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.1.bb
@@ -9,7 +9,6 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz \
-           file://0001-gst-vaapi-Makefile.am-Add-EGL_CFLAGS-to-libgstvaapi-.patch \
            file://0001-vaapsink-downgrade-to-marginal.patch \
            "
 
@@ -19,10 +18,18 @@ SRC_URI[sha256sum] = "cb570f6f1e78cb364fbe3c4fb8751824ee9db0c942ba61b62380b9b5ab
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
 
-inherit autotools pkgconfig gtk-doc features_check upstream-version-is-even
+inherit meson pkgconfig gtk-doc features_check upstream-version-is-even
 
 REQUIRED_DISTRO_FEATURES ?= "opengl"
 
+EXTRA_OEMESON += " \
+    -Dexamples=disabled \
+"
+
+GTKDOC_MESON_OPTION = "gtk_doc"
+GTKDOC_MESON_ENABLE_FLAG = "enabled"
+GTKDOC_MESON_DISABLE_FLAG = "disabled"
+
 PACKAGES =+ "${PN}-tests"
 
 # OpenGL packageconfig factored out to make it easy for distros
@@ -33,17 +40,18 @@ PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'glx'
                         bb.utils.contains('DISTRO_FEATURES',     'opengl', 'egl', \
                                                                        '', d), d)}"
 
-PACKAGECONFIG ??= "drm \
+PACKAGECONFIG ??= "drm encoders \
                    ${PACKAGECONFIG_GL} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
 
-PACKAGECONFIG[drm] = "--enable-drm,--disable-drm,udev libdrm"
-PACKAGECONFIG[egl] = "--enable-egl,--disable-egl,virtual/egl"
-PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,virtual/libgl"
-PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland-native wayland wayland-protocols"
-PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxrandr libxrender"
+PACKAGECONFIG[drm] = "-Dwith_drm=yes,-Dwith_drm=no,udev libdrm"
+PACKAGECONFIG[egl] = "-Dwith_egl=yes,-Dwith_egl=no,virtual/egl"
+PACKAGECONFIG[encoders] = "-Dwith_encoders=yes,-Dwith_encoders=no"
+PACKAGECONFIG[glx] = "-Dwith_glx=yes,-Dwith_glx=no,virtual/libgl"
+PACKAGECONFIG[wayland] = "-Dwith_wayland=yes,-Dwith_wayland=no,wayland-native wayland wayland-protocols"
+PACKAGECONFIG[x11] = "-Dwith_x11=yes,-Dwith_x11=no,virtual/libx11 libxrandr libxrender"
 
 FILES_${PN} += "${libdir}/gstreamer-*/*.so"
 FILES_${PN}-dbg += "${libdir}/gstreamer-*/.debug"
-FILES_${PN}-dev += "${libdir}/gstreamer-*/*.la ${libdir}/gstreamer-*/*.a"
+FILES_${PN}-dev += "${libdir}/gstreamer-*/*.a"
 FILES_${PN}-tests = "${bindir}/*"
-- 
2.17.1


