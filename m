Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E53F860234
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 05:09:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Oct 2018 22:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,338,1534834800"; d="scan'208";a="97283816"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.255])
	by orsmga002.jf.intel.com with ESMTP; 03 Oct 2018 22:09:23 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2018 13:09:17 +0800
Message-Id: <20181004050917.16006-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181004050917.16006-1-anuj.mittal@intel.com>
References: <20181004050917.16006-1-anuj.mittal@intel.com>
Subject: [PATCH 2/2] python: consolidate common patches
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
X-List-Received-Date: Thu, 04 Oct 2018 05:09:23 -0000

Move inclusion of common patches to .inc to simplify things a bit.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/python/python-native_2.7.15.bb | 3 ---
 meta/recipes-devtools/python/python.inc              | 3 +++
 meta/recipes-devtools/python/python_2.7.15.bb        | 3 ---
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python-native_2.7.15.bb b/meta/recipes-devtools/python/python-native_2.7.15.bb
index 7c491fa3e0..ee2ec1082a 100644
--- a/meta/recipes-devtools/python/python-native_2.7.15.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.15.bb
@@ -11,10 +11,7 @@ SRC_URI += "\
             file://debug.patch \
             file://unixccompiler.patch \
             file://nohostlibs.patch \
-            file://multilib.patch \
-            file://add-md5module-support.patch \
             file://builddir.patch \
-            file://parallel-makeinst-create-bindir.patch \
             file://revert_use_of_sysconfigdata.patch \
            "
 
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 66923678b1..38cc79cb41 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -13,6 +13,9 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0003-bpo-34834-Fix-test_ssl.test_options-to-account-for-O.patch \
            file://0004-bpo-34836-fix-test_default_ecdh_curve-needs-no-tlsv1.patch \
            file://0001-bpo-33354-Fix-test_ssl-when-a-filename-cannot-be-enc.patch \
+           file://multilib.patch \
+           file://add-md5module-support.patch \
+           file://parallel-makeinst-create-bindir.patch \
            "
 
 SRC_URI[md5sum] = "a80ae3cc478460b922242f43a1b4094d"
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index 472c1da4bf..8bc0f273ec 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -12,10 +12,8 @@ SRC_URI += "\
   file://03-fix-tkinter-detection.patch \
   file://06-avoid_usr_lib_termcap_path_in_linking.patch \
   ${DISTRO_SRC_URI} \
-  file://multilib.patch \
   file://cgi_py.patch \
   file://setup_py_skip_cross_import_check.patch \
-  file://add-md5module-support.patch \
   file://host_include_contamination.patch \
   file://fix_for_using_different_libdir.patch \
   file://setuptweaks.patch \
@@ -26,7 +24,6 @@ SRC_URI += "\
   file://python-2.7.3-remove-bsdb-rpath.patch \
   file://fix-makefile-for-ptest.patch \
   file://run-ptest \
-  file://parallel-makeinst-create-bindir.patch \
   file://use_sysroot_ncurses_instead_of_host.patch \
   file://add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
   file://pass-missing-libraries-to-Extension-for-mul.patch \
-- 
2.17.1


