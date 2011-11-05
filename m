Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RMk3Q-00065L-1n
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Nov 2011 18:29:16 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Nov 2011 10:23:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,461,1315206000"; d="scan'208";a="33625111"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.12])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Nov 2011 10:23:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Nov 2011 10:22:36 -0700
Message-Id: <58510082c4abac45919b92b88f8f0cfdb2ae5eb9.1320513631.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/28] qmmp: update to 0.5.2
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
X-List-Received-Date: Sat, 05 Nov 2011 17:29:16 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Remove recipe qmmp_0.5.1 and add qmmp_0.5.2

Use do_split_package for each grouping and name them correctly besides updating package.
The format to name plugins of qmmp:
qmmp-plugin-<group>-<library>   with the Description: Qmmp<Group>  plugin for %s"

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    9 +++-
 .../qt-apps/{qmmp_0.5.1.bb => qmmp_0.5.2.bb}       |   52 ++++++++++++--------
 2 files changed, 38 insertions(+), 23 deletions(-)
 rename meta/recipes-qt/qt-apps/{qmmp_0.5.1.bb => qmmp_0.5.2.bb} (48%)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 998eabf..7d7295c 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5726,11 +5726,16 @@ RECIPE_LAST_UPDATE_pn-libgdata = "Dec 29, 2010"
 RECIPE_MAINTAINER_pn-libgdata = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_LATEST_VERSION_pn-man-pages = "3.32"
-RECIPE_LATEST_VERSION_pn-qmmp = "0.4.3"
-RECIPE_MAINTAINER_pn-qmmp = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 RECIPE_LATEST_VERSION_pn-sysprof = "6b5b8432711ef5c747f8375073cd9af88922d3c6"
 RECIPE_LATEST_VERSION_pn-table = "d42a44938699ee30a998fc42bc149aebf69389db"
 
+RECIPE_STATUS_pn-qmmp = "green"
+RECIPE_LATEST_VERSION_pn-qmmp = "0.5.2"
+RECIPE_LATEST_RELEASE_DATE_pn-qmmp = "Sep 02, 2011"
+RECIPE_LAST_UPDATE_pn-qmmp = "Oct 27, 2011"
+RECIPE_MAINTAINER_pn-qmmp = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
+
+
 RECIPE_LATEST_VERSION_pn-texinfo = "4.13a"
 RECIPE_LATEST_RELEASE_DATE_pn-texinfo = "Sep 22, 2008"
 RECIPE_LAST_UPDATE_pn-texinfo = "Sep 16, 2011"
diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.1.bb b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
similarity index 48%
rename from meta/recipes-qt/qt-apps/qmmp_0.5.1.bb
rename to meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
index 948c32a..98ee907 100644
--- a/meta/recipes-qt/qt-apps/qmmp_0.5.1.bb
+++ b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
@@ -1,23 +1,24 @@
-DESCRIPTION = "Qmmp (Qt-based Multimedia Player) is an audio-player, written with help of Qt library"
+dESCRIPTION = "Qmmp (Qt-based Multimedia Player) is an audio-player, written with help of Qt library"
 HOMEPAGE = "http://qmmp.ylsoftware.com"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 SECTION = "multimedia"
 
-PR = "r0"
+PR = "r4"
 
+PROVIDES = "qmmp"
 DEPENDS = "qt4-x11-free taglib libmad libvorbis libogg alsa-lib"
-RDEPENDS_${PN} += "taglib alsa-lib curl"
+RDEPENDS_${PN} += "taglib alsa-lib libmad curl"
 
 SRC_URI = "http://qmmp.ylsoftware.com/files/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "7934c069256bf2fc4ab762ad2683db2f"
-SRC_URI[sha256sum] = "16ab0334f368a5ef14d631a1d43d7cae876ee06b7185643377b5e9cfd6143099"
+SRC_URI[md5sum] = "20852f3cce3471bfc5affa9b2e947dc6"
+SRC_URI[sha256sum] = "6391dec020d2a381d7f4b7890fae6c49eadf88b3c9aef571fe3c5e96140822ec"
 
 
 PARALLEL_MAKE = ""
 
-inherit qmake2 cmake
+inherit qmake2 cmake package
 
 export EXTRA_OECMAKE = "-DQT_QMAKE_EXECUTABLE=${OE_QMAKE_QMAKE} \
                         -DQT_LRELEASE_EXECUTABLE=${OE_QMAKE_LRELEASE} \
@@ -28,20 +29,29 @@ export EXTRA_OECMAKE = "-DQT_QMAKE_EXECUTABLE=${OE_QMAKE_QMAKE} \
                         -DQT_HEADERS_DIR=${OE_QMAKE_INCDIR_QT} \
                         -DQT_QTCORE_INCLUDE_DIR=${OE_QMAKE_INCDIR_QT}/QtCore \
                         "
-
-FILES_${PN} = "${bindir}/qmmp ${libdir}/*.so* \ 
-               ${libdir}/qmmp/PlaylistFormats/*.so \
-               ${libdir}/qmmp/Output/libalsa.so \
-               ${libdir}/qmmp/Transports/libhttp.so \
-               ${libdir}/qmmp/Visual/libanalyzer.so \
-               ${datadir}/icons/* \
-               ${datadir}/qmmp/images/* \
-               ${datadir}/applications/qmmp.desktop \
+PACKAGES_DYNAMIC = "qmmp-plugin-* "
+
+
+python populate_packages_prepend () {
+	import os
+	qmmp_libdir = bb.data.expand('${libdir}/qmmp', d)
+	gd = bb.data.expand('${D}/${libdir}/qmmp', d)
+	plug_dirs = os.listdir(gd)
+
+	for plug_dir in plug_dirs:
+		g_plug_dir = os.path.join(qmmp_libdir,plug_dir)
+		do_split_packages(d, g_plug_dir, '^lib(.*)\.so$', 'qmmp-plugin-' + plug_dir + '-%s', 'Qmmp' + plug_dir  + 'plugin for %s')
+} 
+
+FILES_${PN} = "\
+		${bindir}/qmmp \
+                ${libdir}/lib*${SOLIBS} \ 
+		${datadir}/icons/* \
+                ${datadir}/qmmp/images/* \
+                ${datadir}/applications/* \
+		"
+
+FILES_${PN}-dbg += "\
+                ${libdir}/qmmp/*/.debug/* \
                "
 
-PACKAGES += "${PN}-plugin-input-mad ${PN}-plugin-input-vorbis"
-
-FILES_${PN}-plugin-input-mad = "${libdir}/qmmp/Input/libmad.so"
-RDEPENDS_${PN}-plugin-input-mad = "libmad"
-FILES_${PN}-plugin-input-vorbis = "${libdir}/qmmp/Input/libvorbis.so"
-RDEPENDS_${PN}-plugin-input-vorbis = "libvorbis libogg"
-- 
1.7.6.4



