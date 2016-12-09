Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7DEEC6FFCE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 02:58:09 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id e9so666373pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2016 18:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=e5pT/jgR0xGhYSYW9WNd6wVpdzwbYHPGQplJmVwjQ48=;
	b=Ea0LZrdrMr+aju2gI1vTCJl/BSQbaJ7q+8FRQdY+ON2r+GiCBIUkTnS+jRv1jqkOM5
	KMFghR5PKugQSss9ZsUob6pF4w+7dXlFaxsZrI1YGV8fjIRl3LRPOB+kPcm3E7QrCUGJ
	E5mxJvctBcROtIhiJvgyqklQ5dsa4sLboE5uGSz8Pck+j2P+eIBwG5lET7cSmsNS/p51
	wTpkMIEylbemTvyDMP1/c/gHgvzMUqANCjgFlk0RdcIfNSH9eITzRNxyRd6doomvmJcv
	g9vdpMDJDa36tWjXOZ0w6019p9tS9B7MevXM/tnRCvVS7l56Q1+JkMQeWe3fogcfi6su
	w5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=e5pT/jgR0xGhYSYW9WNd6wVpdzwbYHPGQplJmVwjQ48=;
	b=AsJLzCxIOxCyjr75oAd3rq7T8GxfhwCpaSe+IJdM4fhn8nH0uDTRC+qK+SNpAn/+cP
	e0p0qYWiOPVN4NGJQ66RE6l41Qo/XkmjdZBz9P0fKGtiU7xDU7i8rzasIHADXZA38Cfu
	f5dO8aUhiDV+feyCe7Nj/WO2mWE5TVOhXKCjHY82eTCzHK9iDnRrNnqCx2i8Z23Rr+Y0
	EWWfaB85tOTosUjOSQPPfsCGaCbdmMIf/f7qu+LLerOq4+6ETzL5Ml3MQZ1jyLLD21zJ
	yVV61lVwqNt2E4B7/zVFpzsjmGy0dmy/iE+Um/XT0aVFugAmwFWb7P6c//dVmr8ZZlv6
	75fw==
X-Gm-Message-State: AKaTC00daKBtk0/4Q6EWM1Vj4nsRFQrPbG0bch99RZ1gBzob92YEqmCLM6F2CODfTZ+m1g==
X-Received: by 10.98.83.193 with SMTP id h184mr77798423pfb.175.1481252291044; 
	Thu, 08 Dec 2016 18:58:11 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e11sm53341475pgp.10.2016.12.08.18.58.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Dec 2016 18:58:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 18:57:58 -0800
Message-Id: <20161209025801.20775-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161209025801.20775-1-raj.khem@gmail.com>
References: <20161209025801.20775-1-raj.khem@gmail.com>
Subject: [PATCH 5/8] gstreamer1.0-vaapi: Import from meta-intel
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
X-List-Received-Date: Fri, 09 Dec 2016 02:58:09 -0000

Update to 1.10.1 at the same time

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gstreamer/gstreamer1.0-vaapi.inc               | 36 ++++++++++++++++++
 .../gstreamer1.0-vaapi/install-tests.patch         | 43 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-vaapi_1.10.1.bb         |  6 +++
 3 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/install-tests.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.1.bb

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc
new file mode 100644
index 0000000..6dea9cf
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi.inc
@@ -0,0 +1,36 @@
+SUMMARY = "VA-API support to GStreamer"
+DESCRIPTION = "gstreamer-vaapi consists of a collection of VA-API \
+based plugins for GStreamer and helper libraries: `vaapidecode', \
+`vaapiconvert', and `vaapisink'."
+
+REALPN = "gstreamer-vaapi"
+FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${REALPN}", "${FILE_DIRNAME}/${REALPN}"], d)}"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "libva"
+
+SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz \
+          "
+
+S = "${WORKDIR}/${REALPN}-${PV}"
+
+inherit autotools pkgconfig gtk-doc
+
+PACKAGES =+ "${PN}-tests"
+
+PACKAGECONFIG ??= "drm \
+                   ${@bb.utils.contains("DISTRO_FEATURES", "opengl x11", "glx", "", d)} \
+                   ${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "", d)} \
+                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "x11", "", d)}"
+
+PACKAGECONFIG[drm] = "--enable-drm,--disable-drm,udev libdrm"
+PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,virtual/mesa"
+PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,wayland"
+PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 libxrandr libxrender"
+
+FILES_${PN} += "${libdir}/gstreamer-*/*.so"
+FILES_${PN}-dbg += "${libdir}/gstreamer-*/.debug"
+FILES_${PN}-dev += "${libdir}/gstreamer-*/*.la ${libdir}/gstreamer-*/*.a"
+FILES_${PN}-tests = "${bindir}/*"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/install-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/install-tests.patch
new file mode 100644
index 0000000..d7def3a
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/install-tests.patch
@@ -0,0 +1,43 @@
+From 2791dfde0de0abe8100fa833dfe1a9c2e74c2629 Mon Sep 17 00:00:00 2001
+From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
+Date: Thu, 21 Jan 2016 16:25:44 -0800
+Subject: [PATCH] Install tests
+
+This patch is updated for 0.6.1
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
+---
+ tests/Makefile.am | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 3637d92..7cc6a97 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -1,4 +1,4 @@
+-noinst_PROGRAMS = \
++bin_PROGRAMS = \
+ 	simple-decoder			\
+ 	test-decode			\
+ 	test-display			\
+@@ -9,13 +9,13 @@ noinst_PROGRAMS = \
+ 	$(NULL)
+ 
+ if USE_ENCODERS
+-noinst_PROGRAMS += \
++bin_PROGRAMS += \
+ 	simple-encoder			\
+ 	$(NULL)
+ endif
+ 
+ if USE_GLX
+-noinst_PROGRAMS += \
++bin_PROGRAMS += \
+ 	test-textures			\
+ 	$(NULL)
+ endif
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.1.bb
new file mode 100644
index 0000000..1c727f5
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.1.bb
@@ -0,0 +1,6 @@
+require gstreamer1.0-vaapi.inc
+
+SRC_URI[md5sum] = "514757933ff719a6b8206091f70e0221"
+SRC_URI[sha256sum] = "99aecaa609f37d65e12518b1e77cc70e3cc5dde0c7dfc8e83f508d7e64e1da34"
+
+DEPENDS += "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.10.2


