Return-Path: <liu.ming50@gmail.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 883F871C69
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 12:06:15 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id 73so27119078otj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 04:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UkTxv5ATuX/KMGDDbbVfTRNMAck78g+4odeF6ED9qZA=;
	b=F9IM9iYNAEzTeEF6CJaf/z4tBezkmcq2GJYKusorUgCPtmMPuMwFL4kJZHnITBv6Mx
	uLvMiiTHiI76970b+VMubDoIwBXKZg4nvbVW/D1fYEqhGEofFAo84oSRJksXy4izS9E7
	lVXn8DQz5lEIlPkkRb1/w23FoILoG1ywSd2OYgEfyNWwVRAIioYl57n1xPPr/vsZ96/I
	jElDW6kk47nzlPC185AfRBJTPUw68IGRXbTaHLhFeMP/7WrGXrtr7uqo9qFbn/mn4uDW
	uJU6mHlvNLeoLn6bKiQ3l7sGRR+fHd4MABusinxq1SE22JL8LAN4Xc0jGu06cLxzvL9M
	Pyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UkTxv5ATuX/KMGDDbbVfTRNMAck78g+4odeF6ED9qZA=;
	b=IEI6ogCCF3hSKLPLnZaWGVwtv7oKrOHyr6900XvjyG2+TyovOAmiyZgJchAPJbm+qN
	RP9HJSrrfbzH1I4edh7gJop3uTy9fdCB6uzBBn881nljUasVKOAsEj+FxNdBG53LDDRD
	yToPgtpUVT9g8K/QSfZ6fv8U3MHTkR+ul2EdujkkjnFD1HJhzhOAiMS3k69BBEA/ENUL
	XPNswnCwhA94vwHAfD9E4Gvfq7qqqGC/3BK+WtaxkxBW+Sfue5DHfJu+87/w4KLSD6rS
	5kgHNgBHGMZXj5/vP8sjAQZHYNWyY1tavtaoR94WfmComVIA0UOHJHrmiDozpjWAUOCl
	fetQ==
X-Gm-Message-State: AIkVDXJGfN+i1d4pdsvmVHbF2qEetkzcUTJ2zluA05oiCGfP03dh6OeKScia6ypn5Vu9vw==
X-Received: by 10.107.201.12 with SMTP id z12mr2302029iof.220.1485432376111;
	Thu, 26 Jan 2017 04:06:16 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.224.150]) by smtp.gmail.com with ESMTPSA id
	l74sm1300422ita.15.2017.01.26.04.06.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jan 2017 04:06:15 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 13:06:02 +0100
Message-Id: <1485432362-10280-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
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
X-List-Received-Date: Thu, 26 Jan 2017 12:06:23 -0000

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
 meta/lib/oe/package_manager.py             | 2 +-
 meta/lib/oe/rootfs.py                      | 6 +++---
 meta/lib/oeqa/core/utils/misc.py           | 2 +-
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb  | 2 +-
 9 files changed, 14 insertions(+), 14 deletions(-)

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
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index f92f2b3..2251041 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -2221,7 +2221,7 @@ class DpkgPM(OpkgDpkgPM):
 
     def remove_packaging_data(self):
         bb.utils.remove(os.path.join(self.target_rootfs,
-                                     self.d.getVar('opkglibdir')), True)
+                                     self.d.getVar('opkglibdir')))
         bb.utils.remove(self.target_rootfs + "/var/lib/dpkg/", True)
 
     def fix_broken_dependencies(self):
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 9c8a0eb..40728ec 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -400,7 +400,7 @@ class RpmRootfs(Rootfs):
             bb.utils.remove(self.image_rootfs, True)
         else:
             self.pm.recovery_packaging_data()
-        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
+        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'))
 
         self.pm.create_configs()
 
@@ -642,7 +642,7 @@ class DpkgRootfs(DpkgOpkgRootfs):
         ]
 
         bb.utils.remove(self.image_rootfs, True)
-        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
+        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'))
         self.manifest = DpkgManifest(d, manifest_dir)
         self.pm = DpkgPM(d, d.getVar('IMAGE_ROOTFS'),
                          d.getVar('PACKAGE_ARCHS'),
@@ -747,7 +747,7 @@ class OpkgRootfs(DpkgOpkgRootfs):
                              self.pkg_archs)
             self.pm.recover_packaging_data()
 
-        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
+        bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'))
 
     def _prelink_file(self, root_dir, filename):
         bb.note('prelink %s in %s' % (filename, root_dir))
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


