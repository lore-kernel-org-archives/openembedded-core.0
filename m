Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7FF457C3D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 06:50:41 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id r136so1052006pfc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 22:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=lMtbFfrL6dBdvVwhmfjq5SChK6RECXS9Huzed0UrrBU=;
	b=rMeFDrAnLRj0HQXOlW9AGV4pK3kCgQEkf2QpmR6Uh3FvxUsYG1cRhpPse8SOmCAsTW
	dwkcBgpv1kqQJfiQr6hMdC9W6kI8UlDkQs9I5y3pgY8dHE8NuJ3GIXDHbdfPsYhOzcZw
	1NWCNeDBPPde9zOU1d2g849n2r4AhdzqdH7D99BJqWFpsMIFh5rRZABDiBZE/2YWTZIP
	6Ypcrn8URWHlrgjBC0iteNr7jBbjLBTTM/v4+Csjw5F/nzGqoB2egO890uJFyyoKPGC1
	gMPjGg/eo3ojG0TZf2OMvhz7AfB1UHqmF2U6Z/9HIzq0vrn4bn3PU9wcAEBjM/HhCIXp
	t+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lMtbFfrL6dBdvVwhmfjq5SChK6RECXS9Huzed0UrrBU=;
	b=eE8wRsPoIsZVJNg8QR7Sb2WGuvF6v/MzEQUhFVcoxOQPOlGSIaLsoOu2qrs7vrnP6e
	EMgLZ3IFXXzFYURGy460gi0RMXMZc248XzA6wo+zjAGy7W0k/Mx7oRlMo7417cTMmAXl
	aYhn30d2kNLU+6qTRYYEUiHx+4Dta+yfNiiseUs09pY4VDfXpWRWBo0QRVPrE6qGhu9a
	IjnaqenxhDPMVUp+qflDFQ0UMUx7CjpakoN1i9HVF7Q4aKRv5kIZ6mSgAbG5G5Y7KbXV
	LMoRP7mq+gVHuDZBA+s7MB747PUffVMtzU+HP3I7j4oTp95T9w3BvEAbawbp9c14jCPU
	/tDA==
X-Gm-Message-State: AJcUukcjikkMLCJeNymMeigygmAa0A+dv4H7aabT98fUaBpI3rFHpWVV
	wJYOAwq90T3eBQzsXMjBPTCyeasC
X-Google-Smtp-Source: ALg8bN6qAUipWNgRpLy98ILhMwW4zSQTbKBDYSV/uNbmLf55OWhPdw6NZpBnATJbLuzGNKP2gqm2qA==
X-Received: by 2002:a63:f658:: with SMTP id u24mr30659242pgj.267.1548917442302;
	Wed, 30 Jan 2019 22:50:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::26b6])
	by smtp.gmail.com with ESMTPSA id
	o85sm1080044pfi.105.2019.01.30.22.50.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 22:50:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 22:50:16 -0800
Message-Id: <20190131065016.21887-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190131065016.21887-1-raj.khem@gmail.com>
References: <20190131065016.21887-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] llvm: Upgrade to upcoming 8.0.0 release
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
X-List-Received-Date: Thu, 31 Jan 2019 06:50:41 -0000
Content-Transfer-Encoding: 8bit

License-Update: Copyright year updates from 2017-2019

Refresh patches to apply on new version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ryInfo-Undefine-libc-functions-if-th.patch | 28 ++++----
 ...-llvm-allow-env-override-of-exe-path.patch | 66 +++++++++++++++----
 meta/recipes-devtools/llvm/llvm_git.bb        | 25 ++++---
 3 files changed, 83 insertions(+), 36 deletions(-)

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
index eb0779d6ec..a3dcab175d 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://llvm.org"
 LICENSE = "NCSA"
 SECTION = "devel"
 
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=e825e017edc35cfd58e26116e5251771"
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
 
 DEPENDS = "libffi libxml2 zlib ninja-native llvm-native"
 
@@ -19,18 +19,22 @@ PROVIDES += "llvm${PV}"
 LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
-SRCREV = "5136df4d089a086b70d452160ad5451861269498"
-PV = "6.0"
-BRANCH = "release_60"
-PATCH_VERSION = "1"
-SRC_URI = "git://github.com/llvm-mirror/llvm.git;branch=${BRANCH};protocol=http \
+SRCREV = "5a46917218575e92e3f0f9378338fd215be39107"
+BRANCH = "release_${MAJOR_VERSION}${MINOR_VERSION}"
+MAJOR_VERSION = "8"
+MINOR_VERSION = "0"
+PATCH_VERSION = "0"
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
@@ -117,7 +121,7 @@ do_install() {
 	# Remove unnecessary cmake files
 	rm -rf ${D}${libdir}/${LLVM_DIR}/cmake
 
-	ln -s ${LLVM_DIR}/libLLVM-${PV}${SOLIBSDEV} ${D}${libdir}/libLLVM-${PV}${SOLIBSDEV}
+	ln -s ${LLVM_DIR}/libLLVM-${MAJOR_VERSION}${SOLIBSDEV} ${D}${libdir}/libLLVM-${MAJOR_VERSION}${SOLIBSDEV}
 
 	# We'll have to delete the libLLVM.so due to multiple reasons...
 	rm -rf ${D}${libdir}/${LLVM_DIR}/libLLVM.so
@@ -126,7 +130,7 @@ do_install() {
 do_install_class-native() {
 	install -D -m 0755 ${B}/bin/llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
 	install -D -m 0755 ${B}/bin/llvm-config ${D}${bindir}/llvm-config${PV}
-	install -D -m 0755 ${B}/lib/libLLVM-${PV}.so ${D}${libdir}/libLLVM-${PV}.so
+	install -D -m 0755 ${B}/lib/libLLVM-${MAJOR_VERSION}.so ${D}${libdir}/libLLVM-${MAJOR_VERSION}.so
 }
 
 PACKAGES += "${PN}-bugpointpasses ${PN}-llvmhello"
@@ -139,6 +143,7 @@ FILES_${PN}-dbg = " \
     ${libdir}/${LLVM_DIR}/.debug/BugpointPasses.so \
     ${libdir}/${LLVM_DIR}/.debug/LLVMHello.so \
     ${libdir}/${LLVM_DIR}/.debug/libLTO.so* \
+    ${libdir}/${LLVM_DIR}/.debug/libOptRemarks.so* \
     ${libdir}/${LLVM_DIR}/.debug/llvm-config \
     /usr/src/debug \
 "
@@ -147,6 +152,7 @@ FILES_${PN}-dev = " \
     ${bindir}/${LLVM_DIR} \
     ${includedir}/${LLVM_DIR} \
     ${libdir}/${LLVM_DIR}/llvm-config \
+    ${libdir}/${LLVM_DIR}/libOptRemarks.so \
 "
 
 RRECOMMENDS_${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello"
@@ -156,6 +162,7 @@ FILES_${PN}-bugpointpasses = "\
 "
 FILES_${PN} += "\
     ${libdir}/${LLVM_DIR}/libLTO.so.* \
+    ${libdir}/${LLVM_DIR}/libOptRemarks.so.* \
 "
 
 FILES_${PN}-llvmhello = "\
@@ -166,7 +173,7 @@ PACKAGES_DYNAMIC = "^libllvm${LLVM_RELEASE}-.*$"
 NOAUTOPACKAGEDEBUG = "1"
 
 INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE}.${PATCH_VERSION} += "dev-so"
-INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${LLVM_RELEASE} += "dev-so"
+INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm-${MAJOR_VERSION} += "dev-so"
 INSANE_SKIP_${MLPREFIX}libllvm${LLVM_RELEASE}-llvm += "dev-so"
 
 python llvm_populate_packages() {
-- 
2.20.1


