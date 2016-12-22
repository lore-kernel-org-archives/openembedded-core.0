Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id BD33B774FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 03:14:05 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 21 Dec 2016 19:14:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,386,1477983600"; d="scan'208";a="45278515"
Received: from afzalahm-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.181.112])
	by orsmga005.jf.intel.com with ESMTP; 21 Dec 2016 19:14:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2016 16:13:56 +1300
Message-Id: <f34844865a81dce83014721eff986f9fb27d6afd.1482376395.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1482376395.git.paul.eggleton@linux.intel.com>
References: <cover.1482376395.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] meta: use require instead of include when file should exist
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
X-List-Received-Date: Thu, 22 Dec 2016 03:14:06 -0000

If the file is expected to exist, then we should always be using require
so that if it doesn't we get an error rather than some other more
obscure failure later on.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/glibc/glibc-locale.inc                              | 2 +-
 meta/recipes-core/glibc/glibc-mtrace.inc                              | 2 +-
 meta/recipes-core/glibc/glibc-scripts.inc                             | 2 +-
 meta/recipes-extended/cpio/cpio_2.12.bb                               | 2 +-
 meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.0.bb                     | 2 +-
 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.0.bb                    | 2 +-
 meta/recipes-graphics/xorg-driver/xorg-driver-input.inc               | 2 +-
 meta/recipes-graphics/xorg-driver/xorg-driver-video.inc               | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.1.bb        | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb           | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb           | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb             | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb  | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb     | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.1.bb | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb    | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.1.bb | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb    | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.1.bb | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb    | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb  | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.1.bb              | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb                 | 2 +-
 meta/recipes-support/boost/bjam-native_1.62.0.bb                      | 2 +-
 meta/recipes-support/boost/boost_1.62.0.bb                            | 4 ++--
 25 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index 11bd612..50b191c 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -1,4 +1,4 @@
-include glibc-collateral.inc
+require glibc-collateral.inc
 
 SUMMARY = "Locale data from glibc"
 
diff --git a/meta/recipes-core/glibc/glibc-mtrace.inc b/meta/recipes-core/glibc/glibc-mtrace.inc
index e12b079..0e4615d 100644
--- a/meta/recipes-core/glibc/glibc-mtrace.inc
+++ b/meta/recipes-core/glibc/glibc-mtrace.inc
@@ -1,4 +1,4 @@
-include glibc-collateral.inc
+require glibc-collateral.inc
 
 SUMMARY = "mtrace utility provided by glibc"
 DESCRIPTION = "mtrace utility provided by glibc"
diff --git a/meta/recipes-core/glibc/glibc-scripts.inc b/meta/recipes-core/glibc/glibc-scripts.inc
index bce0a42..66fdee4 100644
--- a/meta/recipes-core/glibc/glibc-scripts.inc
+++ b/meta/recipes-core/glibc/glibc-scripts.inc
@@ -1,4 +1,4 @@
-include glibc-collateral.inc
+require glibc-collateral.inc
 
 SUMMARY = "utility scripts provided by glibc"
 DESCRIPTION = "utility scripts provided by glibc"
diff --git a/meta/recipes-extended/cpio/cpio_2.12.bb b/meta/recipes-extended/cpio/cpio_2.12.bb
index e743999..405a90e 100644
--- a/meta/recipes-extended/cpio/cpio_2.12.bb
+++ b/meta/recipes-extended/cpio/cpio_2.12.bb
@@ -1,4 +1,4 @@
-include cpio_v2.inc
+require cpio_v2.inc
 
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
diff --git a/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.0.bb b/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.0.bb
index 455d31e..dc2820c 100644
--- a/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.0.bb
+++ b/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.0.bb
@@ -1,6 +1,6 @@
 EGLINFO_PLATFORM ?= "fb"
 EGLINFO_BINARY_NAME ?= "eglinfo-fb"
 
-include eglinfo.inc
+require eglinfo.inc
 
 SUMMARY += "(Framebuffer version)"
diff --git a/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.0.bb b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.0.bb
index 3427fdf..06a2fea 100644
--- a/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.0.bb
+++ b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.0.bb
@@ -1,7 +1,7 @@
 EGLINFO_PLATFORM ?= "x11"
 EGLINFO_BINARY_NAME ?= "eglinfo-x11"
 
-include eglinfo.inc
+require eglinfo.inc
 
 DEPENDS += "virtual/libx11"
 
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
index c4dba1b..342067d 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
@@ -1,4 +1,4 @@
-include xorg-driver-common.inc
+require xorg-driver-common.inc
 
 DEPENDS += "inputproto kbproto "
 
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc
index 38281e0..b5862da 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc
@@ -1,4 +1,4 @@
-include xorg-driver-common.inc
+require xorg-driver-common.inc
 
 DEPENDS =+ "renderproto videoproto xextproto fontsproto"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.1.bb
index 98f5a50..c27f5c4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.1.bb
@@ -1,4 +1,4 @@
-include gstreamer1.0-libav.inc
+require gstreamer1.0-libav.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
index f4604a3..b6c0d7d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
@@ -1,6 +1,6 @@
 DEFAULT_PREFERENCE = "-1"
 
-include gstreamer1.0-libav.inc
+require gstreamer1.0-libav.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb
index 74358a7..3b4580f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb
@@ -1,4 +1,4 @@
-include gstreamer1.0-omx.inc
+require gstreamer1.0-omx.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
index 9705543..49593b6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
@@ -1,6 +1,6 @@
 DEFAULT_PREFERENCE = "-1"
 
-include gstreamer1.0-omx.inc
+require gstreamer1.0-omx.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb
index 46df026..91a163c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.1.bb
@@ -1,4 +1,4 @@
-include gstreamer1.0-plugins-bad.inc
+require gstreamer1.0-plugins-bad.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
                     file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
index 609ea0b..79ebcac 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -1,6 +1,6 @@
 DEFAULT_PREFERENCE = "-1"
 
-include gstreamer1.0-plugins-bad.inc
+require gstreamer1.0-plugins-bad.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
                     file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.1.bb
index 82e5a84..6a01bcb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.10.1.bb
@@ -1,4 +1,4 @@
-include gstreamer1.0-plugins-base.inc
+require gstreamer1.0-plugins-base.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
index bdd4cb8..4d63827 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
@@ -1,6 +1,6 @@
 DEFAULT_PREFERENCE = "-1"
 
-include gstreamer1.0-plugins-base.inc
+require gstreamer1.0-plugins-base.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.1.bb
index 44703dc..ce1321e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.10.1.bb
@@ -1,4 +1,4 @@
-include gstreamer1.0-plugins-good.inc
+require gstreamer1.0-plugins-good.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
index 120629c..04a313d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
@@ -1,6 +1,6 @@
 DEFAULT_PREFERENCE = "-1"
 
-include gstreamer1.0-plugins-good.inc
+require gstreamer1.0-plugins-good.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.1.bb
index 1626430..2f72b90 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.10.1.bb
@@ -1,4 +1,4 @@
-include gstreamer1.0-plugins-ugly.inc
+require gstreamer1.0-plugins-ugly.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
index 61cdbe8..5b79234 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
@@ -1,6 +1,6 @@
 DEFAULT_PREFERENCE = "-1"
 
-include gstreamer1.0-plugins-ugly.inc
+require gstreamer1.0-plugins-ugly.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb
index 7b6e4cb..3ecfb88 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.1.bb
@@ -1,4 +1,4 @@
-include gstreamer1.0-rtsp-server.inc
+require gstreamer1.0-rtsp-server.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.1.bb
index 428a012..397dcd3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.10.1.bb
@@ -1,4 +1,4 @@
-include gstreamer1.0.inc
+require gstreamer1.0.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
index 6112f2a..39f38a1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
@@ -1,6 +1,6 @@
 DEFAULT_PREFERENCE = "-1"
 
-include gstreamer1.0.inc
+require gstreamer1.0.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
diff --git a/meta/recipes-support/boost/bjam-native_1.62.0.bb b/meta/recipes-support/boost/bjam-native_1.62.0.bb
index 32646d7..46013f3 100644
--- a/meta/recipes-support/boost/bjam-native_1.62.0.bb
+++ b/meta/recipes-support/boost/bjam-native_1.62.0.bb
@@ -1,4 +1,4 @@
-include boost-${PV}.inc
+require boost-${PV}.inc
 
 SUMMARY = "Portable Boost.Jam build tool for boost"
 SECTION = "devel"
diff --git a/meta/recipes-support/boost/boost_1.62.0.bb b/meta/recipes-support/boost/boost_1.62.0.bb
index 120d129..cde03f2 100644
--- a/meta/recipes-support/boost/boost_1.62.0.bb
+++ b/meta/recipes-support/boost/boost_1.62.0.bb
@@ -1,5 +1,5 @@
-include boost-${PV}.inc
-include boost.inc
+require boost-${PV}.inc
+require boost.inc
 
 SRC_URI += "\
     file://arm-intrinsics.patch \
-- 
2.5.5


