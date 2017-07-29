Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3B47578561
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 08:35:56 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id k190so54198237pgk.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 01:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=q3d41gvvYylJcmrG3u+2RSAyeOEOqvFOU89gURAUPVU=;
	b=hpjSrZZMNKfAz19OsO85GuyAAZkkXcrq3VEwgm9uPtNI+LkJm0uL6DVMxrbD9xpnQ3
	zgfFEkkYCfPcABWQvsJna54NDOJir7RpxC58VGVXpzRZOzF872ZI8xzEgBIbkp/JoZf6
	YkuGrfkcPBzwHfWlFKhBtA4zTT7dkoxqVZc9FH7K7Z5UKHaEN1ujDnlxH9rj6djDIbfB
	EwVOtt0NzuNWGapXuGMjHrDSRdaQSCfj9CT27jF736EUv13a3mc6tq9JALqKCghS0wbm
	hQ2SKfNvE2nDFcxOkhN/IiyAVGwyeHyPc1ffSJHw7eMIu48fEr1QJcOC76Owy9mSYKV8
	AHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=q3d41gvvYylJcmrG3u+2RSAyeOEOqvFOU89gURAUPVU=;
	b=toHTqiaCU9DaWRs7tOSbxbu2c9bbZnv/BWlmq0oQWi1nPizycy7bjLdr8q/dQy7upN
	ukeBkbTlELyATpYtXu7E697n1ZRKgzlFmB4GLoaN6mokLEMMeZz6SvBj4k1NeR7WyWQj
	RMHBPVaPCX0vZgdszjVuwI+4eFaQNKj6kZsncFqBkS3YfgihgM+wwo5uHLJ78uZasEJ6
	armSH/p4VkpqH8VCXrFxU67zLXpfox6Zyihn56lvwXnaes1EJqpGiUzzVAeSMe8RTStb
	VO31ANzbsdyYA47TMHWFH4pQKvGK78OnIDbHzbciTLnyotUOa3mPrOwRYSQvizaZZ5mw
	0CxQ==
X-Gm-Message-State: AIVw112kCsB8VlAUk8GhsNwaLT613V00eAzqi/0LtnU4y5gO/vp8jQEg
	CPEM4uouCNy4Setm
X-Received: by 10.84.132.74 with SMTP id 68mr10850277ple.179.1501317357240;
	Sat, 29 Jul 2017 01:35:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id
	s73sm26396059pgc.73.2017.07.29.01.35.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Jul 2017 01:35:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jul 2017 01:35:39 -0700
Message-Id: <655b584f33664f8188d3425e28e7657749e5850e.1501317178.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <cover.1501317178.git.raj.khem@gmail.com>
References: <cover.1501317178.git.raj.khem@gmail.com>
Subject: [PATCH 3/4] llvm: Add recipe for 5.0
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
X-List-Received-Date: Sat, 29 Jul 2017 08:35:56 -0000

Based on recipe from meta-oe and clang recipe from meta-clang
Needed by mesa

Fixes
[YOCTO #11529]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...LibraryInfo-Undefine-libc-functions-if-th.patch |  93 ++++++++++++
 .../0002-llvm-allow-env-override-of-exe-path.patch |  39 +++++
 meta/recipes-devtools/llvm/llvm_git.bb             | 166 +++++++++++++++++++++
 3 files changed, 298 insertions(+)
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
index 0000000000..7b51d2153f
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -0,0 +1,166 @@
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
+DEPENDS = "libffi libxml2-native zlib ninja-native"
+
+RDEPENDS_${PN}_append_class-target = " ncurses-terminfo"
+
+inherit perlnative pythonnative cmake pkgconfig
+
+PROVIDES += "llvm${PV}"
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
+LLVM_TARGETS_prepend_x86 = "AMDGPU;"
+LLVM_TARGETS_prepend_x86-64 = "AMDGPU;"
+
+EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
+                  -DLLVM_ENABLE_EXPENSIVE_CHECKS=OFF \
+                  -DLLVM_ENABLE_PIC=ON \
+                  -DLLVM_BINDINGS_LIST='' \
+                  -DLLVM_LINK_LLVM_DYLIB=ON \
+                  -DLLVM_ENABLE_FFI=ON \
+                  -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
+                  -DLLVM_OPTIMIZED_TABLEGEN=ON \
+                  -DLLVM_TARGETS_TO_BUILD="${LLVM_TARGETS}" \
+                  -DCMAKE_CROSSCOMPILING:BOOL=ON \
+                  -G Ninja \
+                 "
+EXTRA_OECMAKE_remove_class-native = "-DCMAKE_CROSSCOMPILING:BOOL=ON"
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
+	install -D -m 0755 ${B}/NATIVE/bin/llvm-config ${D}${libdir}/${LLVM_DIR}/llvm-config-host
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
+    ${libdir}/${LLVM_DIR}/.debug/llvm-config-host \
+    /usr/src/debug \
+"
+
+FILES_${PN}-dev = " \
+    ${bindir}/${LLVM_DIR} \
+    ${includedir}/${LLVM_DIR} \
+    ${libdir}/${LLVM_DIR}/llvm-config-host \
+"
+
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


