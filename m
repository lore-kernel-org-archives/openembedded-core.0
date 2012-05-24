Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXQ2e-00056a-IQ
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 06:52:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 21:42:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="144034665"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2012 21:42:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 21:42:10 -0700
Message-Id: <fca9d788cff7244aec54e1e3aee7d09db7511e5c.1337834073.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 07/28] Rename 'external-csl' to 'external-sourcery'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 May 2012 04:52:53 -0000

From: Christopher Larson <kergoth@gmail.com>

This is a rename per the purchase of CodeSourcery by Mentor Graphics
Corporation, and associated naming change.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/conf/distro/include/tcmode-external-csl.inc   |  120 +-------------------
 .../distro/include/tcmode-external-sourcery.inc    |  118 +++++++++++++++++++
 ...toolchain.bb => external-sourcery-toolchain.bb} |    0
 .../SUPPORTED                                      |    0
 4 files changed, 120 insertions(+), 118 deletions(-)
 create mode 100644 meta/conf/distro/include/tcmode-external-sourcery.inc
 rename meta/recipes-core/meta/{external-csl-toolchain.bb => external-sourcery-toolchain.bb} (100%)
 rename meta/recipes-core/meta/{external-csl-toolchain => external-sourcery-toolchain}/SUPPORTED (100%)

diff --git a/meta/conf/distro/include/tcmode-external-csl.inc b/meta/conf/distro/include/tcmode-external-csl.inc
index 0fa2ee1..9e530ab 100644
--- a/meta/conf/distro/include/tcmode-external-csl.inc
+++ b/meta/conf/distro/include/tcmode-external-csl.inc
@@ -1,118 +1,2 @@
-#
-# Configuration to use external CSL toolchain
-#
-
-EXTERNAL_TOOLCHAIN ?= "/usr/local/csl/${TARGET_ARCH}"
-
-TOOLCHAIN_PATH_ADD = "${EXTERNAL_TOOLCHAIN}/bin:"
-PATH =. "${TOOLCHAIN_PATH_ADD}"
-
-CSL_TARGET_SYS_powerpc ?= "powerpc-linux-gnu"
-CSL_TARGET_SYS_powerpc64 ?= "powerpc-linux-gnu"
-CSL_TARGET_SYS_arm ?= "arm-none-linux-gnueabi"
-CSL_TARGET_SYS_mips ?= "mips-linux-gnu"
-CSL_TARGET_SYS_mipsel ?= "mips-linux-gnu"
-CSL_TARGET_SYS_mips64 ?= "mips-linux-gnu"
-CSL_TARGET_SYS_i686 ?= "i686-pc-linux-gnu"
-CSL_TARGET_SYS_i586 ?= "i686-pc-linux-gnu"
-CSL_TARGET_SYS = "${TARGET_SYS}"
-
-TARGET_PREFIX = "${CSL_TARGET_SYS}-"
-
-PREFERRED_PROVIDER_linux-libc-headers = "external-csl-toolchain"
-PREFERRED_PROVIDER_linux-libc-headers-dev = "external-csl-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-csl-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external-csl-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-csl-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-csl-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-csl-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "external-csl-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "external-csl-toolchain"
-PREFERRED_PROVIDER_libgcc = "external-csl-toolchain"
-PREFERRED_PROVIDER_virtual/libc = "external-csl-toolchain"
-PREFERRED_PROVIDER_virtual/libintl = "external-csl-toolchain"
-PREFERRED_PROVIDER_virtual/libiconv = "external-csl-toolchain"
-PREFERRED_PROVIDER_glibc-thread-db = "external-csl-toolchain"
-PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-csl-toolchain"
-PREFERRED_PROVIDER_gdbserver ??= "external-csl-toolchain"
-
-# No need to re-compile the locale files
-GLIBC_INTERNAL_USE_BINARY_LOCALE = "precompiled"
-ENABLE_BINARY_LOCALE_GENERATION = ""
-
-TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
-
-# Translate to CodeSourcery's names for their optimized files in the toolchain
-def csl_target_core(d):
-    coredata = {
-        'armv7a-vfp-neon': 'armv7-a-neon',
-        'i586': 'sgxx-glibc',
-        'i686': 'sgxx-glibc',
-        'core2': 'sgxx-glibc',
-        'mips': 'mips32',
-        'mipsel': 'el',
-        'powerpc-nf': 'nof',
-        'ppce500': 'te500v1',
-        'ppce500mc': 'te500mc',
-        'ppce500v2': 'te500v2',
-        'ppce600': 'te600'
-    }
-    return coredata.get(d.getVar('TUNE_PKGARCH', True), '')
-
-CSL_TARGET_CORE ?= "${@csl_target_core(d)}"
-
-# Unfortunately, the CSL ia32 toolchain has non-prefixed binaries in its
-# bindir (e.g. gcc, ld). To avoid this messing up our build, we avoid adding
-# this bindir to our PATH, and instead add symlinks to the prefixed binaries
-# to our staging toolchain bindir.
-
-python toolchain_metadata_setup () {
-    if not isinstance(e, bb.event.ConfigParsed):
-        return
-
-    d = e.data
-
-    l = d.createCopy()
-    l.finalize()
-    if os.path.exists(bb.data.expand('${EXTERNAL_TOOLCHAIN}/bin/gcc', l)):
-        d.setVar('TOOLCHAIN_PATH_ADD', '')
-}
-addhandler toolchain_metadata_setup
-
-python toolchain_setup () {
-    if not isinstance(e, bb.event.BuildStarted):
-        return
-
-    d = e.data
-
-    if not d.getVar('TOOLCHAIN_PATH_ADD', True):
-        populate_toolchain_links(d)
-}
-addhandler toolchain_setup
-
-def populate_toolchain_links(d):
-    import errno
-    import os
-    from glob import glob
-
-    d = d.createCopy()
-    d.finalize()
-
-    pattern = d.expand('${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}*')
-    files = glob(pattern)
-    if not files:
-        bb.fatal("Unable to populate toolchain binary symlinks in %s" % pattern)
-
-    bindir = d.getVar('STAGING_BINDIR_TOOLCHAIN', True)
-    bb.mkdirhier(bindir)
-    for f in files:
-        base = os.path.basename(f)
-        newpath = os.path.join(bindir, base)
-        try:
-            os.symlink(f, newpath)
-        except OSError as exc:
-            if exc.errno == errno.EEXIST:
-                break
-            bb.fatal("Unable to populate toolchain binary symlink for %s: %s" % (newpath, exc))
-
-require conf/distro/include/csl-versions.inc
+TCMODE = "external-sourcery"
+require conf/distro/include/tcmode-${TCMODE}.inc
diff --git a/meta/conf/distro/include/tcmode-external-sourcery.inc b/meta/conf/distro/include/tcmode-external-sourcery.inc
new file mode 100644
index 0000000..79fef25
--- /dev/null
+++ b/meta/conf/distro/include/tcmode-external-sourcery.inc
@@ -0,0 +1,118 @@
+#
+# Configuration to use external Sourcery G++ toolchain
+#
+
+EXTERNAL_TOOLCHAIN ?= "/usr/local/csl/${TARGET_ARCH}"
+
+TOOLCHAIN_PATH_ADD = "${EXTERNAL_TOOLCHAIN}/bin:"
+PATH =. "${TOOLCHAIN_PATH_ADD}"
+
+CSL_TARGET_SYS_powerpc ?= "powerpc-linux-gnu"
+CSL_TARGET_SYS_powerpc64 ?= "powerpc-linux-gnu"
+CSL_TARGET_SYS_arm ?= "arm-none-linux-gnueabi"
+CSL_TARGET_SYS_mips ?= "mips-linux-gnu"
+CSL_TARGET_SYS_mipsel ?= "mips-linux-gnu"
+CSL_TARGET_SYS_mips64 ?= "mips-linux-gnu"
+CSL_TARGET_SYS_i686 ?= "i686-pc-linux-gnu"
+CSL_TARGET_SYS_i586 ?= "i686-pc-linux-gnu"
+CSL_TARGET_SYS = "${TARGET_SYS}"
+
+TARGET_PREFIX = "${CSL_TARGET_SYS}-"
+
+PREFERRED_PROVIDER_linux-libc-headers = "external-sourcery-toolchain"
+PREFERRED_PROVIDER_linux-libc-headers-dev = "external-sourcery-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-sourcery-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external-sourcery-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-sourcery-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-sourcery-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-sourcery-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "external-sourcery-toolchain"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "external-sourcery-toolchain"
+PREFERRED_PROVIDER_libgcc = "external-sourcery-toolchain"
+PREFERRED_PROVIDER_virtual/libc = "external-sourcery-toolchain"
+PREFERRED_PROVIDER_virtual/libintl = "external-sourcery-toolchain"
+PREFERRED_PROVIDER_virtual/libiconv = "external-sourcery-toolchain"
+PREFERRED_PROVIDER_glibc-thread-db = "external-sourcery-toolchain"
+PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-sourcery-toolchain"
+PREFERRED_PROVIDER_gdbserver ??= "external-sourcery-toolchain"
+
+# No need to re-compile the locale files
+GLIBC_INTERNAL_USE_BINARY_LOCALE = "precompiled"
+ENABLE_BINARY_LOCALE_GENERATION = ""
+
+TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
+
+# Translate to CodeSourcery's names for their optimized files in the toolchain
+def csl_target_core(d):
+    coredata = {
+        'armv7a-vfp-neon': 'armv7-a-neon',
+        'i586': 'sgxx-glibc',
+        'i686': 'sgxx-glibc',
+        'core2': 'sgxx-glibc',
+        'mips': 'mips32',
+        'mipsel': 'el',
+        'powerpc-nf': 'nof',
+        'ppce500': 'te500v1',
+        'ppce500mc': 'te500mc',
+        'ppce500v2': 'te500v2',
+        'ppce600': 'te600'
+    }
+    return coredata.get(d.getVar('TUNE_PKGARCH', True), '')
+
+CSL_TARGET_CORE ?= "${@csl_target_core(d)}"
+
+# Unfortunately, the CSL ia32 toolchain has non-prefixed binaries in its
+# bindir (e.g. gcc, ld). To avoid this messing up our build, we avoid adding
+# this bindir to our PATH, and instead add symlinks to the prefixed binaries
+# to our staging toolchain bindir.
+
+python toolchain_metadata_setup () {
+    if not isinstance(e, bb.event.ConfigParsed):
+        return
+
+    d = e.data
+
+    l = d.createCopy()
+    l.finalize()
+    if os.path.exists(bb.data.expand('${EXTERNAL_TOOLCHAIN}/bin/gcc', l)):
+        d.setVar('TOOLCHAIN_PATH_ADD', '')
+}
+addhandler toolchain_metadata_setup
+
+python toolchain_setup () {
+    if not isinstance(e, bb.event.BuildStarted):
+        return
+
+    d = e.data
+
+    if not d.getVar('TOOLCHAIN_PATH_ADD', True):
+        populate_toolchain_links(d)
+}
+addhandler toolchain_setup
+
+def populate_toolchain_links(d):
+    import errno
+    import os
+    from glob import glob
+
+    d = d.createCopy()
+    d.finalize()
+
+    pattern = d.expand('${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}*')
+    files = glob(pattern)
+    if not files:
+        bb.fatal("Unable to populate toolchain binary symlinks in %s" % pattern)
+
+    bindir = d.getVar('STAGING_BINDIR_TOOLCHAIN', True)
+    bb.mkdirhier(bindir)
+    for f in files:
+        base = os.path.basename(f)
+        newpath = os.path.join(bindir, base)
+        try:
+            os.symlink(f, newpath)
+        except OSError as exc:
+            if exc.errno == errno.EEXIST:
+                break
+            bb.fatal("Unable to populate toolchain binary symlink for %s: %s" % (newpath, exc))
+
+require conf/distro/include/csl-versions.inc
diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/recipes-core/meta/external-sourcery-toolchain.bb
similarity index 100%
rename from meta/recipes-core/meta/external-csl-toolchain.bb
rename to meta/recipes-core/meta/external-sourcery-toolchain.bb
diff --git a/meta/recipes-core/meta/external-csl-toolchain/SUPPORTED b/meta/recipes-core/meta/external-sourcery-toolchain/SUPPORTED
similarity index 100%
rename from meta/recipes-core/meta/external-csl-toolchain/SUPPORTED
rename to meta/recipes-core/meta/external-sourcery-toolchain/SUPPORTED
-- 
1.7.7.6



