Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DE4EFD23A
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:45:51 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42136.1772012745985947413
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:45:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rWWYt/hc;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012744; x=1803548744;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Wbo4TawL+vMSEICt/PTTejNnk+Xl08xda1u5ElB4VL4=;
  b=rWWYt/hcdF5PeVgZ7xdKYRw5u784WQAULRXeCCB/7Ev9mD3jQ9X8Bjfc
   NBtD/2UHe6sCnk2fYALXmK3JlBc6OIT9TB3y72EbHKNcf9/jNncjWJgbJ
   wCMPIU6FsExjkUKDJug5JLy5yZwIDAbgypB3mw2wXNIX/VWDLYkhFbjRM
   DvQ0MbZOwnryzYE7Du/hTj2bUk24wgRAflnPk9SnjFBx/LmW0HnjjiBu+
   wC5V+20QvOlOC0lByO2asp7npmNGE8JZh0GDS/LL1PUiA/6tV5l484iGD
   1Il4ssT7y10lywf2WMPAB7tqTTEYYz+Xdq+Umx9eAhHg93AAhGQ/93FS5
   g==;
X-CSE-ConnectionGUID: ODQQDhGNROOp4rTNxuFX5Q==
X-CSE-MsgGUID: NTtUl2zzQvqBP0nEjG2nBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="209985201"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="209985201"
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 8D4AB1C000A4
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 09:45:44 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 2F8A71803200
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 09:45:44 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.167.241])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id B96A84059BD
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 09:45:41 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] gstreamer1.0-vaapi: Enable hotdoc to produce doc
Date: Wed, 25 Feb 2026 17:45:37 +0800
Message-ID: <20260225094537.1213-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 09:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231945

1. Add 0001-Disable-cross_build-check-to-make-doc-work-in-yocto.patch.

2. Add INSANE_SKIP to fix do_package QA Issue

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...uild-check-to-make-doc-work-in-yocto.patch | 32 +++++++++++++++++++
 .../gstreamer/gstreamer1.0-vaapi_1.26.9.bb    | 19 +++++++++--
 2 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-Disable-cross_build-check-to-make-doc-work-in-yocto.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-Disable-cross_build-check-to-make-doc-work-in-yocto.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-Disable-cross_build-check-to-make-doc-work-in-yocto.patch
new file mode 100644
index 0000000000..e628e3f61e
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-Disable-cross_build-check-to-make-doc-work-in-yocto.patch
@@ -0,0 +1,32 @@
+Subject: [PATCH] Disable cross_build check to make doc work in yocto.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
+ docs/meson.build | 9 ---------
+ 1 file changed, 9 deletions(-)
+
+diff --git a/docs/meson.build b/docs/meson.build
+index ad5f785..1e7a808 100644
+--- a/docs/meson.build
++++ b/docs/meson.build
+@@ -4,15 +4,6 @@ if get_option('doc').disabled()
+   subdir_done()
+ endif
+ 
+-if meson.is_cross_build()
+-    if get_option('doc').enabled()
+-        error('Documentation enabled but building the doc while cross building is not supported yet.')
+-    endif
+-
+-    message('Documentation not built as building it while cross building is not supported yet.')
+-    subdir_done()
+-endif
+-
+ if static_build
+     if get_option('doc').enabled()
+         error('Documentation enabled but not supported when building statically.')
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
index dc5055bb0c..0681ce4884 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
@@ -9,7 +9,9 @@ REALPN = "gstreamer-vaapi"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
+SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz \
+           file://0001-Disable-cross_build-check-to-make-doc-work-in-yocto.patch \
+          "
 
 SRC_URI[sha256sum] = "bf989040404515dc9b042f4fdc49ff33a6dccf49d544736150e967b42665598e"
 
@@ -21,7 +23,6 @@ inherit meson pkgconfig features_check upstream-version-is-even
 REQUIRED_DISTRO_FEATURES ?= "opengl"
 
 EXTRA_OEMESON += " \
-    -Ddoc=disabled \
     -Dexamples=disabled \
     -Dtests=enabled \
 "
@@ -44,10 +45,24 @@ PACKAGECONFIG[drm] = "-Ddrm=enabled,-Ddrm=disabled,udev libdrm"
 PACKAGECONFIG[egl] = "-Degl=enabled,-Degl=disabled,virtual/egl"
 PACKAGECONFIG[encoders] = "-Dencoders=enabled,-Dencoders=disabled"
 PACKAGECONFIG[glx] = "-Dglx=enabled,-Dglx=disabled,virtual/libgl"
+PACKAGECONFIG[hotdoc] = "-Ddoc=enabled,-Ddoc=disabled,hotdoc-native"
 PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,wayland-native wayland wayland-protocols"
 PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 libxrandr libxrender"
 
+do_install:append:class-target () {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'hotdoc', 'true', 'false', d)}; then
+        export LLVM_CONFIG=${STAGING_BINDIR_NATIVE}/llvm-config
+        meson compile docs/vaapi-doc
+        install -d ${D}${docdir}/${PN}
+        cp -r ${B}/docs/vaapi-doc/html ${D}${docdir}/${PN}
+    fi
+}
+
 FILES:${PN} += "${libdir}/gstreamer-*/*.so"
 FILES:${PN}-dbg += "${libdir}/gstreamer-*/.debug"
 FILES:${PN}-dev += "${libdir}/gstreamer-*/*.a"
 FILES:${PN}-tests = "${bindir}/*"
+FILES:${PN}-doc += "${docdir}"
+
+# Fix do_package_qa: QA Issue: non -staticdev package contains static .a library: gstreamer1.0-vaapi-doc path '/usr/share/doc/gstreamer1.0-vaapi/html/assets/js/search/annex.a' [staticdev], annex.a is a text file
+INSANE_SKIP:${PN}-doc += "staticdev"
-- 
2.43.0


