Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30D7C54F32
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 03:52:46 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.40727.1747972362228015310
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 20:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gOHnDa+z;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2322dc5c989so36772125ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 20:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747972362; x=1748577162; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUyf5QzGb29isRTWPlsB7cs6E86lITm1ErdG2Tv6Nq8=;
        b=gOHnDa+zHvonTnKOhoQfNj8XS4N/CHpey3tEQjfE2X8ORrcXajsfE27h8m3ZPUGDHo
         +9ymQGGRwqo/zZp8rJrhJRxTPnAuw8x1RGl5LlV34nBHF56hZ1+VyM0rGDdkqQ1Y+uar
         /OKdeOQ0XOytHem/SqhSb1lJQV1tXp9pML0fnxK3VGEhxkJjZdw8HT1AETYvERIH/nlY
         djqPs70oOTr5iWb1q41N5u0lHgIisRE9jt9Dh96lLfpFx5o9KNXiKvM1W/GVdmnkGoBW
         aAHmzwBufawRDnQ0YumdOuF02K84mp2wg06Mnp23c2wP+Fh0r+CGaEoVZJcqbv/Wx8KR
         9ymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747972362; x=1748577162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUyf5QzGb29isRTWPlsB7cs6E86lITm1ErdG2Tv6Nq8=;
        b=F8YZxYqLNxrOH0vANfMPgTIIOqClZvaBYsOqnBh65tAAeOglke7khen8YmL6/yhQJv
         RYDbj7YkS673NsWR1c/R5yiD6KrGpLtvwCPtgFMo0yuePIhl9sSiWkcXnROSh+ngVIbE
         u+O9/42nzCa6lAb2/wJnhYwUl+3tvuW948qoy83f0gEf8Pp4JmszxEl5686uXJZpwTw1
         /udNDCCH8wwb7XlXyopsX+vmCf7/al9KZnDWYPeWJaEX80cetm35HugEIqjOQJgZ8DzZ
         elkCV34MqeznoD4kq96TbTAG5N76+YHzu9hQqNJfqKdCwdla7M8MxdsrP0bzjoGyAmc/
         YMKA==
X-Gm-Message-State: AOJu0YzF6fmON+pl3wf2AtBrXwxNEc3nsydJNMCCAdXu+Ow1JX/0JB+z
	VOqFEA4EbLeo915KsTBnEwOeUcmbkQuyECvQ+UHYyf6Z2uA+znubNFLJTx4z/i1Y
X-Gm-Gg: ASbGncsDXg6AAqAN+otYWwDPhX3LZXwCyO3HdKJpjoB1xTemCj0gl2p+D9mdOq/JLbS
	7BANdpJr54+sUSXk7HGATjGxY4BCGAA+UCm2RMw6E8M/xGMMjssgjnIPTTocnhpkX9KBCyYJUpx
	oZE9Un8coZRdI/j7gCZLyNBGx9Wf8AMJPxwic2BdJhjwibl5/W5XKfdqEi+UHE+QUyGqJHDd2TN
	YwzFc4xSJjKQJDWjdkgUDuHF+ZJ/DtMyOnKRELUqRgtj2QE8P8aFhVEuhjV9Jidymb3nZ8sMYD2
	aZFSbhYtHvdDxns797o6S37IS/QeTCAbjzetgCLwwnk=
X-Google-Smtp-Source: AGHT+IHYOxm3DBDVNkhpWNezCFJhGm6mq3aGX46DtltLouhNfk/fBU1OKzMCL3qUyJKpdMnlqlkdrg==
X-Received: by 2002:a17:902:e742:b0:223:4341:a994 with SMTP id d9443c01a7336-231de2e6c97mr341390945ad.9.1747972361491;
        Thu, 22 May 2025 20:52:41 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5f56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231ecd5ea41sm107181155ad.228.2025.05.22.20.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 20:52:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 May 2025 20:52:35 -0700
Subject: [PATCH v3 01/13] toolchain: Provide abstraction for choosing
 per-recipe toolchain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-clang-toolchain-v3-1-16cfc6d9891b@gmail.com>
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
In-Reply-To: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 03:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217161

This implements a toolchain selection mechanism with existing defaults
unchanged.

It introduces a variable called TOOLCHAIN, which denotes the familiar
name for toolchain e.g. "gcc" which selects GNU compiler + binutils
as default C/C++ toolchain or "clang" which will use LLVM/Clang Compiler

Additionally build-gcc is used for selecting native compiler

TOOLCHAIN variable has a global fallback to "gcc" in configuration
metadata. A distro can switch to using say "clang" as default system
compiler by defining

TOOLCHAIN ?= "clang"

In local.conf or other distro specific global configuration metadata

It is also selectable at recipe scope, since not all packages are
buildable with either clang or gcc, a recipe can explicitly demand
a given toolchain e.g. glibc can not be built with clang therefore
glibc recipe sets.

TOOLCHAIN = "gcc"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-global/base.bbclass                   |  4 ++++
 meta/classes-recipe/cross-canadian.bbclass         |  1 +
 meta/classes-recipe/cross.bbclass                  |  1 +
 meta/classes-recipe/crosssdk.bbclass               |  1 +
 meta/classes-recipe/native.bbclass                 |  1 +
 meta/classes-recipe/nativesdk.bbclass              |  1 +
 meta/classes/toolchain/clang-native.bbclass        | 28 ++++++++++++++++++++++
 .../clang.inc => classes/toolchain/clang.bbclass}  |  8 +++----
 .../toolchain/gcc-native.bbclass}                  |  1 -
 .../gcc.inc => classes/toolchain/gcc.bbclass}      |  1 -
 meta/conf/bitbake.conf                             |  5 ++--
 11 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 8215969c7bb37c1a1b91e260cd31714fee2db87c..1e7d6fe9b6ac34c17820d9f6378a5aa50f00dff4 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -19,6 +19,10 @@ PACKAGECONFIG_CONFARGS ??= ""
 
 inherit metadata_scm
 
+inherit toolchain/gcc-native
+inherit toolchain/gcc
+inherit_defer ${@oe.utils.ifelse(d.getVar('TOOLCHAIN') == 'clang', 'toolchain/clang', '')}
+
 def lsb_distro_identifier(d):
     adjust = d.getVar('LSB_DISTRO_ADJUST')
     adjust_func = None
diff --git a/meta/classes-recipe/cross-canadian.bbclass b/meta/classes-recipe/cross-canadian.bbclass
index 059d9aa95f57dd77a0ab5172c4c15c13ed3bc43e..de002ede9d3f5d53a4837334bd5474bcfb208499 100644
--- a/meta/classes-recipe/cross-canadian.bbclass
+++ b/meta/classes-recipe/cross-canadian.bbclass
@@ -14,6 +14,7 @@
 EXCLUDE_FROM_WORLD = "1"
 NATIVESDKLIBC ?= "libc-glibc"
 LIBCOVERRIDE = ":${NATIVESDKLIBC}"
+TOOLCHAIN = ""
 CLASSOVERRIDE = "class-cross-canadian"
 STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}:${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
diff --git a/meta/classes-recipe/cross.bbclass b/meta/classes-recipe/cross.bbclass
index 93de9a527446554b93c1e323c7458cc7aacef799..5c36222d7aba04448b1ab70d61dd7c6d011b6a17 100644
--- a/meta/classes-recipe/cross.bbclass
+++ b/meta/classes-recipe/cross.bbclass
@@ -10,6 +10,7 @@ inherit relocatable
 # no need for them to be a direct target of 'world'
 EXCLUDE_FROM_WORLD = "1"
 
+TOOLCHAIN = ""
 CLASSOVERRIDE = "class-cross"
 PACKAGES = ""
 PACKAGES_DYNAMIC = ""
diff --git a/meta/classes-recipe/crosssdk.bbclass b/meta/classes-recipe/crosssdk.bbclass
index 824b1bcff47bcd36a70aa1d7b8724b6cf07131ff..0117afc404c2df77a1f7cb28831fe4098dbb4524 100644
--- a/meta/classes-recipe/crosssdk.bbclass
+++ b/meta/classes-recipe/crosssdk.bbclass
@@ -7,6 +7,7 @@
 inherit cross
 
 CLASSOVERRIDE = "class-crosssdk"
+TOOLCHAIN = ""
 NATIVESDKLIBC ?= "libc-glibc"
 LIBCOVERRIDE = ":${NATIVESDKLIBC}"
 MACHINEOVERRIDES = ""
diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index 625975a69429389a5b231a19b17e8ed7a12d80ad..12630079cd19d6df29f2da94853f6cf2c5895772 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -108,6 +108,7 @@ PKG_CONFIG_SYSTEM_INCLUDE_PATH[unexport] = "1"
 
 # we dont want libc-*libc to kick in for native recipes
 LIBCOVERRIDE = ""
+TOOLCHAIN = ""
 CLASSOVERRIDE = "class-native"
 MACHINEOVERRIDES = ""
 MACHINE_FEATURES = ""
diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/nativesdk.bbclass
index 7ecb4c12c1f0f2b9cc48da215006a153679facf8..f41e5b9642d26cbafeab47ec469441ddd3ff1c09 100644
--- a/meta/classes-recipe/nativesdk.bbclass
+++ b/meta/classes-recipe/nativesdk.bbclass
@@ -13,6 +13,7 @@ STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${S
 # libc for the SDK can be different to that of the target
 NATIVESDKLIBC ?= "libc-glibc"
 LIBCOVERRIDE = ":${NATIVESDKLIBC}"
+TOOLCHAIN = ""
 CLASSOVERRIDE = "class-nativesdk"
 MACHINEOVERRIDES = ""
 
diff --git a/meta/classes/toolchain/clang-native.bbclass b/meta/classes/toolchain/clang-native.bbclass
new file mode 100644
index 0000000000000000000000000000000000000000..bf395eade73eaad18bf15f35d03bc0aec2223090
--- /dev/null
+++ b/meta/classes/toolchain/clang-native.bbclass
@@ -0,0 +1,28 @@
+# inherit this class if you would like to use clang to compile the native
+# version of your recipes instead of system compiler ( which is normally gcc )
+# on build machines
+# to use it add
+#
+# inherit clang-native
+#
+# to the concerned recipe via a bbappend or directly to recipe file
+#
+BUILD_CC = "${CCACHE}${BUILD_PREFIX}clang ${BUILD_CC_ARCH} -isysroot=${STAGING_DIR_NATIVE}"
+BUILD_CXX = "${CCACHE}${BUILD_PREFIX}clang++ ${BUILD_CC_ARCH} -isysroot=${STAGING_DIR_NATIVE}"
+BUILD_FC = "${BUILD_PREFIX}gfortran ${BUILD_CC_ARCH} -isysroot=${STAGING_DIR_NATIVE}"
+BUILD_CPP = "${BUILD_PREFIX}clang ${BUILD_CC_ARCH} -isysroot=${STAGING_DIR_NATIVE} -E"
+BUILD_LD = "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
+BUILD_CCLD = "${BUILD_PREFIX}clang ${BUILD_CC_ARCH}"
+BUILD_AR = "${BUILD_PREFIX}llvm-ar"
+BUILD_AS = "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
+BUILD_RANLIB = "${BUILD_PREFIX}llvm-ranlib -D"
+BUILD_STRIP = "${BUILD_PREFIX}llvm-strip"
+BUILD_OBJCOPY = "${BUILD_PREFIX}llvm-objcopy"
+BUILD_OBJDUMP = "${BUILD_PREFIX}llvm-objdump"
+BUILD_NM = "${BUILD_PREFIX}llvn-nm"
+BUILD_READELF = "${BUILD_PREFIX}readelf"
+DEPENDS:append = " clang-native compiler-rt-native libcxx-native"
+# Use libcxx headers for native parts
+CXXFLAGS:append = " -stdlib=libc++"
+LDFLAGS:append = " -stdlib=libc++ -rtlib=libgcc -unwindlib=libgcc"
+BUILD_LDFLAGS:append = " -stdlib=libc++ -rtlib=libgcc -unwindlib=libgcc"
diff --git a/meta/conf/toolchain/clang.inc b/meta/classes/toolchain/clang.bbclass
similarity index 78%
rename from meta/conf/toolchain/clang.inc
rename to meta/classes/toolchain/clang.bbclass
index 0e5f0769f85a8373c58d4b54dbe2bb1cf7dbd50b..e35e0f0fb1b010dd0f770b749717370041e0ba0d 100644
--- a/meta/conf/toolchain/clang.inc
+++ b/meta/classes/toolchain/clang.bbclass
@@ -17,9 +17,9 @@ READELF = "${HOST_PREFIX}llvm-readelf"
 PREFERRED_PROVIDER_virtual/cross-cc = "${MLPREFIX}clang-cross-${TARGET_ARCH}"
 PREFERRED_PROVIDER_virtual/cross-c++ = "${MLPREFIX}clang-cross-${TARGET_ARCH}"
 PREFERRED_PROVIDER_virtual/compilerlibs = "gcc-runtime"
-PREFERRED_PROVIDER_virtual/cross-cc:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/cross-cc:class-nativesdk = "clang-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk = "clang-crosssdk-${SDK_SYS}"
 
-PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "gcc-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "clang-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "clang-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
diff --git a/meta/conf/toolchain/build-gcc.inc b/meta/classes/toolchain/gcc-native.bbclass
similarity index 99%
rename from meta/conf/toolchain/build-gcc.inc
rename to meta/classes/toolchain/gcc-native.bbclass
index a708bd0389a123504301fd151fb9ebdb677926be..1e1d68b027806b94e8229d4efef025cc1c038ad3 100644
--- a/meta/conf/toolchain/build-gcc.inc
+++ b/meta/classes/toolchain/gcc-native.bbclass
@@ -12,4 +12,3 @@ BUILD_OBJCOPY = "${BUILD_PREFIX}objcopy"
 BUILD_OBJDUMP = "${BUILD_PREFIX}objdump"
 BUILD_NM = "${BUILD_PREFIX}nm"
 BUILD_READELF = "${BUILD_PREFIX}readelf"
-
diff --git a/meta/conf/toolchain/gcc.inc b/meta/classes/toolchain/gcc.bbclass
similarity index 99%
rename from meta/conf/toolchain/gcc.inc
rename to meta/classes/toolchain/gcc.bbclass
index 36d33f5d6d0bfbf0f36158f389c4112ce20d806b..2479caf22c2cd48aebcce0abd5e6ac19b1c53a0f 100644
--- a/meta/conf/toolchain/gcc.inc
+++ b/meta/classes/toolchain/gcc.bbclass
@@ -23,4 +23,3 @@ PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "gcc-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "gcc-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
-
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e5037c6277841908df333b16adbe4e6cce55f814..83e52e7afaaddb19f7418a549c9b34d8d8ee92f1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -13,6 +13,8 @@ BASELIB = "lib"
 BASELIB:libc-glibc:powerpc64 = "lib64"
 BASELIB:libc-glibc:powerpc64le = "lib64"
 
+TOOLCHAIN ??= "gcc"
+
 # Path prefixes
 export base_prefix = ""
 export prefix = "/usr"
@@ -834,9 +836,6 @@ include conf/licenses.conf
 require conf/sanity.conf
 include conf/bblock.conf
 
-require toolchain/gcc.inc
-require toolchain/build-gcc.inc
-
 ##################################################################
 # Weak variables (usually to retain backwards compatibility)
 ##################################################################

-- 
2.49.0


