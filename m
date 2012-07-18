Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrP5Q-0004Vz-0Y
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 09:54:20 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jul 2012 00:42:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169736806"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by azsmga001.ch.intel.com with ESMTP; 18 Jul 2012 00:42:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 00:42:39 -0700
Message-Id: <036a017187e4d75a994b3eb9c0e5d1a8dd61432c.1342597081.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
References: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342597081.git.sgw@linux.intel.com>
References: <cover.1342597081.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/18] qt-mobility, xserver-xorg, ofono, bluez4, gst-plugins-good: bump PR to rebuild after libudev0 soname change to libudev1
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
X-List-Received-Date: Wed, 18 Jul 2012 07:54:21 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* this patch depends on http://patchwork.openembedded.org/patch/32085/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |    2 +-
 meta/recipes-connectivity/ofono/ofono_1.8.bb       |    1 +
 meta/recipes-connectivity/ofono/ofono_git.bb       |    2 +-
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    2 +-
 .../gstreamer/gst-plugins-good_0.10.31.bb          |    2 +-
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    2 +-
 6 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
index 4a360b6..e26d4ea 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -1,6 +1,6 @@
 require bluez4.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "file://bluetooth.conf \
             file://sbc_mmx.patch"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.8.bb b/meta/recipes-connectivity/ofono/ofono_1.8.bb
index e2d97f0..86767f1 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.8.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.8.bb
@@ -4,6 +4,7 @@ SRC_URI  = "\
   ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.bz2 \
   file://ofono \
 "
+PR = "r1"
 
 SRC_URI[md5sum] = "e457ea13db22bb2de77767c867dcc4d3"
 SRC_URI[sha256sum] = "164b413068e810281a5e6c9bb90d5002d80f1c30bef2f3ffdbe70f963079524d"
diff --git a/meta/recipes-connectivity/ofono/ofono_git.bb b/meta/recipes-connectivity/ofono/ofono_git.bb
index a44b411..0a69fff 100644
--- a/meta/recipes-connectivity/ofono/ofono_git.bb
+++ b/meta/recipes-connectivity/ofono/ofono_git.bb
@@ -3,7 +3,7 @@ require ofono.inc
 S	 = "${WORKDIR}/git"
 SRCREV = "14544d5996836f628613c2ce544380ee6fc8f514"
 PV	 = "0.12-git${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 SRC_URI  = "git://git.kernel.org/pub/scm/network/ofono/ofono.git;protocol=git \
 	    file://ofono"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
index 595ab77..017ac91 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
@@ -8,5 +8,5 @@ SRC_URI += "file://crosscompile.patch \
 SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
 SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
 
-PR = "r3"
+PR = "r4"
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
index e0eaf7b..ac63f94 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 DEPENDS += "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3tag flac \
 	    speex libsoup-2.4 pulseaudio"
-PR = "r1"
+PR = "r2"
 
 inherit gettext gconf
 
diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index e612adb..7f0af9f 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -16,7 +16,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.t
 SRC_URI[md5sum]="ea5db5a8d3dd4709c2926dceda646bd8"
 SRC_URI[sha256sum]="ee3c88975e04139ac9589f76d4be646d44fcbc4c8c1cf2db621abc154cf0ba44"
 
-PR = "r5"
+PR = "r6"
 
 S = "${WORKDIR}/qt-mobility-opensource-src-${PV}"
 
-- 
1.7.7.6



