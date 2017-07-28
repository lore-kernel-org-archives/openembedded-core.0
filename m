Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id C1C1878458
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 04:33:07 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id k190so40698656pgk.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 21:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=caRz6Nv5kvGq0QlHkejN+LNQ0suV1WxiG02xJb8wQho=;
	b=UhvHXP17/JxC9g/lBSTfXQC199yc9HRYOZtl9AYxqW0u3UQaLlvaojbe+EsFxIJgB8
	QYS33E5WvtCn68BftXnD5i+N0AWP+DFwizOULsyv+kuvZ6/3iwcSjhgnFKRmqsK8/kgd
	PYbqUsuufKgq9/a1Xe5mEKrH1BMmSNKyamZN3c75gvr65ATT9or56DHWaairbufe2al2
	08/6whClhRovaqvd3HRFF5N3o8twVgVBFJWmMUOh4+a1EPEGbSYaLcwaPR9iH9QnUGNU
	xjTA73G6r+6cui4TCUp5C1wrouRSjVqhxwqu7ImkNJrVnMhtFVanUZuHKS2cB5GyMHH6
	nyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=caRz6Nv5kvGq0QlHkejN+LNQ0suV1WxiG02xJb8wQho=;
	b=d7jHIHd4PYGy/nHFt43NBkQ0R0VM5U0QBDnC3633bUWm3ZS8Fj1MrL3EaUl/xHviqG
	PkmEe/oNkYI+q66DrbT3XD+Boa+BsgKlcgPutF3W793ySx7gDBKhDhPKNoJoARE5aYDJ
	uQgjOhz0moqB4+ZpMQYCosGQlLLp5aa5Sg0AcgckdG4uAt3h2//AuGoomlJGAQ/sl5hN
	z/z+C+PZEZMmF1S2BPA5hYUI+wD0kDD15/ILGqJvkEN6V2tZDt0EKS0AtTjZ1/64ukl4
	soNJJptzu+GTgOeT5eqz5KR32TeF8bRhJNFe9zRFZ4xRDbSfR83M74iARd/pvT0NUlk+
	B10w==
X-Gm-Message-State: AIVw113aWDVXdqWu3wcq4vmihgblUGGMRWU9HIAXJcDPmEEfXDmRewXz
	12x0JOW/jDsGACEa
X-Received: by 10.101.91.15 with SMTP id y15mr6393278pgq.88.1501216388415;
	Thu, 27 Jul 2017 21:33:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	r82sm3748922pfe.0.2017.07.27.21.33.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 21:33:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jul 2017 21:32:59 -0700
Message-Id: <013f04876bdf7263a8d270f07fca4d7f53eaa0ee.1501216255.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <cover.1501216255.git.raj.khem@gmail.com>
References: <cover.1501216255.git.raj.khem@gmail.com>
Subject: [PATCH 1/1] llvm: Add recipe for 5.0
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
X-List-Received-Date: Fri, 28 Jul 2017 04:33:07 -0000

Needed by mesa

Fixes
[YOCTO #11529]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...LibraryInfo-Undefine-libc-functions-if-th.patch |  93 ++++++++++++
 .../0002-llvm-allow-env-override-of-exe-path.patch |  39 +++++
 meta/recipes-devtools/llvm/llvm_git.bb             | 169 +++++++++++++++++++++
 3 files changed, 301 insertions(+)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm_git.bb

diff --git a/meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch b/meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
new file mode 100644
index 0000000000..e251799259
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
@@ -0,0 +1,93 @@
+From 28293e48cf1a52004c6a78de448718441f9e05f9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 21 May 2016 00:33:20 +0000
+Subject: [PATCH 1/2] llvm: TargetLibraryInfo: Undefine libc functions if they
+ are macros
+
+musl defines some functions as macros and not inline functions
+if this is the case then make sure to undefine them
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ include/llvm/Analysis/TargetLibraryInfo.def | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/include/llvm/Analysis/TargetLibraryInfo.def b/include/llvm/Analysis/TargetLibraryInfo.def
+index 9cbe917c146..aff8419cf54 100644
+--- a/include/llvm/Analysis/TargetLibraryInfo.def
++++ b/include/llvm/Analysis/TargetLibraryInfo.def
+@@ -656,6 +656,9 @@ TLI_DEFINE_STRING_INTERNAL("fmodl")
+ TLI_DEFINE_ENUM_INTERNAL(fopen)
+ TLI_DEFINE_STRING_INTERNAL("fopen")
+ /// FILE *fopen64(const char *filename, const char *opentype)
++#ifdef fopen64
++#undef fopen64
++#endif
+ TLI_DEFINE_ENUM_INTERNAL(fopen64)
+ TLI_DEFINE_STRING_INTERNAL("fopen64")
+ /// int fprintf(FILE *stream, const char *format, ...);
+@@ -691,6 +694,9 @@ TLI_DEFINE_STRING_INTERNAL("fseek")
+ /// int fseeko(FILE *stream, off_t offset, int whence);
+ TLI_DEFINE_ENUM_INTERNAL(fseeko)
+ TLI_DEFINE_STRING_INTERNAL("fseeko")
++#ifdef fseeko64
++#undef fseeko64
++#endif
+ /// int fseeko64(FILE *stream, off64_t offset, int whence)
+ TLI_DEFINE_ENUM_INTERNAL(fseeko64)
+ TLI_DEFINE_STRING_INTERNAL("fseeko64")
+@@ -701,6 +707,9 @@ TLI_DEFINE_STRING_INTERNAL("fsetpos")
+ TLI_DEFINE_ENUM_INTERNAL(fstat)
+ TLI_DEFINE_STRING_INTERNAL("fstat")
+ /// int fstat64(int filedes, struct stat64 *buf)
++#ifdef fstat64
++#undef fstat64
++#endif
+ TLI_DEFINE_ENUM_INTERNAL(fstat64)
+ TLI_DEFINE_STRING_INTERNAL("fstat64")
+ /// int fstatvfs(int fildes, struct statvfs *buf);
+@@ -716,6 +725,9 @@ TLI_DEFINE_STRING_INTERNAL("ftell")
+ TLI_DEFINE_ENUM_INTERNAL(ftello)
+ TLI_DEFINE_STRING_INTERNAL("ftello")
+ /// off64_t ftello64(FILE *stream)
++#ifdef ftello64
++#undef ftello64
++#endif
+ TLI_DEFINE_ENUM_INTERNAL(ftello64)
+ TLI_DEFINE_STRING_INTERNAL("ftello64")
+ /// int ftrylockfile(FILE *file);
+@@ -836,6 +848,9 @@ TLI_DEFINE_STRING_INTERNAL("logl")
+ TLI_DEFINE_ENUM_INTERNAL(lstat)
+ TLI_DEFINE_STRING_INTERNAL("lstat")
+ /// int lstat64(const char *path, struct stat64 *buf);
++#ifdef lstat64
++#undef lstat64
++#endif
+ TLI_DEFINE_ENUM_INTERNAL(lstat64)
+ TLI_DEFINE_STRING_INTERNAL("lstat64")
+ /// void *malloc(size_t size);
+@@ -1055,6 +1070,9 @@ TLI_DEFINE_STRING_INTERNAL("sscanf")
+ TLI_DEFINE_ENUM_INTERNAL(stat)
+ TLI_DEFINE_STRING_INTERNAL("stat")
+ /// int stat64(const char *path, struct stat64 *buf);
++#ifdef stat64
++#undef stat64
++#endif
+ TLI_DEFINE_ENUM_INTERNAL(stat64)
+ TLI_DEFINE_STRING_INTERNAL("stat64")
+ /// int statvfs(const char *path, struct statvfs *buf);
+@@ -1184,6 +1202,9 @@ TLI_DEFINE_STRING_INTERNAL("times")
+ TLI_DEFINE_ENUM_INTERNAL(tmpfile)
+ TLI_DEFINE_STRING_INTERNAL("tmpfile")
+ /// FILE *tmpfile64(void)
++#ifdef tmpfile64
++#undef tmpfile64
++#endif
+ TLI_DEFINE_ENUM_INTERNAL(tmpfile64)
+ TLI_DEFINE_STRING_INTERNAL("tmpfile64")
+ /// int toascii(int c);
+-- 
+2.13.1
+
diff --git a/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
new file mode 100644
index 0000000000..832bd729ef
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
@@ -0,0 +1,39 @@
+From d776487bac17650704614248d19d1e6b35775001 Mon Sep 17 00:00:00 2001
+From: Martin Kelly <mkelly@xevo.com>
+Date: Fri, 19 May 2017 00:22:57 -0700
+Subject: [PATCH 2/2] llvm: allow env override of exe path
+
+When using a native llvm-config from inside a sysroot, we need llvm-config to
+return the libraries, include directories, etc. from inside the sysroot rather
+than from the native sysroot. Thus provide an env override for calling
+llvm-config from a target sysroot.
+
+Signed-off-by: Martin Kelly <mkelly@xevo.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ tools/llvm-config/llvm-config.cpp | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/tools/llvm-config/llvm-config.cpp b/tools/llvm-config/llvm-config.cpp
+index 08b096afb05..d8d7742744e 100644
+--- a/tools/llvm-config/llvm-config.cpp
++++ b/tools/llvm-config/llvm-config.cpp
+@@ -225,6 +225,13 @@ Typical components:\n\
+ 
+ /// \brief Compute the path to the main executable.
+ std::string GetExecutablePath(const char *Argv0) {
++  // Hack for Yocto: we need to override the root path when we are using
++  // llvm-config from within a target sysroot.
++  const char *Sysroot = std::getenv("YOCTO_ALTERNATE_EXE_PATH");
++  if (Sysroot != nullptr) {
++    return Sysroot;
++  }
++
+   // This just needs to be some symbol in the binary; C++ doesn't
+   // allow taking the address of ::main however.
+   void *P = (void *)(intptr_t)GetExecutablePath;
+-- 
+2.13.1
+
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
new file mode 100644
index 0000000000..fbb77212bc
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -0,0 +1,169 @@
+# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "The LLVM Compiler Infrastructure"
+HOMEPAGE = "http://llvm.org"
+LICENSE = "NCSA"
+SECTION = "devel"
+
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=e825e017edc35cfd58e26116e5251771"
+
+DEPENDS = "libffi libxml2-native llvm-common zlib ninja-native"
+DEPENDS_append_class-target = " llvm-native"
+DEPENDS_append_class-nativesdk = " llvm-native"
+
+RDEPENDS_${PN}_append_class-target = " ncurses-terminfo"
+
+inherit perlnative pythonnative cmake pkgconfig
+
+PROVIDES += "llvm"
+
+LLVM_RELEASE = "${PV}"
+LLVM_DIR = "llvm${LLVM_RELEASE}"
+
+SRCREV = "9a5c333388cbb54a0ce3a67c4f539f5e590a089b"
+PV = "5.0"
+PATCH_VERSION = "0"
+SRC_URI = "git://github.com/llvm-mirror/llvm.git;branch=release_50;protocol=http \
+           file://0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch \
+           file://0002-llvm-allow-env-override-of-exe-path.patch \
+          "
+S = "${WORKDIR}/git"
+
+LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
+def get_llvm_arch(bb, d, arch_var):
+    import re
+    a = d.getVar(arch_var, True)
+    if   re.match('(i.86|athlon|x86.64)$', a):         return 'X86'
+    elif re.match('arm$', a):                          return 'ARM'
+    elif re.match('armeb$', a):                        return 'ARM'
+    elif re.match('aarch64$', a):                      return 'AArch64'
+    elif re.match('aarch64_be$', a):                   return 'AArch64'
+    elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
+    elif re.match('p(pc|owerpc)(|64)', a):             return 'PowerPC'
+    else:
+        bb.error("cannot map '%s' to a supported llvm architecture" % a)
+    return ""
+
+def get_llvm_target_arch(bb, d):
+    return get_llvm_arch(bb, d, 'TARGET_ARCH')
+#
+# Default to build all OE-Core supported target arches (user overridable).
+#
+LLVM_TARGETS ?= "${@get_llvm_target_arch(bb, d)}"
+
+EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
+                  -DLLVM_ENABLE_EXPENSIVE_CHECKS=OFF \
+                  -DLLVM_ENABLE_PIC=ON \
+                  -DLLVM_BINDINGS_LIST='' \
+                  -DLLVM_LINK_LLVM_DYLIB=ON \
+                  -DLLVM_ENABLE_FFI=OFF \
+                  -DLLVM_OPTIMIZED_TABLEGEN=ON \
+                  -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS}' \
+                  -DLLVM_TARGET_ARCH=${@get_llvm_target_arch(bb, d)} \
+                  -G Ninja \
+                 "
+EXTRA_OECMAKE_append_class-target = " -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen"
+EXTRA_OECMAKE_append_class-nativesdk = " -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen"
+
+do_configure_prepend() {
+# Fix paths in llvm-config
+	sed -i "s|sys::path::parent_path(CurrentPath))\.str()|sys::path::parent_path(sys::path::parent_path(CurrentPath))).str()|g" ${S}/tools/llvm-config/llvm-config.cpp
+	sed -ri "s#/(bin|include|lib)(/?\")#/\1/${LLVM_DIR}\2#g" ${S}/tools/llvm-config/llvm-config.cpp
+	sed -ri "s#lib/${LLVM_DIR}#${baselib}/${LLVM_DIR}#g" ${S}/tools/llvm-config/llvm-config.cpp
+}
+
+do_compile() {
+	NINJA_STATUS="[%p] " ninja -v ${PARALLEL_MAKE}
+}
+
+do_install() {
+	NINJA_STATUS="[%p] " DESTDIR=${LLVM_INSTALL_DIR} ninja -v install
+}
+
+do_install_append_class-native () {
+	install -Dm 0755 ${B}/bin/llvm-tblgen ${D}${bindir}/llvm-tblgen
+}
+do_install_append_class-target() {
+	install ${B}/NATIVE/bin/llvm-config ${LLVM_INSTALL_DIR}/llvm-config-host
+
+	install -d ${D}${bindir}/${LLVM_DIR}
+	cp -r ${LLVM_INSTALL_DIR}${bindir}/* ${D}${bindir}/${LLVM_DIR}/
+
+	install -d ${D}${includedir}/${LLVM_DIR}
+	cp -r ${LLVM_INSTALL_DIR}${includedir}/* ${D}${includedir}/${LLVM_DIR}/
+
+	install -d ${D}${libdir}/${LLVM_DIR}
+
+	# The LLVM sources have "/lib" embedded and so we cannot completely rely on the ${libdir} variable
+	if [ -d ${LLVM_INSTALL_DIR}${libdir}/ ]; then
+		cp -r ${LLVM_INSTALL_DIR}${libdir}/* ${D}${libdir}/${LLVM_DIR}/
+	elif [ -d ${LLVM_INSTALL_DIR}${prefix}/lib ]; then
+		cp -r ${LLVM_INSTALL_DIR}${prefix}/lib/* ${D}${libdir}/${LLVM_DIR}/
+	elif [ -d ${LLVM_INSTALL_DIR}${prefix}/lib64 ]; then
+		cp -r ${LLVM_INSTALL_DIR}${prefix}/lib64/* ${D}${libdir}/${LLVM_DIR}/
+	fi
+
+	# Remove unnecessary cmake files
+	rm -rf ${D}${libdir}/${LLVM_DIR}/cmake
+
+	ln -s ${LLVM_DIR}/libLLVM-${PV}${SOLIBSDEV} ${D}${libdir}/libLLVM-${PV}${SOLIBSDEV}
+
+	# We'll have to delete the libLLVM.so due to multiple reasons...
+	rm -rf ${D}${libdir}/${LLVM_DIR}/libLLVM.so
+	rm -rf ${D}${libdir}/${LLVM_DIR}/libLTO.so
+}
+
+PACKAGES += "${PN}-bugpointpasses ${PN}-llvmhello"
+ALLOW_EMPTY_${PN} = "1"
+ALLOW_EMPTY_${PN}-staticdev = "1"
+FILES_${PN} = ""
+FILES_${PN}-staticdev = ""
+FILES_${PN}-dbg = " \
+    ${bindir}/${LLVM_DIR}/.debug \
+    ${libdir}/${LLVM_DIR}/.debug/BugpointPasses.so \
+    ${libdir}/${LLVM_DIR}/.debug/LLVMHello.so \
+    ${libdir}/${LLVM_DIR}/.debug/libLTO.so* \
+    /usr/src/debug \
+"
+
+FILES_${PN}-dev = " \
+    ${bindir}/${LLVM_DIR} \
+    ${includedir}/${LLVM_DIR} \
+"
+RRECOMMENDS_${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello"
+
+FILES_${PN}-bugpointpasses = "\
+    ${libdir}/${LLVM_DIR}/BugpointPasses.so \
+"
+FILES_${PN} += "\
+    ${libdir}/${LLVM_DIR}/libLTO.so.* \
+"
+
+FILES_${PN}-llvmhello = "\
+    ${libdir}/${LLVM_DIR}/LLVMHello.so \
+"
+
+PACKAGES_DYNAMIC = "^libllvm${LLVM_RELEASE}-.*$"
+NOAUTOPACKAGEDEBUG = "1"
+
+INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE}.${PATCH_VERSION} += "dev-so"
+INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE} += "dev-so"
+INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm += "dev-so"
+
+python llvm_populate_packages() {
+    libdir = bb.data.expand('${libdir}', d)
+    libllvm_libdir = bb.data.expand('${libdir}/${LLVM_DIR}', d)
+    split_dbg_packages = do_split_packages(d, libllvm_libdir+'/.debug', '^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s-dbg', 'Split debug package for %s', allow_dirs=True)
+    split_packages = do_split_packages(d, libdir, '^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s', 'Split package for %s', allow_dirs=True, allow_links=True, recursive=True)
+    split_staticdev_packages = do_split_packages(d, libllvm_libdir, '^lib(.*)\.a$', 'libllvm${LLVM_RELEASE}-%s-staticdev', 'Split staticdev package for %s', allow_dirs=True)
+    if split_packages:
+        pn = d.getVar('PN', True)
+        d.appendVar('RDEPENDS_' + pn, ' '+' '.join(split_packages))
+        d.appendVar('RDEPENDS_' + pn + '-dbg', ' '+' '.join(split_dbg_packages))
+        d.appendVar('RDEPENDS_' + pn + '-staticdev', ' '+' '.join(split_staticdev_packages))
+}
+
+PACKAGESPLITFUNCS_prepend = "llvm_populate_packages "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.13.3


