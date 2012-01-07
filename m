Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1RjM89-000861-NO
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 03:35:38 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 06 Jan 2012 18:28:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="54111075"
Received: from unknown (HELO localhost) ([10.255.13.210])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Jan 2012 18:28:11 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org, philb@gnu.org,
	paul.eggleton@linux.intel.com
Date: Fri,  6 Jan 2012 20:27:38 -0600
Message-Id: <0b099c683a839801b52c2b4983c46f4a44212d51.1325902364.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1325902364.git.tom.zanussi@intel.com>
References: <cover.1325902364.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1325902364.git.tom.zanussi@intel.com>
References: <cover.1325902364.git.tom.zanussi@intel.com>
Subject: [PATCH 2/5] Add LICENSE_FLAGS to packages mentioned in COMMERCIAL_LICENSE
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
X-List-Received-Date: Sat, 07 Jan 2012 02:35:38 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Per-recipe LICENSE_FLAGS replace the global COMMERCIAL_LICENSE list;
add LICENSE_FLAGS varables to each the recipes mentioned in that list:

     - lame
     - gst-fluendo-mp3
     - gst-openmax
     - gst-plugins-ugly
     - libmad
     - libomxil
     - mpeg2dec
     - qmmp

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 .../gstreamer/gst-fluendo-mp3_0.10.16.bb           |    1 +
 .../gstreamer/gst-openmax_0.10.1.bb                |    1 +
 .../gstreamer/gst-plugins-ugly_0.10.18.bb          |    1 +
 meta/recipes-multimedia/lame/lame_3.99.3.bb        |    2 ++
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb   |    1 +
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb |    1 +
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb |    1 +
 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb              |    1 +
 8 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.16.bb b/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.16.bb
index 5975513..2ce2993 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.16.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo-mp3_0.10.16.bb
@@ -2,6 +2,7 @@ require gst-fluendo.inc
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=98326cbb1723a5a97e9b1db62e9faa05"
+LICENSE_FLAGS = "commercial_${PN}"
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb b/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
index 776ed1c..d2a56ce 100644
--- a/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb
@@ -1,6 +1,7 @@
 DEPENDS = "gstreamer"
 RDEPENDS_${PN} = "libomxil"
 LICENSE = "LGPLv2.1"
+LICENSE_FLAGS = "commercial_${PN}"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
                     file://util/sem.h;beginline=1;endline=20;md5=accce5550d5583b839b441a0623f09fc"
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb
index 2d7fa91..ff7e2d6 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.18.bb
@@ -1,6 +1,7 @@
 require gst-plugins.inc
 
 LICENSE = "GPLv2+ & LGPLv2.1+ & LGPLv2+"
+LICENSE_FLAGS = "commercial_${PN}"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://gst/synaesthesia/synaescope.h;beginline=1;endline=20;md5=99f301df7b80490c6ff8305fcc712838 \
                     file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068 \
diff --git a/meta/recipes-multimedia/lame/lame_3.99.3.bb b/meta/recipes-multimedia/lame/lame_3.99.3.bb
index 3c42cc7..1e64b68 100644
--- a/meta/recipes-multimedia/lame/lame_3.99.3.bb
+++ b/meta/recipes-multimedia/lame/lame_3.99.3.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "http://sourceforge.net/projects/lame/files/lame/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=290&atid=100290"
 SECTION = "console/utils"
 LICENSE = "LGPLv2+"
+LICENSE_FLAGS = "commercial_${PN}"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9 \
                     file://include/lame.h;beginline=1;endline=20;md5=a2258182c593c398d15a48262130a92b
 PR = "r0"
diff --git a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
index aec929c..7678b32 100644
--- a/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "MPEG Audio Decoder Library"
 HOMEPAGE = "http://sourceforge.net/projects/mad/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=12349&atid=112349"
 LICENSE = "GPLv2+"
+LICENSE_FLAGS = "commercial_${PN}"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 			file://COPYRIGHT;md5=8e55eb14894e782b84488d5a239bc23d \
 			file://version.h;beginline=1;endline=8;md5=aa07311dd39288d4349f28e1de516454"
diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
index bb31c56..ad11013 100644
--- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
+++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Bellagio OpenMAX Integration Layer"
 HOMEPAGE = "http://omxil.sourceforge.net/"
 LICENSE = "LGPLv2.1+"
+LICENSE_FLAGS = "commercial_${PN}"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae6f0f4dbc7ac193b50f323a6ae191cb \
                     file://src/omxcore.h;beginline=1;endline=27;md5=806b1e5566c06486fe8e42b461e03a90"
 DEPENDS = "libvorbis libogg alsa-lib libmad"
diff --git a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
index 351962f..ef59a55 100644
--- a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
+++ b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Library and test program for decoding mpeg-2 and mpeg-1 video str
 HOMEPAGE = "http://libmpeg2.sourceforge.net/"
 SECTION = "libs"
 LICENSE = "GPLv2+"
+LICENSE_FLAGS = "commercial_${PN}"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://include/mpeg2.h;beginline=1;endline=22;md5=ead62602d4638329d3b5b86a55803154"
 
diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
index b3ecc45..13a53c7 100644
--- a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
+++ b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Qmmp (Qt-based Multimedia Player) is an audio-player, written with help of Qt library"
 HOMEPAGE = "http://qmmp.ylsoftware.com"
 LICENSE = "GPLv2"
+LICENSE_FLAGS = "commercial_${PN}"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 SECTION = "multimedia"
 
-- 
1.7.0.4



