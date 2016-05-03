Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E238473174
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 14:49:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 03 May 2016 07:50:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,572,1455004800"; d="scan'208";a="797794659"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 03 May 2016 07:49:59 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 57C586A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 08:37:34 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 May 2016 17:49:47 +0300
Message-Id: <1462286989-22848-9-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
References: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 08/10] harfbuzz: upgrade to 1.2.6
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
X-List-Received-Date: Tue, 03 May 2016 14:50:01 -0000

1.2.3 -> 1.2.6

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_1.2.3.bb | 39 ------------------------
 meta/recipes-graphics/harfbuzz/harfbuzz_1.2.6.bb | 39 ++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz_1.2.3.bb
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz_1.2.6.bb

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.3.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.3.bb
deleted file mode 100644
index cfe885f..0000000
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.3.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "Text shaping library"
-DESCRIPTION = "HarfBuzz is an OpenType text shaping engine."
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/HarfBuzz"
-BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=HarfBuzz"
-SECTION = "libs"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
-                    file://src/hb-ucdn/COPYING;md5=994ba0f1295f15b4bda4999a5bbeddef \
-"
-
-DEPENDS = "glib-2.0 cairo fontconfig freetype"
-
-SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
-
-SRC_URI[md5sum] = "da8d97e262e6ef8288e1ae76369421bd"
-SRC_URI[sha256sum] = "8216d2404aaab7fde87be0365a90d64aa6c55928e104557cfcb37b54a096cb8c"
-
-inherit autotools pkgconfig lib_package
-
-PACKAGECONFIG ??= "icu"
-PACKAGECONFIG[icu] = "--with-icu,--without-icu,icu"
-
-EXTRA_OECONF = " \
-    --with-cairo \
-    --with-fontconfig \
-    --with-freetype \
-    --with-glib \
-    --without-graphite2 \
-"
-
-PACKAGES =+ "${PN}-icu ${PN}-icu-dev"
-
-FILES_${PN}-icu = "${libdir}/libharfbuzz-icu.so.*"
-FILES_${PN}-icu-dev = "${libdir}/libharfbuzz-icu.la \
-                       ${libdir}/libharfbuzz-icu.so \
-                       ${libdir}/pkgconfig/harfbuzz-icu.pc \
-"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.6.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.6.bb
new file mode 100644
index 0000000..e80b194
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.2.6.bb
@@ -0,0 +1,39 @@
+SUMMARY = "Text shaping library"
+DESCRIPTION = "HarfBuzz is an OpenType text shaping engine."
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/HarfBuzz"
+BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=HarfBuzz"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
+                    file://src/hb-ucdn/COPYING;md5=994ba0f1295f15b4bda4999a5bbeddef \
+"
+
+DEPENDS = "glib-2.0 cairo fontconfig freetype"
+
+SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
+
+SRC_URI[md5sum] = "9f4b6831c86135faef011e991f59f77f"
+SRC_URI[sha256sum] = "7537bacccb3524df0cd2a4d5bc7e168bcc10e8171e0324f3cd522583868192c1"
+
+inherit autotools pkgconfig lib_package
+
+PACKAGECONFIG ??= "icu"
+PACKAGECONFIG[icu] = "--with-icu,--without-icu,icu"
+
+EXTRA_OECONF = " \
+    --with-cairo \
+    --with-fontconfig \
+    --with-freetype \
+    --with-glib \
+    --without-graphite2 \
+"
+
+PACKAGES =+ "${PN}-icu ${PN}-icu-dev"
+
+FILES_${PN}-icu = "${libdir}/libharfbuzz-icu.so.*"
+FILES_${PN}-icu-dev = "${libdir}/libharfbuzz-icu.la \
+                       ${libdir}/libharfbuzz-icu.so \
+                       ${libdir}/pkgconfig/harfbuzz-icu.pc \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.4.0


