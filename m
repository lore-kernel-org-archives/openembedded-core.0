Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0609A75D41
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 12:28:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jul 2015 05:28:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,414,1432623600"; d="scan'208";a="741416740"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jul 2015 05:28:13 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 15:28:54 +0300
Message-Id: <a446be1baf28f8ba1d89f00c5b78e47a81a2ac11.1436184775.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1436184775.git.jussi.kukkonen@intel.com>
References: <cover.1436184775.git.jussi.kukkonen@intel.com>
Subject: [PATCH v4 1/7] intltool: Upgrade 0.50.2 -> 0.51.0
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
X-List-Received-Date: Mon, 06 Jul 2015 12:28:15 -0000

* Remove uclibc.patch as the whole localedir guessing code has been
  removed upstream.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../intltool/intltool-0.50.2/uclibc.patch             | 19 -------------------
 .../intltool-nowarn.patch                             |  0
 .../{intltool-0.50.2 => intltool}/noperlcheck.patch   |  0
 .../remove-xml-check.patch                            |  0
 .../use-nativeperl.patch                              |  0
 .../{intltool_0.50.2.bb => intltool_0.51.0.bb}        |  5 ++---
 6 files changed, 2 insertions(+), 22 deletions(-)
 delete mode 100644 meta/recipes-devtools/intltool/intltool-0.50.2/uclibc.patch
 rename meta/recipes-devtools/intltool/{intltool-0.50.2 => intltool}/intltool-nowarn.patch (100%)
 rename meta/recipes-devtools/intltool/{intltool-0.50.2 => intltool}/noperlcheck.patch (100%)
 rename meta/recipes-devtools/intltool/{intltool-0.50.2 => intltool}/remove-xml-check.patch (100%)
 rename meta/recipes-devtools/intltool/{intltool-0.50.2 => intltool}/use-nativeperl.patch (100%)
 rename meta/recipes-devtools/intltool/{intltool_0.50.2.bb => intltool_0.51.0.bb} (76%)

diff --git a/meta/recipes-devtools/intltool/intltool-0.50.2/uclibc.patch b/meta/recipes-devtools/intltool/intltool-0.50.2/uclibc.patch
deleted file mode 100644
index 145c181..0000000
--- a/meta/recipes-devtools/intltool/intltool-0.50.2/uclibc.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-on uclibc systems localedir should point to /usr/'share' as usual.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: intltool-0.50.2/intltool.m4
-===================================================================
---- intltool-0.50.2.orig/intltool.m4	2014-03-15 22:09:01.016627665 -0700
-+++ intltool-0.50.2/intltool.m4	2014-03-15 22:12:09.732631206 -0700
-@@ -173,6 +173,9 @@
-     AC_CHECK_FUNC(bind_textdomain_codeset,
-       [DATADIRNAME=share], [DATADIRNAME=lib])
-     ;;
-+    *-*-*uclibc*)
-+    [DATADIRNAME=share]
-+    ;;
-     *)
-     [DATADIRNAME=lib]
-     ;;
diff --git a/meta/recipes-devtools/intltool/intltool-0.50.2/intltool-nowarn.patch b/meta/recipes-devtools/intltool/intltool/intltool-nowarn.patch
similarity index 100%
rename from meta/recipes-devtools/intltool/intltool-0.50.2/intltool-nowarn.patch
rename to meta/recipes-devtools/intltool/intltool/intltool-nowarn.patch
diff --git a/meta/recipes-devtools/intltool/intltool-0.50.2/noperlcheck.patch b/meta/recipes-devtools/intltool/intltool/noperlcheck.patch
similarity index 100%
rename from meta/recipes-devtools/intltool/intltool-0.50.2/noperlcheck.patch
rename to meta/recipes-devtools/intltool/intltool/noperlcheck.patch
diff --git a/meta/recipes-devtools/intltool/intltool-0.50.2/remove-xml-check.patch b/meta/recipes-devtools/intltool/intltool/remove-xml-check.patch
similarity index 100%
rename from meta/recipes-devtools/intltool/intltool-0.50.2/remove-xml-check.patch
rename to meta/recipes-devtools/intltool/intltool/remove-xml-check.patch
diff --git a/meta/recipes-devtools/intltool/intltool-0.50.2/use-nativeperl.patch b/meta/recipes-devtools/intltool/intltool/use-nativeperl.patch
similarity index 100%
rename from meta/recipes-devtools/intltool/intltool-0.50.2/use-nativeperl.patch
rename to meta/recipes-devtools/intltool/intltool/use-nativeperl.patch
diff --git a/meta/recipes-devtools/intltool/intltool_0.50.2.bb b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
similarity index 76%
rename from meta/recipes-devtools/intltool/intltool_0.50.2.bb
rename to meta/recipes-devtools/intltool/intltool_0.51.0.bb
index 483239d..35293c6 100644
--- a/meta/recipes-devtools/intltool/intltool_0.50.2.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
@@ -3,7 +3,6 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI += "file://intltool-nowarn.patch \
-           file://uclibc.patch \
            ${NATIVEPATCHES} \
            "
 
@@ -15,5 +14,5 @@ NATIVEPATCHES = "file://noperlcheck.patch \
                  file://remove-xml-check.patch"
 NATIVEPATCHES_class-native = "file://use-nativeperl.patch" 
 
-SRC_URI[md5sum] = "23fbd879118253cb99aeac067da5f591"
-SRC_URI[sha256sum] = "67f25c5c6fb71d095793a7f895b245e65e829e8bde68c6c8b4c912144ff34406"
+SRC_URI[md5sum] = "12e517cac2b57a0121cda351570f1e63"
+SRC_URI[sha256sum] = "67c74d94196b153b774ab9f89b2fa6c6ba79352407037c8c14d5aeb334e959cd"
-- 
2.1.4


