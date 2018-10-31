Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0BCFA79BAD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 13:25:06 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id d17-v6so16168471wre.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 06:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=VOAGy/WNSYwddtdPPRgaQVtSPD5oDhVnt/t0nUOBO1I=;
	b=Cm9pBWST18GIJKRV6CY90BQUT9nblCGLeleaoWmIPm47W0c1iQU5/ZLY8AiNKpKE9u
	7Ap7Cj+7rb8NkGLWSWtrod691iJhoo9y+3I7EwK11Cy8KgbotCs4xm77D6KM3p2NnMw6
	w1k2hDYnQYJiJu+e6HeuAwS6j3ndTuIiKyKYn6qiYMrKpqwyCFpKZVAxscwtT9z4Tp82
	Aceunikymh6QfoGVsLyUoswoDh9SfyyHoGLGtdeYCG4Q6T8UQa6Rn0h7imzkqNd6wrWJ
	rtTTPXcNsB3Obul0MuanpIbZRfGLJMWhTevR5LpjBzLNhqAWhQ6X6WOoK4/v3DgNdvWv
	8oQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=VOAGy/WNSYwddtdPPRgaQVtSPD5oDhVnt/t0nUOBO1I=;
	b=XvnxJ5jsZSa1S8U03imVYUyCS9uawC5Mzs5OHAe8LaQYMHhKIH9Yd3wfTCCjxK6TfB
	RWYXviFZeJsRzLBKlzK1LXWh8T4+Bo+P0nhxgG4udzGAXgF1hYPBT0/hi82RqYbiFxvl
	mEDSq2gj5q2/1FkmBcpzZpm86M7vbDAde3ClD10jppevo0GXyDtJ4l4BW5F5ff0lnmnm
	PGPr5datT7gSrf7RTJnRzSUS/yvDjbi8dXtP+TKqPJkTQgE2Mm0DJyvEEQrWtwhxl0NG
	/6nBdslUhNmUniuk3O2jVBnXyR6+K5Wx3Xq+HasIlip1SZZaFJK1TspYgrvOZhTzhsPI
	zHPA==
X-Gm-Message-State: AGRZ1gJrdbiCTtfcLz47n7TF4tFltI/UIaD0kxQY6DlLFQw6lqSUXmPH
	KxfhjQJ2INs0ZECJiGZtlTk3pyc2
X-Google-Smtp-Source: AJdET5eeTvTn+QKMIzCOqytAkqXGhmvPCK1Q3mfbwaHpiryz22gL6f1b20JYtNsOnT7e2ExTe1HFAQ==
X-Received: by 2002:adf:f24d:: with SMTP id
	b13-v6mr2647804wrp.142.1540992305564; 
	Wed, 31 Oct 2018 06:25:05 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	q185-v6sm16592872wmg.45.2018.10.31.06.25.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 06:25:04 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Oct 2018 14:24:46 +0100
Message-Id: <20181031132446.20189-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH v7] python3{,-native}: update to 3.7.0
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
X-List-Received-Date: Wed, 31 Oct 2018 13:25:07 -0000

Update python3 to recent 3.7.0 release.

Details about new features and bug-fixes can be taken from
* https://docs.python.org/3/whatsnew/3.7.html
* https://docs.python.org/3/whatsnew/3.6.html

Remove patches when they were fixed upstream and rebase the
remaining ones. If necessary, the patches are adopted to
keep the idea when upstream code was changed. Also remove
backports from 3.6 and 3.7 into 3.5.6 codebase for TLS
and multiprocessing.

Open TODO: track patches in a -STABLE rebased git branch for
easier rebasing or upstream submitting.

Enhancement requests for Yocto project
* https://bugzilla.yoctoproject.org/show_bug.cgi?id=12375
* https://bugzilla.yoctoproject.org/show_bug.cgi?id=12901
are solved by this.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/classes/python3-dir.bbclass              |   6 +-
 .../python/python3-native_3.5.6.bb            | 100 ------
 .../python/python3-native_3.7.0.bb            |  73 ++++
 meta/recipes-devtools/python/python3.inc      |  65 +++-
 ...hell-version-of-python-config-that-w.patch |  21 +-
 ..._sysconfigdata.py-to-initialize-dist.patch |  66 ----
 ...ontext-has-improved-default-settings.patch | 272 ---------------
 ...d-target-to-split-profile-generation.patch |  40 ---
 ...S-1.3-cipher-suites-and-OP_NO_TLSv1_.patch | 227 ------------
 ...for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch | 173 ---------
 ....3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch | 110 ------
 ...ALPN-changes-for-OpenSSL-1.1.0f-2305.patch |  68 ----
 .../python3/03-fix-tkinter-detection.patch    |  12 +-
 .../python3/030-fixup-include-dirs.patch      |   9 -
 .../080-distutils-dont_adjust_files.patch     |   4 +-
 .../python/python3/150-fix-setupterm.patch    |  17 -
 ...GS-for-extensions-when-cross-compili.patch |  53 ++-
 .../python3/avoid-ncursesw-include-path.patch |  18 +-
 .../python3/avoid_warning_about_tkinter.patch |  18 +-
 .../python3/configure.ac-fix-LIBPL.patch      |  21 +-
 .../python/python3/float-endian.patch         |   9 +-
 ...ssing-libraries-to-Extension-for-mul.patch |  26 +-
 .../python/python3/python-3.3-multilib.patch  | 241 +++++++------
 .../python/python3/python3-manifest.json      |  35 +-
 ...CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch |  17 +-
 .../python/python3/regen-all.patch            |  25 --
 .../python/python3/signal.patch               |  56 ---
 ...port_SOURCE_DATE_EPOCH_in_py_compile.patch |  36 +-
 .../python3/sysroot-include-headers.patch     |  23 +-
 .../python3/uuid_when_cross_compiling.patch   |  24 ++
 meta/recipes-devtools/python/python3_3.5.6.bb | 329 ------------------
 meta/recipes-devtools/python/python3_3.7.0.bb | 300 ++++++++++++++++
 32 files changed, 723 insertions(+), 1771 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-native_3.5.6.bb
 create mode 100644 meta/recipes-devtools/python/python3-native_3.7.0.bb
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Issue-28043-SSLContext-has-improved-default-settings.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch
 delete mode 100644 meta/recipes-devtools/python/python3/150-fix-setupterm.patch
 delete mode 100644 meta/recipes-devtools/python/python3/regen-all.patch
 delete mode 100644 meta/recipes-devtools/python/python3/signal.patch
 create mode 100644 meta/recipes-devtools/python/python3/uuid_when_cross_compiling.patch
 delete mode 100644 meta/recipes-devtools/python/python3_3.5.6.bb
 create mode 100644 meta/recipes-devtools/python/python3_3.7.0.bb

diff --git a/meta/classes/python3-dir.bbclass b/meta/classes/python3-dir.bbclass
index 06bb046d9c..ad7ea8dd9a 100644
--- a/meta/classes/python3-dir.bbclass
+++ b/meta/classes/python3-dir.bbclass
@@ -1,4 +1,8 @@
-PYTHON_BASEVERSION = "3.5"
+PYTHON_BASEVERSION = "3.7"
+# [d][m][u]
+# d: py_debug
+# m: my_malloc
+# u: wide-char unicode
 PYTHON_ABI = "m"
 PYTHON_DIR = "python${PYTHON_BASEVERSION}"
 PYTHON_PN = "python3"
diff --git a/meta/recipes-devtools/python/python3-native_3.5.6.bb b/meta/recipes-devtools/python/python3-native_3.5.6.bb
deleted file mode 100644
index d5953cf4bb..0000000000
--- a/meta/recipes-devtools/python/python3-native_3.5.6.bb
+++ /dev/null
@@ -1,100 +0,0 @@
-require recipes-devtools/python/python3.inc
-
-DISTRO_SRC_URI ?= "file://sitecustomize.py"
-DISTRO_SRC_URI_linuxstdbase = ""
-SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
-file://12-distutils-prefix-is-inside-staging-area.patch \
-file://python-config.patch \
-file://030-fixup-include-dirs.patch \
-file://070-dont-clean-ipkg-install.patch \
-file://080-distutils-dont_adjust_files.patch \
-file://130-readline-setup.patch \
-file://150-fix-setupterm.patch \
-file://python-3.3-multilib.patch \
-file://03-fix-tkinter-detection.patch \
-file://avoid_warning_about_tkinter.patch \
-file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
-file://sysroot-include-headers.patch \
-file://unixccompiler.patch \
-${DISTRO_SRC_URI} \
-file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
-file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
-file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
-file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
-file://regen-all.patch \
-file://0001-Issue-28043-SSLContext-has-improved-default-settings.patch \
-file://0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch \
-file://0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch \
-file://0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch \
-file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch \
-"
-
-EXTRANATIVEPATH += "bzip2-native"
-DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native sqlite3-native gdbm-native"
-
-inherit native
-
-EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip"
-
-EXTRA_OEMAKE = '\
-  LIBC="" \
-  STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE} \
-  STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
-  LIB=${baselib} \
-  ARCH=${TARGET_ARCH} \
-'
-
-do_configure_append() {
-	autoreconf --verbose --install --force --exclude=autopoint ../Python-${PV}/Modules/_ctypes/libffi
-	sed -i -e 's,#define HAVE_GETRANDOM 1,/\* #undef HAVE_GETRANDOM \*/,' ${B}/pyconfig.h
-}
-
-# Regenerate all of the generated files
-# This ensures that pgen and friends get created during the compile phase
-#
-do_compile_prepend() {
-    # Assuming https://bugs.python.org/issue33080 has been addressed in Makefile.
-    oe_runmake regen-all
-}
-
-do_install() {
-	install -d ${D}${libdir}/pkgconfig
-	oe_runmake 'DESTDIR=${D}' install
-	if [ -e ${WORKDIR}/sitecustomize.py ]; then
-		install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
-	fi
-	install -d ${D}${bindir}/${PN}
-	install -m 0755 Parser/pgen ${D}${bindir}/${PN}
-
-	# Make sure we use /usr/bin/env python
-	for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
-		sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
-	done
-
-        # Add a symlink to the native Python so that scripts can just invoke
-        # "nativepython" and get the right one without needing absolute paths
-        # (these often end up too long for the #! parser in the kernel as the
-        # buffer is 128 bytes long).
-        ln -s python3-native/python3 ${D}${bindir}/nativepython3
-}
-
-python(){
-
-    # Read JSON manifest
-    import json
-    pythondir = d.getVar('THISDIR',True)
-    with open(pythondir+'/python3/python3-manifest.json') as manifest_file:
-        python_manifest=json.load(manifest_file)
-
-    rprovides = d.getVar('RPROVIDES').split()
-
-    # Hardcoded since it cant be python3-native-foo, should be python3-foo-native
-    pn = 'python3'
-
-    for key in python_manifest:
-        pypackage = pn + '-' + key + '-native'
-        if pypackage not in rprovides:
-              rprovides.append(pypackage)
-
-    d.setVar('RPROVIDES', ' '.join(rprovides))
-}
diff --git a/meta/recipes-devtools/python/python3-native_3.7.0.bb b/meta/recipes-devtools/python/python3-native_3.7.0.bb
new file mode 100644
index 0000000000..3ef9f0a5e3
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-native_3.7.0.bb
@@ -0,0 +1,73 @@
+require recipes-devtools/python/python3.inc
+
+SRC_URI += "\
+    file://12-distutils-prefix-is-inside-staging-area.patch \
+    file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
+"
+
+EXTRANATIVEPATH += "bzip2-native"
+DEPENDS = "openssl-native libffi-native bzip2-replacement-native zlib-native \
+           util-linux-native readline-native sqlite3-native gdbm-native \
+"
+
+inherit native
+
+EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip"
+
+EXTRA_OEMAKE = '\
+  LIBC="" \
+  STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE} \
+  STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
+  LIB=${baselib} \
+  ARCH=${TARGET_ARCH} \
+'
+
+# Regenerate all of the generated files
+# This ensures that pgen and friends get created during the compile phase
+#
+do_compile_prepend() {
+    # Assuming https://bugs.python.org/issue33080 has been addressed in Makefile.
+    oe_runmake regen-all
+}
+
+do_install() {
+	install -d ${D}${libdir}/pkgconfig
+	oe_runmake 'DESTDIR=${D}' install
+	if [ -e ${WORKDIR}/sitecustomize.py ]; then
+		install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
+	fi
+	install -d ${D}${bindir}/${PN}
+	install -m 0755 Parser/pgen ${D}${bindir}/${PN}
+
+	# Make sure we use /usr/bin/env python
+	for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
+		sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
+	done
+
+        # Add a symlink to the native Python so that scripts can just invoke
+        # "nativepython" and get the right one without needing absolute paths
+        # (these often end up too long for the #! parser in the kernel as the
+        # buffer is 128 bytes long).
+        ln -s python3-native/python3 ${D}${bindir}/nativepython3
+}
+
+python(){
+
+    # Read JSON manifest
+    import json
+    pythondir = d.getVar('THISDIR',True)
+    with open(pythondir+'/python3/python3-manifest.json') as manifest_file:
+        python_manifest=json.load(manifest_file)
+
+    rprovides = d.getVar('RPROVIDES').split()
+
+    # Hardcoded since it cant be python3-native-foo, should be python3-foo-native
+    pn = 'python3'
+
+    for key in python_manifest:
+        pypackage = pn + '-' + key + '-native'
+        if pypackage not in rprovides:
+              rprovides.append(pypackage)
+
+    d.setVar('RPROVIDES', ' '.join(rprovides))
+}
diff --git a/meta/recipes-devtools/python/python3.inc b/meta/recipes-devtools/python/python3.inc
index f565b3f171..b0fc0144a4 100644
--- a/meta/recipes-devtools/python/python3.inc
+++ b/meta/recipes-devtools/python/python3.inc
@@ -3,41 +3,74 @@ HOMEPAGE = "http://www.python.org"
 LICENSE = "PSFv2"
 SECTION = "devel/python"
 
-# TODO Remove this when we upgrade
-INC_PR = "r1"
-PR = "${INC_PR}.0"
+PYTHON_MAJMIN = "3.7"
+DISTRO_SRC_URI ?= "file://sitecustomize.py"
+DISTRO_SRC_URI_linuxstdbase = ""
+SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
+    file://python-config.patch \
+    file://python-3.3-multilib.patch \
+    file://03-fix-tkinter-detection.patch \
+    file://avoid_warning_about_tkinter.patch \
+    file://unixccompiler.patch \
+    file://sysroot-include-headers.patch \
+    file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
+    file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
+    file://030-fixup-include-dirs.patch \
+    file://070-dont-clean-ipkg-install.patch \
+    file://080-distutils-dont_adjust_files.patch \
+    file://130-readline-setup.patch \
+    file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
+    ${DISTRO_SRC_URI} \
+    file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
+    file://Use-correct-CFLAGS-for-extensions-when-cross-compili.patch \
+"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b6ec515b22618f55fa07276b897bacea"
+SRC_URI[md5sum] = "eb8c2a6b1447d50813c02714af4681f3"
+SRC_URI[sha256sum] = "0382996d1ee6aafe59763426cf0139ffebe36984474d0ec4126dd1c40a8b3549"
 
-# TODO consolidate patch set
-SRC_URI[md5sum] = "f5a99f765e765336a3ebbb2a24ca2be3"
-SRC_URI[sha256sum] = "f55cde04f521f273c7cba08912921cc5642cfc15ca7b22d5829f0aff4371155f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f257cc14f81685691652a3d3e1b5d754"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
-CVE_PRODUCT = "python"
-
-PYTHON_MAJMIN = "3.5"
-PYTHON_BINABI = "${PYTHON_MAJMIN}m"
-
 S = "${WORKDIR}/Python-${PV}"
 
-inherit autotools bluetooth pkgconfig
+CVE_PRODUCT = "python"
+
+inherit autotools bluetooth pkgconfig python3-dir
 
 EXTRA_OECONF = "\
-  --with-threads \
   --with-pymalloc \
   --without-cxx-main \
-  --with-signal-module \
   --enable-shared \
   --enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)} \
 "
 
 PACKAGECONFIG[bluetooth] = ",ac_cv_header_bluetooth_bluetooth_h=no ac_cv_header_bluetooth_h=no,${BLUEZ}"
 
+do_configure_prepend() {
+	libdirleaf="$(echo ${libdir} | sed -e 's:${prefix}/::')"
+	sed -i -e "s:SEDMELIBLEAF:${libdirleaf}:g" \
+		${S}/configure.ac
+}
+
+do_install_prepend() {
+	MAKESETTINGS="$(egrep '^(ABIFLAGS|MULTIARCH)=' ${B}/Makefile | sed -E -e 's/[[:space:]]//g' -e 's/=/="/' -e 's/$/"/')"
+	eval ${MAKESETTINGS}
+	if test "${ABIFLAGS}" != "${PYTHON_ABI}"; then
+	    die "do_install: configure determined ABIFLAGS '${ABIFLAGS}' != '${PYTHON_ABI}' from python3-dir.bbclass"
+	fi
+	if test "x${BUILD_OS}" = "x${TARGET_OS}"; then
+		# no cross-compile at all
+		_PYTHON_SYSCONFIGDATA_NAME=${PYTHON_ABI}_${TARGET_OS}_${MULTIARCH}
+	else
+		# at the very moment, it's the only available target
+		_PYTHON_SYSCONFIGDATA_NAME=${PYTHON_ABI}_linux_${MULTIARCH}
+	fi
+}
+
 do_install_append () {
 	sed -i -e 's:${HOSTTOOLS_DIR}/install:install:g' \
 		-e 's:${HOSTTOOLS_DIR}/mkdir:mkdir:g' \
-		${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
+		${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCONFIGDATA_NAME}.py
 }
diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
index 8ea3f03fe0..aac34533ef 100644
--- a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
+++ b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
@@ -14,25 +14,22 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 3 insertions(+), 6 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 236f005..5c4337f 100644
+index 31b4bcabb3..7da6d6941e 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1348,12 +1348,9 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -1415,12 +1415,9 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," < $(srcdir)/Misc/python-config.in >python-config.py
- 	# Replace makefile compat. variable references with shell script compat. ones; $(VAR) -> ${VAR}
+ 	@ # Replace makefile compat. variable references with shell script compat. ones; $(VAR) -> ${VAR}
  	LC_ALL=C sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' < Misc/python-config.sh >python-config
--	# On Darwin, always use the python version of the script, the shell
--	# version doesn't use the compiler customizations that are provided
--	# in python (_osx_support.py).
--	if test `uname -s` = Darwin; then \
+-	@ # On Darwin, always use the python version of the script, the shell
+-	@ # version doesn't use the compiler customizations that are provided
+-	@ # in python (_osx_support.py).
+-	@if test `uname -s` = Darwin; then \
 -		cp python-config.py python-config; \
 -	fi
-+	# In OpenEmbedded, always use the python version of the script, the shell
-+	# version is broken in multiple ways, and doesn't return correct directories
++	@ # In OpenEmbedded, always use the python version of the script, the shell
++	@ # version is broken in multiple ways, and doesn't return correct directories
 +	cp python-config.py python-config
  
  
  # Install the include files
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch b/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
deleted file mode 100644
index d1c92e9eed..0000000000
--- a/meta/recipes-devtools/python/python3/0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From bcddbf40c7f1b80336268cdddacc17369fb0ccea Mon Sep 17 00:00:00 2001
-From: Libin Dang <libin.dang@windriver.com>
-Date: Tue, 11 Apr 2017 14:12:15 +0800
-Subject: [PATCH] Issue #21272: Use _sysconfigdata.py to initialize
- distutils.sysconfig
-
-Backport upstream commit
-https://github.com/python/cpython/commit/409482251b06fe75c4ee56e85ffbb4b23d934159
-
-Upstream-Status: Backport
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- Lib/distutils/sysconfig.py | 35 ++++-------------------------------
- 1 file changed, 4 insertions(+), 31 deletions(-)
-
-diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index 6d5cfd0..9925d24 100644
---- a/Lib/distutils/sysconfig.py
-+++ b/Lib/distutils/sysconfig.py
-@@ -424,38 +424,11 @@ _config_vars = None
- 
- def _init_posix():
-     """Initialize the module as appropriate for POSIX systems."""
--    g = {}
--    # load the installed Makefile:
--    try:
--        filename = get_makefile_filename()
--        parse_makefile(filename, g)
--    except OSError as msg:
--        my_msg = "invalid Python installation: unable to open %s" % filename
--        if hasattr(msg, "strerror"):
--            my_msg = my_msg + " (%s)" % msg.strerror
--
--        raise DistutilsPlatformError(my_msg)
--
--    # load the installed pyconfig.h:
--    try:
--        filename = get_config_h_filename()
--        with open(filename) as file:
--            parse_config_h(file, g)
--    except OSError as msg:
--        my_msg = "invalid Python installation: unable to open %s" % filename
--        if hasattr(msg, "strerror"):
--            my_msg = my_msg + " (%s)" % msg.strerror
--
--        raise DistutilsPlatformError(my_msg)
--
--    # On AIX, there are wrong paths to the linker scripts in the Makefile
--    # -- these paths are relative to the Python source, but when installed
--    # the scripts are in another directory.
--    if python_build:
--        g['LDSHARED'] = g['BLDSHARED']
--
-+    # _sysconfigdata is generated at build time, see the sysconfig module
-+    from _sysconfigdata import build_time_vars
-     global _config_vars
--    _config_vars = g
-+    _config_vars = {}
-+    _config_vars.update(build_time_vars)
- 
- 
- def _init_nt():
--- 
-1.8.3.1
-
diff --git a/meta/recipes-devtools/python/python3/0001-Issue-28043-SSLContext-has-improved-default-settings.patch b/meta/recipes-devtools/python/python3/0001-Issue-28043-SSLContext-has-improved-default-settings.patch
deleted file mode 100644
index 321b4afa12..0000000000
--- a/meta/recipes-devtools/python/python3/0001-Issue-28043-SSLContext-has-improved-default-settings.patch
+++ /dev/null
@@ -1,272 +0,0 @@
-From 758e7463c104f71b810c8588166747eeab6148d7 Mon Sep 17 00:00:00 2001
-From: Christian Heimes <christian@python.org>
-Date: Sat, 10 Sep 2016 22:43:48 +0200
-Subject: [PATCH 1/4] Issue 28043: SSLContext has improved default settings
-
-The options OP_NO_COMPRESSION, OP_CIPHER_SERVER_PREFERENCE, OP_SINGLE_DH_USE, OP_SINGLE_ECDH_USE, OP_NO_SSLv2 (except for PROTOCOL_SSLv2), and OP_NO_SSLv3 (except for PROTOCOL_SSLv3) are set by default. The initial cipher suite list contains only HIGH ciphers, no NULL ciphers and MD5 ciphers (except for PROTOCOL_SSLv2).
-
-Upstream-Status: Backport
-[https://github.com/python/cpython/commit/358cfd426ccc0fcd6a7940d306602138e76420ae]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- Doc/library/ssl.rst  |  9 ++++++-
- Lib/ssl.py           | 30 +++++----------------
- Lib/test/test_ssl.py | 62 +++++++++++++++++++++++---------------------
- Modules/_ssl.c       | 31 ++++++++++++++++++++++
- 4 files changed, 78 insertions(+), 54 deletions(-)
-
-diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst
-index a2f008346b..14f2d68217 100644
---- a/Doc/library/ssl.rst
-+++ b/Doc/library/ssl.rst
-@@ -1151,7 +1151,14 @@ to speed up repeated connections from the same clients.
- 
-    .. versionchanged:: 3.5.3
- 
--      :data:`PROTOCOL_TLS` is the default value.
-+      The context is created with secure default values. The options
-+      :data:`OP_NO_COMPRESSION`, :data:`OP_CIPHER_SERVER_PREFERENCE`,
-+      :data:`OP_SINGLE_DH_USE`, :data:`OP_SINGLE_ECDH_USE`,
-+      :data:`OP_NO_SSLv2` (except for :data:`PROTOCOL_SSLv2`),
-+      and :data:`OP_NO_SSLv3` (except for :data:`PROTOCOL_SSLv3`) are
-+      set by default. The initial cipher suite list contains only ``HIGH``
-+      ciphers, no ``NULL`` ciphers and no ``MD5`` ciphers (except for
-+      :data:`PROTOCOL_SSLv2`).
- 
- 
- :class:`SSLContext` objects have the following methods and attributes:
-diff --git a/Lib/ssl.py b/Lib/ssl.py
-index e1913904f3..4d302a78fa 100644
---- a/Lib/ssl.py
-+++ b/Lib/ssl.py
-@@ -446,32 +446,16 @@ def create_default_context(purpose=Purpose.SERVER_AUTH, *, cafile=None,
-     if not isinstance(purpose, _ASN1Object):
-         raise TypeError(purpose)
- 
-+    # SSLContext sets OP_NO_SSLv2, OP_NO_SSLv3, OP_NO_COMPRESSION,
-+    # OP_CIPHER_SERVER_PREFERENCE, OP_SINGLE_DH_USE and OP_SINGLE_ECDH_USE
-+    # by default.
-     context = SSLContext(PROTOCOL_TLS)
- 
--    # SSLv2 considered harmful.
--    context.options |= OP_NO_SSLv2
--
--    # SSLv3 has problematic security and is only required for really old
--    # clients such as IE6 on Windows XP
--    context.options |= OP_NO_SSLv3
--
--    # disable compression to prevent CRIME attacks (OpenSSL 1.0+)
--    context.options |= getattr(_ssl, "OP_NO_COMPRESSION", 0)
--
-     if purpose == Purpose.SERVER_AUTH:
-         # verify certs and host name in client mode
-         context.verify_mode = CERT_REQUIRED
-         context.check_hostname = True
-     elif purpose == Purpose.CLIENT_AUTH:
--        # Prefer the server's ciphers by default so that we get stronger
--        # encryption
--        context.options |= getattr(_ssl, "OP_CIPHER_SERVER_PREFERENCE", 0)
--
--        # Use single use keys in order to improve forward secrecy
--        context.options |= getattr(_ssl, "OP_SINGLE_DH_USE", 0)
--        context.options |= getattr(_ssl, "OP_SINGLE_ECDH_USE", 0)
--
--        # disallow ciphers with known vulnerabilities
-         context.set_ciphers(_RESTRICTED_SERVER_CIPHERS)
- 
-     if cafile or capath or cadata:
-@@ -497,12 +481,10 @@ def _create_unverified_context(protocol=PROTOCOL_TLS, *, cert_reqs=None,
-     if not isinstance(purpose, _ASN1Object):
-         raise TypeError(purpose)
- 
-+    # SSLContext sets OP_NO_SSLv2, OP_NO_SSLv3, OP_NO_COMPRESSION,
-+    # OP_CIPHER_SERVER_PREFERENCE, OP_SINGLE_DH_USE and OP_SINGLE_ECDH_USE
-+    # by default.
-     context = SSLContext(protocol)
--    # SSLv2 considered harmful.
--    context.options |= OP_NO_SSLv2
--    # SSLv3 has problematic security and is only required for really old
--    # clients such as IE6 on Windows XP
--    context.options |= OP_NO_SSLv3
- 
-     if cert_reqs is not None:
-         context.verify_mode = cert_reqs
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index ffb7314f57..f91af7bd05 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -73,6 +73,12 @@ NULLBYTECERT = data_file("nullbytecert.pem")
- DHFILE = data_file("dh1024.pem")
- BYTES_DHFILE = os.fsencode(DHFILE)
- 
-+# Not defined in all versions of OpenSSL
-+OP_NO_COMPRESSION = getattr(ssl, "OP_NO_COMPRESSION", 0)
-+OP_SINGLE_DH_USE = getattr(ssl, "OP_SINGLE_DH_USE", 0)
-+OP_SINGLE_ECDH_USE = getattr(ssl, "OP_SINGLE_ECDH_USE", 0)
-+OP_CIPHER_SERVER_PREFERENCE = getattr(ssl, "OP_CIPHER_SERVER_PREFERENCE", 0)
-+
- 
- def handle_error(prefix):
-     exc_format = ' '.join(traceback.format_exception(*sys.exc_info()))
-@@ -839,8 +845,9 @@ class ContextTests(unittest.TestCase):
-         ctx = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
-         # OP_ALL | OP_NO_SSLv2 | OP_NO_SSLv3 is the default value
-         default = (ssl.OP_ALL | ssl.OP_NO_SSLv2 | ssl.OP_NO_SSLv3)
--        if not IS_LIBRESSL and ssl.OPENSSL_VERSION_INFO >= (1, 1, 0):
--            default |= ssl.OP_NO_COMPRESSION
-+        # SSLContext also enables these by default
-+        default |= (OP_NO_COMPRESSION | OP_CIPHER_SERVER_PREFERENCE |
-+                    OP_SINGLE_DH_USE | OP_SINGLE_ECDH_USE)
-         self.assertEqual(default, ctx.options)
-         ctx.options |= ssl.OP_NO_TLSv1
-         self.assertEqual(default | ssl.OP_NO_TLSv1, ctx.options)
-@@ -1205,16 +1212,29 @@ class ContextTests(unittest.TestCase):
-             stats["x509"] += 1
-             self.assertEqual(ctx.cert_store_stats(), stats)
- 
-+    def _assert_context_options(self, ctx):
-+        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
-+        if OP_NO_COMPRESSION != 0:
-+            self.assertEqual(ctx.options & OP_NO_COMPRESSION,
-+                             OP_NO_COMPRESSION)
-+        if OP_SINGLE_DH_USE != 0:
-+            self.assertEqual(ctx.options & OP_SINGLE_DH_USE,
-+                             OP_SINGLE_DH_USE)
-+        if OP_SINGLE_ECDH_USE != 0:
-+            self.assertEqual(ctx.options & OP_SINGLE_ECDH_USE,
-+                             OP_SINGLE_ECDH_USE)
-+        if OP_CIPHER_SERVER_PREFERENCE != 0:
-+            self.assertEqual(ctx.options & OP_CIPHER_SERVER_PREFERENCE,
-+                             OP_CIPHER_SERVER_PREFERENCE)
-+
-     def test_create_default_context(self):
-         ctx = ssl.create_default_context()
-+
-         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
-         self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
-         self.assertTrue(ctx.check_hostname)
--        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
--        self.assertEqual(
--            ctx.options & getattr(ssl, "OP_NO_COMPRESSION", 0),
--            getattr(ssl, "OP_NO_COMPRESSION", 0),
--        )
-+        self._assert_context_options(ctx)
-+
- 
-         with open(SIGNING_CA) as f:
-             cadata = f.read()
-@@ -1222,40 +1242,24 @@ class ContextTests(unittest.TestCase):
-                                          cadata=cadata)
-         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
-         self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
--        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
--        self.assertEqual(
--            ctx.options & getattr(ssl, "OP_NO_COMPRESSION", 0),
--            getattr(ssl, "OP_NO_COMPRESSION", 0),
--        )
-+        self._assert_context_options(ctx)
- 
-         ctx = ssl.create_default_context(ssl.Purpose.CLIENT_AUTH)
-         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
-         self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
--        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
--        self.assertEqual(
--            ctx.options & getattr(ssl, "OP_NO_COMPRESSION", 0),
--            getattr(ssl, "OP_NO_COMPRESSION", 0),
--        )
--        self.assertEqual(
--            ctx.options & getattr(ssl, "OP_SINGLE_DH_USE", 0),
--            getattr(ssl, "OP_SINGLE_DH_USE", 0),
--        )
--        self.assertEqual(
--            ctx.options & getattr(ssl, "OP_SINGLE_ECDH_USE", 0),
--            getattr(ssl, "OP_SINGLE_ECDH_USE", 0),
--        )
-+        self._assert_context_options(ctx)
- 
-     def test__create_stdlib_context(self):
-         ctx = ssl._create_stdlib_context()
-         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
-         self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
-         self.assertFalse(ctx.check_hostname)
--        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
-+        self._assert_context_options(ctx)
- 
-         ctx = ssl._create_stdlib_context(ssl.PROTOCOL_TLSv1)
-         self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1)
-         self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
--        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
-+        self._assert_context_options(ctx)
- 
-         ctx = ssl._create_stdlib_context(ssl.PROTOCOL_TLSv1,
-                                          cert_reqs=ssl.CERT_REQUIRED,
-@@ -1263,12 +1267,12 @@ class ContextTests(unittest.TestCase):
-         self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1)
-         self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
-         self.assertTrue(ctx.check_hostname)
--        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
-+        self._assert_context_options(ctx)
- 
-         ctx = ssl._create_stdlib_context(purpose=ssl.Purpose.CLIENT_AUTH)
-         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
-         self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
--        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
-+        self._assert_context_options(ctx)
- 
-     def test_check_hostname(self):
-         ctx = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
-diff --git a/Modules/_ssl.c b/Modules/_ssl.c
-index 86482677ae..0d5c121d2c 100644
---- a/Modules/_ssl.c
-+++ b/Modules/_ssl.c
-@@ -2330,6 +2330,7 @@ _ssl__SSLContext_impl(PyTypeObject *type, int proto_version)
-     PySSLContext *self;
-     long options;
-     SSL_CTX *ctx = NULL;
-+    int result;
- #if defined(SSL_MODE_RELEASE_BUFFERS)
-     unsigned long libver;
- #endif
-@@ -2393,8 +2394,38 @@ _ssl__SSLContext_impl(PyTypeObject *type, int proto_version)
-         options |= SSL_OP_NO_SSLv2;
-     if (proto_version != PY_SSL_VERSION_SSL3)
-         options |= SSL_OP_NO_SSLv3;
-+    /* Minimal security flags for server and client side context.
-+     * Client sockets ignore server-side parameters. */
-+#ifdef SSL_OP_NO_COMPRESSION
-+    options |= SSL_OP_NO_COMPRESSION;
-+#endif
-+#ifdef SSL_OP_CIPHER_SERVER_PREFERENCE
-+    options |= SSL_OP_CIPHER_SERVER_PREFERENCE;
-+#endif
-+#ifdef SSL_OP_SINGLE_DH_USE
-+    options |= SSL_OP_SINGLE_DH_USE;
-+#endif
-+#ifdef SSL_OP_SINGLE_ECDH_USE
-+    options |= SSL_OP_SINGLE_ECDH_USE;
-+#endif
-     SSL_CTX_set_options(self->ctx, options);
- 
-+    /* A bare minimum cipher list without completly broken cipher suites.
-+     * It's far from perfect but gives users a better head start. */
-+    if (proto_version != PY_SSL_VERSION_SSL2) {
-+        result = SSL_CTX_set_cipher_list(ctx, "HIGH:!aNULL:!eNULL:!MD5");
-+    } else {
-+        /* SSLv2 needs MD5 */
-+        result = SSL_CTX_set_cipher_list(ctx, "HIGH:!aNULL:!eNULL");
-+    }
-+    if (result == 0) {
-+        Py_DECREF(self);
-+        ERR_clear_error();
-+        PyErr_SetString(PySSLErrorObject,
-+                        "No cipher can be selected.");
-+        return NULL;
-+    }
-+
- #if defined(SSL_MODE_RELEASE_BUFFERS)
-     /* Set SSL_MODE_RELEASE_BUFFERS. This potentially greatly reduces memory
-        usage for no cost at all. However, don't do this for OpenSSL versions
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch b/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch
deleted file mode 100644
index 2b4ba316e4..0000000000
--- a/meta/recipes-devtools/python/python3/0002-Makefile-add-target-to-split-profile-generation.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 98586d6dc598e40b8b821b0dde57599e188a7ca4 Mon Sep 17 00:00:00 2001
-From: Anuj Mittal <anuj.mittal@intel.com>
-Date: Tue, 7 Aug 2018 16:43:17 +0800
-Subject: [PATCH 2/2] Makefile: add target to split profile generation
-
-We don't want to have profile task invoked from here and want to use
-qemu-user instead. Split the profile-opt task so qemu can be invoked
-once binaries have been built with instrumentation and then we can go
-ahead and build again using the profile data generated.
-
-Upstream-Status: Inappropriate [OE-specific]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- Makefile.pre.in | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 84bc3ff..017a2c4 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -469,13 +469,12 @@ profile-opt:
- 	$(MAKE) profile-removal
- 	$(MAKE) build_all_generate_profile
- 	$(MAKE) profile-removal
--	@echo "Running code to generate profile data (this can take a while):"
--	$(MAKE) run_profile_task
--	$(MAKE) build_all_merge_profile
-+
-+clean_and_use_profile:
- 	@echo "Rebuilding with profile guided optimizations:"
- 	$(MAKE) clean
- 	$(MAKE) build_all_use_profile
- 	$(MAKE) profile-removal
- 
- build_all_generate_profile:
- 	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LIBS="$(LIBS)"
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/python/python3/0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch b/meta/recipes-devtools/python/python3/0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch
deleted file mode 100644
index d48cad7586..0000000000
--- a/meta/recipes-devtools/python/python3/0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch
+++ /dev/null
@@ -1,227 +0,0 @@
-From e950ea68dab006944af194c9910b8f2341d1437d Mon Sep 17 00:00:00 2001
-From: Christian Heimes <christian@python.org>
-Date: Thu, 7 Sep 2017 20:23:52 -0700
-Subject: [PATCH] bpo-29136: Add TLS 1.3 cipher suites and OP_NO_TLSv1_3
- (GH-1363) (#3444)
-
-* bpo-29136: Add TLS 1.3 support
-
-TLS 1.3 introduces a new, distinct set of cipher suites. The TLS 1.3
-cipher suites don't overlap with cipher suites from TLS 1.2 and earlier.
-Since Python sets its own set of permitted ciphers, TLS 1.3 handshake
-will fail as soon as OpenSSL 1.1.1 is released. Let's enable the common
-AES-GCM and ChaCha20 suites.
-
-Additionally the flag OP_NO_TLSv1_3 is added. It defaults to 0 (no op) with
-OpenSSL prior to 1.1.1. This allows applications to opt-out from TLS 1.3
-now.
-
-Signed-off-by: Christian Heimes <christian@python.org>.
-(cherry picked from commit cb5b68abdeb1b1d56c581d5b4d647018703d61e3)
-
-Upstream-Status: Backport
-[https://github.com/python/cpython/commit/cb5b68abdeb1b1d56c581d5b4d647018703d61e3]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- Doc/library/ssl.rst                           | 21 ++++++++++++++
- Lib/ssl.py                                    |  7 +++++
- Lib/test/test_ssl.py                          | 29 ++++++++++++++++++-
- .../2017-09-04-16-39-49.bpo-29136.vSn1oR.rst  |  1 +
- Modules/_ssl.c                                | 13 +++++++++
- 5 files changed, 70 insertions(+), 1 deletion(-)
- create mode 100644 Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136.vSn1oR.rst
-
-diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst
-index 14f2d68217..29c5e94cf6 100644
---- a/Doc/library/ssl.rst
-+++ b/Doc/library/ssl.rst
-@@ -285,6 +285,11 @@ purposes.
- 
-      3DES was dropped from the default cipher string.
- 
-+   .. versionchanged:: 3.7
-+
-+     TLS 1.3 cipher suites TLS_AES_128_GCM_SHA256, TLS_AES_256_GCM_SHA384,
-+     and TLS_CHACHA20_POLY1305_SHA256 were added to the default cipher string.
-+
- 
- Random generation
- ^^^^^^^^^^^^^^^^^
-@@ -719,6 +724,16 @@ Constants
- 
-    .. versionadded:: 3.4
- 
-+.. data:: OP_NO_TLSv1_3
-+
-+   Prevents a TLSv1.3 connection. This option is only applicable in conjunction
-+   with :const:`PROTOCOL_TLS`. It prevents the peers from choosing TLSv1.3 as
-+   the protocol version. TLS 1.3 is available with OpenSSL 1.1.1 or later.
-+   When Python has been compiled against an older version of OpenSSL, the
-+   flag defaults to *0*.
-+
-+   .. versionadded:: 3.7
-+
- .. data:: OP_CIPHER_SERVER_PREFERENCE
- 
-    Use the server's cipher ordering preference, rather than the client's.
-@@ -783,6 +798,12 @@ Constants
- 
-    .. versionadded:: 3.3
- 
-+.. data:: HAS_TLSv1_3
-+
-+   Whether the OpenSSL library has built-in support for the TLS 1.3 protocol.
-+
-+   .. versionadded:: 3.7
-+
- .. data:: CHANNEL_BINDING_TYPES
- 
-    List of supported TLS channel binding types.  Strings in this list
-diff --git a/Lib/ssl.py b/Lib/ssl.py
-index 4d302a78fa..f233e72e1f 100644
---- a/Lib/ssl.py
-+++ b/Lib/ssl.py
-@@ -122,6 +122,7 @@ _import_symbols('OP_')
- _import_symbols('ALERT_DESCRIPTION_')
- _import_symbols('SSL_ERROR_')
- _import_symbols('VERIFY_')
-+from _ssl import HAS_SNI, HAS_ECDH, HAS_NPN, HAS_ALPN, HAS_TLSv1_3
- 
- from _ssl import HAS_SNI, HAS_ECDH, HAS_NPN, HAS_ALPN
- 
-@@ -162,6 +163,7 @@ else:
- # (OpenSSL's default setting is 'DEFAULT:!aNULL:!eNULL')
- # Enable a better set of ciphers by default
- # This list has been explicitly chosen to:
-+#   * TLS 1.3 ChaCha20 and AES-GCM cipher suites
- #   * Prefer cipher suites that offer perfect forward secrecy (DHE/ECDHE)
- #   * Prefer ECDHE over DHE for better performance
- #   * Prefer AEAD over CBC for better performance and security
-@@ -173,6 +175,8 @@ else:
- #   * Disable NULL authentication, NULL encryption, 3DES and MD5 MACs
- #     for security reasons
- _DEFAULT_CIPHERS = (
-+    'TLS13-AES-256-GCM-SHA384:TLS13-CHACHA20-POLY1305-SHA256:'
-+    'TLS13-AES-128-GCM-SHA256:'
-     'ECDH+AESGCM:ECDH+CHACHA20:DH+AESGCM:DH+CHACHA20:ECDH+AES256:DH+AES256:'
-     'ECDH+AES128:DH+AES:ECDH+HIGH:DH+HIGH:RSA+AESGCM:RSA+AES:RSA+HIGH:'
-     '!aNULL:!eNULL:!MD5:!3DES'
-@@ -180,6 +184,7 @@ _DEFAULT_CIPHERS = (
- 
- # Restricted and more secure ciphers for the server side
- # This list has been explicitly chosen to:
-+#   * TLS 1.3 ChaCha20 and AES-GCM cipher suites
- #   * Prefer cipher suites that offer perfect forward secrecy (DHE/ECDHE)
- #   * Prefer ECDHE over DHE for better performance
- #   * Prefer AEAD over CBC for better performance and security
-@@ -190,6 +195,8 @@ _DEFAULT_CIPHERS = (
- #   * Disable NULL authentication, NULL encryption, MD5 MACs, DSS, RC4, and
- #     3DES for security reasons
- _RESTRICTED_SERVER_CIPHERS = (
-+    'TLS13-AES-256-GCM-SHA384:TLS13-CHACHA20-POLY1305-SHA256:'
-+    'TLS13-AES-128-GCM-SHA256:'
-     'ECDH+AESGCM:ECDH+CHACHA20:DH+AESGCM:DH+CHACHA20:ECDH+AES256:DH+AES256:'
-     'ECDH+AES128:DH+AES:ECDH+HIGH:DH+HIGH:RSA+AESGCM:RSA+AES:RSA+HIGH:'
-     '!aNULL:!eNULL:!MD5:!DSS:!RC4:!3DES'
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index f91af7bd05..1acc12ec2d 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -150,6 +150,13 @@ class BasicSocketTests(unittest.TestCase):
-             ssl.OP_NO_COMPRESSION
-         self.assertIn(ssl.HAS_SNI, {True, False})
-         self.assertIn(ssl.HAS_ECDH, {True, False})
-+        ssl.OP_NO_SSLv2
-+        ssl.OP_NO_SSLv3
-+        ssl.OP_NO_TLSv1
-+        ssl.OP_NO_TLSv1_3
-+    if ssl.OPENSSL_VERSION_INFO >= (1, 0, 1):
-+            ssl.OP_NO_TLSv1_1
-+            ssl.OP_NO_TLSv1_2
- 
-     def test_str_for_enums(self):
-         # Make sure that the PROTOCOL_* constants have enum-like string
-@@ -3028,12 +3035,33 @@ else:
-                     self.assertEqual(s.version(), 'TLSv1')
-                 self.assertIs(s.version(), None)
- 
-+        @unittest.skipUnless(ssl.HAS_TLSv1_3,
-+                             "test requires TLSv1.3 enabled OpenSSL")
-+        def test_tls1_3(self):
-+            context = ssl.SSLContext(ssl.PROTOCOL_TLS)
-+            context.load_cert_chain(CERTFILE)
-+            # disable all but TLS 1.3
-+            context.options |= (
-+                ssl.OP_NO_TLSv1 | ssl.OP_NO_TLSv1_1 | ssl.OP_NO_TLSv1_2
-+            )
-+            with ThreadedEchoServer(context=context) as server:
-+                with context.wrap_socket(socket.socket()) as s:
-+                    s.connect((HOST, server.port))
-+                    self.assertIn(s.cipher()[0], [
-+                        'TLS13-AES-256-GCM-SHA384',
-+                        'TLS13-CHACHA20-POLY1305-SHA256',
-+                        'TLS13-AES-128-GCM-SHA256',
-+                    ])
-+
-         @unittest.skipUnless(ssl.HAS_ECDH, "test requires ECDH-enabled OpenSSL")
-         def test_default_ecdh_curve(self):
-             # Issue #21015: elliptic curve-based Diffie Hellman key exchange
-             # should be enabled by default on SSL contexts.
-             context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
-             context.load_cert_chain(CERTFILE)
-+            # TLSv1.3 defaults to PFS key agreement and no longer has KEA in
-+            # cipher name.
-+            context.options |= ssl.OP_NO_TLSv1_3
-             # Prior to OpenSSL 1.0.0, ECDH ciphers have to be enabled
-             # explicitly using the 'ECCdraft' cipher alias.  Otherwise,
-             # our default cipher list should prefer ECDH-based ciphers
-@@ -3394,7 +3422,6 @@ else:
-                         s.sendfile(file)
-                         self.assertEqual(s.recv(1024), TEST_DATA)
- 
--
- def test_main(verbose=False):
-     if support.verbose:
-         import warnings
-diff --git a/Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136.vSn1oR.rst b/Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136.vSn1oR.rst
-new file mode 100644
-index 0000000000..e76997ef83
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136.vSn1oR.rst
-@@ -0,0 +1 @@
-+Add TLS 1.3 cipher suites and OP_NO_TLSv1_3.
-diff --git a/Modules/_ssl.c b/Modules/_ssl.c
-index 0d5c121d2c..c71d89607c 100644
---- a/Modules/_ssl.c
-+++ b/Modules/_ssl.c
-@@ -4842,6 +4842,11 @@ PyInit__ssl(void)
- #if HAVE_TLSv1_2
-     PyModule_AddIntConstant(m, "OP_NO_TLSv1_1", SSL_OP_NO_TLSv1_1);
-     PyModule_AddIntConstant(m, "OP_NO_TLSv1_2", SSL_OP_NO_TLSv1_2);
-+#endif
-+#ifdef SSL_OP_NO_TLSv1_3
-+    PyModule_AddIntConstant(m, "OP_NO_TLSv1_3", SSL_OP_NO_TLSv1_3);
-+#else
-+    PyModule_AddIntConstant(m, "OP_NO_TLSv1_3", 0);
- #endif
-     PyModule_AddIntConstant(m, "OP_CIPHER_SERVER_PREFERENCE",
-                             SSL_OP_CIPHER_SERVER_PREFERENCE);
-@@ -4890,6 +4895,14 @@ PyInit__ssl(void)
-     Py_INCREF(r);
-     PyModule_AddObject(m, "HAS_ALPN", r);
- 
-+#if defined(TLS1_3_VERSION) && !defined(OPENSSL_NO_TLS1_3)
-+    r = Py_True;
-+#else
-+    r = Py_False;
-+#endif
-+    Py_INCREF(r);
-+    PyModule_AddObject(m, "HAS_TLSv1_3", r);
-+
-     /* Mappings for error codes */
-     err_codes_to_names = PyDict_New();
-     err_names_to_codes = PyDict_New();
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/python/python3/0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch b/meta/recipes-devtools/python/python3/0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch
deleted file mode 100644
index 56d591d1b5..0000000000
--- a/meta/recipes-devtools/python/python3/0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-From 170a614904febd14ff6cfd7a75c9bccc114b3948 Mon Sep 17 00:00:00 2001
-From: Christian Heimes <christian@python.org>
-Date: Tue, 14 Aug 2018 16:56:32 +0200
-Subject: [PATCH] bpo-32947: Fixes for TLS 1.3 and OpenSSL 1.1.1 (GH-8761)
-
-Backport of TLS 1.3 related fixes from 3.7.
-
-Misc fixes and workarounds for compatibility with OpenSSL 1.1.1 from git
-master and TLS 1.3 support. With OpenSSL 1.1.1, Python negotiates TLS 1.3 by
-default. Some test cases only apply to TLS 1.2.
-
-OpenSSL 1.1.1 has added a new option OP_ENABLE_MIDDLEBOX_COMPAT for TLS
-1.3. The feature is enabled by default for maximum compatibility with
-broken middle boxes. Users should be able to disable the hack and CPython's test suite needs
-it to verify default options
-
-Signed-off-by: Christian Heimes <christian@python.org>
-
-Upstream-Status: Backport
-[https://github.com/python/cpython/commit/2a4ee8aa01d61b6a9c8e9c65c211e61bdb471826]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- Doc/library/ssl.rst                           |  9 ++++++
- Lib/test/test_asyncio/test_events.py          |  6 +++-
- Lib/test/test_ssl.py                          | 29 +++++++++++++++----
- .../2018-08-14-08-57-01.bpo-32947.mqStVW.rst  |  2 ++
- Modules/_ssl.c                                |  4 +++
- 5 files changed, 44 insertions(+), 6 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Library/2018-08-14-08-57-01.bpo-32947.mqStVW.rst
-
-diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst
-index 29c5e94cf6..f63a3deec5 100644
---- a/Doc/library/ssl.rst
-+++ b/Doc/library/ssl.rst
-@@ -757,6 +757,15 @@ Constants
- 
-    .. versionadded:: 3.3
- 
-+.. data:: OP_ENABLE_MIDDLEBOX_COMPAT
-+
-+   Send dummy Change Cipher Spec (CCS) messages in TLS 1.3 handshake to make
-+   a TLS 1.3 connection look more like a TLS 1.2 connection.
-+
-+   This option is only available with OpenSSL 1.1.1 and later.
-+
-+   .. versionadded:: 3.6.7
-+
- .. data:: OP_NO_COMPRESSION
- 
-    Disable compression on the SSL channel.  This is useful if the application
-diff --git a/Lib/test/test_asyncio/test_events.py b/Lib/test/test_asyncio/test_events.py
-index 492a84a231..6f208474b9 100644
---- a/Lib/test/test_asyncio/test_events.py
-+++ b/Lib/test/test_asyncio/test_events.py
-@@ -1169,7 +1169,11 @@ class EventLoopTestsMixin:
-                     self.loop.run_until_complete(f_c)
- 
-         # close connection
--        proto.transport.close()
-+        # transport may be None with TLS 1.3, because connection is
-+        # interrupted, server is unable to send session tickets, and
-+        # transport is closed.
-+        if proto.transport is not None:
-+            proto.transport.close()
-         server.close()
- 
-     def test_legacy_create_server_ssl_match_failed(self):
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index 1acc12ec2d..a2e1d32a62 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -78,6 +78,7 @@ OP_NO_COMPRESSION = getattr(ssl, "OP_NO_COMPRESSION", 0)
- OP_SINGLE_DH_USE = getattr(ssl, "OP_SINGLE_DH_USE", 0)
- OP_SINGLE_ECDH_USE = getattr(ssl, "OP_SINGLE_ECDH_USE", 0)
- OP_CIPHER_SERVER_PREFERENCE = getattr(ssl, "OP_CIPHER_SERVER_PREFERENCE", 0)
-+OP_ENABLE_MIDDLEBOX_COMPAT = getattr(ssl, "OP_ENABLE_MIDDLEBOX_COMPAT", 0)
- 
- 
- def handle_error(prefix):
-@@ -155,8 +156,8 @@ class BasicSocketTests(unittest.TestCase):
-         ssl.OP_NO_TLSv1
-         ssl.OP_NO_TLSv1_3
-     if ssl.OPENSSL_VERSION_INFO >= (1, 0, 1):
--            ssl.OP_NO_TLSv1_1
--            ssl.OP_NO_TLSv1_2
-+        ssl.OP_NO_TLSv1_1
-+        ssl.OP_NO_TLSv1_2
- 
-     def test_str_for_enums(self):
-         # Make sure that the PROTOCOL_* constants have enum-like string
-@@ -854,7 +855,8 @@ class ContextTests(unittest.TestCase):
-         default = (ssl.OP_ALL | ssl.OP_NO_SSLv2 | ssl.OP_NO_SSLv3)
-         # SSLContext also enables these by default
-         default |= (OP_NO_COMPRESSION | OP_CIPHER_SERVER_PREFERENCE |
--                    OP_SINGLE_DH_USE | OP_SINGLE_ECDH_USE)
-+                    OP_SINGLE_DH_USE | OP_SINGLE_ECDH_USE |
-+                    OP_ENABLE_MIDDLEBOX_COMPAT)
-         self.assertEqual(default, ctx.options)
-         ctx.options |= ssl.OP_NO_TLSv1
-         self.assertEqual(default | ssl.OP_NO_TLSv1, ctx.options)
-@@ -1860,11 +1862,26 @@ else:
-                         self.sock, server_side=True)
-                     self.server.selected_npn_protocols.append(self.sslconn.selected_npn_protocol())
-                     self.server.selected_alpn_protocols.append(self.sslconn.selected_alpn_protocol())
--                except (ssl.SSLError, ConnectionResetError) as e:
-+                except (ConnectionResetError, BrokenPipeError) as e:
-                     # We treat ConnectionResetError as though it were an
-                     # SSLError - OpenSSL on Ubuntu abruptly closes the
-                     # connection when asked to use an unsupported protocol.
-                     #
-+                    # BrokenPipeError is raised in TLS 1.3 mode, when OpenSSL
-+                    # tries to send session tickets after handshake.
-+                    # https://github.com/openssl/openssl/issues/6342
-+                    self.server.conn_errors.append(str(e))
-+                    if self.server.chatty:
-+                        handle_error(
-+                            "\n server:  bad connection attempt from " + repr(
-+                                self.addr) + ":\n")
-+                    self.running = False
-+                    self.close()
-+                    return False
-+                except (ssl.SSLError, OSError) as e:
-+                    # OSError may occur with wrong protocols, e.g. both
-+                    # sides use PROTOCOL_TLS_SERVER.
-+                    #
-                     # XXX Various errors can have happened here, for example
-                     # a mismatching protocol version, an invalid certificate,
-                     # or a low-level bug. This should be made more discriminating.
-@@ -2974,7 +2991,7 @@ else:
-                 # Block on the accept and wait on the connection to close.
-                 evt.set()
-                 remote, peer = server.accept()
--                remote.recv(1)
-+                remote.send(remote.recv(4))
- 
-             t = threading.Thread(target=serve)
-             t.start()
-@@ -2982,6 +2999,8 @@ else:
-             evt.wait()
-             client = context.wrap_socket(socket.socket())
-             client.connect((host, port))
-+            client.send(b'data')
-+            client.recv()
-             client_addr = client.getsockname()
-             client.close()
-             t.join()
-diff --git a/Misc/NEWS.d/next/Library/2018-08-14-08-57-01.bpo-32947.mqStVW.rst b/Misc/NEWS.d/next/Library/2018-08-14-08-57-01.bpo-32947.mqStVW.rst
-new file mode 100644
-index 0000000000..28de360c36
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2018-08-14-08-57-01.bpo-32947.mqStVW.rst
-@@ -0,0 +1,2 @@
-+Add OP_ENABLE_MIDDLEBOX_COMPAT and test workaround for TLSv1.3 for future
-+compatibility with OpenSSL 1.1.1.
-diff --git a/Modules/_ssl.c b/Modules/_ssl.c
-index c71d89607c..eb123a87ba 100644
---- a/Modules/_ssl.c
-+++ b/Modules/_ssl.c
-@@ -4858,6 +4858,10 @@ PyInit__ssl(void)
-     PyModule_AddIntConstant(m, "OP_NO_COMPRESSION",
-                             SSL_OP_NO_COMPRESSION);
- #endif
-+#ifdef SSL_OP_ENABLE_MIDDLEBOX_COMPAT
-+    PyModule_AddIntConstant(m, "OP_ENABLE_MIDDLEBOX_COMPAT",
-+                            SSL_OP_ENABLE_MIDDLEBOX_COMPAT);
-+#endif
- 
- #if HAVE_SNI
-     r = Py_True;
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/python/python3/0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch b/meta/recipes-devtools/python/python3/0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch
deleted file mode 100644
index b97d5501e1..0000000000
--- a/meta/recipes-devtools/python/python3/0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 0c9354362bfa5f90fbea8ff8237a1f1f5dba686f Mon Sep 17 00:00:00 2001
-From: Christian Heimes <christian@python.org>
-Date: Wed, 12 Sep 2018 15:20:31 +0800
-Subject: [PATCH] bpo-33570: TLS 1.3 ciphers for OpenSSL 1.1.1 (GH-6976)
-
-Change TLS 1.3 cipher suite settings for compatibility with OpenSSL
-1.1.1-pre6 and newer. OpenSSL 1.1.1 will have TLS 1.3 cipers enabled by
-default.
-
-Also update multissltests and Travis config to test with latest OpenSSL.
-
-Signed-off-by: Christian Heimes <christian@python.org>
-(cherry picked from commit e8eb6cb7920ded66abc5d284319a8539bdc2bae3)
-
-Co-authored-by: Christian Heimes <christian@python.org
-
-Upstream-Status: Backport
-[https://github.com/python/cpython/commit/3e630c541b35c96bfe5619165255e559f577ee71]
-
-Tweaked patch to not take changes for multissltests and Travis config.
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- Lib/test/test_ssl.py | 51 ++++++++++++++++++++++----------------------
- 1 file changed, 26 insertions(+), 25 deletions(-)
-
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index a2e1d32a62..c484ead5ff 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -3024,17 +3024,21 @@ else:
-                     sock.do_handshake()
-                 self.assertEqual(cm.exception.errno, errno.ENOTCONN)
- 
--        def test_default_ciphers(self):
--            context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
--            try:
--                # Force a set of weak ciphers on our client context
--                context.set_ciphers("DES")
--            except ssl.SSLError:
--                self.skipTest("no DES cipher available")
--            with ThreadedEchoServer(CERTFILE,
--                                    ssl_version=ssl.PROTOCOL_SSLv23,
--                                    chatty=False) as server:
--                with context.wrap_socket(socket.socket()) as s:
-+        def test_no_shared_ciphers(self):
-+            server_context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
-+            server_context.load_cert_chain(SIGNED_CERTFILE)
-+            client_context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
-+            client_context.verify_mode = ssl.CERT_REQUIRED
-+            client_context.check_hostname = True
-+
-+            client_context.set_ciphers("AES128")
-+            server_context.set_ciphers("AES256")
-+            # OpenSSL enables all TLS 1.3 ciphers, enforce TLS 1.2 for test
-+            client_context.options |= ssl.OP_NO_TLSv1_3
-+            with ThreadedEchoServer(context=server_context) as server:
-+                with client_context.wrap_socket(
-+                        socket.socket(),
-+                        server_hostname="localhost") as s:
-                     with self.assertRaises(OSError):
-                         s.connect((HOST, server.port))
-             self.assertIn("no shared cipher", str(server.conn_errors[0]))
-@@ -3067,9 +3071,9 @@ else:
-                 with context.wrap_socket(socket.socket()) as s:
-                     s.connect((HOST, server.port))
-                     self.assertIn(s.cipher()[0], [
--                        'TLS13-AES-256-GCM-SHA384',
--                        'TLS13-CHACHA20-POLY1305-SHA256',
--                        'TLS13-AES-128-GCM-SHA256',
-+                        'TLS_AES_256_GCM_SHA384',
-+                        'TLS_CHACHA20_POLY1305_SHA256',
-+                        'TLS_AES_128_GCM_SHA256',
-                     ])
- 
-         @unittest.skipUnless(ssl.HAS_ECDH, "test requires ECDH-enabled OpenSSL")
-@@ -3391,22 +3395,19 @@ else:
-             client_context = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
-             client_context.verify_mode = ssl.CERT_REQUIRED
-             client_context.load_verify_locations(SIGNING_CA)
--            if ssl.OPENSSL_VERSION_INFO >= (1, 0, 2):
--                client_context.set_ciphers("AES128:AES256")
--                server_context.set_ciphers("AES256")
--                alg1 = "AES256"
--                alg2 = "AES-256"
--            else:
--                client_context.set_ciphers("AES:3DES")
--                server_context.set_ciphers("3DES")
--                alg1 = "3DES"
--                alg2 = "DES-CBC3"
-+            client_context.set_ciphers("AES128:AES256")
-+            server_context.set_ciphers("AES256")
-+            expected_algs = [
-+                "AES256", "AES-256",
-+                 # TLS 1.3 ciphers are always enabled
-+                 "TLS_CHACHA20", "TLS_AES",
-+            ]
- 
-             stats = server_params_test(client_context, server_context)
-             ciphers = stats['server_shared_ciphers'][0]
-             self.assertGreater(len(ciphers), 0)
-             for name, tls_version, bits in ciphers:
--                if not alg1 in name.split("-") and alg2 not in name:
-+                if not any (alg in name for alg in expected_algs):
-                     self.fail(name)
- 
-         def test_read_write_after_close_raises_valuerror(self):
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/python/python3/0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch b/meta/recipes-devtools/python/python3/0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch
deleted file mode 100644
index d609847204..0000000000
--- a/meta/recipes-devtools/python/python3/0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 7b40cb7293cb14e5c7c8ed123efaf9acb33edae2 Mon Sep 17 00:00:00 2001
-From: Christian Heimes <christian@python.org>
-Date: Tue, 15 Aug 2017 10:33:43 +0200
-Subject: [PATCH] bpo-30714: ALPN changes for OpenSSL 1.1.0f (#2305)
-
-OpenSSL 1.1.0 to 1.1.0e aborted the handshake when server and client
-could not agree on a protocol using ALPN. OpenSSL 1.1.0f changed that.
-The most recent version now behaves like OpenSSL 1.0.2 again. The ALPN
-callback can pretend to not been set.
-
-See https://github.com/openssl/openssl/pull/3158 for more details
-
-Signed-off-by: Christian Heimes <christian@python.org>
-
-Upstream-Status: Backport
-[https://github.com/python/cpython/commit/7b40cb7293cb14e5c7c8ed123efaf9acb33edae2]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- Doc/library/ssl.rst                                          | 5 +++--
- Lib/test/test_ssl.py                                         | 5 +++--
- .../next/Tests/2017-07-25-15-27-44.bpo-30715.Sp7bTF.rst      | 2 ++
- 3 files changed, 8 insertions(+), 4 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Tests/2017-07-25-15-27-44.bpo-30715.Sp7bTF.rst
-
-diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst
-index 729a239a1b..0a09e7e9d4 100644
---- a/Doc/library/ssl.rst
-+++ b/Doc/library/ssl.rst
-@@ -1447,8 +1447,9 @@ to speed up repeated connections from the same clients.
-    This method will raise :exc:`NotImplementedError` if :data:`HAS_ALPN` is
-    False.
- 
--   OpenSSL 1.1.0+ will abort the handshake and raise :exc:`SSLError` when
--   both sides support ALPN but cannot agree on a protocol.
-+   OpenSSL 1.1.0 to 1.1.0e will abort the handshake and raise :exc:`SSLError`
-+   when both sides support ALPN but cannot agree on a protocol. 1.1.0f+
-+   behaves like 1.0.2, :meth:`SSLSocket.selected_alpn_protocol` returns None.
- 
-    .. versionadded:: 3.5
- 
-diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
-index d960d82065..104b7f377a 100644
---- a/Lib/test/test_ssl.py
-+++ b/Lib/test/test_ssl.py
-@@ -3268,8 +3268,9 @@ if _have_threads:
-                 except ssl.SSLError as e:
-                     stats = e
- 
--                if expected is None and IS_OPENSSL_1_1:
--                    # OpenSSL 1.1.0 raises handshake error
-+                if (expected is None and IS_OPENSSL_1_1
-+                        and ssl.OPENSSL_VERSION_INFO < (1, 1, 0, 6)):
-+                    # OpenSSL 1.1.0 to 1.1.0e raises handshake error
-                     self.assertIsInstance(stats, ssl.SSLError)
-                 else:
-                     msg = "failed trying %s (s) and %s (c).\n" \
-diff --git a/Misc/NEWS.d/next/Tests/2017-07-25-15-27-44.bpo-30715.Sp7bTF.rst b/Misc/NEWS.d/next/Tests/2017-07-25-15-27-44.bpo-30715.Sp7bTF.rst
-new file mode 100644
-index 0000000000..88394e585c
---- /dev/null
-+++ b/Misc/NEWS.d/next/Tests/2017-07-25-15-27-44.bpo-30715.Sp7bTF.rst
-@@ -0,0 +1,2 @@
-+Address ALPN callback changes for OpenSSL 1.1.0f. The latest version behaves
-+like OpenSSL 1.0.2 and no longer aborts handshake.
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch b/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
index fddfd2b2f6..b916d04d05 100644
--- a/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
+++ b/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
@@ -4,11 +4,11 @@ Upstream-Status: Inappropriate [embedded specific]
 # will not be found.
 # Signed-Off: Michael 'Mickey' Lauer <mickey@vanille.de>
 
-Index: Python-3.3.0rc2/setup.py
-===================================================================
---- Python-3.3.0rc2.orig/setup.py	2012-09-20 15:24:14.009124003 -0700
-+++ Python-3.3.0rc2/setup.py	2012-09-20 15:25:08.449124963 -0700
-@@ -1620,7 +1620,7 @@
+diff --git a/setup.py b/setup.py
+index 37c5dd58a6..7f0e4d1010 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1803,7 +1803,7 @@ class PyBuildExt(build_ext):
                  dotversion = dotversion[:-1] + '.' + dotversion[-1]
              tcl_include_sub = []
              tk_include_sub = []
@@ -17,7 +17,7 @@ Index: Python-3.3.0rc2/setup.py
                  tcl_include_sub += [dir + os.sep + "tcl" + dotversion]
                  tk_include_sub += [dir + os.sep + "tk" + dotversion]
              tk_include_sub += tcl_include_sub
-@@ -1639,22 +1639,6 @@
+@@ -1822,22 +1822,6 @@ class PyBuildExt(build_ext):
              if dir not in include_dirs:
                  include_dirs.append(dir)
  
diff --git a/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch b/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
index 6beac7b805..c12f11c6e7 100644
--- a/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
+++ b/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
@@ -22,12 +22,3 @@ Index: Python-3.3.2/setup.py
  
          # Add paths specified in the environment variables LDFLAGS and
          # CPPFLAGS for header and library files.
-@@ -480,7 +481,7 @@ class PyBuildExt(build_ext):
-                     for directory in reversed(options.dirs):
-                         add_dir_to_list(dir_list, directory)
- 
--        if os.path.normpath(sys.base_prefix) != '/usr' \
-+        if not cross_compiling and os.path.normpath(sys.base_prefix) != '/usr' \
-                 and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
-             # OSX note: Don't add LIBDIR and INCLUDEDIR to building a framework
-             # (PYTHONFRAMEWORK is set) to avoid # linking problems when
diff --git a/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch b/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
index b96419a638..1bd6e56117 100644
--- a/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
+++ b/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
@@ -14,11 +14,11 @@ Upstream-Status: Inappropriate [Embedded-Specific]
  
  
      def copy_scripts(self):
--        """Copy each script listed in 'self.scripts'; if it's marked as a
+-        r"""Copy each script listed in 'self.scripts'; if it's marked as a
 -        Python script in the Unix way (first line matches 'first_line_re',
 -        ie. starts with "\#!" and contains "python"), then adjust the first
 -        line to refer to the current Python interpreter as we copy.
-+        """Copy each script listed in 'self.scripts'
++        r"""Copy each script listed in 'self.scripts'
          """
          self.mkpath(self.build_dir)
          outfiles = []
diff --git a/meta/recipes-devtools/python/python3/150-fix-setupterm.patch b/meta/recipes-devtools/python/python3/150-fix-setupterm.patch
deleted file mode 100644
index 78d7c78670..0000000000
--- a/meta/recipes-devtools/python/python3/150-fix-setupterm.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Fix warning with newer compiler
-
--Khem
-
-Upstream-Status: Pending
-
---- a/Modules/_cursesmodule.c
-+++ b/Modules/_cursesmodule.c
-@@ -116,7 +116,7 @@ char *PyCursesVersion = "2.2";
-     #defines many common symbols (such as "lines") which breaks the
-     curses module in other ways.  So the code will just specify
-     explicit prototypes here. */
--extern int setupterm(char *,int,int *);
-+//extern int setupterm(char *,int,int *);
- #ifdef __sgi
- #include <term.h>
- #endif
diff --git a/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch b/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
index ae74ef531d..35b849e399 100644
--- a/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
+++ b/meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
@@ -9,6 +9,11 @@ profile-optimized build.
 
 Upstream-Status: Pending
 
+2018-08:
+  * Rebased Makefile.pre.in for 3.7
+  * Remove patch for setup.py in favor of upstream fix
+  -- Jens
+
 Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
 ---
  Makefile.pre.in | 4 ++--
@@ -16,41 +21,31 @@ Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
  2 files changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index e2d5d3d..84bc3ff 100644
+index 4c23c0e411..0871c98f29 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -478,7 +478,7 @@ profile-opt:
- 	$(MAKE) profile-removal
+@@ -497,6 +497,7 @@ profile-run-stamp:
  
  build_all_generate_profile:
--	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LIBS="$(LIBS)"
-+	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LIBS="$(LIBS)"
+ 	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(PGO_PROF_GEN_FLAG)" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG)" LIBS="$(LIBS)"
++	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_GEN_FLAG)" LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG)" LIBS="$(LIBS)"
  
  run_profile_task:
- 	: # FIXME: can't run for a cross build
-@@ -488,7 +488,7 @@ build_all_merge_profile:
- 	$(LLVM_PROF_MERGER)
- 
- build_all_use_profile:
--	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(PGO_PROF_USE_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) @LTOFLAGS@"
-+	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_USE_FLAG) @LTOFLAGS@" LDFLAGS="$(LDFLAGS) @LTOFLAGS@"
+ 	@ # FIXME: can't run for a cross build
+@@ -510,14 +511,14 @@ build_all_merge_profile:
+ profile-opt: profile-run-stamp
+ 	@echo "Rebuilding with profile guided optimizations:"
+ 	-rm -f profile-clean-stamp
+-	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(PGO_PROF_USE_FLAG)" LDFLAGS="$(LDFLAGS)"
++	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS) $(EXTRA_CFLAGS) $(PGO_PROF_USE_FLAG)" LDFLAGS="$(LDFLAGS)"
  
  # Compile and run with gcov
  .PHONY=coverage coverage-lcov coverage-report
-diff --git a/setup.py b/setup.py
-index add3346..65e83b1 100644
---- a/setup.py
-+++ b/setup.py
-@@ -263,7 +263,8 @@ class PyBuildExt(build_ext):
-         # compilers
-         if compiler is not None:
-             if cross_compiling:
--                (ccshared,cflags) = (os.environ.get('CCSHARED') or '', os.environ.get('CFLAGS') or '')
-+                (ccshared,cflags) = (os.environ.get('CCSHARED') or '',
-+                                     (os.environ.get('CFLAGS') or '') + ' ' + sysconfig.get_config_var('PY_CFLAGS_NODIST'))
-             else:
-                 (ccshared,cflags) = sysconfig.get_config_vars('CCSHARED','CFLAGS')
-             args['compiler_so'] = compiler + ' ' + ccshared + ' ' + cflags
--- 
-2.17.1
-
+ coverage:
+ 	@echo "Building with support for coverage checking:"
+ 	$(MAKE) clean profile-removal
+-	$(MAKE) @DEF_MAKE_RULE@ CFLAGS="$(CFLAGS) -O0 -pg -fprofile-arcs -ftest-coverage" LIBS="$(LIBS) -lgcov"
++	$(MAKE) @DEF_MAKE_RULE@ CFLAGS="$(CFLAGS) $(EXTRA_CFLAGS) -O0 -pg -fprofile-arcs -ftest-coverage" LIBS="$(LIBS) -lgcov"
+ 
+ coverage-lcov:
+ 	@echo "Creating Coverage HTML report with LCOV:"
diff --git a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch
index f29ae53371..7e1dc4ef5b 100644
--- a/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch
+++ b/meta/recipes-devtools/python/python3/avoid-ncursesw-include-path.patch
@@ -6,16 +6,16 @@ hardcoded locations for include paths
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: Python-3.4.2/configure.ac
-===================================================================
---- Python-3.4.2.orig/configure.ac
-+++ Python-3.4.2/configure.ac
-@@ -4434,7 +4434,7 @@ fi
- 
+diff --git a/configure.ac b/configure.ac
+index 2b8aa4d592..1f5bf4b4b0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4976,7 +4976,7 @@ fi
  # first curses header check
  ac_save_cppflags="$CPPFLAGS"
--CPPFLAGS="$CPPFLAGS -I/usr/include/ncursesw"
-+CPPFLAGS="$CPPFLAGS -I=/usr/include/ncursesw"
+ if test "$cross_compiling" = no; then
+-  CPPFLAGS="$CPPFLAGS -I/usr/include/ncursesw"
++  CPPFLAGS="$CPPFLAGS -I=/usr/include/ncursesw"
+ fi
  
  AC_CHECK_HEADERS(curses.h ncurses.h)
- 
diff --git a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
index a3cc48c9a4..ebdd64b7b5 100644
--- a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
+++ b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
@@ -5,13 +5,17 @@ Avoid a warning by not adding this module to missing variable.
 Upstream-Status: Inappropriate [distribution]
 
 Also simply disable the tk module since its not in DEPENDS.
+
+2018-08: Rebased for 3.7.0
+  -- Jens
+
 Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
 
-Index: Python-3.5.3/setup.py
-===================================================================
---- Python-3.5.3.orig/setup.py
-+++ Python-3.5.3/setup.py
-@@ -1558,10 +1558,12 @@ class PyBuildExt(build_ext):
+diff --git a/setup.py b/setup.py
+index 37c5dd58a6..0321245761 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1608,10 +1608,12 @@ class PyBuildExt(build_ext):
          self.extensions.extend(exts)
  
          # Call the method for detecting whether _tkinter can be compiled
@@ -25,5 +29,5 @@ Index: Python-3.5.3/setup.py
 +        #if '_tkinter' not in [e.name for e in self.extensions]:
 +        #    missing.append('_tkinter')
  
- ##         # Uncomment these lines if you want to play with xxmodule.c
- ##         ext = Extension('xx', ['xxmodule.c'])
+         # Build the _uuid module if possible
+         uuid_incs = find_file("uuid.h", inc_dirs, ["/usr/include/uuid"])
diff --git a/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch b/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch
index 97214f9aa4..689baf00ad 100644
--- a/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch
+++ b/meta/recipes-devtools/python/python3/configure.ac-fix-LIBPL.patch
@@ -7,24 +7,27 @@ Use LIBDIR rather than prefix/lib, so that it would work when lib64.
 
 Upstream-Status: Pending
 
+2018-08: rebased and adopted for 3.7
+  -- Jens
+
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
  configure.ac |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 63aef8e..aefb27f 100644
+index 2b8aa4d592..0da15fbbdf 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4366,7 +4366,7 @@ AC_MSG_RESULT($LDVERSION)
- 
+@@ -4674,9 +4674,9 @@ AC_MSG_RESULT($LDVERSION)
  dnl define LIBPL after ABIFLAGS and LDVERSION is defined.
  AC_SUBST(PY_ENABLE_SHARED)
--LIBPL='$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}"
-+LIBPL='$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}"
+ if test x$PLATFORM_TRIPLET = x; then
+-  LIBPL='$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}"
++  LIBPL='$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}"
+ else
+-  LIBPL='$(prefix)'"/lib/python${VERSION}/config-${LDVERSION}-${PLATFORM_TRIPLET}"
++  LIBPL='$(LIBDIR)'"/python${VERSION}/config-${LDVERSION}-${PLATFORM_TRIPLET}"
+ fi
  AC_SUBST(LIBPL)
  
- # Check whether right shifting a negative integer extends the sign bit
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/python/python3/float-endian.patch b/meta/recipes-devtools/python/python3/float-endian.patch
index 6ba3f5c252..1511f00bc3 100644
--- a/meta/recipes-devtools/python/python3/float-endian.patch
+++ b/meta/recipes-devtools/python/python3/float-endian.patch
@@ -21,19 +21,19 @@ Subject: [PATCH] Don't do runtime test to get float byte order
  create mode 100644 m4/ax_c_float_words_bigendian.m4
 
 diff --git a/configure.ac b/configure.ac
-index c9b755f0f4..1215969871 100644
+index 2b8aa4d592..80aa37125f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -9,6 +9,8 @@ AC_PREREQ(2.65)
+@@ -11,6 +11,8 @@ AC_INIT(python, PYTHON_VERSION, https://bugs.python.org/)
  
- AC_INIT(python, PYTHON_VERSION, https://bugs.python.org/)
+ AC_CONFIG_MACRO_DIR(m4)
  
 +AC_CONFIG_MACRO_DIR(m4)
 +
  AC_SUBST(BASECPPFLAGS)
  if test "$srcdir" != . -a "$srcdir" != "$(pwd)"; then
      # If we're building out-of-tree, we need to make sure the following
-@@ -4128,77 +4130,19 @@ fi
+@@ -4264,77 +4266,19 @@ fi
  # * Check for various properties of floating point *
  # **************************************************
  
@@ -209,4 +209,3 @@ index 0000000000..216b90d803
 +])# AX_C_FLOAT_WORDS_BIGENDIAN
 -- 
 2.11.0
-
diff --git a/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension-for-mul.patch b/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension-for-mul.patch
index 5c3af6b626..1ce4defe95 100644
--- a/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension-for-mul.patch
+++ b/meta/recipes-devtools/python/python3/pass-missing-libraries-to-Extension-for-mul.patch
@@ -47,16 +47,19 @@ And the semaphore issue also caused multiprocessing.Queue().put() hung.
 
 Upstream-Status: Submitted [https://github.com/python/cpython/pull/2999]
 
+2018-08: rebased for 3.7
+  -- Jens
+
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  setup.py | 7 +++++--
  1 file changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 4f0f522..d05707d 100644
+index a97a7559ca..633eba8f1e 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1606,8 +1606,10 @@ class PyBuildExt(build_ext):
+@@ -1580,8 +1580,10 @@ class PyBuildExt(build_ext):
          elif host_platform.startswith('netbsd'):
              macros = dict()
              libraries = []
@@ -69,14 +72,11 @@ index 4f0f522..d05707d 100644
              macros = dict()
              libraries = ['rt']
  
-@@ -1626,6 +1628,7 @@ class PyBuildExt(build_ext):
-         if sysconfig.get_config_var('WITH_THREAD'):
-             exts.append ( Extension('_multiprocessing', multiprocessing_srcs,
-                                     define_macros=list(macros.items()),
-+                                    libraries=libraries,
-                                     include_dirs=["Modules/_multiprocessing"]))
-         else:
-             missing.append('_multiprocessing')
--- 
-2.7.4
-
+@@ -1599,6 +1601,7 @@ class PyBuildExt(build_ext):
+ 
+         exts.append ( Extension('_multiprocessing', multiprocessing_srcs,
+                                 define_macros=list(macros.items()),
++                                libraries=libraries,
+                                 include_dirs=["Modules/_multiprocessing"]))
+         # End multiprocessing
+ 
diff --git a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
index cc35dc1617..d5bafbfba1 100644
--- a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
+++ b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
@@ -4,7 +4,7 @@ Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH 01/13] get the sys.lib from python itself and do not use
  hardcoded value of 'lib'
 
-02/2015 Rebased for 3.4.2
+08/2018 Rebased for 3.7.0
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
@@ -25,12 +25,12 @@ Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
  setup.py                         |  9 ++++-----
  12 files changed, 97 insertions(+), 23 deletions(-)
 
-Index: Python-3.5.4/Include/pythonrun.h
-===================================================================
---- Python-3.5.4.orig/Include/pythonrun.h
-+++ Python-3.5.4/Include/pythonrun.h
-@@ -23,6 +23,9 @@ typedef struct {
- } PyCompilerFlags;
+diff --git a/Include/pythonrun.h b/Include/pythonrun.h
+index 6f0c6fc655..95a597b412 100644
+--- a/Include/pythonrun.h
++++ b/Include/pythonrun.h
+@@ -7,6 +7,9 @@
+ extern "C" {
  #endif
  
 +PyAPI_FUNC(const char *) Py_GetArch(void);
@@ -39,10 +39,10 @@ Index: Python-3.5.4/Include/pythonrun.h
  #ifndef Py_LIMITED_API
  PyAPI_FUNC(int) PyRun_SimpleStringFlags(const char *, PyCompilerFlags *);
  PyAPI_FUNC(int) PyRun_AnyFileFlags(FILE *, const char *, PyCompilerFlags *);
-Index: Python-3.5.4/Lib/distutils/command/install.py
-===================================================================
---- Python-3.5.4.orig/Lib/distutils/command/install.py
-+++ Python-3.5.4/Lib/distutils/command/install.py
+diff --git a/Lib/distutils/command/install.py b/Lib/distutils/command/install.py
+index 0258d3deae..352fd8f792 100644
+--- a/Lib/distutils/command/install.py
++++ b/Lib/distutils/command/install.py
 @@ -19,6 +19,8 @@ from site import USER_BASE
  from site import USER_SITE
  HAS_USER_SITE = True
@@ -63,11 +63,11 @@ Index: Python-3.5.4/Lib/distutils/command/install.py
          'headers': '$base/include/python$py_version_short$abiflags/$dist_name',
          'scripts': '$base/bin',
          'data'   : '$base',
-Index: Python-3.5.4/Lib/pydoc.py
-===================================================================
---- Python-3.5.4.orig/Lib/pydoc.py
-+++ Python-3.5.4/Lib/pydoc.py
-@@ -389,7 +389,7 @@ class Doc:
+diff --git a/Lib/pydoc.py b/Lib/pydoc.py
+index 8a6b27b16e..fc55893b18 100644
+--- a/Lib/pydoc.py
++++ b/Lib/pydoc.py
+@@ -399,7 +399,7 @@ class Doc:
      docmodule = docclass = docroutine = docother = docproperty = docdata = fail
  
      def getdocloc(self, object,
@@ -76,29 +76,30 @@ Index: Python-3.5.4/Lib/pydoc.py
                                         "python%d.%d" %  sys.version_info[:2])):
          """Return the location of module docs or None"""
  
-Index: Python-3.5.4/Lib/site.py
-===================================================================
---- Python-3.5.4.orig/Lib/site.py
-+++ Python-3.5.4/Lib/site.py
-@@ -303,12 +303,12 @@ def getsitepackages(prefixes=None):
+diff --git a/Lib/site.py b/Lib/site.py
+index ffd132b389..3ca8270d49 100644
+--- a/Lib/site.py
++++ b/Lib/site.py
+@@ -334,12 +334,12 @@ def getsitepackages(prefixes=None):
          seen.add(prefix)
  
          if os.sep == '/':
 -            sitepackages.append(os.path.join(prefix, "lib",
+-                                        "python%d.%d" % sys.version_info[:2],
 +            sitepackages.append(os.path.join(prefix, sys.lib,
-                                         "python" + sys.version[:3],
++                                        "python%d.%d" % sys.version_info[:2],
                                          "site-packages"))
          else:
              sitepackages.append(prefix)
 -            sitepackages.append(os.path.join(prefix, "lib", "site-packages"))
 +            sitepackages.append(os.path.join(prefix, sys.lib, "site-packages"))
-         if sys.platform == "darwin":
-             # for framework builds *only* we add the standard Apple
-             # locations.
-Index: Python-3.5.4/Lib/sysconfig.py
-===================================================================
---- Python-3.5.4.orig/Lib/sysconfig.py
-+++ Python-3.5.4/Lib/sysconfig.py
+     return sitepackages
+ 
+ def addsitepackages(known_paths, prefixes=None):
+diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
+index e0f9c18531..9869363977 100644
+--- a/Lib/sysconfig.py
++++ b/Lib/sysconfig.py
 @@ -20,10 +20,10 @@ __all__ = [
  
  _INSTALL_SCHEMES = {
@@ -129,7 +130,7 @@ Index: Python-3.5.4/Lib/sysconfig.py
          'include': '{installed_base}/include/python',
          'platinclude': '{installed_base}/include/python',
          'scripts': '{base}/bin',
-@@ -61,10 +61,10 @@ _INSTALL_SCHEMES = {
+@@ -62,10 +62,10 @@ _INSTALL_SCHEMES = {
          'data': '{userbase}',
          },
      'posix_user': {
@@ -144,28 +145,24 @@ Index: Python-3.5.4/Lib/sysconfig.py
          'include': '{userbase}/include/python{py_version_short}',
          'scripts': '{userbase}/bin',
          'data': '{userbase}',
-Index: Python-3.5.4/Lib/trace.py
-===================================================================
---- Python-3.5.4.orig/Lib/trace.py
-+++ Python-3.5.4/Lib/trace.py
-@@ -749,10 +749,10 @@ def main(argv=None):
-                 # should I also call expanduser? (after all, could use $HOME)
+diff --git a/Lib/trace.py b/Lib/trace.py
+index 86b2101763..f3c32ec317 100755
+--- a/Lib/trace.py
++++ b/Lib/trace.py
+@@ -659,7 +659,7 @@ def main():
+     opts = parser.parse_args()
+ 
+     if opts.ignore_dir:
+-        rel_path = 'lib', 'python{0.major}.{0.minor}'.format(sys.version_info)
++        rel_path = sys.lib, 'python{0.major}.{0.minor}'.format(sys.version_info)
+         _prefix = os.path.join(sys.base_prefix, *rel_path)
+         _exec_prefix = os.path.join(sys.base_exec_prefix, *rel_path)
  
-                 s = s.replace("$prefix",
--                              os.path.join(sys.base_prefix, "lib",
-+                              os.path.join(sys.base_prefix, sys.lib,
-                                            "python" + sys.version[:3]))
-                 s = s.replace("$exec_prefix",
--                              os.path.join(sys.base_exec_prefix, "lib",
-+                              os.path.join(sys.base_exec_prefix, sys.lib,
-                                            "python" + sys.version[:3]))
-                 s = os.path.normpath(s)
-                 ignore_dirs.append(s)
-Index: Python-3.5.4/Makefile.pre.in
-===================================================================
---- Python-3.5.4.orig/Makefile.pre.in
-+++ Python-3.5.4/Makefile.pre.in
-@@ -109,6 +109,8 @@ CFLAGS_ALIASING=@CFLAGS_ALIASING@
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 31b4bcabb3..713215e57d 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -114,6 +114,8 @@ CFLAGS_ALIASING=@CFLAGS_ALIASING@
  
  # Machine-dependent subdirectories
  MACHDEP=	@MACHDEP@
@@ -174,7 +171,7 @@ Index: Python-3.5.4/Makefile.pre.in
  
  # Multiarch directory (may be empty)
  MULTIARCH=	@MULTIARCH@
-@@ -128,7 +130,7 @@ LIBDIR=		@libdir@
+@@ -134,7 +136,7 @@ LIBDIR=		@libdir@
  MANDIR=		@mandir@
  INCLUDEDIR=	@includedir@
  CONFINCLUDEDIR=	$(exec_prefix)/include
@@ -183,7 +180,7 @@ Index: Python-3.5.4/Makefile.pre.in
  ABIFLAGS=	@ABIFLAGS@
  
  # Detailed destination directories
-@@ -731,6 +733,7 @@ Modules/getpath.o: $(srcdir)/Modules/get
+@@ -754,6 +756,7 @@ Modules/getpath.o: $(srcdir)/Modules/getpath.c Makefile
  		-DEXEC_PREFIX='"$(exec_prefix)"' \
  		-DVERSION='"$(VERSION)"' \
  		-DVPATH='"$(VPATH)"' \
@@ -191,8 +188,8 @@ Index: Python-3.5.4/Makefile.pre.in
  		-o $@ $(srcdir)/Modules/getpath.c
  
  Programs/python.o: $(srcdir)/Programs/python.c
-@@ -813,7 +816,7 @@ regen-opcode:
- Python/compile.o Python/symtable.o Python/ast.o: $(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
+@@ -842,7 +845,7 @@ regen-opcode:
+ Python/compile.o Python/symtable.o Python/ast_unparse.o Python/ast.o: $(srcdir)/Include/graminit.h $(srcdir)/Include/Python-ast.h
  
  Python/getplatform.o: $(srcdir)/Python/getplatform.c
 -		$(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -o $@ $(srcdir)/Python/getplatform.c
@@ -200,11 +197,11 @@ Index: Python-3.5.4/Makefile.pre.in
  
  Python/importdl.o: $(srcdir)/Python/importdl.c
  		$(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
-Index: Python-3.5.4/Modules/getpath.c
-===================================================================
---- Python-3.5.4.orig/Modules/getpath.c
-+++ Python-3.5.4/Modules/getpath.c
-@@ -105,6 +105,13 @@
+diff --git a/Modules/getpath.c b/Modules/getpath.c
+index 041cb14b4b..d52d1e1cdb 100644
+--- a/Modules/getpath.c
++++ b/Modules/getpath.c
+@@ -106,6 +106,13 @@ extern "C" {
  #error "PREFIX, EXEC_PREFIX, VERSION, and VPATH must be constant defined"
  #endif
  
@@ -218,30 +215,22 @@ Index: Python-3.5.4/Modules/getpath.c
  #ifndef LANDMARK
  #define LANDMARK L"os.py"
  #endif
-@@ -113,6 +120,7 @@ static wchar_t prefix[MAXPATHLEN+1];
- static wchar_t exec_prefix[MAXPATHLEN+1];
- static wchar_t progpath[MAXPATHLEN+1];
- static wchar_t *module_search_path = NULL;
-+static wchar_t *lib_python = L"" LIB_PYTHON;
- 
- /* Get file status. Encode the path to the locale encoding. */
- 
-@@ -494,7 +502,7 @@ calculate_path(void)
-     _pythonpath = Py_DecodeLocale(PYTHONPATH, NULL);
-     _prefix = Py_DecodeLocale(PREFIX, NULL);
-     _exec_prefix = Py_DecodeLocale(EXEC_PREFIX, NULL);
--    lib_python = Py_DecodeLocale("lib/python" VERSION, NULL);
-+    lib_python = Py_DecodeLocale(LIB_PYTHON, NULL);
- 
-     if (!_pythonpath || !_prefix || !_exec_prefix || !lib_python) {
-         Py_FatalError(
-Index: Python-3.5.4/Python/getplatform.c
-===================================================================
---- Python-3.5.4.orig/Python/getplatform.c
-+++ Python-3.5.4/Python/getplatform.c
+@@ -867,7 +874,7 @@ calculate_init(PyCalculatePath *calculate,
+     if (!calculate->prefix) {
+         return DECODE_LOCALE_ERR("EXEC_PREFIX define", len);
+     }
+-    calculate->lib_python = Py_DecodeLocale("lib/python" VERSION, &len);
++    calculate->lib_python = Py_DecodeLocale(LIB_PYTHON, &len);
+     if (!calculate->lib_python) {
+         return DECODE_LOCALE_ERR("EXEC_PREFIX define", len);
+     }
+diff --git a/Python/getplatform.c b/Python/getplatform.c
+index 81a0f7ac53..bc7127ae3e 100644
+--- a/Python/getplatform.c
++++ b/Python/getplatform.c
 @@ -10,3 +10,23 @@ Py_GetPlatform(void)
  {
- 	return PLATFORM;
+     return PLATFORM;
  }
 +
 +#ifndef ARCH
@@ -263,11 +252,11 @@ Index: Python-3.5.4/Python/getplatform.c
 +{
 +	return LIB;
 +}
-Index: Python-3.5.4/Python/sysmodule.c
-===================================================================
---- Python-3.5.4.orig/Python/sysmodule.c
-+++ Python-3.5.4/Python/sysmodule.c
-@@ -1827,6 +1827,10 @@ _PySys_Init(void)
+diff --git a/Python/sysmodule.c b/Python/sysmodule.c
+index 177b830762..38112b831e 100644
+--- a/Python/sysmodule.c
++++ b/Python/sysmodule.c
+@@ -2324,6 +2324,10 @@ _PySys_BeginInit(PyObject **sysmod)
                          PyUnicode_FromString(Py_GetCopyright()));
      SET_SYS_FROM_STRING("platform",
                          PyUnicode_FromString(Py_GetPlatform()));
@@ -275,16 +264,16 @@ Index: Python-3.5.4/Python/sysmodule.c
 +                        PyUnicode_FromString(Py_GetArch()));
 +    SET_SYS_FROM_STRING("lib",
 +                        PyUnicode_FromString(Py_GetLib()));
-     SET_SYS_FROM_STRING("executable",
-                         PyUnicode_FromWideChar(
-                                Py_GetProgramFullPath(), -1));
-Index: Python-3.5.4/configure.ac
-===================================================================
---- Python-3.5.4.orig/configure.ac
-+++ Python-3.5.4/configure.ac
-@@ -885,6 +885,41 @@ PLATDIR=plat-$MACHDEP
- AC_SUBST(PLATDIR)
- AC_SUBST(PLATFORM_TRIPLET)
+     SET_SYS_FROM_STRING("maxsize",
+                         PyLong_FromSsize_t(PY_SSIZE_T_MAX));
+     SET_SYS_FROM_STRING("float_info",
+diff --git a/configure.ac b/configure.ac
+index 5b66624d78..1c88696532 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -867,6 +867,41 @@ AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[]])],
+ LDFLAGS="$save_LDFLAGS"
+ AC_SUBST(NO_AS_NEEDED)
  
 +AC_SUBST(ARCH)
 +AC_MSG_CHECKING(ARCH)
@@ -322,13 +311,13 @@ Index: Python-3.5.4/configure.ac
 +esac
 +AC_MSG_RESULT($LIB)
  
- AC_MSG_CHECKING([for -Wl,--no-as-needed])
- save_LDFLAGS="$LDFLAGS"
-Index: Python-3.5.4/setup.py
-===================================================================
---- Python-3.5.4.orig/setup.py
-+++ Python-3.5.4/setup.py
-@@ -494,7 +494,7 @@ class PyBuildExt(build_ext):
+ # checks for UNIX variants that set C preprocessor variables
+ AC_USE_SYSTEM_EXTENSIONS
+diff --git a/setup.py b/setup.py
+index 37c5dd58a6..b82b7177bc 100644
+--- a/setup.py
++++ b/setup.py
+@@ -541,7 +541,7 @@ class PyBuildExt(build_ext):
          # directories (i.e. '.' and 'Include') must be first.  See issue
          # 10520.
          if not cross_compiling:
@@ -337,17 +326,16 @@ Index: Python-3.5.4/setup.py
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
          # only change this for cross builds for 3.3, issues on Mageia
          if cross_compiling:
-@@ -552,8 +552,7 @@ class PyBuildExt(build_ext):
-         # be assumed that no additional -I,-L directives are needed.
-         if not cross_compiling:
-             lib_dirs = self.compiler.library_dirs + [
--                '/lib64', '/usr/lib64',
--                '/lib', '/usr/lib',
-+                '/' + sys.lib, '/usr/' + sys.lib,
-                 ]
-             inc_dirs = self.compiler.include_dirs + ['/usr/include']
-         else:
-@@ -745,11 +744,11 @@ class PyBuildExt(build_ext):
+@@ -579,7 +579,7 @@ class PyBuildExt(build_ext):
+             add_dir_to_list(self.compiler.include_dirs,
+                             sysconfig.get_config_var("INCLUDEDIR"))
+ 
+-        system_lib_dirs = ['/lib64', '/usr/lib64', '/lib', '/usr/lib']
++        system_lib_dirs = ['/' + sys.lib, '/usr/' + sys.lib]
+         system_include_dirs = ['/usr/include']
+         # lib_dirs and inc_dirs are used to search for files;
+         # if a file is found in one of those directories, it can
+@@ -836,11 +836,11 @@ class PyBuildExt(build_ext):
              elif curses_library:
                  readline_libs.append(curses_library)
              elif self.compiler.find_library_file(lib_dirs +
@@ -361,3 +349,26 @@ Index: Python-3.5.4/setup.py
                                     extra_link_args=readline_extra_link_args,
                                     libraries=readline_libs) )
          else:
+@@ -1054,8 +1054,7 @@ class PyBuildExt(build_ext):
+ 
+                 # check lib directories parallel to the location of the header
+                 db_dirs_to_check = [
+-                    db_incdir.replace("include", 'lib64'),
+-                    db_incdir.replace("include", 'lib'),
++                    db_incdir.replace("include", sys.lib),
+                 ]
+ 
+                 if host_platform != 'darwin':
+@@ -1166,10 +1165,8 @@ class PyBuildExt(build_ext):
+ 
+         if sqlite_incdir:
+             sqlite_dirs_to_check = [
+-                os.path.join(sqlite_incdir, '..', 'lib64'),
+-                os.path.join(sqlite_incdir, '..', 'lib'),
+-                os.path.join(sqlite_incdir, '..', '..', 'lib64'),
+-                os.path.join(sqlite_incdir, '..', '..', 'lib'),
++                os.path.join(sqlite_incdir, '..', sys.lib),
++                os.path.join(sqlite_incdir, '..', '..', sys.lib),
+             ]
+             sqlite_libfile = self.compiler.find_library_file(
+                                 sqlite_dirs_to_check + lib_dirs, 'sqlite3')
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index f922561368..e63fcb95e3 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -27,24 +27,17 @@
     "asyncio": {
         "summary": "Python Asynchronous I/",
         "rdepends": [
-            "compression",
             "core",
-            "crypt",
             "io",
             "logging",
-            "math",
-            "multiprocessing",
             "netclient",
-            "pickle",
-            "shell",
-            "stringold",
-            "threading",
-            "unixadmin"
+            "stringold"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/asyncio",
             "${libdir}/python${PYTHON_MAJMIN}/concurrent",
-            "${libdir}/python${PYTHON_MAJMIN}/concurrent/futures"
+            "${libdir}/python${PYTHON_MAJMIN}/concurrent/futures",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_asyncio.*.so"
         ],
         "cached": []
     },
@@ -149,7 +142,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/_collections_abc.py",
             "${libdir}/python${PYTHON_MAJMIN}/_markupbase.py",
             "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.py",
-            "${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py",
             "${libdir}/python${PYTHON_MAJMIN}/_weakrefset.py",
             "${libdir}/python${PYTHON_MAJMIN}/abc.py",
             "${libdir}/python${PYTHON_MAJMIN}/argparse.py",
@@ -162,6 +155,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/collections/abc.py",
             "${libdir}/python${PYTHON_MAJMIN}/configparser.py",
             "${libdir}/python${PYTHON_MAJMIN}/contextlib.py",
+            "${libdir}/python${PYTHON_MAJMIN}/contextvars.py",
             "${libdir}/python${PYTHON_MAJMIN}/copy.py",
             "${libdir}/python${PYTHON_MAJMIN}/copyreg.py",
             "${libdir}/python${PYTHON_MAJMIN}/csv.py",
@@ -191,6 +185,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/time.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/xreadlines.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_bisect.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_contextvars.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_csv.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_heapq.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_opcode.*.so",
@@ -256,6 +251,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codeop.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/configparser.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextlib.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextvars.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copy.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copyreg.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/csv.*.pyc",
@@ -323,9 +319,13 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/crypt.py",
             "${libdir}/python${PYTHON_MAJMIN}/hashlib.py",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_blake2.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_crypt.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hashlib.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_md5.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha1.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha256.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha3.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha512.*.so"
         ],
         "cached": [
@@ -729,7 +729,9 @@
     "multiprocessing": {
         "summary": "Python multiprocessing support",
         "rdepends": [
-            "core"
+            "core",
+            "io",
+            "pickle"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_multiprocessing.*.so",
@@ -740,18 +742,14 @@
     "netclient": {
         "summary": "Python Internet Protocol clients",
         "rdepends": [
-            "compression",
             "core",
             "crypt",
-            "ctypes",
             "datetime",
             "email",
             "io",
             "math",
             "mime",
-            "shell",
-            "stringold",
-            "unixadmin"
+            "stringold"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/base64.py",
@@ -1043,13 +1041,12 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/_dummy_thread.py",
             "${libdir}/python${PYTHON_MAJMIN}/_threading_local.py",
-            "${libdir}/python${PYTHON_MAJMIN}/dummy_threading.py",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/queue.py"
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_dummy_thread.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_threading_local.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dummy_threading.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/queue.*.pyc"
         ]
     },
diff --git a/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch b/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
index a4f8bd4710..c6aa581b4c 100644
--- a/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
+++ b/meta/recipes-devtools/python/python3/python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
@@ -5,21 +5,24 @@ Subject: [PATCH] python3 use CROSSPYTHONPATH for PYTHON_FOR_BUILD
 
 Upstream-Status: Inappropriate [Cross compile specific]
 
+2018-08: Rebased and adopted for 3.7
+  -- Jens
+
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: Python-3.5.4/configure.ac
-===================================================================
---- Python-3.5.4.orig/configure.ac
-+++ Python-3.5.4/configure.ac
-@@ -73,7 +73,7 @@ if test "$cross_compiling" = yes; then
+diff --git a/configure.ac b/configure.ac
+index 2b8aa4d592..a361436f4f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -75,7 +75,7 @@ if test "$cross_compiling" = yes; then
  	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
  	fi
          AC_MSG_RESULT($interp)
--	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
-+	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(CROSSPYTHONPATH) '$interp
+-	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) '$interp
++	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(CROSSPYTHONPATH) _PYTHON_SYSCONFIGDATA_NAME=_sysconfigdata_$(ABIFLAGS)_$(MACHDEP)_$(MULTIARCH) '$interp
      fi
  elif test "$cross_compiling" = maybe; then
      AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
diff --git a/meta/recipes-devtools/python/python3/regen-all.patch b/meta/recipes-devtools/python/python3/regen-all.patch
deleted file mode 100644
index 36b9d9d919..0000000000
--- a/meta/recipes-devtools/python/python3/regen-all.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-python3-native: run regen-importlib target correctly
-
-regen-importlib depends on other regen- targets, so we must be sure to
-run it after (most of) the others.  In reality, we do not need to run it
-at all since "make" will invoke it, if necessary.  We do not want to
-rely on that, though.
-
-Upstream-Status: Pending
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-
-
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -709,7 +709,8 @@ regen-importlib: Programs/_freeze_import
- ############################################################################
- # Regenerate all generated files
- 
--regen-all: regen-opcode regen-opcode-targets regen-typeslots regen-grammar regen-ast regen-importlib
-+regen-all: regen-opcode regen-opcode-targets regen-typeslots regen-grammar regen-ast
-+	$(MAKE) regen-importlib
- 
- ############################################################################
- # Special rules for object files
diff --git a/meta/recipes-devtools/python/python3/signal.patch b/meta/recipes-devtools/python/python3/signal.patch
deleted file mode 100644
index 534a097771..0000000000
--- a/meta/recipes-devtools/python/python3/signal.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 4315389df3c4e8c1f94a18ab11a4b234762132b1 Mon Sep 17 00:00:00 2001
-From: Antoine Pitrou <pitrou@free.fr>
-Date: Mon, 23 Apr 2018 22:22:49 +0200
-Subject: [PATCH] [3.6] bpo-33329: Fix multiprocessing regression on newer
- glibcs (GH-6575) (GH-6582)
-
-Starting with glibc 2.27.9000-xxx, sigaddset() can return EINVAL for some
-reserved signal numbers between 1 and NSIG.  The `range(1, NSIG)` idiom
-is commonly used to select all signals for blocking with `pthread_sigmask`.
-So we ignore the sigaddset() return value until we expose sigfillset()
-to provide a better idiom.
-(cherry picked from commit 25038ecfb665bef641abf8cb61afff7505b0e008)
----
- .../next/Library/2018-04-23-13-21-39.bpo-33329.lQ-Eod.rst  |  1 +
- Modules/signalmodule.c                                     | 14 ++++++++------
- 2 files changed, 9 insertions(+), 6 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Library/2018-04-23-13-21-39.bpo-33329.lQ-Eod.rst
-
-diff --git a/Modules/signalmodule.c b/Modules/signalmodule.c
-index e0d06b434d..138e74e8a9 100644
---- a/Modules/signalmodule.c
-+++ b/Modules/signalmodule.c
-@@ -744,7 +744,6 @@ iterable_to_sigset(PyObject *iterable, sigset_t *mask)
-     int result = -1;
-     PyObject *iterator, *item;
-     long signum;
--    int err;
- 
-     sigemptyset(mask);
- 
-@@ -766,11 +765,14 @@ iterable_to_sigset(PyObject *iterable, sigset_t *mask)
-         Py_DECREF(item);
-         if (signum == -1 && PyErr_Occurred())
-             goto error;
--        if (0 < signum && signum < NSIG)
--            err = sigaddset(mask, (int)signum);
--        else
--            err = 1;
--        if (err) {
-+        if (0 < signum && signum < NSIG) {
-+            /* bpo-33329: ignore sigaddset() return value as it can fail
-+             * for some reserved signals, but we want the `range(1, NSIG)`
-+             * idiom to allow selecting all valid signals.
-+             */
-+            (void) sigaddset(mask, (int)signum);
-+        }
-+        else {
-             PyErr_Format(PyExc_ValueError,
-                          "signal number %ld out of range", signum);
-             goto error;
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_compile.patch b/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_compile.patch
index 32ecab9fec..058cfdbc2d 100644
--- a/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_compile.patch
+++ b/meta/recipes-devtools/python/python3/support_SOURCE_DATE_EPOCH_in_py_compile.patch
@@ -36,12 +36,12 @@ The software will still work, but it will not use the .pyc file as it should.
  3 files changed, 27 insertions(+)
 
 diff --git a/Doc/library/py_compile.rst b/Doc/library/py_compile.rst
-index 0af8fb1..841f3e8 100644
+index d720e01050..c8cc738f3d 100644
 --- a/Doc/library/py_compile.rst
 +++ b/Doc/library/py_compile.rst
-@@ -53,6 +53,10 @@ byte-code cache files in the directory containing the source code.
-    :func:`compile` function.  The default of ``-1`` selects the optimization
-    level of the current interpreter.
+@@ -59,6 +59,10 @@ byte-code cache files in the directory containing the source code.
+    *invalidation_mode* will be forced to
+    :attr:`PycInvalidationMode.CHECKED_HASH`.
  
 +   If the SOURCE_DATE_EPOCH environment variable is set, the .py file mtime
 +   and timestamp entry in .pyc file header, will be limited to this value.
@@ -51,27 +51,27 @@ index 0af8fb1..841f3e8 100644
        Changed default value of *cfile* to be :PEP:`3147`-compliant.  Previous
        default was *file* + ``'c'`` (``'o'`` if optimization was enabled).
 diff --git a/Lib/py_compile.py b/Lib/py_compile.py
-index 11c5b50..62dcdc7 100644
+index 16dc0a011f..b7c28e4fdd 100644
 --- a/Lib/py_compile.py
 +++ b/Lib/py_compile.py
-@@ -137,6 +137,10 @@ def compile(file, cfile=None, dfile=None, doraise=False, optimize=-1):
-     except FileExistsError:
+@@ -149,6 +149,10 @@ def compile(file, cfile=None, dfile=None, doraise=False, optimize=-1,
          pass
-     source_stats = loader.path_stats(file)
-+    sde = os.environ.get('SOURCE_DATE_EPOCH')
-+    if sde and source_stats['mtime'] > int(sde):
-+        source_stats['mtime'] = int(sde)
-+        os.utime(file, (source_stats['mtime'], source_stats['mtime']))
-     bytecode = importlib._bootstrap_external._code_to_bytecode(
+     if invalidation_mode == PycInvalidationMode.TIMESTAMP:
+         source_stats = loader.path_stats(file)
++        sde = os.environ.get('SOURCE_DATE_EPOCH')
++        if sde and source_stats['mtime'] > int(sde):
++            source_stats['mtime'] = int(sde)
++            os.utime(file, (source_stats['mtime'], source_stats['mtime']))
+         bytecode = importlib._bootstrap_external._code_to_timestamp_pyc(
              code, source_stats['mtime'], source_stats['size'])
-     mode = importlib._bootstrap_external._calc_mode(file)
+     else:
 diff --git a/Lib/test/test_py_compile.py b/Lib/test/test_py_compile.py
-index 4a6caa5..3d09963 100644
+index 8fc0b3308c..1445a14548 100644
 --- a/Lib/test/test_py_compile.py
 +++ b/Lib/test/test_py_compile.py
-@@ -98,6 +98,25 @@ def test_bad_coding(self):
-         self.assertFalse(os.path.exists(
-             importlib.util.cache_from_source(bad_coding)))
+@@ -110,6 +110,25 @@ class PyCompileTests(unittest.TestCase):
+                 fp.read(), 'test', {})
+         self.assertEqual(flags, 0b11)
  
 +    def test_source_date_epoch(self):
 +        testtime = 123456789
diff --git a/meta/recipes-devtools/python/python3/sysroot-include-headers.patch b/meta/recipes-devtools/python/python3/sysroot-include-headers.patch
index 785b5567f2..d5983544c4 100644
--- a/meta/recipes-devtools/python/python3/sysroot-include-headers.patch
+++ b/meta/recipes-devtools/python/python3/sysroot-include-headers.patch
@@ -6,26 +6,27 @@ Should fix things like
 configure:6972: arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8 -DNDEBUG -fno-inline -D__SOFTFP__ --sysroot=/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone -c -O2 -pipe -g -feliminate-unused-debug-types  -I/usr/include/ncursesw conftest.c >&5
 cc1: warning: include location "/usr/include/ncursesw" is unsafe for cross-compilation [-Wpoison-system-directories]
 
+2018-08: Rebased to 3.7.0
+  -- Jens
 
 Signed-off-by: Khem Raj
 Upstream-Status: Pending
 
-
-Index: Python-3.3.2/setup.py
-===================================================================
---- Python-3.3.2.orig/setup.py	2013-07-30 01:30:48.000000000 -0700
-+++ Python-3.3.2/setup.py	2013-07-30 01:41:11.697862723 -0700
-@@ -1210,7 +1210,7 @@
-         panel_library = 'panel'
+diff --git a/setup.py b/setup.py
+index 37c5dd58a6..41e88a152b 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1333,7 +1333,7 @@ class PyBuildExt(build_ext):
          if curses_library == 'ncursesw':
              curses_defines.append(('HAVE_NCURSESW', '1'))
--            curses_includes.append('/usr/include/ncursesw')
-+            curses_includes.append('=/usr/include/ncursesw')
+             if not cross_compiling:
+-                curses_includes.append('/usr/include/ncursesw')
++                curses_includes.append('=/usr/include/ncursesw')
              # Bug 1464056: If _curses.so links with ncursesw,
              # _curses_panel.so must link with panelw.
              panel_library = 'panelw'
-@@ -1819,7 +1819,7 @@
-         if host_platform == 'darwin':
+@@ -1968,7 +1968,7 @@ class PyBuildExt(build_ext):
+                 return
              # OS X 10.5 comes with libffi.dylib; the include files are
              # in /usr/include/ffi
 -            inc_dirs.append('/usr/include/ffi')
diff --git a/meta/recipes-devtools/python/python3/uuid_when_cross_compiling.patch b/meta/recipes-devtools/python/python3/uuid_when_cross_compiling.patch
new file mode 100644
index 0000000000..464f873112
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/uuid_when_cross_compiling.patch
@@ -0,0 +1,24 @@
+Subject: [PATCH] util-linux uuid support
+
+Scan for uuid.h in include/uuid/ as well as in include/ to catch
+the uuid/uuid.h well supported but accidently not detected.
+
+Upstream-Status: Pending
+
+Signed-off-by: Jens Rehsack <sno@NetBSD.org>
+diff --git a/setup.py b/setup.py
+index a97a7559ca..01d8f24fdd 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1596,8 +1596,9 @@ class PyBuildExt(build_ext):
+         #    missing.append('_tkinter')
+ 
+         # Build the _uuid module if possible
+-        uuid_incs = find_file("uuid.h", inc_dirs, ["/usr/include/uuid"])
+-        if uuid_incs is not None:
++        uuid_incs = find_file("uuid.h", inc_dirs, [])
++        uuid_uuid_incs = find_file("uuid/uuid.h", inc_dirs, [])
++        if uuid_incs is not None or uuid_uuid_incs is not None:
+             if self.compiler.find_library_file(lib_dirs, 'uuid'):
+                 uuid_libs = ['uuid']
+             else:
diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
deleted file mode 100644
index 2a4547694a..0000000000
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ /dev/null
@@ -1,329 +0,0 @@
-require recipes-devtools/python/python3.inc
-
-DEPENDS = "python3-native libffi bzip2 gdbm openssl \
-           sqlite3 zlib virtual/libintl xz qemu-native \
-           qemu-helper-native virtual/crypt"
-
-DISTRO_SRC_URI ?= "file://sitecustomize.py"
-DISTRO_SRC_URI_linuxstdbase = ""
-SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
-file://python-config.patch \
-file://030-fixup-include-dirs.patch \
-file://070-dont-clean-ipkg-install.patch \
-file://080-distutils-dont_adjust_files.patch \
-file://130-readline-setup.patch \
-file://150-fix-setupterm.patch \
-file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
-file://tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch \
-file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
-${DISTRO_SRC_URI} \
-"
-
-SRC_URI += "\
-            file://03-fix-tkinter-detection.patch \
-            file://avoid_warning_about_tkinter.patch \
-            file://cgi_py.patch \
-            file://host_include_contamination.patch \
-            file://python-3.3-multilib.patch \
-            file://sysroot-include-headers.patch \
-            file://unixccompiler.patch \
-            file://avoid-ncursesw-include-path.patch \
-            file://python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
-            file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
-            file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
-            file://configure.ac-fix-LIBPL.patch \
-            file://0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch \
-            file://pass-missing-libraries-to-Extension-for-mul.patch \
-            file://Use-correct-CFLAGS-for-extensions-when-cross-compili.patch \
-            file://0002-Makefile-add-target-to-split-profile-generation.patch \
-            file://float-endian.patch \
-            file://ftplib.patch \
-            file://signal.patch \
-            file://0001-Issue-28043-SSLContext-has-improved-default-settings.patch \
-            file://0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch \
-            file://0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch \
-            file://0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch \
-            file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch \
-            file://run-ptest \
-           "
-
-inherit multilib_header python3native update-alternatives qemu ptest
-
-MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
-
-ALTERNATIVE_${PN}-dev = "python-config"
-ALTERNATIVE_LINK_NAME[python-config] = "${bindir}/python${PYTHON_BINABI}-config"
-ALTERNATIVE_TARGET[python-config] = "${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}"
-
-CONFIGUREOPTS += " --with-system-ffi "
-
-CACHED_CONFIGUREVARS = "ac_cv_have_chflags=no \
-                ac_cv_have_lchflags=no \
-                ac_cv_have_long_long_format=yes \
-                ac_cv_buggy_getaddrinfo=no \
-                ac_cv_file__dev_ptmx=yes \
-                ac_cv_file__dev_ptc=no \
-"
-
-TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
-SDK_CC_ARCH += "-DNDEBUG -fno-inline"
-EXTRA_OEMAKE += "CROSS_COMPILE=yes"
-EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ --without-ensurepip"
-
-PYTHON3_PROFILE_TASK ?= "./python -m test.regrtest --pgo test_grammar test_opcodes test_dict test_builtin test_exceptions test_types test_support || true"
-
-export CROSS_COMPILE = "${TARGET_PREFIX}"
-export CCSHARED = "-fPIC"
-
-# Fix cross compilation of different modules
-export CROSSPYTHONPATH = "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/:${B}/build/lib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${S}/Lib:${S}/Lib/plat-linux"
-
-PACKAGECONFIG ??= "readline ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'pgo', '', d)}"
-PACKAGECONFIG[readline] = ",,readline"
-# Use profile guided optimisation by running PyBench inside qemu-user
-PACKAGECONFIG[pgo] = "--enable-optimizations"
-
-do_configure_append() {
-	rm -f ${S}/Makefile.orig
-}
-
-run_make() {
-	oe_runmake PGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-		LIB=${baselib} \
-		ARCH=${TARGET_ARCH} \
-		OPT="${CFLAGS}" \
-		"$@"
-}
-
-do_compile() {
-	# regenerate platform specific files, because they depend on system headers
-	cd ${S}/Lib/plat-linux*
-	include=${STAGING_INCDIR} ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
-		${S}/Tools/scripts/h2py.py -i '(u_long)' \
-		${STAGING_INCDIR}/dlfcn.h \
-		${STAGING_INCDIR}/linux/cdrom.h \
-		${STAGING_INCDIR}/netinet/in.h \
-		${STAGING_INCDIR}/sys/types.h
-	sed -e 's,${STAGING_DIR_HOST},,g' -i *.py
-	cd -
-
-	# remove any bogus LD_LIBRARY_PATH
-	sed -i -e s,RUNSHARED=.*,RUNSHARED=, Makefile
-
-	if [ ! -f Makefile.orig ]; then
-		install -m 0644 Makefile Makefile.orig
-	fi
-	sed -i -e 's,^CONFIGURE_LDFLAGS=.*,CONFIGURE_LDFLAGS=-L. -L${STAGING_LIBDIR},g' \
-		-e 's,libdir=${libdir},libdir=${STAGING_LIBDIR},g' \
-		-e 's,libexecdir=${libexecdir},libexecdir=${STAGING_DIR_HOST}${libexecdir},g' \
-		-e 's,^LIBDIR=.*,LIBDIR=${STAGING_LIBDIR},g' \
-		-e 's,includedir=${includedir},includedir=${STAGING_INCDIR},g' \
-		-e 's,^INCLUDEDIR=.*,INCLUDE=${STAGING_INCDIR},g' \
-		-e 's,^CONFINCLUDEDIR=.*,CONFINCLUDE=${STAGING_INCDIR},g' \
-		Makefile
-	# save copy of it now, because if we do it in do_install and 
-	# then call do_install twice we get Makefile.orig == Makefile.sysroot
-	install -m 0644 Makefile Makefile.sysroot
-
-	if ${@bb.utils.contains('PACKAGECONFIG', 'pgo', 'true', 'false', d)}; then
-		run_make profile-opt
-		qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])}"
-		cat >pgo-wrapper <<EOF
-#!/bin/sh
-cd ${B}
-$qemu_binary "\$@"
-EOF
-		chmod +x pgo-wrapper
-		bbnote Gathering profiling data
-		./pgo-wrapper ${PYTHON3_PROFILE_TASK}
-		bbnote Profiling data gathered, rebuilding
-		run_make clean_and_use_profile
-	else
-		run_make libpython3.so
-		run_make
-	fi
-}
-
-do_install() {
-	# make install needs the original Makefile, or otherwise the inclues would
-	# go to ${D}${STAGING...}/...
-	install -m 0644 Makefile.orig Makefile
-
-	install -d ${D}${libdir}/pkgconfig
-	install -d ${D}${libdir}/python${PYTHON_MAJMIN}/config
-
-	# rerun the build once again with original makefile this time
-	# run install in a separate step to avoid compile/install race
-	if ${@bb.utils.contains('PACKAGECONFIG', 'pgo', 'true', 'false', d)}; then
-		run_make DESTDIR=${D} LIBDIR=${libdir} build_all_use_profile
-	else
-		run_make DESTDIR=${D} LIBDIR=${libdir}
-	fi
-
-	run_make DESTDIR=${D} LIBDIR=${libdir} install
-
-	# avoid conflict with 2to3 from Python 2
-	rm -f ${D}/${bindir}/2to3
-
-	install -m 0644 Makefile.sysroot ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
-	install -m 0644 Makefile.sysroot ${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}/Makefile
-
-	if [ -e ${WORKDIR}/sitecustomize.py ]; then
-		install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
-	fi
-
-	oe_multilib_header python${PYTHON_BINABI}/pyconfig.h
-}
-
-do_install_append_class-nativesdk () {
-	create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} PYTHONHOME='${prefix}' TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
-}
-
-SSTATE_SCAN_FILES += "Makefile"
-PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
-
-py_package_preprocess () {
-	# copy back the old Makefile to fix target package
-	install -m 0644 ${B}/Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
-	install -m 0644 ${B}/Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}/Makefile
-	# Remove references to buildmachine paths in target Makefile and _sysconfigdata
-	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
-		-e 's|${DEBUG_PREFIX_MAP}||g' \
-		-e 's:${HOSTTOOLS_DIR}/::g' \
-		-e 's:${RECIPE_SYSROOT_NATIVE}::g' \
-		-e 's:${RECIPE_SYSROOT}::g' \
-		-e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
-		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
-		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}/Makefile \
-		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py \
-		${PKGD}/${bindir}/python${PYTHON_BINABI}-config
-
-	# Recompile _sysconfigdata after modifying it
-	cd ${PKGD}
-	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
-	     -c "from py_compile import compile; compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py')"
-	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
-	     -c "from py_compile import compile; compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py', optimize=1)"
-	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
-	     -c "from py_compile import compile; compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py', optimize=2)"
-	cd -
-
-	mv ${PKGD}/${bindir}/python${PYTHON_BINABI}-config ${PKGD}/${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}
-}
-
-PACKAGES_remove = "${PN}"
-
-# manual dependency additions
-RPROVIDES_${PN}-modules = "${PN}"
-RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python3-modules"
-RRECOMMENDS_${PN}-crypt = "openssl ca-certificates"
-
-FILES_${PN}-2to3 += "${bindir}/2to3-${PYTHON_MAJMIN}"
-FILES_${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
-FILES_${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
-
-PACKAGES =+ "${PN}-pyvenv"
-FILES_${PN}-pyvenv += "${bindir}/pyvenv-${PYTHON_MAJMIN} ${bindir}/pyvenv"
-
-# package libpython3
-PACKAGES =+ "libpython3 libpython3-staticdev"
-FILES_libpython3 = "${libdir}/libpython*.so.*"
-FILES_libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}/libpython${PYTHON_BINABI}.a"
-INSANE_SKIP_${PN}-dev += "dev-elf"
-
-# catch all the rest (unsorted)
-PACKAGES += "${PN}-misc"
-RDEPENDS_${PN}-misc += "${PN}-core ${PN}-email ${PN}-codecs"
-RDEPENDS_${PN}-modules += "${PN}-misc"
-FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
-
-# catch manpage
-PACKAGES += "${PN}-man"
-FILES_${PN}-man = "${datadir}/man"
-
-RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2"
-
-RDEPENDS_${PN}-dev = ""
-
-BBCLASSEXTEND = "nativesdk"
-
-# We want bytecode precompiled .py files (.pyc's) by default
-# but the user may set it on their own conf
-INCLUDE_PYCS ?= "1"
-
-python(){
-    import collections, json
-
-    filename = os.path.join(d.getVar('THISDIR'), 'python3', 'python3-manifest.json')
-    # This python changes the datastore based on the contents of a file, so mark
-    # that dependency.
-    bb.parse.mark_dependency(d, filename)
-
-    with open(filename) as manifest_file:
-        python_manifest=json.load(manifest_file, object_pairs_hook=collections.OrderedDict)
-
-    include_pycs = d.getVar('INCLUDE_PYCS')
-
-    packages = d.getVar('PACKAGES').split()
-    pn = d.getVar('PN')
-
-    newpackages=[]
-    for key in python_manifest:
-        pypackage= pn + '-' + key
-
-        if pypackage not in packages:
-            # We need to prepend, otherwise python-misc gets everything
-            # so we use a new variable
-            newpackages.append(pypackage)
-
-        # "Build" python's manifest FILES, RDEPENDS and SUMMARY
-        d.setVar('FILES_' + pypackage, '')
-        for value in python_manifest[key]['files']:
-            d.appendVar('FILES_' + pypackage, ' ' + value)
-
-    	# Add cached files
-        if include_pycs == '1':
-            for value in python_manifest[key]['cached']:
-                    d.appendVar('FILES_' + pypackage, ' ' + value)
-
-        for value in python_manifest[key]['rdepends']:
-            # Make it work with or without $PN
-            if '${PN}' in value:
-                value=value.split('-')[1]
-            d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)
-        d.setVar('SUMMARY_' + pypackage, python_manifest[key]['summary'])
-
-    # Prepending so to avoid python-misc getting everything
-    packages = newpackages + packages
-    d.setVar('PACKAGES', ' '.join(packages))
-    d.setVar('ALLOW_EMPTY_${PN}-modules', '1')
-}
-
-# Files needed to create a new manifest
-SRC_URI += "file://create_manifest3.py file://get_module_deps3.py file://python3-manifest.json"
-
-do_create_manifest() {
-    # This task should be run with every new release of Python.
-    # We must ensure that PACKAGECONFIG enables everything when creating
-    # a new manifest, this is to base our new manifest on a complete
-    # native python build, containing all dependencies, otherwise the task
-    # wont be able to find the required files.
-    # e.g. BerkeleyDB is an optional build dependency so it may or may not
-    # be present, we must ensure it is.
-
-    cd ${WORKDIR}
-    # This needs to be executed by python-native and NOT by HOST's python
-    nativepython3 create_manifest3.py ${PYTHON_MAJMIN}
-    cp python3-manifest.json.new ${THISDIR}/python3/python3-manifest.json
-}
-
-# bitbake python -c create_manifest
-addtask do_create_manifest
-
-# Make sure we have native python ready when we create a new manifest
-do_create_manifest[depends] += "python3:do_prepare_recipe_sysroot"
-do_create_manifest[depends] += "python3:do_patch"
diff --git a/meta/recipes-devtools/python/python3_3.7.0.bb b/meta/recipes-devtools/python/python3_3.7.0.bb
new file mode 100644
index 0000000000..7d4f67fcd2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3_3.7.0.bb
@@ -0,0 +1,300 @@
+# Maintainers hint: with every new release of Python, the task
+# create_manifest - please see for detailed documentation
+# inside do_create_manifest
+require recipes-devtools/python/python3.inc
+
+DEPENDS = "libffi bzip2 gdbm openssl sqlite3 zlib xz \
+           util-linux libtirpc libnsl2 virtual/libintl virtual/crypt\
+"
+DEPENDS += "${@["qemu-native qemu-helper-native", ""][bb.utils.contains('PACKAGECONFIG', 'pgo', 0, 1, d)]}"
+
+PYTHON_BINABI = "${PYTHON_MAJMIN}${PYTHON_ABI}"
+
+SRC_URI += "\
+    file://tweak-MULTIARCH-for-powerpc-linux-gnuspe.patch \
+    file://cgi_py.patch \
+    file://host_include_contamination.patch \
+    file://uuid_when_cross_compiling.patch \
+    file://avoid-ncursesw-include-path.patch \
+    file://python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
+    file://configure.ac-fix-LIBPL.patch \
+    file://pass-missing-libraries-to-Extension-for-mul.patch \
+    file://float-endian.patch \
+    file://ftplib.patch \
+    file://run-ptest \
+"
+
+inherit multilib_header python3native update-alternatives qemu ptest
+
+MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
+
+ALTERNATIVE_${PN}-dev = "python-config"
+ALTERNATIVE_LINK_NAME[python-config] = "${bindir}/python${PYTHON_BINABI}-config"
+ALTERNATIVE_TARGET[python-config] = "${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}"
+
+CACHED_CONFIGUREVARS = "ac_cv_have_chflags=no \
+                ac_cv_have_lchflags=no \
+                ac_cv_have_long_long_format=yes \
+                ac_cv_buggy_getaddrinfo=no \
+                ac_cv_file__dev_ptmx=yes \
+                ac_cv_file__dev_ptc=no \
+"
+
+TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
+SDK_CC_ARCH += "-DNDEBUG -fno-inline"
+EXTRA_OEMAKE += "CROSS_COMPILE=yes"
+EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ --without-ensurepip"
+PYTHON3_PROFILE_TASK ?= "./python -m test.regrtest --pgo test_grammar test_opcodes test_dict test_builtin test_exceptions test_types test_support"
+
+export CROSS_COMPILE = "${TARGET_PREFIX}"
+export CCSHARED = "-fPIC"
+
+# Fix cross compilation of different modules
+export CROSSPYTHONPATH = "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/:${B}/build/lib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${S}/Lib:${S}/Lib/plat-linux"
+
+PACKAGECONFIG ??= "pgo readline ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
+PACKAGECONFIG[readline] = ",,readline"
+# Use profile guided optimisation by running PyBench inside qemu-user
+PACKAGECONFIG[pgo] = "--enable-optimizations"
+
+run_make() {
+	oe_runmake PGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
+		LIB=${baselib} \
+		ARCH=${TARGET_ARCH} \
+		OPT="${CFLAGS}" \
+		"$@"
+}
+
+do_compile() {
+	# remove any bogus LD_LIBRARY_PATH
+	sed -i -e s,RUNSHARED=.*,RUNSHARED=, Makefile
+
+	if [ ! -f Makefile.orig ]; then
+		install -m 0644 Makefile Makefile.orig
+	fi
+	sed -i -e 's,^CONFIGURE_LDFLAGS=.*,CONFIGURE_LDFLAGS=-L. -L${STAGING_LIBDIR},g' \
+		-e 's,libdir=${libdir},libdir=${STAGING_LIBDIR},g' \
+		-e 's,libexecdir=${libexecdir},libexecdir=${STAGING_DIR_HOST}${libexecdir},g' \
+		-e 's,^LIBDIR=.*,LIBDIR=${STAGING_LIBDIR},g' \
+		-e 's,includedir=${includedir},includedir=${STAGING_INCDIR},g' \
+		-e 's,^INCLUDEDIR=.*,INCLUDE=${STAGING_INCDIR},g' \
+		-e 's,^CONFINCLUDEDIR=.*,CONFINCLUDE=${STAGING_INCDIR},g' \
+		Makefile
+
+        if ${@bb.utils.contains('PACKAGECONFIG', 'pgo', 'true', 'false', d)}; then
+		qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])}"
+		cat > ${B}/pgo-wrapper << EOF
+#!/bin/sh
+set -x
+cd ${B}
+$qemu_binary "\$@"
+EOF
+		chmod +x ${B}/pgo-wrapper
+		bbnote Updating Makefile to gather profiling data during build
+		sed -i  -e 's,$(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK),${B}/pgo-wrapper ./python $(PROFILE_TASK),' \
+			-e 's,PROFILE_TASK=.*,PROFILE_TASK=${PYTHON3_PROFILE_TASK},' \
+			Makefile
+	else
+		sed -i -e 's,$(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK),:,' \
+			Makefile
+	fi
+
+	# save copy of it now, because if we do it in do_install and 
+	# then call do_install twice we get Makefile.orig == Makefile.sysroot
+	install -m 0644 Makefile Makefile.sysroot
+
+        run_make profile-opt
+}
+
+do_install() {
+	# make install needs the original Makefile, or otherwise the inclues would
+	# go to ${D}${STAGING...}/...
+	install -m 0644 Makefile.orig Makefile
+
+	install -d ${D}${libdir}/pkgconfig
+	install -d ${D}${libdir}/python${PYTHON_MAJMIN}/config
+
+	# rerun the build once again with original makefile this time
+	# run install in a separate step to avoid compile/install race
+	run_make DESTDIR=${D} LIBDIR=${libdir} build_all
+	run_make DESTDIR=${D} LIBDIR=${libdir} install
+
+	# avoid conflict with 2to3 from Python 2
+	rm -f ${D}/${bindir}/2to3
+
+	set -x
+        install -m 0644 Makefile.sysroot ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+	install -m 0644 Makefile.sysroot ${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-${MULTIARCH}/Makefile
+
+	if [ -e ${WORKDIR}/sitecustomize.py ]; then
+		install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
+	fi
+
+	oe_multilib_header python${PYTHON_BINABI}/pyconfig.h
+}
+
+do_install_append_class-nativesdk () {
+	create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} PYTHONHOME='${prefix}' TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
+}
+
+SSTATE_SCAN_FILES += "Makefile"
+PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
+
+py_package_preprocess () {
+	MAKESETTINGS="$(egrep '^(ABIFLAGS|MULTIARCH)=' ${B}/Makefile | sed -E -e 's/[[:space:]]//g' -e 's/=/="/' -e 's/$/"/')"
+	eval ${MAKESETTINGS}
+	if test "${ABIFLAGS}" != "${PYTHON_ABI}"; then
+	    die "do_install: configure determined ABIFLAGS '${ABIFLAGS}' != '${PYTHON_ABI}' from python3-dir.bbclass"
+	fi
+	if test "x${BUILD_OS}" = "x${TARGET_OS}"; then
+		# no cross-compile at all
+		_PYTHON_SYSCONFIGDATA_NAME=${PYTHON_ABI}_${TARGET_OS}_${MULTIARCH}
+	else
+		# at the very moment, it's the only available target
+		_PYTHON_SYSCONFIGDATA_NAME=${PYTHON_ABI}_linux_${MULTIARCH}
+	fi
+
+	# copy back the old Makefile to fix target package
+	install -m 0644 ${B}/Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+	install -m 0644 ${B}/Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-${MULTIARCH}/Makefile
+	# Remove references to buildmachine paths in target Makefile and _sysconfigdata
+	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
+		-e 's|${DEBUG_PREFIX_MAP}||g' \
+		-e 's:${HOSTTOOLS_DIR}/::g' \
+		-e 's:${RECIPE_SYSROOT_NATIVE}::g' \
+		-e 's:${RECIPE_SYSROOT}::g' \
+		-e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
+		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
+		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-${MULTIARCH}/Makefile \
+		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCONFIGDATA_NAME}.py \
+		${PKGD}/${bindir}/python${PYTHON_BINABI}-config
+
+	# Recompile _sysconfigdata after modifying it
+	cd ${PKGD}
+	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
+	     -c "from py_compile import compile; compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCONFIGDATA_NAME}.py')"
+	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
+	     -c "from py_compile import compile; compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCONFIGDATA_NAME}.py', optimize=1)"
+	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
+	     -c "from py_compile import compile; compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata_${_PYTHON_SYSCONFIGDATA_NAME}.py', optimize=2)"
+	cd -
+
+	mv ${PKGD}/${bindir}/python${PYTHON_BINABI}-config ${PKGD}/${bindir}/python${PYTHON_BINABI}-config-${MULTILIB_SUFFIX}
+}
+
+# manual dependency additions
+RPROVIDES_${PN}-modules = "${PN}"
+RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python3-modules"
+RRECOMMENDS_${PN}-crypt = "openssl ca-certificates"
+
+FILES_${PN}-2to3 += "${bindir}/2to3-${PYTHON_MAJMIN}"
+FILES_${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
+FILES_${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
+
+PACKAGES =+ "${PN}-pyvenv"
+FILES_${PN}-pyvenv += "${bindir}/pyvenv-${PYTHON_MAJMIN} ${bindir}/pyvenv"
+
+# package libpython3
+PACKAGES =+ "libpython3 libpython3-staticdev"
+FILES_libpython3 = "${libdir}/libpython*.so.*"
+FILES_libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}*/libpython${PYTHON_BINABI}.a"
+INSANE_SKIP_${PN}-dev += "dev-elf"
+
+# catch all the rest (unsorted)
+PACKAGES += "${PN}-misc"
+RDEPENDS_${PN}-misc += "${PN}-core ${PN}-email ${PN}-codecs"
+RDEPENDS_${PN}-modules += "${PN}-misc"
+FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
+
+# catch manpage
+PACKAGES += "${PN}-man"
+FILES_${PN}-man = "${datadir}/man"
+
+RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2"
+
+RDEPENDS_${PN}-dev = ""
+
+BBCLASSEXTEND = "nativesdk"
+
+RPROVIDES_${PN} += "${PN}-modules"
+
+# We want bytecode precompiled .py files (.pyc's) by default
+# but the user may set it on their own conf
+INCLUDE_PYCS ?= "1"
+
+python(){
+    import collections, json
+
+    filename = os.path.join(d.getVar('THISDIR'), 'python3', 'python3-manifest.json')
+    # This python changes the datastore based on the contents of a file, so mark
+    # that dependency.
+    bb.parse.mark_dependency(d, filename)
+
+    with open(filename) as manifest_file:
+        python_manifest=json.load(manifest_file, object_pairs_hook=collections.OrderedDict)
+
+    include_pycs = d.getVar('INCLUDE_PYCS')
+
+    packages = d.getVar('PACKAGES').split()
+    pn = d.getVar('PN')
+
+    newpackages=[]
+    for key in python_manifest:
+        pypackage= pn + '-' + key
+
+        if pypackage not in packages:
+            # We need to prepend, otherwise python-misc gets everything
+            # so we use a new variable
+            newpackages.append(pypackage)
+
+        # "Build" python's manifest FILES, RDEPENDS and SUMMARY
+        d.setVar('FILES_' + pypackage, '')
+        for value in python_manifest[key]['files']:
+            d.appendVar('FILES_' + pypackage, ' ' + value)
+
+	# Add cached files
+        if include_pycs == '1':
+            for value in python_manifest[key]['cached']:
+                    d.appendVar('FILES_' + pypackage, ' ' + value)
+
+        for value in python_manifest[key]['rdepends']:
+            # Make it work with or without $PN
+            if '${PN}' in value:
+                value=value.split('-')[1]
+            d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)
+        d.setVar('SUMMARY_' + pypackage, python_manifest[key]['summary'])
+
+    # Prepending so to avoid python-misc getting everything
+    packages = newpackages + packages
+    d.setVar('PACKAGES', ' '.join(packages))
+    d.setVar('ALLOW_EMPTY_${PN}-modules', '1')
+}
+
+# Files needed to create a new manifest
+SRC_URI += "file://create_manifest3.py file://get_module_deps3.py file://python3-manifest.json"
+
+do_create_manifest() {
+    # This task should be run with every new release of Python.
+    # We must ensure that PACKAGECONFIG enables everything when creating
+    # a new manifest, this is to base our new manifest on a complete
+    # native python build, containing all dependencies, otherwise the task
+    # wont be able to find the required files.
+    # e.g. BerkeleyDB is an optional build dependency so it may or may not
+    # be present, we must ensure it is.
+
+    cd ${WORKDIR}
+    # This needs to be executed by python-native and NOT by HOST's python
+    nativepython3 create_manifest3.py ${PYTHON_MAJMIN}
+    cp python3-manifest.json.new ${THISDIR}/python3/python3-manifest.json
+}
+
+# bitbake python -c create_manifest
+addtask do_create_manifest
+
+# Make sure we have native python ready when we create a new manifest
+do_create_manifest[depends] += "python3:do_prepare_recipe_sysroot"
+do_create_manifest[depends] += "python3:do_patch"
-- 
2.17.1


