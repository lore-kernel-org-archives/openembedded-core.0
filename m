Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 860B671CBD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Sep 2017 04:04:04 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id e64so4394698wmi.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Sep 2017 21:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dCkAD0oiFy9CDrmmCRcbbh9RMzyTYTbC+c1Gh5Ft7VQ=;
	b=NYKWz9Ai1lLhb4P2S5y3x11Gy0g4j3HDd/bWQf/W4xcgI+0wkxV67iMTnLeWEC3f6C
	vBso/p+nCFgdV2wc40QBYbAQziunv+T4HvxdM8RXpSEVLskZbte4SvWM2KFn/i+zpfpP
	KIplKROqMRmA+hRFdb3SyJEP11RbeRyG9GRHJQ+Hzyd784dXDMt2ge5PFc9ILIiP84SW
	pqb/cL/H68fb9wYkyjCjiSswWXkKCvB6ImQt7N/el0NSlmqhOw/YqT3KccvkbpfP2fEY
	JpLnYeCTdHF1LSC1PYqB9zFMLGJmWvzUzsFJz4/JHZNbiL24ep1mXcywx7iOjVL9hmUf
	BsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dCkAD0oiFy9CDrmmCRcbbh9RMzyTYTbC+c1Gh5Ft7VQ=;
	b=kYSv3LwZJB575pHNfQmpQKykF30OEXyYXF16dh9lBVNNyay+CpLEHPgrvwwrnJODHn
	ZxVU6VVoabVI20SsmP1jz7p5T6J/ZmnHuq8S86Vuo36rGzWpQE1CR5gLvn4siWnXpB1K
	1Ir1eb0IhbPXZ4apAQYiToaMZ8qCIK6UoaLcKGBHEbRErpnRx6Zzl1c3KmUTb5XIpjgU
	7ObreQsk/nhALKPvQfRkqKOvlKGlyMKohrc1ZuUY+kjHMBellGatGld3pUKlPT3ovqW3
	NTKpSRbtuE38T96zKOtsOMd4PAwiQMNDh5C42UHVv42bL/I8wnSU2k5znicTLwzv83/T
	fHOg==
X-Gm-Message-State: AHPjjUj/ri0R5+nuvLYgJIYl9EwSV+d3SUFQPCmcWrJE22j9P4HE6nF4
	tsrmQW09rrPnYCOo+YQkp5ULrQ==
X-Google-Smtp-Source: AOwi7QDTgiZs+fthQSWR075i+jAImZx+dIzuN3xlWJ3UleUbqoLLmy6fS/VmBxO2CcNikW8SnKBLZw==
X-Received: by 10.80.136.21 with SMTP id b21mr10486206edb.83.1506225844655;
	Sat, 23 Sep 2017 21:04:04 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58])
	by smtp.gmail.com with ESMTPSA id c5sm1857197edd.43.2017.09.23.21.04.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Sep 2017 21:04:04 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Sep 2017 06:03:49 +0200
Message-Id: <1506225829-14257-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] meta: drop True option to getVar calls
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
X-List-Received-Date: Sun, 24 Sep 2017 04:04:04 -0000

From: Ming Liu <liu.ming50@gmail.com>

Search made with the following regex: getVar ?\((.*), True\).

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/buildhistory.bbclass                  |  2 +-
 meta/classes/rootfs-postcommands.bbclass           |  2 +-
 meta/classes/staging.bbclass                       | 14 +++++++-------
 meta/conf/bitbake.conf                             |  2 +-
 meta/lib/oe/package_manager.py                     |  2 +-
 meta/recipes-devtools/go/go-cross.inc              |  2 +-
 meta/recipes-devtools/go/go-crosssdk.inc           |  2 +-
 meta/recipes-devtools/go/go-native.inc             |  2 +-
 meta/recipes-devtools/go/go-target.inc             |  2 +-
 meta/recipes-devtools/llvm/llvm_git.bb             |  4 ++--
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb |  2 +-
 11 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index dbfcc05..7a5534e 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -192,7 +192,7 @@ python buildhistory_emit_pkghistory() {
     pe = d.getVar('PE') or "0"
     pv = d.getVar('PV')
     pr = d.getVar('PR')
-    layer = bb.utils.get_file_layer(d.getVar('FILE', True), d)
+    layer = bb.utils.get_file_layer(d.getVar('FILE'), d)
 
     pkgdata_dir = d.getVar('PKGDATA_DIR')
     packages = ""
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index f6d31a0..997de1d 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -317,5 +317,5 @@ python rootfs_log_check_recommends() {
                 continue
 
             if 'unsatisfied recommendation for' in line:
-                bb.warn('[log_check] %s: %s' % (d.getVar('PN', True), line))
+                bb.warn('[log_check] %s: %s' % (d.getVar('PN'), line))
 }
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 6185aef..05ea4df 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -68,16 +68,16 @@ sysroot_stage_all() {
 }
 
 python sysroot_strip () {
-    inhibit_sysroot = d.getVar('INHIBIT_SYSROOT_STRIP', True)
+    inhibit_sysroot = d.getVar('INHIBIT_SYSROOT_STRIP')
     if inhibit_sysroot and oe.types.boolean(inhibit_sysroot):
         return 0
 
-    dstdir = d.getVar('SYSROOT_DESTDIR', True)
-    pn = d.getVar('PN', True)
-    libdir = os.path.abspath(dstdir + os.sep + d.getVar("libdir", True))
-    base_libdir = os.path.abspath(dstdir + os.sep + d.getVar("base_libdir", True))
-    qa_already_stripped = 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn, True) or "").split()
-    strip_cmd = d.getVar("STRIP", True)
+    dstdir = d.getVar('SYSROOT_DESTDIR')
+    pn = d.getVar('PN')
+    libdir = os.path.abspath(dstdir + os.sep + d.getVar("libdir"))
+    base_libdir = os.path.abspath(dstdir + os.sep + d.getVar("base_libdir"))
+    qa_already_stripped = 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn) or "").split()
+    strip_cmd = d.getVar("STRIP")
 
     oe.package.strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir,
                            qa_already_stripped=qa_already_stripped)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 4ff1e96..f41680b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -337,7 +337,7 @@ FILESEXTRAPATHS ?= "__default:"
 #  datadir, sysconfdir, servicedir, sharedstatedir, localstatedir, infodir,
 #  mandir, docdir, bindir, sbindir, libexecdir, libdir, includedir and
 #  oldincludedir
-FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR', True)) else 'files/fs-perms-persistent-log.txt'}"
+FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 'files/fs-perms-persistent-log.txt'}"
 
 ##################################################################
 # General work and output directories for the build system.
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 994e462..658c964 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1151,7 +1151,7 @@ class OpkgPM(OpkgDpkgPM):
 
         # Create an temp dir as opkg root for dummy installation
         temp_rootfs = self.d.expand('${T}/opkg')
-        opkg_lib_dir = self.d.getVar('OPKGLIBDIR', True)
+        opkg_lib_dir = self.d.getVar('OPKGLIBDIR')
         if opkg_lib_dir[0] == "/":
             opkg_lib_dir = opkg_lib_dir[1:]
         temp_opkg_dir = os.path.join(temp_rootfs, opkg_lib_dir, 'opkg')
diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index 234528a..dac0dfd 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -15,7 +15,7 @@ export GOROOT_FINAL = "${libdir}/go"
 export CGO_ENABLED = "1"
 export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
 export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
-CC = "${@d.getVar('BUILD_CC', True).strip()}"
+CC = "${@d.getVar('BUILD_CC').strip()}"
 
 do_configure[noexec] = "1"
 
diff --git a/meta/recipes-devtools/go/go-crosssdk.inc b/meta/recipes-devtools/go/go-crosssdk.inc
index 471c75b..f67e4b9 100644
--- a/meta/recipes-devtools/go/go-crosssdk.inc
+++ b/meta/recipes-devtools/go/go-crosssdk.inc
@@ -14,7 +14,7 @@ export CGO_ENABLED = "1"
 export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
 export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
 export GO_INSTALL = "cmd"
-CC = "${@d.getVar('BUILD_CC', True).strip()}"
+CC = "${@d.getVar('BUILD_CC').strip()}"
 
 do_configure[noexec] = "1"
 
diff --git a/meta/recipes-devtools/go/go-native.inc b/meta/recipes-devtools/go/go-native.inc
index 66b845c..95db1c2 100644
--- a/meta/recipes-devtools/go/go-native.inc
+++ b/meta/recipes-devtools/go/go-native.inc
@@ -10,7 +10,7 @@ SRC_URI[bootstrap.sha256sum] = "9947fc705b0b841b5938c48b22dc33e9647ec0752bae66e5
 
 export GOOS = "${BUILD_GOOS}"
 export GOARCH = "${BUILD_GOARCH}"
-CC = "${@d.getVar('BUILD_CC', True).strip()}"
+CC = "${@d.getVar('BUILD_CC').strip()}"
 
 export CGO_ENABLED = "1"
 
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index b88d016..24e7068 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -22,7 +22,7 @@ do_configure[noexec] = "1"
 
 do_compile() {
 	export GOBIN="${B}/bin"
-	export CC="${@d.getVar('BUILD_CC', True).strip()}"
+	export CC="${@d.getVar('BUILD_CC').strip()}"
 	rm -rf ${GOBIN} ${B}/pkg
 	mkdir ${GOBIN}
 
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 632178f..f06fa49 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -32,7 +32,7 @@ S = "${WORKDIR}/git"
 LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
 def get_llvm_arch(bb, d, arch_var):
     import re
-    a = d.getVar(arch_var, True)
+    a = d.getVar(arch_var)
     if   re.match('(i.86|athlon|x86.64)$', a):         return 'X86'
     elif re.match('arm$', a):                          return 'ARM'
     elif re.match('armeb$', a):                        return 'ARM'
@@ -174,7 +174,7 @@ python llvm_populate_packages() {
     split_packages = do_split_packages(d, libdir, '^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s', 'Split package for %s', allow_dirs=True, allow_links=True, recursive=True)
     split_staticdev_packages = do_split_packages(d, libllvm_libdir, '^lib(.*)\.a$', 'libllvm${LLVM_RELEASE}-%s-staticdev', 'Split staticdev package for %s', allow_dirs=True)
     if split_packages:
-        pn = d.getVar('PN', True)
+        pn = d.getVar('PN')
         d.appendVar('RDEPENDS_' + pn, ' '+' '.join(split_packages))
         d.appendVar('RDEPENDS_' + pn + '-dbg', ' '+' '.join(split_dbg_packages))
         d.appendVar('RDEPENDS_' + pn + '-staticdev', ' '+' '.join(split_staticdev_packages))
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb
index 14e63d9..8c35904 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb
@@ -74,7 +74,7 @@ python populate_packages_prepend () {
 
     # The test suite exercises all the loaders, so ensure they are all
     # dependencies of the ptest package.
-    d.appendVar("RDEPENDS_%s-ptest" % d.getVar('PN', True), " " + packages)
+    d.appendVar("RDEPENDS_%s-ptest" % d.getVar('PN'), " " + packages)
 }
 
 do_install_append() {
-- 
2.7.4


