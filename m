Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD4CF513EE
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 02:29:25 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60969.1772764154163090271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 18:29:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sKJRsqVh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772764155; x=1804300155;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kuA4c9JP7IeajRnuEjRgVlrF4NWR69msW8jcSU9NesE=;
  b=sKJRsqVhvvIKa48t4WqPut8lZtblvx0xghoJuYN/9G1zyvmIEqMNU0vP
   XXMZnYRrhSYxn4+BmuAn69YqwcOAInfJ6LQmK98By+Mmd6jdCgDlxINI8
   Ph1NsnsPe3whiwHFpCSDCxiL3VI9Tno9dao0Obr34rNQJRB2PYkqdvsTr
   3CtKzfa/lRXCn+gbZC/HNmj3zBzPR81DWP/mTWFHQbnJhce1fRqNL9J2R
   biDx7wx4/6jM0hIjK4HUdErtq4pAjDAreHIrhwz7Z72gN9ezoxCbIn2zM
   sfrlnLXktm5XfEIBhZySwaJiSSV59zFDFeux9SJTpCZyw4REiCue9Z7Uv
   g==;
X-CSE-ConnectionGUID: a7MDXt9fR8ehSPpDNZL0zg==
X-CSE-MsgGUID: SdkiimC0Qkau2Kp5iEmB4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="232118209"
X-IronPort-AV: E=Sophos;i="6.23,104,1770562800"; 
   d="scan'208";a="232118209"
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1B4C11000367
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Mar 2026 02:29:12 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C1EB2C03408
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Mar 2026 02:29:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id D13982000A98;
	Fri,  6 Mar 2026 02:29:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gstreamer1.0-vaapi: remove recipe
Date: Fri,  6 Mar 2026 10:29:04 +0800
Message-ID: <20260306022904.1781-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 02:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232529

From: Wang Mingyu <wangmy@fujitsu.com>

gstreamer-vappi has been removed in favour of the va plugin and is no longer
updated going forward.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gstreamer/gstreamer1.0-vaapi_1.26.9.bb    | 53 -------------------
 1 file changed, 53 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
deleted file mode 100644
index dc5055bb0c..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.9.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY = "VA-API support to GStreamer"
-HOMEPAGE = "https://gstreamer.freedesktop.org/"
-DESCRIPTION = "gstreamer-vaapi consists of a collection of VA-API \
-based plugins for GStreamer and helper libraries: `vaapidecode', \
-`vaapiconvert', and `vaapisink'."
-
-REALPN = "gstreamer-vaapi"
-
-LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
-
-SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
-
-SRC_URI[sha256sum] = "bf989040404515dc9b042f4fdc49ff33a6dccf49d544736150e967b42665598e"
-
-S = "${UNPACKDIR}/${REALPN}-${PV}"
-DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-
-inherit meson pkgconfig features_check upstream-version-is-even
-
-REQUIRED_DISTRO_FEATURES ?= "opengl"
-
-EXTRA_OEMESON += " \
-    -Ddoc=disabled \
-    -Dexamples=disabled \
-    -Dtests=enabled \
-"
-
-PACKAGES =+ "${PN}-tests"
-
-# OpenGL packageconfig factored out to make it easy for distros
-# and BSP layers to pick either glx, egl, or no GL. By default,
-# try detecting X11 first, and if found (with OpenGL), use GLX,
-# otherwise try to check if EGL can be used.
-PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'glx', \
-                        bb.utils.contains('DISTRO_FEATURES',     'opengl', 'egl', \
-                                                                       '', d), d)}"
-
-PACKAGECONFIG ??= "drm encoders \
-                   ${PACKAGECONFIG_GL} \
-                   ${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
-
-PACKAGECONFIG[drm] = "-Ddrm=enabled,-Ddrm=disabled,udev libdrm"
-PACKAGECONFIG[egl] = "-Degl=enabled,-Degl=disabled,virtual/egl"
-PACKAGECONFIG[encoders] = "-Dencoders=enabled,-Dencoders=disabled"
-PACKAGECONFIG[glx] = "-Dglx=enabled,-Dglx=disabled,virtual/libgl"
-PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,wayland-native wayland wayland-protocols"
-PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 libxrandr libxrender"
-
-FILES:${PN} += "${libdir}/gstreamer-*/*.so"
-FILES:${PN}-dbg += "${libdir}/gstreamer-*/.debug"
-FILES:${PN}-dev += "${libdir}/gstreamer-*/*.a"
-FILES:${PN}-tests = "${bindir}/*"
-- 
2.43.0


