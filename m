Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C419076894
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 14:22:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 10 Aug 2015 07:22:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,645,1432623600"; d="scan'208";a="745684048"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 10 Aug 2015 07:22:23 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Aug 2015 17:23:21 +0300
Message-Id: <71a4d140d3c37cea4ad1c004fb53a9a1ceb58d57.1439216269.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
References: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
References: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/8] apt: update to 1.0.10.1
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
X-List-Received-Date: Mon, 10 Aug 2015 14:22:24 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/apt/apt-native_1.0.10.1.bb                 | 4 ++++
 meta/recipes-devtools/apt/apt-native_1.0.9.9.bb                  | 9 ---------
 meta/recipes-devtools/apt/apt.inc                                | 5 ++++-
 ...01-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch | 0
 .../{apt-1.0.9.9 => apt}/0001-fix-the-gcc-version-check.patch    | 0
 .../0001-remove-Wsuggest-attribute-from-CFLAGS.patch             | 0
 .../apt/{apt-1.0.9.9 => apt}/disable-configure-in-makefile.patch | 0
 .../recipes-devtools/apt/{apt-1.0.9.9 => apt}/disable-test.patch | 0
 .../apt/{apt-1.0.9.9 => apt}/fix-gcc-4.6-null-not-defined.patch  | 0
 meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/makerace.patch    | 0
 meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/no-nls-dpkg.patch | 0
 meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/noconfigure.patch | 0
 meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/nodoc.patch       | 0
 .../apt/{apt-1.0.9.9 => apt}/truncate-filename.patch             | 0
 meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/use-host.patch    | 0
 meta/recipes-devtools/apt/{apt_1.0.9.9.bb => apt_1.0.10.1.bb}    | 4 ----
 16 files changed, 8 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-devtools/apt/apt-native_1.0.10.1.bb
 delete mode 100644 meta/recipes-devtools/apt/apt-native_1.0.9.9.bb
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/0001-fix-the-gcc-version-check.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/0001-remove-Wsuggest-attribute-from-CFLAGS.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/disable-configure-in-makefile.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/disable-test.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/fix-gcc-4.6-null-not-defined.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/makerace.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/no-nls-dpkg.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/noconfigure.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/nodoc.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/truncate-filename.patch (100%)
 rename meta/recipes-devtools/apt/{apt-1.0.9.9 => apt}/use-host.patch (100%)
 rename meta/recipes-devtools/apt/{apt_1.0.9.9.bb => apt_1.0.10.1.bb} (70%)

diff --git a/meta/recipes-devtools/apt/apt-native_1.0.10.1.bb b/meta/recipes-devtools/apt/apt-native_1.0.10.1.bb
new file mode 100644
index 0000000..1e660da
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt-native_1.0.10.1.bb
@@ -0,0 +1,4 @@
+require apt-native.inc
+
+SRC_URI += "file://noconfigure.patch \
+            file://no-curl.patch"
diff --git a/meta/recipes-devtools/apt/apt-native_1.0.9.9.bb b/meta/recipes-devtools/apt/apt-native_1.0.9.9.bb
deleted file mode 100644
index cbaf25b..0000000
--- a/meta/recipes-devtools/apt/apt-native_1.0.9.9.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require apt-native.inc
-
-SRC_URI += "file://noconfigure.patch \
-            file://no-curl.patch"
-
-SRC_URI[md5sum] = "e70c6d6227883cfc0dda6bc5db509bca"
-SRC_URI[sha256sum] = "96bebcd7bfee0b2386741a8315182ba39487bdd743ecf5c1fc5b8b889cca2478"
-
-LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 94bd6e9..3248b9a 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -2,7 +2,7 @@ SUMMARY = "Advanced front-end for dpkg"
 LICENSE = "GPLv2.0+"
 SECTION = "base"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20150428T221633Z/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20150805T094928Z/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz \
            file://use-host.patch \
            file://makerace.patch \
            file://no-nls-dpkg.patch \
@@ -12,6 +12,9 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20150428T221633Z/pool/main/
            file://disable-configure-in-makefile.patch \
            file://disable-test.patch \
            "
+SRC_URI[md5sum] = "6505c4297b338adb2087ce87bbc4a276"
+SRC_URI[sha256sum] = "3fb1de9598363c416591d49e3c285458e095b035e6c06d5b944a54e15fc9b543"
+LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools gettext
 
diff --git a/meta/recipes-devtools/apt/apt-1.0.9.9/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-1.0.9.9/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
rename to meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
diff --git a/meta/recipes-devtools/apt/apt-1.0.9.9/0001-fix-the-gcc-version-check.patch b/meta/recipes-devtools/apt/apt/0001-fix-the-gcc-version-check.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-1.0.9.9/0001-fix-the-gcc-version-check.patch
rename to meta/recipes-devtools/apt/apt/0001-fix-the-gcc-version-check.patch
diff --git a/meta/recipes-devtools/apt/apt-1.0.9.9/0001-remove-Wsuggest-attribute-from-CFLAGS.patch b/meta/recipes-devtools/apt/apt/0001-remove-Wsuggest-attribute-from-CFLAGS.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-1.0.9.9/0001-remove-Wsuggest-attribute-from-CFLAGS.patch
rename to meta/recipes-devtools/apt/apt/0001-remove-Wsuggest-attribute-from-CFLAGS.patch
diff --git a/meta/recipes-devtools/apt/apt-1.0.9.9/disable-configure-in-makefile.patch b/meta/recipes-devtools/apt/apt/disable-configure-in-makefile.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-1.0.9.9/disable-configure-in-makefile.patch
rename to meta/recipes-devtools/apt/apt/disable-configure-in-makefile.patch
diff --git a/meta/recipes-devtools/apt/apt-1.0.9.9/disable-test.patch b/meta/recipes-devtools/apt/apt/disable-test.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-1.0.9.9/disable-test.patch
rename to meta/recipes-devtools/apt/apt/disable-test.patch
diff --git a/meta/recipes-devtools/apt/apt-1.0.9.9/fix-gcc-4.6-null-not-defined.patch b/meta/recipes-devtools/apt/apt/fix-gcc-4.6-null-not-defined.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-1.0.9.9/fix-gcc-4.6-null-not-defined.patch
rename to meta/recipes-devtools/apt/apt/fix-gcc-4.6-null-not-defined.patch
diff --git a/meta/recipes-devtools/apt/apt-1.0.9.9/makerace.patch b/meta/recipes-devtools/apt/apt/makerace.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-1.0.9.9/makerace.patch
rename to meta/recipes-devtools/apt/apt/makerace.patch
diff --git a/meta/recipes-devtools/apt/apt-1.0.9.9/no-nls-dpkg.patch b/meta/recipes-devtools/apt/apt/no-nls-dpkg.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-1.0.9.9/no-nls-dpkg.patch
rename to meta/recipes-devtools/apt/apt/no-nls-dpkg.patch
diff --git a/meta/recipes-devtools/apt/apt-1.0.9.9/noconfigure.patch b/meta/recipes-devtools/apt/apt/noconfigure.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-1.0.9.9/noconfigure.patch
rename to meta/recipes-devtools/apt/apt/noconfigure.patch
diff --git a/meta/recipes-devtools/apt/apt-1.0.9.9/nodoc.patch b/meta/recipes-devtools/apt/apt/nodoc.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-1.0.9.9/nodoc.patch
rename to meta/recipes-devtools/apt/apt/nodoc.patch
diff --git a/meta/recipes-devtools/apt/apt-1.0.9.9/truncate-filename.patch b/meta/recipes-devtools/apt/apt/truncate-filename.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-1.0.9.9/truncate-filename.patch
rename to meta/recipes-devtools/apt/apt/truncate-filename.patch
diff --git a/meta/recipes-devtools/apt/apt-1.0.9.9/use-host.patch b/meta/recipes-devtools/apt/apt/use-host.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-1.0.9.9/use-host.patch
rename to meta/recipes-devtools/apt/apt/use-host.patch
diff --git a/meta/recipes-devtools/apt/apt_1.0.9.9.bb b/meta/recipes-devtools/apt/apt_1.0.10.1.bb
similarity index 70%
rename from meta/recipes-devtools/apt/apt_1.0.9.9.bb
rename to meta/recipes-devtools/apt/apt_1.0.10.1.bb
index 4c40d0d..bf77e2a 100644
--- a/meta/recipes-devtools/apt/apt_1.0.9.9.bb
+++ b/meta/recipes-devtools/apt/apt_1.0.10.1.bb
@@ -1,11 +1,7 @@
 DEPENDS = "curl db"
 RDEPENDS_${PN} = "dpkg bash debianutils"
-LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 require apt.inc
 
-SRC_URI[md5sum] = "e70c6d6227883cfc0dda6bc5db509bca"
-SRC_URI[sha256sum] = "96bebcd7bfee0b2386741a8315182ba39487bdd743ecf5c1fc5b8b889cca2478"
-
 require apt-package.inc
 
 PACKAGECONFIG ??= "lzma"
-- 
2.1.4


