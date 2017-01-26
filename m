Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7B07871A72
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 13:26:57 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r126so50437023wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 05:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+RrldLAKNvtbpvIOM0hBC40qSkpzzYHlobUgxHtbCeg=;
	b=c+H2pxej+jECCeKfixTamoro0FFxGeX/t8UtBaKTbukTJBPsaA4Sb0UvBr4JAvs0uR
	q+QXjzUT1KU4n9LTJfEN1DyKEKO/bV2I/xZ23ECNwsd4u3DsU7R1F1GZI/Rw+GPFX06K
	UfFcL6VTEeKOibl9wlBHNRVDfShu3hJbq7PawRv/08MV8xISP14nMRe6KRJ1k3Fq9Bw/
	IQfDUF7+ZtqIbaW+mGarc37srMLilosZ5WDTUyD166Xn8QPY+1i6b1gfjmD8AuSfWQsP
	vGR8MgZBmnC+n25/cLXFDXiEMSodt/EKXpwDKrXvCxwC1SvkN/UhjjlWuzDv9I0hbBS0
	fWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+RrldLAKNvtbpvIOM0hBC40qSkpzzYHlobUgxHtbCeg=;
	b=ULBt+S97v/aKdAfAh3u8KpuPDW3A8wU76y81gVq8ti3xKS/Xx5iMJz3l1HcZahKBlI
	z1Gd3blDtCq2nnu66erxXWflqiJJ59CjYj06hAdX0Y1XQHORWb8h2oNxNO8ors7tlYBR
	Rq+Wr+ghRs6GDXpLUDObPJQ8f9v1szfEIXycXa0tVsBKfmWjGc6GCAofH+HunUugAOlF
	1ni2bnjgaYdKcmDSH/qRrGk7QqU+XgmSts2t5b35yw85waEq5z3W0Vc+2MoCYLRzKOCT
	knjroSUNM2uXYObffhog+O4UKlW4hFL6/v/cASk4conP/z1No144Fs2roX/N9DCSiHx4
	ydHQ==
X-Gm-Message-State: AIkVDXJb1ieL1KU7iSRtmnpp8l3h1bWPsSdrN2AKQBzd5M5rqgq0gcCUnXqGt8q2QX+xNA==
X-Received: by 10.28.109.218 with SMTP id b87mr2543333wmi.52.1485437217031;
	Thu, 26 Jan 2017 05:26:57 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.224.150])
	by smtp.gmail.com with ESMTPSA id 40sm2602769wry.22.2017.01.26.05.26.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jan 2017 05:26:56 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 14:26:44 +0100
Message-Id: <1485437204-9530-2-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1485437204-9530-1-git-send-email-liu.ming50@gmail.com>
References: <1485437204-9530-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] meta: remove remaining True option to getVar calls
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
X-List-Received-Date: Thu, 26 Jan 2017 13:26:57 -0000

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


