Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 661066069C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 18:13:45 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id q24so2953826plr.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 11:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J2bm8OCAyrb3RDYlTCuvKAQ0JKckfz5aaKHNpHO7WqY=;
	b=AF/UKRnf9nK0G6gH0KyIFQyTbpQFVfFaSTwAzRBUofYxHRemsdLCh1zqw2UjP1xTOR
	0LGu8BFUAG9haRqt7si91byJE6KAjH9jXXd9BqaA0tH401gZXCPh8YjhonyhwuN/1yuk
	8keU//06G94fv3wfY8Ck5kRqNjwNLl7O1uVavyp9inuuZBch6bCdSa98G5WVGOI6JuFV
	QGIBujE6i+u3vDsttCTsVe7Ako31E1VGIFIko3dy19I2LmxO3Y+nURiLUouz9Ht/ClpA
	c+MQtGbPFNhIU8OEXZ2pGmGm6Uzms8jpYEez0zx8aKzo3omdTGAEM4UZMD/iXlmdDbl3
	ITvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J2bm8OCAyrb3RDYlTCuvKAQ0JKckfz5aaKHNpHO7WqY=;
	b=LrUErKq0mVMEWsA5eA4+LhbA7wM9IFjLoZZeZ9Le6UvVYkqz0EUDc1dup8Ctal4fsW
	FA8TsQZIlrx+/yWsanRxGIGGbAnApq/fxQyNsviO8qkbXokyzmyMCkSmLO098STI5pqk
	Fia4ZqWvi0ZKXI/FCAJaGSMaclnP1MlyuTmDfY1fMLx0uoydenSEOpeTTkTroduFeHbe
	Dq1fyb4ikxFZtjsYf7hHhQRS7we4IdjXK2qgO8/TM6WG0NpITP3KOCMpmZK8fTVGTFL9
	vYxnZ3oTqMnd2z49qHFmMnol3q09V4qOokAAiCxBpkIDeaEp9bxGV9531my6jnOqDn6n
	/jLQ==
X-Gm-Message-State: APjAAAU62QcblvkLFICvgv+me57lnb8A1Oy4GbcPviXMQ1u5JHOoVk6u
	o1EBybxyIUB2GJTPV7QHz6mEdkr1Ve4=
X-Google-Smtp-Source: APXvYqwUyosvKJCxzo4lywuIJpuxz0LRy9GmfqCfr+OUgpi1Ois3VabaXpdxU+XEhhEfu820u6pI7Q==
X-Received: by 2002:a17:902:8d84:: with SMTP id
	v4mr7872731plo.196.1569780825882; 
	Sun, 29 Sep 2019 11:13:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id e3sm9375697pjs.15.2019.09.29.11.13.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Sep 2019 11:13:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 11:13:28 -0700
Message-Id: <20190929181328.2650066-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] llvm: Update to 9.0.0
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
X-List-Received-Date: Sun, 29 Sep 2019 18:13:45 -0000
Content-Transfer-Encoding: 8bit

libOptRemarks has been renamed as libRemarks
RISC-V backend is now supported

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...ryInfo-Undefine-libc-functions-if-th.patch |  9 ++------
 ...-llvm-allow-env-override-of-exe-path.patch |  8 ++-----
 meta/recipes-devtools/llvm/llvm_git.bb        | 23 ++++++++++---------
 4 files changed, 17 insertions(+), 25 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index d8f434609b..4a23c50631 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,7 +26,7 @@ QEMUVERSION ?= "4.1%"
 GOVERSION ?= "1.12%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
-LLVMVERSION ?= "8.0.1"
+LLVMVERSION ?= "9.0.0"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/llvm/llvm/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch b/meta/recipes-devtools/llvm/llvm/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
index 789c308863..d75c94e9e9 100644
--- a/meta/recipes-devtools/llvm/llvm/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
+++ b/meta/recipes-devtools/llvm/llvm/0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
@@ -1,13 +1,11 @@
-From 4c08879d2dfbe7face4e679ac8499dc7bff2dd20 Mon Sep 17 00:00:00 2001
+From dbeecdb307be8b783b42cbc89dcb9c5e7f528989 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 May 2016 00:33:20 +0000
-Subject: [PATCH 06/19] llvm: TargetLibraryInfo: Undefine libc functions if
- they are macros
+Subject: [PATCH] llvm: TargetLibraryInfo: Undefine libc functions if they are macros
 
 musl defines some functions as macros and not inline functions
 if this is the case then make sure to undefine them
 
-Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  .../llvm/Analysis/TargetLibraryInfo.def       | 21 +++++++++++++++++++
@@ -87,6 +85,3 @@ index afed404f04c..876888656f2 100644
  TLI_DEFINE_ENUM_INTERNAL(tmpfile64)
  TLI_DEFINE_STRING_INTERNAL("tmpfile64")
  /// int toascii(int c);
--- 
-2.22.0
-
diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
index f47080c9fd..58dce513c2 100644
--- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
+++ b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
@@ -1,14 +1,13 @@
-From b66d6f39a374b8df41e7235351e5dee2e81f440c Mon Sep 17 00:00:00 2001
+From 61b00e1e051e367f5483d7b5253b6c85a9e8a90f Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 19 May 2017 00:22:57 -0700
-Subject: [PATCH 07/19] llvm: allow env override of exe path
+Subject: [PATCH] llvm: allow env override of exe path
 
 When using a native llvm-config from inside a sysroot, we need llvm-config to
 return the libraries, include directories, etc. from inside the sysroot rather
 than from the native sysroot. Thus provide an env override for calling
 llvm-config from a target sysroot.
 
-Upstream-Status: Pending
 Signed-off-by: Martin Kelly <mkelly@xevo.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
@@ -33,6 +32,3 @@ index 7ef7c46a262..a4f7ed82c7b 100644
    // This just needs to be some symbol in the binary; C++ doesn't
    // allow taking the address of ::main however.
    void *P = (void *)(intptr_t)GetExecutablePath;
--- 
-2.22.0
-
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 08b19a33e3..aba8e4e829 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -3,10 +3,10 @@
 
 DESCRIPTION = "The LLVM Compiler Infrastructure"
 HOMEPAGE = "http://llvm.org"
-LICENSE = "NCSA"
+LICENSE = "Apache-2.0-with-LLVM-exception"
 SECTION = "devel"
 
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=8a15a0759ef07f2682d2ba4b893c9afe"
 
 DEPENDS = "libffi libxml2 zlib libedit ninja-native llvm-native"
 
@@ -16,17 +16,17 @@ inherit cmake pkgconfig
 
 PROVIDES += "llvm${PV}"
 
+MAJOR_VERSION = "9"
+MINOR_VERSION = "0"
+PATCH_VERSION = "0"
+
+PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
+
 LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
-SRCREV = "19a71f6bdf2dddb10764939e7f0ec2b98dba76c9"
-
 BRANCH = "release/${MAJOR_VERSION}.x"
-MAJOR_VERSION = "8"
-MINOR_VERSION = "0"
-PATCH_VERSION = "1"
-SOLIBVER = "1"
-PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
+SRCREV = "0399d5a9682b3cef71c653373e38890c63c4c365"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
@@ -45,6 +45,7 @@ def get_llvm_arch(bb, d, arch_var):
     elif re.match(r'aarch64$', a):                      return 'AArch64'
     elif re.match(r'aarch64_be$', a):                   return 'AArch64'
     elif re.match(r'mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
+    elif re.match(r'riscv(32|64)(eb|)$', a):            return 'RISCV'
     elif re.match(r'p(pc|owerpc)(|64)', a):             return 'PowerPC'
     else:
         raise bb.parse.SkipRecipe("Cannot map '%s' to a supported LLVM architecture" % a)
@@ -158,7 +159,7 @@ FILES_${PN}-liblto += "\
 "
 
 FILES_${PN}-liboptremarks += "\
-    ${libdir}/${LLVM_DIR}/libOptRemarks.so.* \
+    ${libdir}/${LLVM_DIR}/libRemarks.so.* \
 "
 
 FILES_${PN}-llvmhello = "\
@@ -167,7 +168,7 @@ FILES_${PN}-llvmhello = "\
 
 FILES_${PN}-dev += " \
     ${libdir}/${LLVM_DIR}/llvm-config \
-    ${libdir}/${LLVM_DIR}/libOptRemarks.so \
+    ${libdir}/${LLVM_DIR}/libRemarks.so \
     ${libdir}/${LLVM_DIR}/libLLVM-${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}.so \
 "
 
-- 
2.23.0


