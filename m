Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E23ED6C335
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 10:47:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wANAlmfa025710
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 02:47:48 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Fri, 23 Nov 2018 02:47:48 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2018 19:04:51 +0800
Message-ID: <e1d7cec8b84c7e3399cc651bce2909d0fe455c59.1542971027.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1542971027.git.liezhi.yang@windriver.com>
References: <cover.1542971027.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] classes: Remove tab indentations in python code
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
X-List-Received-Date: Fri, 23 Nov 2018 10:47:48 -0000
Content-Type: text/plain

Use 4 spaces to replace a tab.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/crosssdk.bbclass          |  4 ++--
 meta/classes/license.bbclass           |  2 +-
 meta/classes/linux-kernel-base.bbclass |  4 ++--
 meta/classes/siteconfig.bbclass        | 18 +++++++++---------
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index 03b0c60..fdaaac8 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -4,8 +4,8 @@ CLASSOVERRIDE = "class-crosssdk"
 MACHINEOVERRIDES = ""
 PACKAGE_ARCH = "${SDK_ARCH}"
 python () {
-	# set TUNE_PKGARCH to SDK_ARCH
-	d.setVar('TUNE_PKGARCH', d.getVar('SDK_ARCH'))
+    # set TUNE_PKGARCH to SDK_ARCH
+    d.setVar('TUNE_PKGARCH', d.getVar('SDK_ARCH'))
 }
 
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 0e5675c..ed91a4b 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -309,7 +309,7 @@ def incompatible_license(d, dont_want_licenses, package=None):
     except oe.license.LicenseError as exc:
         bb.fatal('%s: %s' % (d.getVar('P'), exc))
     return any(not oe.license.license_ok(canonical_license(d, l), \
-		dont_want_licenses) for l in licenses)
+               dont_want_licenses) for l in licenses)
 
 def check_license_flags(d):
     """
diff --git a/meta/classes/linux-kernel-base.bbclass b/meta/classes/linux-kernel-base.bbclass
index 89ce716..ba59222 100644
--- a/meta/classes/linux-kernel-base.bbclass
+++ b/meta/classes/linux-kernel-base.bbclass
@@ -34,8 +34,8 @@ def get_kernelversion_file(p):
         return None
 
 def linux_module_packages(s, d):
-	suffix = ""
-	return " ".join(map(lambda s: "kernel-module-%s%s" % (s.lower().replace('_', '-').replace('@', '+'), suffix), s.split()))
+    suffix = ""
+    return " ".join(map(lambda s: "kernel-module-%s%s" % (s.lower().replace('_', '-').replace('@', '+'), suffix), s.split()))
 
 # that's all
 
diff --git a/meta/classes/siteconfig.bbclass b/meta/classes/siteconfig.bbclass
index bb491d2..0cfa5a6 100644
--- a/meta/classes/siteconfig.bbclass
+++ b/meta/classes/siteconfig.bbclass
@@ -1,13 +1,13 @@
 python siteconfig_do_siteconfig () {
-	shared_state = sstate_state_fromvars(d)
-	if shared_state['task'] != 'populate_sysroot':
-		return
-	if not os.path.isdir(os.path.join(d.getVar('FILE_DIRNAME'), 'site_config')):
-		bb.debug(1, "No site_config directory, skipping do_siteconfig")
-		return
-	sstate_install(shared_state, d)
-	bb.build.exec_func('do_siteconfig_gencache', d)
-	sstate_clean(shared_state, d)
+    shared_state = sstate_state_fromvars(d)
+    if shared_state['task'] != 'populate_sysroot':
+        return
+    if not os.path.isdir(os.path.join(d.getVar('FILE_DIRNAME'), 'site_config')):
+        bb.debug(1, "No site_config directory, skipping do_siteconfig")
+        return
+    sstate_install(shared_state, d)
+    bb.build.exec_func('do_siteconfig_gencache', d)
+    sstate_clean(shared_state, d)
 }
 
 EXTRASITECONFIG ?= ""
-- 
2.7.4


