Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1Qmymn-000131-GR
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 03:56:18 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 29 Jul 2011 18:51:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,290,1309762800"; 
   d="scan'208";a="2509910"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.157])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Jul 2011 18:51:57 -0700
From: Yu Ke <ke.yu@intel.com>
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Sat, 30 Jul 2011 09:59:27 +0800
Message-Id: <22b61a5a19141669915925f974a5ce408687d762.1311990838.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311990837.git.ke.yu@intel.com>
References: <cover.1311990837.git.ke.yu@intel.com>
In-Reply-To: <cover.1311990837.git.ke.yu@intel.com>
References: <cover.1311990837.git.ke.yu@intel.com>
Subject: [PATCH 1/1] SRC_URI, S: use BPN instead of PN for multilib case
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
X-List-Received-Date: Sat, 30 Jul 2011 01:56:19 -0000

in multilibcase, PN has multilib prefix, so it is not
correct to use PN in SRC_URI and S. instead,  we've
dedicately pruned multilib prefix in BPN, so BPN is
the right alternative for PN.

Signed-off-by: Yu Ke <ke.y@intel.com>
---
 .../farsight/farsight2_0.0.9.bb                    |    2 +-
 .../loudmouth/loudmouth_1.4.0.bb                   |    2 +-
 .../opensync/libopensync-plugin_0.36.inc           |    2 +-
 .../telepathy/telepathy-farsight_0.0.7.bb          |    2 +-
 .../telepathy/telepathy-gabble_0.7.8.bb            |    2 +-
 .../recipes-connectivity/wbxml/wbxml2_0.9.2.bb     |    2 +-
 .../recipes-gnome/gcalctool/gcalctool_5.7.32.bb    |    2 +-
 .../recipes-gnome/gcalctool/gcalctool_5.8.17.bb    |    2 +-
 .../recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb |    2 +-
 meta-demoapps/recipes-gnome/wv/wv_1.2.0.bb         |    2 +-
 meta-demoapps/recipes-sato/kf/kf_0.5.4.1.bb        |    2 +-
 .../matchbox-themes-extra_git.bb                   |    2 +-
 .../recipes-support/poppler/poppler-data_0.1.bb    |    2 +-
 meta-demoapps/recipes-support/poppler/poppler.inc  |    2 +-
 .../omap3-sgx-modules_1.3.13.1397.bb               |    4 ++--
 meta/recipes-bsp/zaurusd/zaurusd_svn.bb            |    2 +-
 .../galago/galago-daemon_0.5.1.bb                  |    2 +-
 .../iproute2/iproute2_2.6.38.bb                    |    2 +-
 meta/recipes-connectivity/ofono/ofono_0.50.bb      |    2 +-
 .../telepathy/telepathy-glib_0.14.3.bb             |    2 +-
 .../telepathy/telepathy-idle_0.1.8.bb              |    2 +-
 .../telepathy/telepathy-python_0.15.19.bb          |    2 +-
 meta/recipes-core/dbus-wait/dbus-wait_svn.bb       |    2 +-
 .../glib-networking/glib-networking_2.28.7.bb      |    2 +-
 meta/recipes-devtools/distcc/distcc_2.18.3.bb      |    2 +-
 .../subversion/subversion_1.6.15.bb                |    2 +-
 meta/recipes-extended/blktool/blktool_4-6.bb       |    2 +-
 .../recipes-extended/chkconfig/chkconfig_1.3.52.bb |    2 +-
 meta/recipes-extended/libidn/libidn_0.6.14.bb      |    2 +-
 meta/recipes-extended/libidn/libidn_1.22.bb        |    2 +-
 meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb   |    4 ++--
 meta/recipes-extended/mktemp/mktemp_1.7.bb         |    2 +-
 meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb |    2 +-
 .../ttf-fonts/liberation-fonts_1.06.bb             |    2 +-
 .../xorg-driver/xf86-driver-common.inc             |    2 +-
 meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb |    2 +-
 meta/recipes-sato/eds/eds-tools_bzr.bb             |    2 +-
 meta/recipes-sato/gaku/gaku_svn.bb                 |    2 +-
 meta/recipes-sato/libical/libical_0.46.bb          |    2 +-
 meta/recipes-sato/libowl/libowl_svn.bb             |    2 +-
 .../recipes-sato/owl-video-widget/libowl-av_svn.bb |    2 +-
 meta/recipes-sato/puzzles/oh-puzzles_svn.bb        |    2 +-
 meta/recipes-sato/puzzles/puzzles_r9175.bb         |    2 +-
 meta/recipes-sato/screenshot/screenshot_svn.bb     |    2 +-
 meta/recipes-support/apr/apr-util_1.3.10.bb        |    2 +-
 meta/recipes-support/apr/apr_1.4.2.bb              |    2 +-
 meta/recipes-support/liboil/liboil_0.3.17.bb       |    2 +-
 meta/recipes-support/neon/neon_0.29.5.bb           |    2 +-
 48 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/meta-demoapps/recipes-connectivity/farsight/farsight2_0.0.9.bb b/meta-demoapps/recipes-connectivity/farsight/farsight2_0.0.9.bb
index 483a767..a7bdc97 100644
--- a/meta-demoapps/recipes-connectivity/farsight/farsight2_0.0.9.bb
+++ b/meta-demoapps/recipes-connectivity/farsight/farsight2_0.0.9.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "FarSight is an audio/video conferencing framework specifically designed for Instant Messengers."
 HOMEPAGE = "http://farsight.sf.net"
-SRC_URI = "http://farsight.freedesktop.org/releases/farsight2/${P}.tar.gz"
+SRC_URI = "http://farsight.freedesktop.org/releases/farsight2/${BPN}-${PV}.tar.gz"
 LICENSE = "GPLv2.1"
 DEPENDS = "libnice glib-2.0 libxml2 zlib dbus gstreamer gst-plugins-base"
 
diff --git a/meta-demoapps/recipes-connectivity/loudmouth/loudmouth_1.4.0.bb b/meta-demoapps/recipes-connectivity/loudmouth/loudmouth_1.4.0.bb
index e20c417..b6af11d 100644
--- a/meta-demoapps/recipes-connectivity/loudmouth/loudmouth_1.4.0.bb
+++ b/meta-demoapps/recipes-connectivity/loudmouth/loudmouth_1.4.0.bb
@@ -5,6 +5,6 @@ LICENSE = "LGPL"
 DEPENDS = "glib-2.0 gnutls libcheck"
 PR = "r2"
 
-SRC_URI = "http://ftp.imendio.com/pub/imendio/${PN}/src/${PN}-${PV}.tar.bz2"
+SRC_URI = "http://ftp.imendio.com/pub/imendio/${BPN}/src/${BPN}-${PV}.tar.bz2"
 
 inherit autotools pkgconfig
diff --git a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin_0.36.inc b/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin_0.36.inc
index 147fcfb..cde4779 100644
--- a/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin_0.36.inc
+++ b/meta-demoapps/recipes-connectivity/opensync/libopensync-plugin_0.36.inc
@@ -2,7 +2,7 @@ DEPENDS = "libopensync (>= 0.36)"
 
 DESCRIPTION ?= "OpenSync plugin"
 
-SRC_URI = "http://opensync.org/download/releases/${PV}/${P}.tar.bz2"
+SRC_URI = "http://opensync.org/download/releases/${PV}/${BPN}-${PV}.tar.bz2"
 
 inherit cmake
 
diff --git a/meta-demoapps/recipes-connectivity/telepathy/telepathy-farsight_0.0.7.bb b/meta-demoapps/recipes-connectivity/telepathy/telepathy-farsight_0.0.7.bb
index 56c32f2..3ddee8f 100644
--- a/meta-demoapps/recipes-connectivity/telepathy/telepathy-farsight_0.0.7.bb
+++ b/meta-demoapps/recipes-connectivity/telepathy/telepathy-farsight_0.0.7.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
 DEPENDS = "glib-2.0 dbus telepathy-glib farsight2"
 LICENSE = "LGPLv2"
 
-SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-farsight/${P}.tar.gz \
+SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-farsight/${BPN}-${PV}.tar.gz \
 "
 
 inherit autotools
diff --git a/meta-demoapps/recipes-connectivity/telepathy/telepathy-gabble_0.7.8.bb b/meta-demoapps/recipes-connectivity/telepathy/telepathy-gabble_0.7.8.bb
index ff49418..36e9d65 100644
--- a/meta-demoapps/recipes-connectivity/telepathy/telepathy-gabble_0.7.8.bb
+++ b/meta-demoapps/recipes-connectivity/telepathy/telepathy-gabble_0.7.8.bb
@@ -5,7 +5,7 @@ DEPENDS = "glib-2.0 dbus loudmouth telepathy-glib dbus-glib"
 LICENSE = "LGPL"
 
 # gabble.manager needs to get regenerated every release, so please don't copy it over blindly
-SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-gabble/${P}.tar.gz \
+SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-gabble/${BPN}-${PV}.tar.gz \
            file://gabble.manager"
 
 inherit autotools pkgconfig
diff --git a/meta-demoapps/recipes-connectivity/wbxml/wbxml2_0.9.2.bb b/meta-demoapps/recipes-connectivity/wbxml/wbxml2_0.9.2.bb
index e3ac001..42655a1 100644
--- a/meta-demoapps/recipes-connectivity/wbxml/wbxml2_0.9.2.bb
+++ b/meta-demoapps/recipes-connectivity/wbxml/wbxml2_0.9.2.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2"
 
 DEPENDS = "libxml2 sed-native expat"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/wbxmllib/${P}.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/wbxmllib/${BPN}-${PV}.tar.gz \
 	   file://no-doc-install.patch;patch=1"
 
 inherit autotools pkgconfig
diff --git a/meta-demoapps/recipes-gnome/gcalctool/gcalctool_5.7.32.bb b/meta-demoapps/recipes-gnome/gcalctool/gcalctool_5.7.32.bb
index f12e6c4..4b74cf1 100644
--- a/meta-demoapps/recipes-gnome/gcalctool/gcalctool_5.7.32.bb
+++ b/meta-demoapps/recipes-gnome/gcalctool/gcalctool_5.7.32.bb
@@ -4,7 +4,7 @@ DEPENDS = "gtk+"
 DESCRIPTION = "gcalctool is a powerful calculator"
 PR = "r2"
 
-SRC_URI = "http://download.gnome.org/sources/${PN}/5.7/${PN}-${PV}.tar.gz \
+SRC_URI = "http://download.gnome.org/sources/${BPN}/5.7/${BPN}-${PV}.tar.gz \
         file://makefile-fix.diff;patch=1\
 	file://fix-includedir.patch;patch=1"
 
diff --git a/meta-demoapps/recipes-gnome/gcalctool/gcalctool_5.8.17.bb b/meta-demoapps/recipes-gnome/gcalctool/gcalctool_5.8.17.bb
index c72860c..8854ecf 100644
--- a/meta-demoapps/recipes-gnome/gcalctool/gcalctool_5.8.17.bb
+++ b/meta-demoapps/recipes-gnome/gcalctool/gcalctool_5.8.17.bb
@@ -4,7 +4,7 @@ DEPENDS = "gtk+ gnome-doc-utils"
 DESCRIPTION = "gcalctool is a powerful calculator"
 PR = "r0"
 
-SRC_URI = "http://download.gnome.org/sources/${PN}/5.8/${PN}-${PV}.tar.gz \
+SRC_URI = "http://download.gnome.org/sources/${BPN}/5.8/${BPN}-${PV}.tar.gz \
 	file://fix-includedir.patch;patch=1"
 
 inherit autotools pkgconfig
diff --git a/meta-demoapps/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb b/meta-demoapps/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
index f614048..b359938 100644
--- a/meta-demoapps/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
+++ b/meta-demoapps/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
@@ -6,7 +6,7 @@ PR = "r2"
 
 inherit autotools
 
-SRC_URI = "http://burtonini.com/temp/${PN}-${PV}.tar.gz \
+SRC_URI = "http://burtonini.com/temp/${BPN}-${PV}.tar.gz \
 	file://gtkstylus.sh"
 
 do_install_append() {
diff --git a/meta-demoapps/recipes-gnome/wv/wv_1.2.0.bb b/meta-demoapps/recipes-gnome/wv/wv_1.2.0.bb
index c4c115b..54878a9 100644
--- a/meta-demoapps/recipes-gnome/wv/wv_1.2.0.bb
+++ b/meta-demoapps/recipes-gnome/wv/wv_1.2.0.bb
@@ -9,6 +9,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/wv-${PV}.tar.gz \
 
 inherit autotools pkgconfig
 
-S = "${WORKDIR}/${PN}-${PV}"
+S = "${WORKDIR}/${BPN}-${PV}"
 
 EXTRA_OECONF = ""
diff --git a/meta-demoapps/recipes-sato/kf/kf_0.5.4.1.bb b/meta-demoapps/recipes-sato/kf/kf_0.5.4.1.bb
index 2baa6d4..67db92c 100644
--- a/meta-demoapps/recipes-sato/kf/kf_0.5.4.1.bb
+++ b/meta-demoapps/recipes-sato/kf/kf_0.5.4.1.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL"
 DEPENDS = "libxml2 glib-2.0 gtk+ loudmouth libglade"
 PR = "r4"
 
-SRC_URI = "http://jabberstudio.2nw.net/${PN}/${PN}-${PV}.tar.gz \
+SRC_URI = "http://jabberstudio.2nw.net/${BPN}/${BPN}-${PV}.tar.gz \
            file://fix-configure.patch;patch=1 \
            file://fix-desktop-file.patch;patch=0 \
            file://gcc4.patch;patch=1"
diff --git a/meta-demoapps/recipes-sato/matchbox-themes-extra/matchbox-themes-extra_git.bb b/meta-demoapps/recipes-sato/matchbox-themes-extra/matchbox-themes-extra_git.bb
index ad14043..214dd3d 100644
--- a/meta-demoapps/recipes-sato/matchbox-themes-extra/matchbox-themes-extra_git.bb
+++ b/meta-demoapps/recipes-sato/matchbox-themes-extra/matchbox-themes-extra_git.bb
@@ -7,7 +7,7 @@ PV = "0.3+git${SRCPV}"
 
 LIC_FILES_CHKSUM = "file://configure.ac;endline=7;md5=3c4e087662e37f10e469425f3a0ad225"
 
-SRC_URI = "git://git.yoctoproject.org/${PN};protocol=git"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
diff --git a/meta-demoapps/recipes-support/poppler/poppler-data_0.1.bb b/meta-demoapps/recipes-support/poppler/poppler-data_0.1.bb
index ca22e4d..37a8564 100644
--- a/meta-demoapps/recipes-support/poppler/poppler-data_0.1.bb
+++ b/meta-demoapps/recipes-support/poppler/poppler-data_0.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Poppler is a PDF rendering library based on the xpdf-3.0 code bas
 LICENSE = "Adobe"
 PR = "r0"
 
-SRC_URI = "http://poppler.freedesktop.org/${PN}-${PV}.tar.gz"
+SRC_URI = "http://poppler.freedesktop.org/${BPN}-${PV}.tar.gz"
 
 do_compile() {
 }
diff --git a/meta-demoapps/recipes-support/poppler/poppler.inc b/meta-demoapps/recipes-support/poppler/poppler.inc
index 645e734..b534ac2 100644
--- a/meta-demoapps/recipes-support/poppler/poppler.inc
+++ b/meta-demoapps/recipes-support/poppler/poppler.inc
@@ -3,7 +3,7 @@ DEPENDS = "fontconfig jpeg zlib gtk+ cairo"
 LICENSE = "GPL"
 PR = "r1"
 
-SRC_URI = "http://poppler.freedesktop.org/${PN}-${PV}.tar.gz"
+SRC_URI = "http://poppler.freedesktop.org/${BPN}-${PV}.tar.gz"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.3.13.1397.bb b/meta/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.3.13.1397.bb
index 22a55b2..0e850bc 100644
--- a/meta/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.3.13.1397.bb
+++ b/meta/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.3.13.1397.bb
@@ -5,7 +5,7 @@ inherit module
 
 SRC_URI = "http://dominion.thruhere.net/koen/OE/omap3-sgx-modules-1.3.13.1397.tar.bz2"
 
-S = ${WORKDIR}/${PN}-${PV}/eurasiacon/build/linux/omap3430_linux/kbuild/
+S = ${WORKDIR}/${BPN}-${PV}/eurasiacon/build/linux/omap3430_linux/kbuild/
 
 MAKE_TARGETS = "BUILD=debug"
 
@@ -13,5 +13,5 @@ COMPATIBLE_MACHINE = "(omap-3430ldp|omap-3430sdp|beagleboard|overo)"
 
 do_install() {
 	mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/drivers/gpu
-	cp ${WORKDIR}/${PN}-${PV}/eurasiacon/binary_omap3430_linux_debug/*.ko ${D}/lib/modules/${KERNEL_VERSION}/drivers/gpu	
+	cp ${WORKDIR}/${BPN}-${PV}/eurasiacon/binary_omap3430_linux_debug/*.ko ${D}/lib/modules/${KERNEL_VERSION}/drivers/gpu	
 }
diff --git a/meta/recipes-bsp/zaurusd/zaurusd_svn.bb b/meta/recipes-bsp/zaurusd/zaurusd_svn.bb
index 6f9ed03..eaac303 100644
--- a/meta/recipes-bsp/zaurusd/zaurusd_svn.bb
+++ b/meta/recipes-bsp/zaurusd/zaurusd_svn.bb
@@ -11,7 +11,7 @@ PR = "r3"
 SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=zaurusd;proto=http \
 	file://fix_makefile.patch"
 
-S = "${WORKDIR}/${PN}"
+S = "${WORKDIR}/${BPN}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/meta/recipes-connectivity/galago/galago-daemon_0.5.1.bb b/meta/recipes-connectivity/galago/galago-daemon_0.5.1.bb
index 01f0ef7..81a367d 100644
--- a/meta/recipes-connectivity/galago/galago-daemon_0.5.1.bb
+++ b/meta/recipes-connectivity/galago/galago-daemon_0.5.1.bb
@@ -5,7 +5,7 @@ LICENSE =       "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS =       "libgalago dbus glib-2.0"
 
-SRC_URI =       "http://www.galago-project.org/files/releases/source/${BPN}/${P}.tar.gz "
+SRC_URI =       "http://www.galago-project.org/files/releases/source/${BPN}/${BPN}-${PV}.tar.gz "
 
 SRC_URI[md5sum] = "fdb81f938f86f380b127158ebb542279"
 SRC_URI[sha256sum] = "db42a0d1d0f8b069ea5ac1203207f9178f25ac1367f4910bd48547f5be1db4c2"
diff --git a/meta/recipes-connectivity/iproute2/iproute2_2.6.38.bb b/meta/recipes-connectivity/iproute2/iproute2_2.6.38.bb
index e822750..7abc41f 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_2.6.38.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_2.6.38.bb
@@ -2,7 +2,7 @@ require iproute2.inc
 
 PR = "r0"
 
-SRC_URI = "http://developer.osdl.org/dev/iproute2/download/${P}.tar.bz2 \
+SRC_URI = "http://developer.osdl.org/dev/iproute2/download/${BPN}-${PV}.tar.bz2 \
 	   file://configure-cross.patch"
 
 SRC_URI[md5sum] = "a243bfea837e71824b7ca26c3bb45fa8"
diff --git a/meta/recipes-connectivity/ofono/ofono_0.50.bb b/meta/recipes-connectivity/ofono/ofono_0.50.bb
index 4635386..ef4fbf0 100644
--- a/meta/recipes-connectivity/ofono/ofono_0.50.bb
+++ b/meta/recipes-connectivity/ofono/ofono_0.50.bb
@@ -2,7 +2,7 @@ require ofono.inc
 
 PR = "r1"
 
-SRC_URI  = "${KERNELORG_MIRROR}/linux/network/ofono/${P}.tar.bz2 \
+SRC_URI  = "${KERNELORG_MIRROR}/linux/network/ofono/${BPN}-${PV}.tar.bz2 \
 	          file://ofono"
 
 EXTRA_OECONF += "\
diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.14.3.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.14.3.bb
index 9351be4..8bb63e7 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.14.3.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.14.3.bb
@@ -5,7 +5,7 @@ DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib"
 LICENSE = "LGPLv2.1+"
 PR = "r0"
 
-SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${P}.tar.gz"
+SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "fe9a4f781651593fd4afddb343ff50bf"
 SRC_URI[sha256sum] = "62e759084355ac0fce61feb561a7535a6707b223f0d1e4305fd47c83fa5494d0"
diff --git a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.8.bb b/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.8.bb
index 5bd4e28..bc1fb4e 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.8.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.8.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/idle.c;beginline=1;endline=19;md5=b06b1e2594423111a1a7910b0eefc7f9"
 PR = "r0"
 
-SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${P}.tar.gz"
+SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "82f5eafa07df5e1abc785061143bbfd2"
 SRC_URI[sha256sum] = "384119cc64022626b6f51aaaef605abf248602d8fae25baff82762a097f20fe9"
diff --git a/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb b/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
index 0a483c4..ead8dea 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 RDEPENDS_${PN} += "python-dbus"
 
-SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${P}.tar.gz \
+SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://parallel_make.patch"
 
 PR = "r2"
diff --git a/meta/recipes-core/dbus-wait/dbus-wait_svn.bb b/meta/recipes-core/dbus-wait/dbus-wait_svn.bb
index 9a6130f..1270973 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_svn.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_svn.bb
@@ -11,6 +11,6 @@ PR = "r2"
 
 SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=dbus-wait;proto=http"
 
-S = "${WORKDIR}/${PN}"
+S = "${WORKDIR}/${BPN}"
 
 inherit autotools
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb b/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
index 64fff50..f492dd3 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.28.7.bb
@@ -10,7 +10,7 @@ DEPENDS = "glib-2.0 gnutls"
 
 PR = "r0"
 
-SRC_URI = "${GNOME_MIRROR}/${PN}/2.28/${PN}-${PV}.tar.bz2"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/2.28/${BPN}-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "c10e51571d03c10111a37bcd21fbf777"
 SRC_URI[sha256sum] = "98bedfbd530c4b1b53c91025fe82290bafd289d249e4eb549c3b90d23a76021c"
diff --git a/meta/recipes-devtools/distcc/distcc_2.18.3.bb b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
index e474cce..ec6ffb3 100644
--- a/meta/recipes-devtools/distcc/distcc_2.18.3.bb
+++ b/meta/recipes-devtools/distcc/distcc_2.18.3.bb
@@ -14,7 +14,7 @@ RRECOMMENDS_${PN} = "avahi-daemon"
 
 # Upstream change this patch periodically so store locally
 # http://0pointer.de/public/distcc-avahi.patch
-SRC_URI = "http://distcc.googlecode.com/files/${PN}-${PV}.tar.bz2 \
+SRC_URI = "http://distcc.googlecode.com/files/${BPN}-${PV}.tar.bz2 \
            file://distcc-avahi.patch \	  
            file://makefile-param-order.patch \
 	   file://default \
diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
index f73bd1e..4b3dd94 100644
--- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://subversion.tigris.org"
 
 PR = "r0"
 
-SRC_URI = "http://subversion.tigris.org/downloads/${P}.tar.bz2 \
+SRC_URI = "http://subversion.tigris.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://disable-revision-install.patch;patch=1 \
 	   file://neon-detection.patch;patch=1 \
 	   file://libtool2.patch;patch=1"
diff --git a/meta/recipes-extended/blktool/blktool_4-6.bb b/meta/recipes-extended/blktool/blktool_4-6.bb
index 86d2d0d..cc1174c 100644
--- a/meta/recipes-extended/blktool/blktool_4-6.bb
+++ b/meta/recipes-extended/blktool/blktool_4-6.bb
@@ -19,6 +19,6 @@ SRC_URI[tarball.sha256sum] = "b1e6d5912546d2a4b704ec65c2b9664aa3b4663e7d800e0680
 SRC_URI[patch.md5sum] = "2d1bc2f2c38b65d47e27da7c7508d17f"
 SRC_URI[patch.sha256sum] = "999f2062203e389327d997724621be37bea9c98fa226238f9f4eb4a6ea25bd4b"
 
-S = "${WORKDIR}/${PN}-4.orig"
+S = "${WORKDIR}/${BPN}-4.orig"
 
 inherit autotools
diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.52.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.52.bb
index 7d5f069..659f964 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.52.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.52.bb
@@ -14,7 +14,7 @@ DEPENDS = "libnewt popt"
 
 PR = "r0"
 
-SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${P}.tar.bz2"
+SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "a576808a6d66763606d750ec451bab6d"
 SRC_URI[sha256sum] = "aa36bf7fd3f7c6e3371eddd8a7846b83435c48f132cc5919d83a830504b797d6"
diff --git a/meta/recipes-extended/libidn/libidn_0.6.14.bb b/meta/recipes-extended/libidn/libidn_0.6.14.bb
index c453b79..67c9381 100644
--- a/meta/recipes-extended/libidn/libidn_0.6.14.bb
+++ b/meta/recipes-extended/libidn/libidn_0.6.14.bb
@@ -11,7 +11,7 @@ PR = "r0"
 
 inherit pkgconfig autotools gettext
 
-SRC_URI = "http://alpha.gnu.org/gnu/libidn/${P}.tar.gz"
+SRC_URI = "http://alpha.gnu.org/gnu/libidn/${BPN}-${PV}.tar.gz"
 
 EXTRA_OECONF = " --disable-tld"
 
diff --git a/meta/recipes-extended/libidn/libidn_1.22.bb b/meta/recipes-extended/libidn/libidn_1.22.bb
index cf08eaf..6a1059c 100644
--- a/meta/recipes-extended/libidn/libidn_1.22.bb
+++ b/meta/recipes-extended/libidn/libidn_1.22.bb
@@ -11,7 +11,7 @@ PR = "r0"
 
 inherit pkgconfig autotools gettext
 
-SRC_URI = "${GNU_MIRROR}/libidn/${P}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz"
 
 # command tool is under GPLv3+, while libidn itself is under LGPLv2.1+
 # so package command into a separate package
diff --git a/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb b/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb
index dbc15e1..8988ca1 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_0.2.2.bb
@@ -11,8 +11,8 @@ PR = "r0"
 DEPENDS += "xz-native"
 PROVIDES = "virtual/librpc"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.bz2;name=libtirpc \
-           ${GENTOO_MIRROR}/${PN}-glibc-nfs.tar.xz;name=glibc-nfs \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2;name=libtirpc \
+           ${GENTOO_MIRROR}/${BPN}-glibc-nfs.tar.xz;name=glibc-nfs \
            file://libtirpc-0.2.1-fortify.patch \
            file://libtirpc-0.2.2-rpc-des-prot.patch \
            file://remove-des-crypt.patch \
diff --git a/meta/recipes-extended/mktemp/mktemp_1.7.bb b/meta/recipes-extended/mktemp/mktemp_1.7.bb
index 1d09964..d0479ce 100644
--- a/meta/recipes-extended/mktemp/mktemp_1.7.bb
+++ b/meta/recipes-extended/mktemp/mktemp_1.7.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=430680f6322a1eb87199b5e01a82c0d4"
 
 PR = "r0"
 
-SRC_URI = "ftp://ftp.mktemp.org/pub/mktemp/${P}.tar.gz \
+SRC_URI = "ftp://ftp.mktemp.org/pub/mktemp/${BPN}-${PV}.tar.gz \
         file://disable-strip.patch \
         "
 
diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb
index 695e4f3..f54d591 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb
@@ -18,7 +18,7 @@ PR="r0"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a5367a90934098d6b05af3b746405014"
 
-SRC_URI = "http://portland.freedesktop.org/download/${PN}-${PV}.tgz"
+SRC_URI = "http://portland.freedesktop.org/download/${BPN}-${PV}.tgz"
 
 inherit autotools
 
diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb
index 1b02258..e1f9ffb 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.06.bb
@@ -17,7 +17,7 @@ FONTREV = "0.20100721"
 SRC_URI = "https://fedorahosted.org/releases/l/i/${BPN}/${BPN}-${PV}.${FONTREV}.tar.gz \
            file://30-liberation-aliases.conf"
 
-S = ${WORKDIR}/${PN}-${PV}.${FONTREV}
+S = ${WORKDIR}/${BPN}-${PV}.${FONTREV}
 
 do_install () {
 	install -d ${D}${datadir}/fonts/ttf/
diff --git a/meta/recipes-graphics/xorg-driver/xf86-driver-common.inc b/meta/recipes-graphics/xorg-driver/xf86-driver-common.inc
index 6ff1391..34d03b2 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xf86-driver-common.inc
@@ -9,7 +9,7 @@ PR = "r1"
 
 DEPENDS = "virtual/xserver-xf86 xproto randrproto util-macros"
 
-XORG_PN = "${PN}"
+XORG_PN = "${BPN}"
 SRC_URI = "${XORG_MIRROR}/individual/driver/${XORG_PN}-${PV}.tar.bz2"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb
index 0498c19..665601f 100644
--- a/meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb
+++ b/meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb
@@ -7,7 +7,7 @@ DEPENDS = "libvorbis libogg alsa-lib libmad"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/omxil/libomxil-B-${PV}.tar.gz"
 
-S = "${WORKDIR}/${PN}-B-${PV}"
+S = "${WORKDIR}/${BPN}-B-${PV}"
 
 inherit autotools
 
diff --git a/meta/recipes-sato/eds/eds-tools_bzr.bb b/meta/recipes-sato/eds/eds-tools_bzr.bb
index bd693db..afa8000 100644
--- a/meta/recipes-sato/eds/eds-tools_bzr.bb
+++ b/meta/recipes-sato/eds/eds-tools_bzr.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit autotools pkgconfig
 
-S = "${WORKDIR}/${PN}"
+S = "${WORKDIR}/${BPN}"
 
 FILES_${PN} += "${libdir}/evolution-data-server-1.2/extensions/*.so"
diff --git a/meta/recipes-sato/gaku/gaku_svn.bb b/meta/recipes-sato/gaku/gaku_svn.bb
index 4a2e907..3806021 100644
--- a/meta/recipes-sato/gaku/gaku_svn.bb
+++ b/meta/recipes-sato/gaku/gaku_svn.bb
@@ -22,6 +22,6 @@ PR = "r4"
 
 SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=${BPN};proto=http"
 
-S = "${WORKDIR}/${PN}"
+S = "${WORKDIR}/${BPN}"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-sato/libical/libical_0.46.bb b/meta/recipes-sato/libical/libical_0.46.bb
index 6ad5d35..e0e88ba 100644
--- a/meta/recipes-sato/libical/libical_0.46.bb
+++ b/meta/recipes-sato/libical/libical_0.46.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=35da21efce2b9f0ca07524c9f844e6ed \
 SECTION = "libs"
 PR = "r0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/freeassociation/${P}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/freeassociation/${BPN}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "9c08f88945bfd5d0791d102e4aa4125c"
 SRC_URI[sha256sum] = "000762efb81501421d94ec56343648a62b3bd2884e7cdf6f638e2c207dd8f6a1"
diff --git a/meta/recipes-sato/libowl/libowl_svn.bb b/meta/recipes-sato/libowl/libowl_svn.bb
index 147a332..1500fad 100644
--- a/meta/recipes-sato/libowl/libowl_svn.bb
+++ b/meta/recipes-sato/libowl/libowl_svn.bb
@@ -16,6 +16,6 @@ PR = "r6"
 
 SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=${BPN};proto=http"
 
-S = "${WORKDIR}/${PN}"
+S = "${WORKDIR}/${BPN}"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-sato/owl-video-widget/libowl-av_svn.bb b/meta/recipes-sato/owl-video-widget/libowl-av_svn.bb
index 9d5fd89..04928a4 100644
--- a/meta/recipes-sato/owl-video-widget/libowl-av_svn.bb
+++ b/meta/recipes-sato/owl-video-widget/libowl-av_svn.bb
@@ -16,7 +16,7 @@ SRCREV = "416"
 PV = "0.0+svnr${SRCPV}"
 PR = "r6"
 
-S = "${WORKDIR}/${PN}"
+S = "${WORKDIR}/${BPN}"
 
 SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=${BPN};proto=http \
            file://gst_change_state.patch \
diff --git a/meta/recipes-sato/puzzles/oh-puzzles_svn.bb b/meta/recipes-sato/puzzles/oh-puzzles_svn.bb
index d00b060..616fb0e 100644
--- a/meta/recipes-sato/puzzles/oh-puzzles_svn.bb
+++ b/meta/recipes-sato/puzzles/oh-puzzles_svn.bb
@@ -22,7 +22,7 @@ inherit autotools pkgconfig
 SRC_URI = "svn://svn.o-hand.com/repos/;module=oh-puzzles;proto=http"
 SRC_URI_append_poky = " file://oh-puzzles-owl-menu.patch;patch=1;pnum=0 "
 
-S = "${WORKDIR}/${PN}"
+S = "${WORKDIR}/${BPN}"
 
 EXTRA_OEMAKE += "GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1"
 
diff --git a/meta/recipes-sato/puzzles/puzzles_r9175.bb b/meta/recipes-sato/puzzles/puzzles_r9175.bb
index 5cd8bb9..ee0c025 100644
--- a/meta/recipes-sato/puzzles/puzzles_r9175.bb
+++ b/meta/recipes-sato/puzzles/puzzles_r9175.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/puzzles-${PV}.tar
 #SRC_URI[sha256sum] = "69f37e497e63b2f7ab44e7bbd50aee078269c16dbc2d78ec1b00257678f2cbd2"
 #SRC_URI = "svn://ixion.tartarus.org/main;module=puzzles;rev=${MOD_PV}"
 
-S = "${WORKDIR}/${PN}-${PV}"
+S = "${WORKDIR}/${BPN}-${PV}"
 
 do_configure () {
 	./mkfiles.pl
diff --git a/meta/recipes-sato/screenshot/screenshot_svn.bb b/meta/recipes-sato/screenshot/screenshot_svn.bb
index 66a5c81..825870d 100644
--- a/meta/recipes-sato/screenshot/screenshot_svn.bb
+++ b/meta/recipes-sato/screenshot/screenshot_svn.bb
@@ -15,7 +15,7 @@ PR = "r2"
 SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=${BPN};proto=http \
            file://fix_ldadd_order.patch"
 
-S = ${WORKDIR}/${PN}
+S = ${WORKDIR}/${BPN}
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-support/apr/apr-util_1.3.10.bb b/meta/recipes-support/apr/apr-util_1.3.10.bb
index 7071b90..01595df 100644
--- a/meta/recipes-support/apr/apr-util_1.3.10.bb
+++ b/meta/recipes-support/apr/apr-util_1.3.10.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=519e0a18e03f7c023070568c14b077bb \
 
 PR = "r0"
 
-SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.gz \
+SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch;patch=1 \
            file://configure_fixes.patch;patch=1"
 
diff --git a/meta/recipes-support/apr/apr_1.4.2.bb b/meta/recipes-support/apr/apr_1.4.2.bb
index b37001d..2d5edaa 100644
--- a/meta/recipes-support/apr/apr_1.4.2.bb
+++ b/meta/recipes-support/apr/apr_1.4.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c35ff3c4c83b89d2f076e315caac28b \
 
 PR = "r1"
 
-SRC_URI = "${APACHE_MIRROR}/apr/${P}.tar.bz2 \
+SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://configure_fixes.patch;patch=1 \
 	   file://cleanup.patch;patch=1 \
            file://configfix.patch;patch=1 \
diff --git a/meta/recipes-support/liboil/liboil_0.3.17.bb b/meta/recipes-support/liboil/liboil_0.3.17.bb
index f342a82..64e1ddd 100644
--- a/meta/recipes-support/liboil/liboil_0.3.17.bb
+++ b/meta/recipes-support/liboil/liboil_0.3.17.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ad80780d9c5205d63481a0184e199a15 \
 DEPENDS = "glib-2.0"
 PR = "r3"
 
-SRC_URI = "http://liboil.freedesktop.org/download/${P}.tar.gz \
+SRC_URI = "http://liboil.freedesktop.org/download/${BPN}-${PV}.tar.gz \
            file://no-tests.patch \
            file://fix-unaligned-whitelist.patch \
           "
diff --git a/meta/recipes-support/neon/neon_0.29.5.bb b/meta/recipes-support/neon/neon_0.29.5.bb
index ae476a6..f465a4d 100644
--- a/meta/recipes-support/neon/neon_0.29.5.bb
+++ b/meta/recipes-support/neon/neon_0.29.5.bb
@@ -8,7 +8,7 @@ DEPENDS = "zlib libxml2 expat time gnutls"
 
 PR = "r0"
 
-SRC_URI = "http://www.webdav.org/${BPN}/${P}.tar.gz \
+SRC_URI = "http://www.webdav.org/${BPN}/${BPN}-${PV}.tar.gz \
            file://pkgconfig.patch;patch=1"
 
 SRC_URI[md5sum] = "ff369e69ef0f0143beb5626164e87ae2"
-- 
1.7.0.4



