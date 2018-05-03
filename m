Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EB4F1745F3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 08:18:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 May 2018 01:18:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,357,1520924400"; d="scan'208";a="55612697"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.22.40])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2018 01:18:03 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2018 16:17:47 +0800
Message-Id: <20180503081758.4661-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH 01/12] gstreamer1.0: upgrade 1.12.4 -> 1.14.0
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
X-List-Received-Date: Thu, 03 May 2018 08:18:04 -0000

* For changes, please see: https://gstreamer.freedesktop.org/releases/1.14/
* Merge inc and bb file since we only have one version now.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb   | 14 --------------
 .../gstreamer/{gstreamer1.0.inc => gstreamer1.0_1.14.0.bb} | 12 +++++++++++-
 2 files changed, 11 insertions(+), 15 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0.inc => gstreamer1.0_1.14.0.bb} (84%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
deleted file mode 100644
index 01b2396513..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require gstreamer1.0.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
-                    file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
-
-SRC_URI = " \
-    http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
-"
-SRC_URI[md5sum] = "9d268f2e891cce1ac0832f1cc467d4ea"
-SRC_URI[sha256sum] = "5a8704aa4c2eeb04da192c4a9942f94f860ac1a585de90d9f914bac26a970674"
-
-S = "${WORKDIR}/gstreamer-${PV}"
-
-CVE_PRODUCT = "gstreamer"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
similarity index 84%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
index c2df1f3258..b4398c8111 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
@@ -14,11 +14,19 @@ inherit autotools pkgconfig gettext upstream-version-is-even gobject-introspecti
 # (it has a custom INTROSPECTION_INIT macro, and so must be used instead of our common introspection.m4 file)
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
-SRC_URI_append = " \
+LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
+                    file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
+
+S = "${WORKDIR}/gstreamer-${PV}"
+
+SRC_URI = " \
+    http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
     file://gtk-doc-tweaks.patch \
     file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
 "
+SRC_URI[md5sum] = "63c7cbfb86aa28c4522e374dc5555b96"
+SRC_URI[sha256sum] = "fc361367f0d4b780a868a8833f9f30b9c9f4ac9faea4e6b251db8b4b0398466e"
 
 PACKAGECONFIG ??= ""
 
@@ -59,3 +67,5 @@ do_configure[prefuncs] += "delete_pkg_m4_file"
 do_compile_prepend() {
         export GIR_EXTRA_LIBS_PATH="${B}/gst/.libs:${B}/libs/gst/base/.libs"
 }
+
+CVE_PRODUCT = "gstreamer"
-- 
2.14.1


