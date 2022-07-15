Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4168CCA497
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:53 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web08.937.1657900667649528446
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kcPpCgy2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 010101820294903f-c1b35f0c-7b67-45f5-bf97-a1ebadb87f65-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8GuXIkHWTI9dfZ96Q2yHDAU1PH8cL7+u6eQytDIFDgQ=;
	b=kcPpCgy2W3eNarFXqwKYmXNKCgFrkG79jbD0OIakHx9fKhaD4FzS0Ojag8yR+kby
	2Yt/f1q2zf0M11NUKphkX6BeWfaeCAsasostVeb/dfnFhaZ0QjOtB6dBD936P98z9Pf
	IXAbN4Bb+TJrzekg7SDPkuHumhEfX8Pni1E0J6AY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8GuXIkHWTI9dfZ96Q2yHDAU1PH8cL7+u6eQytDIFDgQ=;
	b=ds1+1oGyCvKMv9qZ1QDh7rD1zFVuWm5uQsqP4jlF/qBBMe/fNbaaiBHsXDvXN9O7
	NxNxnsVBYaS2u6ymS8OGtLBXmwMSBLdPRIgeYFgNJuwhRyDuSOxc/W4Le/XIdZxoywF
	JUTJr/o1tSEa6BYQJmbSMV8bsLQXNwiYKjWmTABI=
Content-Type: multipart/mixed; boundary="===============7185107361941063879=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 14.0.6 FAILED
Message-ID: 
 <010101820294903f-c1b35f0c-7b67-45f5-bf97-a1ebadb87f65-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168068

--===============7185107361941063879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *llvm* to *14.0.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-llvm-upgrade-14.0.4-14.0.6.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7185107361941063879==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-llvm-upgrade-14.0.4-14.0.6.patch"

From edf574faac15ae95d9402702f500b6059ee5e0c9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 07:16:27 +0000
Subject: [PATCH] llvm: upgrade 14.0.4 -> 14.0.6

---
 ...r-sort-ClassInfo-lists-by-name-as-we.patch |  31 ----
 ...ryInfo-Undefine-libc-functions-if-th.patch |  90 ----------
 ...-llvm-allow-env-override-of-exe-path.patch |  37 ----
 meta/recipes-devtools/llvm/llvm_git.bb        | 165 ------------------
 4 files changed, 323 deletions(-)
 delete mode 100644 meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
 delete mode 100644 meta/recipes-devtools/llvm/llvm/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
 delete mode 100644 meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
 delete mode 100644 meta/recipes-devtools/llvm/llvm_git.bb

diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
deleted file mode 100644
index 48af6fc283..0000000000
--- a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 86940d87026432683fb6741cd8a34d3b9b18e40d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 27 Nov 2020 10:11:08 +0000
-Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
-
-Otherwise, there are instances which are identical in
-every other field and therefore sort non-reproducibly
-(which breaks binary and source reproducibiliy).
-
-Upstream-Status: Submitted [https://reviews.llvm.org/D97477]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- llvm/utils/TableGen/AsmMatcherEmitter.cpp | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-index ccf0959389b..1f801e83b7d 100644
---- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-+++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-@@ -359,7 +359,10 @@ public:
-     // name of a class shouldn't be significant. However, some of the backends
-     // accidentally rely on this behaviour, so it will have to stay like this
-     // until they are fixed.
--    return ValueName < RHS.ValueName;
-+    if (ValueName != RHS.ValueName)
-+        return ValueName < RHS.ValueName;
-+    // All else being equal, we should sort by name, for source and binary reproducibility
-+    return Name < RHS.Name;
-   }
- };
- 
diff --git a/meta/recipes-devtools/llvm/llvm/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch b/meta/recipes-devtools/llvm/llvm/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
deleted file mode 100644
index d02b7ba6ab..0000000000
--- a/meta/recipes-devtools/llvm/llvm/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-From dbeecdb307be8b783b42cbc89dcb9c5e7f528989 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 21 May 2016 00:33:20 +0000
-Subject: [PATCH] llvm: TargetLibraryInfo: Undefine libc functions if they are macros
-
-musl defines some functions as macros and not inline functions
-if this is the case then make sure to undefine them
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../llvm/Analysis/TargetLibraryInfo.def       | 21 +++++++++++++++++++
- 1 file changed, 21 insertions(+)
-
-diff --git a/llvm/include/llvm/Analysis/TargetLibraryInfo.def b/llvm/include/llvm/Analysis/TargetLibraryInfo.def
-index afed404f04c..876888656f2 100644
---- a/llvm/include/llvm/Analysis/TargetLibraryInfo.def
-+++ b/llvm/include/llvm/Analysis/TargetLibraryInfo.def
-@@ -782,6 +782,9 @@ TLI_DEFINE_STRING_INTERNAL("fmodl")
- TLI_DEFINE_ENUM_INTERNAL(fopen)
- TLI_DEFINE_STRING_INTERNAL("fopen")
- /// FILE *fopen64(const char *filename, const char *opentype)
-+#ifdef fopen64
-+#undef fopen64
-+#endif
- TLI_DEFINE_ENUM_INTERNAL(fopen64)
- TLI_DEFINE_STRING_INTERNAL("fopen64")
- /// int fork();
-@@ -829,6 +832,9 @@ TLI_DEFINE_STRING_INTERNAL("fseek")
- /// int fseeko(FILE *stream, off_t offset, int whence);
- TLI_DEFINE_ENUM_INTERNAL(fseeko)
- TLI_DEFINE_STRING_INTERNAL("fseeko")
-+#ifdef fseeko64
-+#undef fseeko64
-+#endif
- /// int fseeko64(FILE *stream, off64_t offset, int whence)
- TLI_DEFINE_ENUM_INTERNAL(fseeko64)
- TLI_DEFINE_STRING_INTERNAL("fseeko64")
-@@ -839,6 +845,9 @@ TLI_DEFINE_STRING_INTERNAL("fsetpos")
- TLI_DEFINE_ENUM_INTERNAL(fstat)
- TLI_DEFINE_STRING_INTERNAL("fstat")
- /// int fstat64(int filedes, struct stat64 *buf)
-+#ifdef fstat64
-+#undef fstat64
-+#endif
- TLI_DEFINE_ENUM_INTERNAL(fstat64)
- TLI_DEFINE_STRING_INTERNAL("fstat64")
- /// int fstatvfs(int fildes, struct statvfs *buf);
-@@ -854,6 +863,9 @@ TLI_DEFINE_STRING_INTERNAL("ftell")
- TLI_DEFINE_ENUM_INTERNAL(ftello)
- TLI_DEFINE_STRING_INTERNAL("ftello")
- /// off64_t ftello64(FILE *stream)
-+#ifdef ftello64
-+#undef ftello64
-+#endif
- TLI_DEFINE_ENUM_INTERNAL(ftello64)
- TLI_DEFINE_STRING_INTERNAL("ftello64")
- /// int ftrylockfile(FILE *file);
-@@ -980,6 +992,9 @@ TLI_DEFINE_STRING_INTERNAL("logl")
- TLI_DEFINE_ENUM_INTERNAL(lstat)
- TLI_DEFINE_STRING_INTERNAL("lstat")
- /// int lstat64(const char *path, struct stat64 *buf);
-+#ifdef lstat64
-+#undef lstat64
-+#endif
- TLI_DEFINE_ENUM_INTERNAL(lstat64)
- TLI_DEFINE_STRING_INTERNAL("lstat64")
- /// void *malloc(size_t size);
-@@ -1205,6 +1220,9 @@ TLI_DEFINE_STRING_INTERNAL("sscanf")
- TLI_DEFINE_ENUM_INTERNAL(stat)
- TLI_DEFINE_STRING_INTERNAL("stat")
- /// int stat64(const char *path, struct stat64 *buf);
-+#ifdef stat64
-+#undef stat64
-+#endif
- TLI_DEFINE_ENUM_INTERNAL(stat64)
- TLI_DEFINE_STRING_INTERNAL("stat64")
- /// int statvfs(const char *path, struct statvfs *buf);
-@@ -1340,6 +1358,9 @@ TLI_DEFINE_STRING_INTERNAL("times")
- TLI_DEFINE_ENUM_INTERNAL(tmpfile)
- TLI_DEFINE_STRING_INTERNAL("tmpfile")
- /// FILE *tmpfile64(void)
-+#ifdef tmpfile64
-+#undef tmpfile64
-+#endif
- TLI_DEFINE_ENUM_INTERNAL(tmpfile64)
- TLI_DEFINE_STRING_INTERNAL("tmpfile64")
- /// int toascii(int c);
diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
deleted file mode 100644
index b01b8647c9..0000000000
--- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-From 61b00e1e051e367f5483d7b5253b6c85a9e8a90f Mon Sep 17 00:00:00 2001
-From: Martin Kelly <mkelly@xevo.com>
-Date: Fri, 19 May 2017 00:22:57 -0700
-Subject: [PATCH] llvm: allow env override of exe path
-
-When using a native llvm-config from inside a sysroot, we need llvm-config to
-return the libraries, include directories, etc. from inside the sysroot rather
-than from the native sysroot. Thus provide an env override for calling
-llvm-config from a target sysroot.
-
-Signed-off-by: Martin Kelly <mkelly@xevo.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
-index 7ef7c46a262..a4f7ed82c7b 100644
---- a/llvm/tools/llvm-config/llvm-config.cpp
-+++ b/llvm/tools/llvm-config/llvm-config.cpp
-@@ -225,6 +225,13 @@ Typical components:\n\
- 
- /// Compute the path to the main executable.
- std::string GetExecutablePath(const char *Argv0) {
-+  // Hack for Yocto: we need to override the root path when we are using
-+  // llvm-config from within a target sysroot.
-+  const char *Sysroot = std::getenv("YOCTO_ALTERNATE_EXE_PATH");
-+  if (Sysroot != nullptr) {
-+    return Sysroot;
-+  }
-+
-   // This just needs to be some symbol in the binary; C++ doesn't
-   // allow taking the address of ::main however.
-   void *P = (void *)(intptr_t)GetExecutablePath;
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
deleted file mode 100644
index 2ec5c1e1c0..0000000000
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ /dev/null
@@ -1,165 +0,0 @@
-# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-DESCRIPTION = "The LLVM Compiler Infrastructure"
-HOMEPAGE = "http://llvm.org"
-LICENSE = "Apache-2.0-with-LLVM-exception"
-SECTION = "devel"
-
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=8a15a0759ef07f2682d2ba4b893c9afe"
-
-DEPENDS = "libffi libxml2 zlib libedit ninja-native llvm-native"
-
-COMPATIBLE_HOST:riscv64 = "null"
-COMPATIBLE_HOST:riscv32 = "null"
-
-RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
-
-inherit cmake pkgconfig
-
-PROVIDES += "llvm${PV}"
-
-PV = "14.0.4"
-
-MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
-
-LLVM_RELEASE = "${PV}"
-
-BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "29f1039a7285a5c3a9c353d054140bf2556d4c4d"
-SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
-           file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
-           file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-           file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-           "
-
-UPSTREAM_CHECK_GITTAGREGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
-
-S = "${WORKDIR}/git/llvm"
-
-LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
-
-def get_llvm_arch(bb, d, arch_var):
-    import re
-    a = d.getVar(arch_var)
-    if   re.match(r'(i.86|athlon|x86.64)$', a):         return 'X86'
-    elif re.match(r'arm$', a):                          return 'ARM'
-    elif re.match(r'armeb$', a):                        return 'ARM'
-    elif re.match(r'aarch64$', a):                      return 'AArch64'
-    elif re.match(r'aarch64_be$', a):                   return 'AArch64'
-    elif re.match(r'mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
-    elif re.match(r'riscv(32|64)(eb|)$', a):            return 'RISCV'
-    elif re.match(r'p(pc|owerpc)(|64)', a):             return 'PowerPC'
-    else:
-        raise bb.parse.SkipRecipe("Cannot map '%s' to a supported LLVM architecture" % a)
-
-def get_llvm_host_arch(bb, d):
-    return get_llvm_arch(bb, d, 'HOST_ARCH')
-
-PACKAGECONFIG ??= ""
-# if optviewer OFF, force the modules to be not found or the ones on the host would be found
-PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=OFF -DPY_YAML_FOUND=OFF,python3-pygments python3-pyyaml,python3-pygments python3-pyyaml"
-
-#
-# Default to build all OE-Core supported target arches (user overridable).
-#
-LLVM_TARGETS ?= "AMDGPU;${@get_llvm_host_arch(bb, d)}"
-
-ARM_INSTRUCTION_SET:armv5 = "arm"
-ARM_INSTRUCTION_SET:armv4t = "arm"
-
-EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
-                  -DLLVM_ENABLE_EXPENSIVE_CHECKS=OFF \
-                  -DLLVM_ENABLE_PIC=ON \
-                  -DLLVM_BINDINGS_LIST='' \
-                  -DLLVM_LINK_LLVM_DYLIB=ON \
-                  -DLLVM_ENABLE_FFI=ON \
-                  -DLLVM_ENABLE_RTTI=ON \
-                  -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
-                  -DLLVM_OPTIMIZED_TABLEGEN=ON \
-                  -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS}' \
-                  -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
-                  -DPYTHON_EXECUTABLE=${HOSTTOOLS_DIR}/python3 \
-                  -G Ninja"
-
-EXTRA_OECMAKE:append:class-target = "\
-                  -DCMAKE_CROSSCOMPILING:BOOL=ON \
-                  -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
-                  -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
-                 "
-
-EXTRA_OECMAKE:append:class-nativesdk = "\
-                  -DCMAKE_CROSSCOMPILING:BOOL=ON \
-                  -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
-                  -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
-                 "
-
-# patch out build host paths for reproducibility
-do_compile:prepend:class-target() {
-        sed -i -e "s,${WORKDIR},,g" ${B}/tools/llvm-config/BuildVariables.inc
-}
-
-do_compile() {
-	ninja -v ${PARALLEL_MAKE}
-}
-
-do_compile:class-native() {
-	ninja -v ${PARALLEL_MAKE} llvm-config llvm-tblgen
-}
-
-do_install() {
-	DESTDIR=${D} ninja -v install
-
-        # llvm harcodes usr/lib as install path, so this corrects it to actual libdir
-        mv -T -n ${D}/${prefix}/lib ${D}/${libdir} || true
-
-        # Remove opt-viewer: https://llvm.org/docs/Remarks.html
-        rm -rf ${D}${datadir}/opt-viewer
-        rmdir ${D}${datadir}
-
-        # reproducibility
-        sed -i -e 's,${WORKDIR},,g' ${D}/${libdir}/cmake/llvm/LLVMConfig.cmake
-}
-
-do_install:class-native() {
-	install -D -m 0755 ${B}/bin/llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
-	install -D -m 0755 ${B}/bin/llvm-config ${D}${bindir}/llvm-config${PV}
-}
-
-PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto"
-
-RRECOMMENDS:${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liboptremarks"
-
-FILES:${PN}-bugpointpasses = "\
-    ${libdir}/BugpointPasses.so \
-"
-
-FILES:${PN}-libllvm = "\
-    ${libdir}/libLLVM-${MAJOR_VERSION}.so \
-"
-
-FILES:${PN}-liblto += "\
-    ${libdir}/libLTO.so.* \
-"
-
-FILES:${PN}-liboptremarks += "\
-    ${libdir}/libRemarks.so.* \
-"
-
-FILES:${PN}-llvmhello = "\
-    ${libdir}/LLVMHello.so \
-"
-
-FILES:${PN}-dev += " \
-    ${libdir}/llvm-config \
-    ${libdir}/libRemarks.so \
-    ${libdir}/libLLVM-${PV}.so \
-"
-
-FILES:${PN}-staticdev += "\
-    ${libdir}/*.a \
-"
-
-INSANE_SKIP:${PN}-libllvm += "dev-so"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.31.1


--===============7185107361941063879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1660 entries from dependency cache.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'llvm'

--===============7185107361941063879==--

