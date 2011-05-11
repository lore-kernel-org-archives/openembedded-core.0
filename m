Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QK3mQ-0003bh-Ep
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 09:24:22 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 May 2011 00:21:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,350,1301900400"; d="scan'208";a="641109614"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by orsmga002.jf.intel.com with ESMTP; 11 May 2011 00:21:34 -0700
Message-Id: <4722c2ce38a22beb09d8ad21d4f0508e871f028a.1305098201.git.ke.yu@intel.com>
In-Reply-To: <cover.1305098201.git.ke.yu@intel.com>
References: <cover.1305098201.git.ke.yu@intel.com>
Old-Date: Mon, 9 May 2011 14:21:57 +0800
Date: Wed, 11 May 2011 15:27:51 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 3/5] xserver-xf86-dri-lite: upgrade from 1.9.3 to 1.10.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 May 2011 07:24:22 -0000

From: Yu Ke <ke.yu@intel.com>

- update the license checksum due to SUN/Oracle name changing

- remove the nodolt.patch because it is already in upstream and release
  http://cgit.freedesktop.org/xorg/xserver/commit/?id=a769f4c22a9cfb5ba248c924a66c31ec966bd8a0

- update the patch upstream status

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../distro/include/preferred-xorg-versions.inc     |    2 +-
 .../xserver-xf86-dri-lite/macro_tweak.patch        |    2 +
 .../xserver-xf86-dri-lite/nodolt.patch             |   12 ----------
 .../xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb   |   20 ++++++++++++++++++
 .../xorg-xserver/xserver-xf86-dri-lite_1.9.3.bb    |   22 --------------------
 5 files changed, 23 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/nodolt.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.9.3.bb

diff --git a/meta/conf/distro/include/preferred-xorg-versions.inc b/meta/conf/distro/include/preferred-xorg-versions.inc
index 7afa8c9..add4d29 100644
--- a/meta/conf/distro/include/preferred-xorg-versions.inc
+++ b/meta/conf/distro/include/preferred-xorg-versions.inc
@@ -128,7 +128,7 @@ PREFERRED_VERSION_xproxymanagementprotocol ?= "1.0.3"
 PREFERRED_VERSION_xrandr ?= "1.3.4"
 PREFERRED_VERSION_xrdb ?= "1.0.5"
 PREFERRED_VERSION_xserver-kdrive ?= "1.7.99.2"
-PREFERRED_VERSION_xserver-xf86-dri-lite ?= "1.9.3"
+PREFERRED_VERSION_xserver-xf86-dri-lite ?= "1.10.1"
 PREFERRED_VERSION_xset ?= "1.2.1"
 PREFERRED_VERSION_xtrans ?= "1.2.6"
 PREFERRED_VERSION_xtrans-native ?= "1.2.6"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.patch
index cd408c7..2b75427 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.patch
@@ -6,6 +6,8 @@ xserver-kdrive-1.7.99.2 and xserver-xf86-lite_1.7.99.2. Once they
 are all upgraded to 1.8.99.904, the the files/macro_tweak.patch
 can be safely replace by this patch.
 
+Upstream-Status: Pending
+
 Signed-off-by: Yu Ke <ke.yu@intel.com>
 
 diff --git a/xorg-server.m4 b/xorg-server.m4
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/nodolt.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/nodolt.patch
deleted file mode 100644
index 6b34032..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/nodolt.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac	2009-01-15 20:35:31.000000000 +0000
-+++ git/configure.ac	2009-01-15 20:35:38.000000000 +0000
-@@ -62,7 +62,6 @@
- AC_LIBTOOL_WIN32_DLL
- AC_DISABLE_STATIC
- AC_PROG_LIBTOOL
--DOLT
- AC_PROG_MAKE_SET
- PKG_PROG_PKG_CONFIG
- AC_PROG_LEX
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
new file mode 100644
index 0000000..ea57140
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
@@ -0,0 +1,20 @@
+require xserver-xf86-dri-lite.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
+
+PROTO_DEPS += "xf86driproto dri2proto"
+
+DEPENDS += "font-util"
+
+PE = "1"
+PR = "r0"
+
+SRC_URI += "file://crosscompile.patch"
+
+# Misc build failure for master HEAD
+SRC_URI += "file://fix_open_max_preprocessor_error.patch"
+
+SRC_URI[md5sum] = "75f117c74f2ecaf9dd167f6a66ac98de"
+SRC_URI[sha256sum] = "143c7c3d7d4428352e1153dffa34fd64af391f72d30b2a03e911e54e36f00b5d"
+
+EXTRA_OECONF += "--enable-dri --enable-dri2"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.9.3.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.9.3.bb
deleted file mode 100644
index faa4f64..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.9.3.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require xserver-xf86-dri-lite.inc
-
-
-PROTO_DEPS += "xf86driproto dri2proto"
-
-DEPENDS += "font-util"
-
-PE = "1"
-PR = "r0"
-
-SRC_URI += "file://nodolt.patch \
-            file://crosscompile.patch"
-#           file://libdri-xinerama-symbol.patch;patch=1
-#           file://xserver-boottime.patch;patch=1
-
-# Misc build failure for master HEAD
-SRC_URI += "file://fix_open_max_preprocessor_error.patch"
-
-SRC_URI[md5sum] = "5bef6839a76d029204ab31aa2fcb5201"
-SRC_URI[sha256sum] = "864831f51e841ff37f2445d1c85b86b559c8860a435fb496aead4f256a2b141d"
-
-EXTRA_OECONF += "--enable-dri --enable-dri2"
-- 
1.7.0.4



