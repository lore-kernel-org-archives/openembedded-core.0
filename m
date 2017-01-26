Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 26F8D71D42
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 13:02:36 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r144so50340692wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 05:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+RrldLAKNvtbpvIOM0hBC40qSkpzzYHlobUgxHtbCeg=;
	b=QCkGB+xzkAMKKCE+DN480VN/mhlZVApFWizV2DNAukrcr+0YJyjj57+IJt3qXGH/Sp
	PmIumjrHMi0PNLMqwxZkAYxpxQIliRGB85hnhPWiSsau5MHOChH7sXKpKAgnooqi9nly
	siQyxXgMSRlNUHd94a3xrNoHZW6WrjN/IdEQoHjICQ0zPTOh9uWSFwy7ONYTTkZ4bZie
	fWGF1NWwnYXOWiLNJd6PPjTKu3/agX9pToHCbE7iKNHrLqow6qFLj//2czY90IGrK06t
	1pkectHyTPWo965dKFeQGCPP95vdkUti45tNNzZVUak6/ZVBmAg9OLDdIZCdU6EIpmDF
	ad4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+RrldLAKNvtbpvIOM0hBC40qSkpzzYHlobUgxHtbCeg=;
	b=oqWFGwpLcSbIOXz9UKwUn7uFyCBBdBtXepP5K3G/cKfCDaLnGoGClHJzvRx0/5t1xd
	QMXMLVj4/fUYvOSjDwI5W/eFO/gTpovTRBvpNMpn5tOMsZKPN/2fs3fXnzYSpyQ65Nve
	QOgc2ZQKRAAyFtdwl8xoy6mQA0fbN09sbhw4oAHfJZC7nStuXMVwpZ+V0nOsF/guQBGz
	p/fTO38UQEp3r0WYx5JNrLJbZBbPPKmpo9d1B8KrVhCwIdRL3OtU3fIAhfBPftS5vpFI
	Zl87q8oGNg9dERwiBbqpGT4B1TAmImvEuZKv1Rk+IG0N+qi+R/7uwSYIN6evhiA1mXxN
	T0yQ==
X-Gm-Message-State: AIkVDXKfp/p2Ihh6hv6QjscIX3dMTuu7GUsdZtQboQE0OuXjCsORLYuTxpYrwAx1wAUVSQ==
X-Received: by 10.28.131.72 with SMTP id f69mr2815016wmd.140.1485435756951;
	Thu, 26 Jan 2017 05:02:36 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.224.150])
	by smtp.gmail.com with ESMTPSA id o2sm2452033wra.42.2017.01.26.05.02.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jan 2017 05:02:35 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 14:01:58 +0100
Message-Id: <1485435718-787-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: =?UTF-8?B?W1BBVENI44CAVjJdIG1ldGE6IHJlbW92ZSByZW1haW5pbmcgVHJ1ZSBvcHRpb24gdG8gZ2V0VmFyIGNhbGxz?=
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
X-List-Received-Date: Thu, 26 Jan 2017 13:02:38 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Ming Liu <peter.x.liu@external.atlascopco.com>

This is a complementary fix to commit 7c552996:
[ meta: remove True option to getVar calls ]

it intended to remove all True option to getVar calls, but there are
still some remaining.

Search made with the following regex: getVar ?\((.*), True\)

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/kernel-module-split.bbclass   | 4 ++--
 meta/classes/packagefeed-stability.bbclass | 2 +-
 meta/classes/populate_sdk_base.bbclass     | 2 +-
 meta/classes/rootfs-postcommands.bbclass   | 4 ++--
 meta/classes/testsdk.bbclass               | 4 ++--
 meta/lib/oeqa/core/utils/misc.py           | 2 +-
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb  | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 49cd8e9..db332e5 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -123,7 +123,7 @@ python split_kernel_module_packages () {
         d.setVarFlag('RRECOMMENDS_' + pkg, 'nodeprrecs', 1)
 
         # Provide virtual package without postfix
-        providevirt = d.getVar('KERNEL_MODULE_PROVIDE_VIRTUAL', True)
+        providevirt = d.getVar('KERNEL_MODULE_PROVIDE_VIRTUAL')
         if providevirt == "1":
            postfix = format.split('%s')[1]
            d.setVar('RPROVIDES_' + pkg, pkg.replace(postfix, ''))
@@ -131,7 +131,7 @@ python split_kernel_module_packages () {
     module_regex = '^(.*)\.k?o$'
 
     module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
-    module_pattern = module_pattern_prefix + 'kernel-module-%s-' + d.getVar("KERNEL_VERSION", True)
+    module_pattern = module_pattern_prefix + 'kernel-module-%s-' + d.getVar("KERNEL_VERSION")
 
     postinst = d.getVar('pkg_postinst_modules')
     postrm = d.getVar('pkg_postrm_modules')
diff --git a/meta/classes/packagefeed-stability.bbclass b/meta/classes/packagefeed-stability.bbclass
index 04d2ef4..c0e9be5 100644
--- a/meta/classes/packagefeed-stability.bbclass
+++ b/meta/classes/packagefeed-stability.bbclass
@@ -232,7 +232,7 @@ python pfs_cleanpkgs () {
     for pkgclass in (d.getVar('PACKAGE_CLASSES') or '').split():
         if pkgclass.startswith('package_'):
             pkgtype = pkgclass.split('_', 1)[1]
-            deploydir = d.getVar('DEPLOY_DIR_%s' % pkgtype.upper(), True)
+            deploydir = d.getVar('DEPLOY_DIR_%s' % pkgtype.upper())
             prepath = deploydir + '-prediff'
             pcmanifest = os.path.join(prepath, d.expand('pkg-compare-manifest-${MULTIMACH_TARGET_SYS}-${PN}'))
             try:
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 2246eb3..22b577e 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -72,7 +72,7 @@ python write_target_sdk_manifest () {
 
 python write_sdk_test_data() {
     from oe.data import export2json
-    testdata = "%s/%s.testdata.json" % (d.getVar('SDKDEPLOYDIR', True), d.getVar('TOOLCHAIN_OUTPUTNAME', True))
+    testdata = "%s/%s.testdata.json" % (d.getVar('SDKDEPLOYDIR'), d.getVar('TOOLCHAIN_OUTPUTNAME'))
     bb.utils.mkdirhier(os.path.dirname(testdata))
     export2json(d, testdata)
 }
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index c8f18c6..65ab3ed 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -308,8 +308,8 @@ rootfs_sysroot_relativelinks () {
 python write_image_test_data() {
     from oe.data import export2json
 
-    testdata = "%s/%s.testdata.json" % (d.getVar('DEPLOY_DIR_IMAGE', True), d.getVar('IMAGE_NAME', True))
-    testdata_link = "%s/%s.testdata.json" % (d.getVar('DEPLOY_DIR_IMAGE', True), d.getVar('IMAGE_LINK_NAME', True))
+    testdata = "%s/%s.testdata.json" % (d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('IMAGE_NAME'))
+    testdata_link = "%s/%s.testdata.json" % (d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('IMAGE_LINK_NAME'))
 
     bb.utils.mkdirhier(os.path.dirname(testdata))
     export2json(d, testdata)
diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 69689a1..75b4027 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -27,7 +27,7 @@ def testsdk_main(d):
     from oeqa.sdk.context import OESDKTestContext, OESDKTestContextExecutor
     from oeqa.utils import make_logger_bitbake_compatible
 
-    pn = d.getVar("PN", True)
+    pn = d.getVar("PN")
     logger = make_logger_bitbake_compatible(logging.getLogger("BitBake"))
 
     # sdk use network for download projects for build
@@ -103,7 +103,7 @@ def testsdkext_main(d):
     from oeqa.utils import avoid_paths_in_environ, make_logger_bitbake_compatible
     from oeqa.sdkext.context import OESDKExtTestContext, OESDKExtTestContextExecutor
 
-    pn = d.getVar("PN", True)
+    pn = d.getVar("PN")
     logger = make_logger_bitbake_compatible(logging.getLogger("BitBake"))
 
     # extensible sdk use network
diff --git a/meta/lib/oeqa/core/utils/misc.py b/meta/lib/oeqa/core/utils/misc.py
index 6ae58ad..6779b36 100644
--- a/meta/lib/oeqa/core/utils/misc.py
+++ b/meta/lib/oeqa/core/utils/misc.py
@@ -32,6 +32,6 @@ def dataStoteToDict(d, variables):
     data = {}
 
     for v in variables:
-        data[v] = d.getVar(v, True)
+        data[v] = d.getVar(v)
 
     return data
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
index f95029a..9edd539 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
@@ -57,7 +57,7 @@ BBCLASSEXTEND = "native"
 TUNE_CCARGS_remove = "-mfpmath=sse"
 
 python () {
-    ccargs = d.getVar('TUNE_CCARGS', True).split()
+    ccargs = d.getVar('TUNE_CCARGS').split()
     if '-mx32' in ccargs:
         # use x86_64 EFI ABI
         ccargs.remove('-mx32')
-- 
1.9.1


