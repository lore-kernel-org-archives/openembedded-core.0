Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id E9573771C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 20:02:20 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id fy10so37374661pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 12:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=EHfax4zbdcW1PBtHJCSmuK1i/DA5sK2IIa8m9Sn5W28=;
	b=t55gf91c1q8xqPx0NDFol4iPjWozUjhSaPbr+KdnwMhkPIoelIFdS2anKB2xRjKiBs
	TzwSwnYKbs05ZCh8thu0QYc+wp/mN9ZK9XJ9emvwEGwxOTWhc9S4pKtbao2gHgQXU+Vo
	5cUhiVIA0KiuSdDzxD+pJO0wZ83jK7tlZOVou47I1Rm4w18FPIs06B64f8tPJ7LXSVAp
	IyfdY0Jg2PGNma59i/TVkdHIJECv2pgzY0sXNqmjRtvqF3cauPQYUj3HoD0JJiP17O8a
	49IIjLdbp7oISfDZoyUSpsLBNAhWJPGVf1fRHEhoKKToWwQezvq7SlmLBIGnRNnSUNIx
	cCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EHfax4zbdcW1PBtHJCSmuK1i/DA5sK2IIa8m9Sn5W28=;
	b=klgrHN0IaVjov72orR4MRL7fn/iKfspqGOoQoB+hNpj3VW54QrU25/3dZsnJDg7hdG
	+4wQSkncRTvsqqWX2UrxpTTxCpsv5v35XLUGk8lfeEsSx6DXPIxrHBpg+UArmrFDmVJn
	G7y80iJrQmlwysdqHx/x67G/lJ9o7r7h7IP8bYF2zeyDejkas2SFFB33TXy1QiyHqe3v
	N9qy7fuB7aIyMhrdmj9DUrGPNWAB+k1TCPi4u+MU0/W89Mx5NNIHBlbfMDMFGf5qr48G
	Mes2xxhy2+d4OqGxg5MQVgyqK2ABKfUT/gfjbQgAl0RAVWBkJyPCtlVS3wetgTCUXyFh
	auOA==
X-Gm-Message-State: AG10YOSrBhlVq4wGIqJpQslzANwLbfKu/RV0uk9LnaKY3GzvAoqlFOK/rQVjtQEoGaf5vg==
X-Received: by 10.66.252.100 with SMTP id zr4mr64449769pac.111.1456430541121; 
	Thu, 25 Feb 2016 12:02:21 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	z3sm14101284par.17.2016.02.25.12.02.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Feb 2016 12:02:20 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 12:02:15 -0800
Message-Id: <1456430535-11781-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gstreamer1.0-plugins-XXX: control orc PACKAGECONFIG via GSTREAMER_ORC
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
X-List-Received-Date: Thu, 25 Feb 2016 20:02:25 -0000

Orc enables runtime JIT compilation of data processing routines from
Orc bytecode to SIMD instructions for various architectures (currently
SSE, MMX, MIPS, Altivec and NEON are supported).

  https://cgit.freedesktop.org/gstreamer/orc/tree/README

Provide a convenient way to globally control the orc PACKAGECONFIG
option for all four gstreamer-1.0-plugins-XXX recipes.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc  | 3 ++-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc | 3 ++-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc | 3 ++-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc | 3 ++-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc      | 6 ++++++
 5 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 6117e69..6a89fc9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -13,11 +13,12 @@ PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2',
 # gtk is not in the PACKAGECONFIG variable by default until
 # the transition to gtk+3 is finished
 PACKAGECONFIG ??= " \
+    ${GSTREAMER_ORC} \
     ${PACKAGECONFIG_GL} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
-    bz2 curl dash dtls hls neon orc rsvg sbc smoothstreaming sndfile uvch264 \
+    bz2 curl dash dtls hls neon rsvg sbc smoothstreaming sndfile uvch264 \
 "
 
 PACKAGECONFIG[assrender]       = "--enable-assrender,--disable-assrender,libass"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index cde0019..f75efea 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -7,9 +7,10 @@ DEPENDS += "iso-codes util-linux zlib"
 PACKAGES_DYNAMIC =+ "^libgst.*"
 
 PACKAGECONFIG ??= " \
+    ${GSTREAMER_ORC} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-    gio-unix-2.0 ivorbis ogg orc pango theora vorbis \
+    gio-unix-2.0 ivorbis ogg pango theora vorbis \
 "
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxv"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 3f56d1d..6b005aa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -5,9 +5,10 @@ LICENSE = "GPLv2+ & LGPLv2.1+"
 DEPENDS += "gstreamer1.0-plugins-base libcap zlib bzip2"
 
 PACKAGECONFIG ??= " \
+    ${GSTREAMER_ORC} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-    cairo flac gdk-pixbuf gudev jpeg libpng orc soup speex taglib v4l2 \
+    cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib v4l2 \
 "
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
index 839ff8a..38e358f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
@@ -6,7 +6,8 @@ LICENSE_FLAGS = "commercial"
 DEPENDS += "gstreamer1.0-plugins-base libid3tag"
 
 PACKAGECONFIG ??= " \
-    a52dec lame mad mpeg2dec orc \
+    ${GSTREAMER_ORC} \
+    a52dec lame mad mpeg2dec \
 "
 
 PACKAGECONFIG[a52dec]   = "--enable-a52dec,--disable-a52dec,liba52"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index d2b3820..18ed6cf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -12,6 +12,12 @@ acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 LIBV = "1.0"
 require gst-plugins-package.inc
 
+# Orc enables runtime JIT compilation of data processing routines from Orc
+# bytecode to SIMD instructions for various architectures (currently SSE, MMX,
+# MIPS, Altivec and NEON are supported).
+
+GSTREAMER_ORC ?= "orc"
+
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc orc-native"
 PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind"
-- 
1.9.1


