Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 459DD74821
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 08:18:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 May 2018 01:18:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,357,1520924400"; d="scan'208";a="55612744"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.22.40])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2018 01:18:09 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2018 16:17:51 +0800
Message-Id: <20180503081758.4661-5-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180503081758.4661-1-anuj.mittal@intel.com>
References: <20180503081758.4661-1-anuj.mittal@intel.com>
Subject: [PATCH 05/12] gst-plugins-ugly: upgrade 1.12.4 -> 1.14.0
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
X-List-Received-Date: Thu, 03 May 2018 08:18:09 -0000

* For changes, please see: https://gstreamer.freedesktop.org/releases/1.14/
* Remove PACKAGECONFIG for lame, mpg123 since those have moved to -good.
* Merge inc/bb since there's only one version now.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gstreamer/gstreamer1.0-plugins-ugly_1.12.4.bb       | 13 -------------
 ...ins-ugly.inc => gstreamer1.0-plugins-ugly_1.14.0.bb} | 17 +++++++++++++----
 2 files changed, 13 insertions(+), 17 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.4.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly.inc => gstreamer1.0-plugins-ugly_1.14.0.bb} (59%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.4.bb
deleted file mode 100644
index f8333519e9..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.12.4.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require gstreamer1.0-plugins-ugly.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
-
-SRC_URI = " \
-    http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
-    file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
-"
-SRC_URI[md5sum] = "e2b836fb2747f6ae3a1a6f33a9d8c952"
-SRC_URI[sha256sum] = "1c165b8d888ed350acd8e6ac9f6fe06508e6fcc0a3afc6ccc9fbeb30df9be522"
-
-S = "${WORKDIR}/gst-plugins-ugly-${PV}"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.0.bb
similarity index 59%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.0.bb
index 60aa968c95..c8f778bff3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.14.0.bb
@@ -1,15 +1,27 @@
 require gstreamer1.0-plugins.inc
 
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+                    file://tests/check/elements/xingmux.c;beginline=1;endline=21;md5=4c771b8af188724855cb99cadd390068"
+
 LICENSE = "GPLv2+ & LGPLv2.1+ & LGPLv2+"
 LICENSE_FLAGS = "commercial"
 
+SRC_URI = " \
+            http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
+            file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
+            "
+SRC_URI[md5sum] = "bcb1f8d9339176aee2b5da2a9cb2df88"
+SRC_URI[sha256sum] = "3fb9ea5fc8a2de4b3eaec4128d71c6a2d81dd19befe1cd87cb833b98bcb542d1"
+
+S = "${WORKDIR}/gst-plugins-ugly-${PV}"
+
 DEPENDS += "gstreamer1.0-plugins-base libid3tag"
 
 inherit gettext
 
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
-    a52dec lame mpg123 mpeg2dec \
+    a52dec mpeg2dec \
 "
 
 PACKAGECONFIG[a52dec]   = "--enable-a52dec,--disable-a52dec,liba52"
@@ -17,14 +29,11 @@ PACKAGECONFIG[amrnb]    = "--enable-amrnb,--disable-amrnb,opencore-amr"
 PACKAGECONFIG[amrwb]    = "--enable-amrwb,--disable-amrwb,opencore-amr"
 PACKAGECONFIG[cdio]     = "--enable-cdio,--disable-cdio,libcdio"
 PACKAGECONFIG[dvdread]  = "--enable-dvdread,--disable-dvdread,libdvdread"
-PACKAGECONFIG[lame]     = "--enable-lame,--disable-lame,lame"
 PACKAGECONFIG[mpeg2dec] = "--enable-mpeg2dec,--disable-mpeg2dec,mpeg2dec"
-PACKAGECONFIG[mpg123]   = "--enable-mpg123,--disable-mpg123,mpg123"
 PACKAGECONFIG[x264]     = "--enable-x264,--disable-x264,x264"
 
 EXTRA_OECONF += " \
     --disable-sidplay \
-    --disable-twolame \
 "
 
 FILES_${PN}-amrnb += "${datadir}/gstreamer-1.0/presets/GstAmrnbEnc.prs"
-- 
2.14.1


