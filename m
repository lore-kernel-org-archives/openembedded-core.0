Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id C41397C346
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Feb 2019 19:43:36 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 64so4920272pfr.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Feb 2019 11:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CkCEvO1NtE6BuqFcPKGYjFoUFRo/Ao4OqXFuE5oqZgg=;
	b=nnT0R7xeFNPsGN7auiCLmmTFVHVeFr7iC8ZP2+85fPugDHAkqrBpSSQb3fRnQPFwyz
	A4JQOKFBrrxzKHwhB9azXH4zVTX2t/+PMK0zFJxdg5xA52Zo6EE/LHLtrJIDVZOxNcR1
	bd/3JyifStlhVJYAKduuaRXUcGjdEf4q7UIOv53MLnaUeiuw+It3IYP2O1p/GKxQCHMK
	WhJUk23pRCDjaonsV6/r8f9La7W4T1g/SW+TDC0WzVO8EeHfTD4d7z3he/sLDGBbMq5z
	amx+RvkIKqo3N5bnkuB/VI7U91GbUMwUPuaYrsLEQB2NavH2e+4KAUtC3G0ikaChJFWP
	gRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CkCEvO1NtE6BuqFcPKGYjFoUFRo/Ao4OqXFuE5oqZgg=;
	b=jSCI6ea6YGfn7znTC6cBa5L8GCDCmQffHIo4G7DxzVScLV8xFvDnxSmVH1keqX9TVN
	Ruh0pdd6sDbgDdwafTYEJj8qAbyVpAhAMoWvtjmDXdSdcrDk+K/m5hMVY0pk7E70lQWi
	rpwYzDOdtTRc91LpA0D7Q/hl1wTcLWnF/3x4XmRxunWGbPJ7j/IXL7zDvFSiaX6OHr+A
	zZE2y8SpqaLZCPzpFaV42veTKVI7VSX0PmqaZt2fHbSzFFHq6+Ywnu6wYvM7/krr+ePJ
	bsnZySDq7uptNEhIZlk6bP0hAdeFZ5DxE4Wtd+JEvf8YYl7CxDYLsSjtHn6+koE2OxSb
	ZvAQ==
X-Gm-Message-State: AHQUAuYJ54WGCEtijTvY7//iFwHx9J6iV3bbRlilflDBhQJ7OqbojARP
	m71rye/t7qOcIBc1x72rRCkvdBTe
X-Google-Smtp-Source: AHgI3IY9uSeUDYJA1jVrilH+uEw7y9X7Ca2p9YSJO8AJ06vbyrbfwDWT2Ja0tU2+aUVN/fJd9fge9g==
X-Received: by 2002:a63:96:: with SMTP id 144mr27655802pga.315.1549136617379; 
	Sat, 02 Feb 2019 11:43:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::1609])
	by smtp.gmail.com with ESMTPSA id
	j21sm15541962pfn.175.2019.02.02.11.43.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Feb 2019 11:43:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Feb 2019 11:43:26 -0800
Message-Id: <20190202194326.42388-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190202194326.42388-1-raj.khem@gmail.com>
References: <20190202194326.42388-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] llvm, mesa: Upgrade to upcoming 8.0.0 release
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
X-List-Received-Date: Sat, 02 Feb 2019 19:43:36 -0000
Content-Transfer-Encoding: 8bit

License-Update: Copyright year updates from 2017-2019

Refresh patches to apply on new version

mesa move dep to the llvm release to 8.0
Needs to happen along with llvm upgrade always

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
V2:
- merge mesa and llvm changes together to be atomic
- Redo llvm packaging, to avoid per library split
  we only have static (.a) files for components
- Bump LLVM to 8.0.0 RC1

 ...ryInfo-Undefine-libc-functions-if-th.patch | 28 +++---
 ...-llvm-allow-env-override-of-exe-path.patch | 66 +++++++++++---
 meta/recipes-devtools/llvm/llvm_git.bb        | 86 ++++++++-----------
 meta/recipes-graphics/mesa/mesa.inc           |  2 +-
 4 files changed, 105 insertions(+), 77 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch b/meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
index 209764c8ba..6dbbced7eb 100644
--- a/meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
+++ b/meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
@@ -1,24 +1,22 @@
-From 96558c4f25d5132936014f6f2d6252cfdfdf478a Mon Sep 17 00:00:00 2001
+From 905cac8934fb17e20416a4df712a566e757471a3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 May 2016 00:33:20 +0000
-Subject: [PATCH 1/2] llvm: TargetLibraryInfo: Undefine libc functions if they
- are macros
+Subject: [PATCH 1/2] llvm: TargetLibraryInfo: Undefine libc functions if they are macros
 
 musl defines some functions as macros and not inline functions
 if this is the case then make sure to undefine them
 
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-Upstream-Status: Pending
-
  include/llvm/Analysis/TargetLibraryInfo.def | 21 +++++++++++++++++++++
  1 file changed, 21 insertions(+)
 
 diff --git a/include/llvm/Analysis/TargetLibraryInfo.def b/include/llvm/Analysis/TargetLibraryInfo.def
-index a461ed813b9..f9fd9faeee0 100644
+index 518a85ee1a0..6b4ead4efc6 100644
 --- a/include/llvm/Analysis/TargetLibraryInfo.def
 +++ b/include/llvm/Analysis/TargetLibraryInfo.def
-@@ -665,6 +665,9 @@ TLI_DEFINE_STRING_INTERNAL("fmodl")
+@@ -731,6 +731,9 @@ TLI_DEFINE_STRING_INTERNAL("fmodl")
  TLI_DEFINE_ENUM_INTERNAL(fopen)
  TLI_DEFINE_STRING_INTERNAL("fopen")
  /// FILE *fopen64(const char *filename, const char *opentype)
@@ -27,8 +25,8 @@ index a461ed813b9..f9fd9faeee0 100644
 +#endif
  TLI_DEFINE_ENUM_INTERNAL(fopen64)
  TLI_DEFINE_STRING_INTERNAL("fopen64")
- /// int fprintf(FILE *stream, const char *format, ...);
-@@ -700,6 +703,9 @@ TLI_DEFINE_STRING_INTERNAL("fseek")
+ /// int fork();
+@@ -778,6 +781,9 @@ TLI_DEFINE_STRING_INTERNAL("fseek")
  /// int fseeko(FILE *stream, off_t offset, int whence);
  TLI_DEFINE_ENUM_INTERNAL(fseeko)
  TLI_DEFINE_STRING_INTERNAL("fseeko")
@@ -38,7 +36,7 @@ index a461ed813b9..f9fd9faeee0 100644
  /// int fseeko64(FILE *stream, off64_t offset, int whence)
  TLI_DEFINE_ENUM_INTERNAL(fseeko64)
  TLI_DEFINE_STRING_INTERNAL("fseeko64")
-@@ -710,6 +716,9 @@ TLI_DEFINE_STRING_INTERNAL("fsetpos")
+@@ -788,6 +794,9 @@ TLI_DEFINE_STRING_INTERNAL("fsetpos")
  TLI_DEFINE_ENUM_INTERNAL(fstat)
  TLI_DEFINE_STRING_INTERNAL("fstat")
  /// int fstat64(int filedes, struct stat64 *buf)
@@ -48,7 +46,7 @@ index a461ed813b9..f9fd9faeee0 100644
  TLI_DEFINE_ENUM_INTERNAL(fstat64)
  TLI_DEFINE_STRING_INTERNAL("fstat64")
  /// int fstatvfs(int fildes, struct statvfs *buf);
-@@ -725,6 +734,9 @@ TLI_DEFINE_STRING_INTERNAL("ftell")
+@@ -803,6 +812,9 @@ TLI_DEFINE_STRING_INTERNAL("ftell")
  TLI_DEFINE_ENUM_INTERNAL(ftello)
  TLI_DEFINE_STRING_INTERNAL("ftello")
  /// off64_t ftello64(FILE *stream)
@@ -58,7 +56,7 @@ index a461ed813b9..f9fd9faeee0 100644
  TLI_DEFINE_ENUM_INTERNAL(ftello64)
  TLI_DEFINE_STRING_INTERNAL("ftello64")
  /// int ftrylockfile(FILE *file);
-@@ -845,6 +857,9 @@ TLI_DEFINE_STRING_INTERNAL("logl")
+@@ -929,6 +941,9 @@ TLI_DEFINE_STRING_INTERNAL("logl")
  TLI_DEFINE_ENUM_INTERNAL(lstat)
  TLI_DEFINE_STRING_INTERNAL("lstat")
  /// int lstat64(const char *path, struct stat64 *buf);
@@ -68,7 +66,7 @@ index a461ed813b9..f9fd9faeee0 100644
  TLI_DEFINE_ENUM_INTERNAL(lstat64)
  TLI_DEFINE_STRING_INTERNAL("lstat64")
  /// void *malloc(size_t size);
-@@ -1064,6 +1079,9 @@ TLI_DEFINE_STRING_INTERNAL("sscanf")
+@@ -1154,6 +1169,9 @@ TLI_DEFINE_STRING_INTERNAL("sscanf")
  TLI_DEFINE_ENUM_INTERNAL(stat)
  TLI_DEFINE_STRING_INTERNAL("stat")
  /// int stat64(const char *path, struct stat64 *buf);
@@ -78,7 +76,7 @@ index a461ed813b9..f9fd9faeee0 100644
  TLI_DEFINE_ENUM_INTERNAL(stat64)
  TLI_DEFINE_STRING_INTERNAL("stat64")
  /// int statvfs(const char *path, struct statvfs *buf);
-@@ -1193,6 +1211,9 @@ TLI_DEFINE_STRING_INTERNAL("times")
+@@ -1283,6 +1301,9 @@ TLI_DEFINE_STRING_INTERNAL("times")
  TLI_DEFINE_ENUM_INTERNAL(tmpfile)
  TLI_DEFINE_STRING_INTERNAL("tmpfile")
  /// FILE *tmpfile64(void)
@@ -89,5 +87,5 @@ index a461ed813b9..f9fd9faeee0 100644
  TLI_DEFINE_STRING_INTERNAL("tmpfile64")
  /// int toascii(int c);
 -- 
-2.16.1
+2.20.1
 
diff --git a/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
index 6a9283323c..2970b0827b 100644
--- a/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
+++ b/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
@@ -1,4 +1,4 @@
-From aeccf16eaccdd80e4d5ecaa51673ce4b2bac1130 Mon Sep 17 00:00:00 2001
+From 0570fe02c07244a8724c1e6c0437f893c8aa8e93 Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 19 May 2017 00:22:57 -0700
 Subject: [PATCH 2/2] llvm: allow env override of exe path
@@ -16,16 +16,16 @@ Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Martin Kelly <mkelly@xevo.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- tools/llvm-config/llvm-config.cpp | 17 ++++++++++++++++-
- 1 file changed, 16 insertions(+), 1 deletion(-)
+ tools/llvm-config/llvm-config.cpp | 35 ++++++++++++++++++++++---------
+ 1 file changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/tools/llvm-config/llvm-config.cpp b/tools/llvm-config/llvm-config.cpp
-index 08b096afb05..360cc5abf4e 100644
+index bec89fef98c..91b4d6e4c43 100644
 --- a/tools/llvm-config/llvm-config.cpp
 +++ b/tools/llvm-config/llvm-config.cpp
-@@ -225,6 +225,13 @@ Typical components:\n\
+@@ -226,6 +226,13 @@ Typical components:\n\
  
- /// \brief Compute the path to the main executable.
+ /// Compute the path to the main executable.
  std::string GetExecutablePath(const char *Argv0) {
 +  // Hack for Yocto: we need to override the root path when we are using
 +  // llvm-config from within a target sysroot.
@@ -37,7 +37,25 @@ index 08b096afb05..360cc5abf4e 100644
    // This just needs to be some symbol in the binary; C++ doesn't
    // allow taking the address of ::main however.
    void *P = (void *)(intptr_t)GetExecutablePath;
-@@ -306,12 +313,20 @@ int main(int argc, char **argv) {
+@@ -284,7 +291,7 @@ int main(int argc, char **argv) {
+   // bin dir).
+   sys::fs::make_absolute(CurrentPath);
+   CurrentExecPrefix =
+-      sys::path::parent_path(sys::path::parent_path(CurrentPath)).str();
++      sys::path::parent_path(sys::path::parent_path(sys::path::parent_path(CurrentPath))).str();
+ 
+   // Check to see if we are inside a development tree by comparing to possible
+   // locations (prefix style or CMake style).
+@@ -293,7 +300,7 @@ int main(int argc, char **argv) {
+     DevelopmentTreeLayout = CMakeStyle;
+     ActiveObjRoot = LLVM_OBJ_ROOT;
+   } else if (sys::fs::equivalent(CurrentExecPrefix,
+-                                 Twine(LLVM_OBJ_ROOT) + "/bin")) {
++                                 Twine(LLVM_OBJ_ROOT) + "/bin/llvm8.0")) {
+     IsInDevelopmentTree = true;
+     DevelopmentTreeLayout = CMakeBuildModeStyle;
+     ActiveObjRoot = LLVM_OBJ_ROOT;
+@@ -307,37 +314,45 @@ int main(int argc, char **argv) {
    std::string ActivePrefix, ActiveBinDir, ActiveIncludeDir, ActiveLibDir,
                ActiveCMakeDir;
    std::string ActiveIncludeOption;
@@ -45,11 +63,12 @@ index 08b096afb05..360cc5abf4e 100644
 +  // llvm-config from within a target sysroot.
 +  std::string Multilibdir = std::getenv("YOCTO_ALTERNATE_MULTILIB_NAME");
 +  if (Multilibdir.empty()) {
-+    Multilibdir = "/lib" LLVM_LIBDIR_SUFFIX;
++    Multilibdir = "/lib/llvm8.0" LLVM_LIBDIR_SUFFIX;
 +  }
 +
    if (IsInDevelopmentTree) {
-     ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include";
+-    ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include";
++    ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include/llvm8.0";
      ActivePrefix = CurrentExecPrefix;
  
      // CMake organizes the products differently than a normal prefix style
@@ -57,8 +76,31 @@ index 08b096afb05..360cc5abf4e 100644
 +
      switch (DevelopmentTreeLayout) {
      case CMakeStyle:
-       ActiveBinDir = ActiveObjRoot + "/bin";
-@@ -336,7 +351,7 @@ int main(int argc, char **argv) {
+-      ActiveBinDir = ActiveObjRoot + "/bin";
+-      ActiveLibDir = ActiveObjRoot + "/lib" + LLVM_LIBDIR_SUFFIX;
++      ActiveBinDir = ActiveObjRoot + "/bin/llvm8.0";
++      ActiveLibDir = ActiveObjRoot + "/lib/llvm8.0" + LLVM_LIBDIR_SUFFIX;
+       ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
+       break;
+     case CMakeBuildModeStyle:
+       ActivePrefix = ActiveObjRoot;
+-      ActiveBinDir = ActiveObjRoot + "/bin/" + build_mode;
++      ActiveBinDir = ActiveObjRoot + "/bin/llvm8.0/" + build_mode;
+       ActiveLibDir =
+-          ActiveObjRoot + "/lib" + LLVM_LIBDIR_SUFFIX + "/" + build_mode;
++          ActiveObjRoot + "/lib/llvm8.0" + LLVM_LIBDIR_SUFFIX + "/" + build_mode;
+       ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
+       break;
+     }
+ 
+     // We need to include files from both the source and object trees.
+     ActiveIncludeOption =
+-        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot + "/include");
++        ("-I" + ActiveIncludeDir + " " + "-I" + ActiveObjRoot + "/include/llvm8.0");
+   } else {
+     ActivePrefix = CurrentExecPrefix;
+-    ActiveIncludeDir = ActivePrefix + "/include";
++    ActiveIncludeDir = ActivePrefix + "/include/llvm8.0";
      SmallString<256> path(StringRef(LLVM_TOOLS_INSTALL_DIR));
      sys::fs::make_absolute(ActivePrefix, path);
      ActiveBinDir = path.str();
@@ -68,5 +110,5 @@ index 08b096afb05..360cc5abf4e 100644
      ActiveIncludeOption = "-I" + ActiveIncludeDir;
    }
 -- 
-2.18.0
+2.20.1
 
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index eb0779d6ec..eca78af09e 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://llvm.org"
 LICENSE = "NCSA"
 SECTION = "devel"
 
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=e825e017edc35cfd58e26116e5251771"
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
 
 DEPENDS = "libffi libxml2 zlib ninja-native llvm-native"
 
@@ -19,18 +19,23 @@ PROVIDES += "llvm${PV}"
 LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
-SRCREV = "5136df4d089a086b70d452160ad5451861269498"
-PV = "6.0"
-BRANCH = "release_60"
-PATCH_VERSION = "1"
-SRC_URI = "git://github.com/llvm-mirror/llvm.git;branch=${BRANCH};protocol=http \
+SRCREV = "e5cc6808dc0d5b773479bf36c51d59d0d3174733"
+BRANCH = "release_${MAJOR_VERSION}${MINOR_VERSION}"
+MAJOR_VERSION = "8"
+MINOR_VERSION = "0"
+PATCH_VERSION = "0"
+SOLIBVER = "1"
+PV = "${MAJOR_VERSION}.${MINOR_VERSION}"
+SRC_URI = "git://github.com/llvm-mirror/llvm.git;branch=${BRANCH} \
            file://0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch \
            file://0002-llvm-allow-env-override-of-exe-path.patch \
           "
 UPSTREAM_CHECK_COMMITS = "1"
+
 S = "${WORKDIR}/git"
 
 LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
+
 def get_llvm_arch(bb, d, arch_var):
     import re
     a = d.getVar(arch_var)
@@ -117,71 +122,54 @@ do_install() {
 	# Remove unnecessary cmake files
 	rm -rf ${D}${libdir}/${LLVM_DIR}/cmake
 
-	ln -s ${LLVM_DIR}/libLLVM-${PV}${SOLIBSDEV} ${D}${libdir}/libLLVM-${PV}${SOLIBSDEV}
+	ln -s ${LLVM_DIR}/libLLVM-${MAJOR_VERSION}${SOLIBSDEV} ${D}${libdir}/libLLVM-${MAJOR_VERSION}${SOLIBSDEV}
 
 	# We'll have to delete the libLLVM.so due to multiple reasons...
 	rm -rf ${D}${libdir}/${LLVM_DIR}/libLLVM.so
 	rm -rf ${D}${libdir}/${LLVM_DIR}/libLTO.so
 }
+
 do_install_class-native() {
 	install -D -m 0755 ${B}/bin/llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
 	install -D -m 0755 ${B}/bin/llvm-config ${D}${bindir}/llvm-config${PV}
-	install -D -m 0755 ${B}/lib/libLLVM-${PV}.so ${D}${libdir}/libLLVM-${PV}.so
+	install -D -m 0755 ${B}/lib/libLLVM-${MAJOR_VERSION}.so ${D}${libdir}/libLLVM-${MAJOR_VERSION}.so
 }
 
-PACKAGES += "${PN}-bugpointpasses ${PN}-llvmhello"
-ALLOW_EMPTY_${PN} = "1"
-ALLOW_EMPTY_${PN}-staticdev = "1"
-FILES_${PN} = ""
-FILES_${PN}-staticdev = ""
-FILES_${PN}-dbg = " \
-    ${bindir}/${LLVM_DIR}/.debug \
-    ${libdir}/${LLVM_DIR}/.debug/BugpointPasses.so \
-    ${libdir}/${LLVM_DIR}/.debug/LLVMHello.so \
-    ${libdir}/${LLVM_DIR}/.debug/libLTO.so* \
-    ${libdir}/${LLVM_DIR}/.debug/llvm-config \
-    /usr/src/debug \
-"
+PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto"
 
-FILES_${PN}-dev = " \
-    ${bindir}/${LLVM_DIR} \
-    ${includedir}/${LLVM_DIR} \
-    ${libdir}/${LLVM_DIR}/llvm-config \
-"
-
-RRECOMMENDS_${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello"
+RRECOMMENDS_${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liboptremarks"
 
 FILES_${PN}-bugpointpasses = "\
     ${libdir}/${LLVM_DIR}/BugpointPasses.so \
 "
-FILES_${PN} += "\
+
+FILES_${PN}-libllvm = "\
+    ${libdir}/${LLVM_DIR}/libLLVM-${MAJOR_VERSION}.so \
+    ${libdir}/libLLVM-${MAJOR_VERSION}.so \
+"
+
+FILES_${PN}-liblto += "\
     ${libdir}/${LLVM_DIR}/libLTO.so.* \
 "
 
+FILES_${PN}-liboptremarks += "\
+    ${libdir}/${LLVM_DIR}/libOptRemarks.so.* \
+"
+
 FILES_${PN}-llvmhello = "\
     ${libdir}/${LLVM_DIR}/LLVMHello.so \
 "
 
-PACKAGES_DYNAMIC = "^libllvm${LLVM_RELEASE}-.*$"
-NOAUTOPACKAGEDEBUG = "1"
-
-INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE}.${PATCH_VERSION} += "dev-so"
-INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE} += "dev-so"
-INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm += "dev-so"
-
-python llvm_populate_packages() {
-    libdir = bb.data.expand('${libdir}', d)
-    libllvm_libdir = bb.data.expand('${libdir}/${LLVM_DIR}', d)
-    split_dbg_packages = do_split_packages(d, libllvm_libdir+'/.debug', r'^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s-dbg', 'Split debug package for %s', allow_dirs=True)
-    split_packages = do_split_packages(d, libdir, r'^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s', 'Split package for %s', allow_dirs=True, allow_links=True, recursive=True)
-    split_staticdev_packages = do_split_packages(d, libllvm_libdir, r'^lib(.*)\.a$', 'libllvm${LLVM_RELEASE}-%s-staticdev', 'Split staticdev package for %s', allow_dirs=True)
-    if split_packages:
-        pn = d.getVar('PN')
-        d.appendVar('RDEPENDS_' + pn, ' '+' '.join(split_packages))
-        d.appendVar('RDEPENDS_' + pn + '-dbg', ' '+' '.join(split_dbg_packages))
-        d.appendVar('RDEPENDS_' + pn + '-staticdev', ' '+' '.join(split_staticdev_packages))
-}
+FILES_${PN}-dev += " \
+    ${libdir}/${LLVM_DIR}/llvm-config \
+    ${libdir}/${LLVM_DIR}/libOptRemarks.so \
+    ${libdir}/${LLVM_DIR}/libLLVM-${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}.so \
+"
+
+FILES_${PN}-staticdev += "\
+    ${libdir}/${LLVM_DIR}/*.a \
+"
 
-PACKAGESPLITFUNCS_prepend = "llvm_populate_packages "
+INSANE_SKIP_${PN}-libllvm += "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index e96a12c1b9..66ed649efe 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -105,7 +105,7 @@ GALLIUMDRIVERS_append = ",virgl"
 
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
 PACKAGECONFIG[gallium]      = "--enable-texture-float --with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
-MESA_LLVM_RELEASE ?= "6.0"
+MESA_LLVM_RELEASE ?= "8.0"
 PACKAGECONFIG[gallium-llvm] = "--enable-llvm --enable-llvm-shared-libs, --disable-llvm, llvm${MESA_LLVM_RELEASE} llvm-native \
                                ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
-- 
2.20.1


