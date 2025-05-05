Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB26C3ABC2
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 04:15:24 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.43259.1746418517488518469
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 21:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YL4KgaZ8;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22423adf751so45161535ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 21:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746418517; x=1747023317; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sdHn0wtzxH8C/cE47EBflZy3EIy0v2LJsCAFD+iW/TU=;
        b=YL4KgaZ8Z+3kj5RDs+SPeITU8oywG86iNEAOHAf56Vd1LuLdkxj+7QbaUnr4iMfzzt
         R/E8ggDPHc4tDjJuyNundUGz1+hDoCkU93m2RcEXwmqAkevwqE0ZVeLljvEHl8CAvl0U
         Oy+laide1o3dW+sWNBm2cYLeN81a9KTCUth7wJcUc7JRhxc5jBvzS0nxgvd8dvW7rZ+l
         FGNB6ySL0710ViTGfxea6hUgMk/22xRyKegYEL7KZSc6QCzorCEDB2yCaTUzShqsDJk0
         U12P0+/XVUxV3mrcaPhj6Zogx0TnitgtXOu7PtCi1R5R3KdBbO8GZScWimie4jZpT9di
         pvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746418517; x=1747023317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdHn0wtzxH8C/cE47EBflZy3EIy0v2LJsCAFD+iW/TU=;
        b=ubOSp/Un/3S99C+WBNoo23UXWQgFcZHbzEr6LE0JiJzKfvpxW4HUVI7Agv+05euiIA
         xxQL7bjVlL0O+bzrOwTuJ+6IqMTKMNxnvI7O9miJFXTr/la+slE2iNvLsjlMZme2e0AJ
         tQxAIxrRav8QmwwHdUeTRV2sn/+wJW6Mq94Qv8Y0r9pjNdAdUPpgMQ0Vgi8shKHlqUDb
         lN9KR50WANvk0lIR2OX8EbSbIQeqUeiV12zDzrk4QX8uokzVn3MhLson2vFnlJXsXQrO
         ApvEoUHk+SbuFTHrwvMxk+0Q732fYZonOnf6B+R/F2t8YJIgXhvxAp1N+bL/qpvEw9Hj
         ueTA==
X-Gm-Message-State: AOJu0Ywt4+2xFW7KNZ5qwXQzvhGgFY5f1VkJelfafxEKAVNlivNJPOZm
	/QOXXcQb4YqoADOZtYITcvKIhWrcHpiicDkZyA5cR/nvGQZW5P0D
X-Gm-Gg: ASbGncuqJzXjqXBWQ12hM4xUwzuw0pUxdiuNqTAVn7lKmHJm2yBV4dgab1AdTw+iByy
	tKXPTZp/Xsnzp6qzjFmbp4nKUgNzuJMpalS6fja7fDfiynfgaPOMkhKgDlIhMfwaqK2LuxboZP3
	ggDHUiRxt6kRR6pIpCR57LN//7+epob1PVsv/tT7TbOhTkMWLsi1UUNXvv5EwjMsa6maZA3rX1G
	Ps/R1g2h8eRXo0w1GkPypGdEfWy0ZIAMj5AYaLIB9hS+oTgmZd/f+RBCjArPRN51dFD/OLj27GQ
	mJmomleO2Kjmnu1Lf4pALy2T/7vOJWgW1ZB12aihHTE=
X-Google-Smtp-Source: AGHT+IECTIWu2BHZ2XWWCU7ihlgGyc8vc+WoguqBqVYsg+NzYznTeiP7hMX3aALCCT7FAXNp/eIwTw==
X-Received: by 2002:a17:903:22cc:b0:224:1c41:a4cd with SMTP id d9443c01a7336-22e102b85aamr157271265ad.3.1746418515755;
        Sun, 04 May 2025 21:15:15 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059021044sm5905039b3a.96.2025.05.04.21.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 21:15:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 04 May 2025 21:15:11 -0700
Subject: [PATCH v7 1/8] clang: Merge llvm/clang family recipes from
 meta-clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250504-clang-merge-v7-1-165be7b96180@gmail.com>
References: <20250504-clang-merge-v7-0-165be7b96180@gmail.com>
In-Reply-To: <20250504-clang-merge-v7-0-165be7b96180@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 04:15:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215978

This can ensure that meta-clang does not carry them and can rely on core layer
while mesa can use them too.

Omit time stamps in openmp from generated files to improve
reproducibility

fix the issue that:
| file /usr/include/llvm/Config/llvm-config.h conflicts between attempted installs of lib32-llvm-dev-20.1.2-r0.core2_32 and llvm-dev-20.1.2-r0.core2_64

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../clang/clang-cross-canadian_git.bb              |  36 ++
 meta/recipes-devtools/clang/clang-cross_git.bb     |  39 ++
 meta/recipes-devtools/clang/clang-crosssdk_git.bb  |  33 ++
 ...ind-libunwind-headers-when-LIBCXXABI_LIBU.patch |  60 +++
 ...er-rt-support-a-new-embedded-linux-target.patch | 309 +++++++++++++
 ...-Simplify-cross-compilation.-Don-t-use-na.patch |  44 ++
 ...LibraryInfo-Undefine-libc-functions-if-th.patch |  90 ++++
 ...allow-env-override-of-exe-and-libdir-path.patch |  71 +++
 ...-clang-driver-Check-sysroot-for-ldso-path.patch |  78 ++++
 ...iver-tools.cpp-Add-lssp_nonshared-on-musl.patch |  32 ++
 .../0008-clang-Prepend-trailing-to-sysroot.patch   |  39 ++
 ...inside-the-target-sysroot-for-compiler-ru.patch |  41 ++
 ...ang-Define-releative-gcc-installation-dir.patch | 123 ++++++
 ...pthread-and-ldl-along-with-lunwind-for-st.patch |  35 ++
 ..._EXECUTABLE-when-cross-compiling-for-nati.patch |  24 +
 .../0013-Check-for-atomic-double-intrinsics.patch  |  34 ++
 ...configure-for-packages-using-find_package.patch |   2 +-
 ...esource-dir-location-for-cross-toolchains.patch |  50 +++
 ...r-Add-dyld-prefix-when-checking-sysroot-f.patch |  79 ++++
 .../0017-clang-Use-python3-in-python-scripts.patch |  35 ++
 ...Insert-anchor-for-adding-OE-distro-vendor.patch | 167 +++++++
 ...-Do-not-use-backtrace-APIs-on-non-glibc-l.patch |  68 +++
 ...86-triple-for-non-debian-multiarch-linux-.patch |  28 ++
 ...0021-libunwind-Added-unw_backtrace-method.patch |  56 +++
 .../0022-lldb-Link-with-libatomic-on-x86.patch     |  33 ++
 ...023-compiler-rt-Enable-__int128-for-ppc32.patch |  73 +++
 ...-Do-not-use-cmake-infra-to-detect-libzstd.patch |  62 +++
 ...ler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch |  46 ++
 ...-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch |  43 ++
 ...s-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch |  81 ++++
 ...vm-Add-OE-specific-ABI-triple-for-N32-ABI.patch |  78 ++++
 ...d-libunwind.pc.in-and-llvm-config-scripts.patch |  90 ++++
 ...py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch |  92 ++++
 ...r-rt-Do-not-pass-target-to-clang-compiler.patch |  29 ++
 .../clang/clang/0032-Fix-build-on-ppc64-musl.patch |  97 ++++
 ...d-a-build-option-to-disable-building-dexp.patch |  85 ++++
 ...itter-sort-ClassInfo-lists-by-name-as-we.patch} |   4 +-
 ...-remove-LLVM_LDFLAGS-from-ldflags-output.patch} |  12 +-
 ...ot-emit-date-and-time-into-generate-files.patch |  37 ++
 .../clang}/spirv-internal-build.patch              |   0
 .../clang}/spirv-shared-library.patch              |   0
 meta/recipes-devtools/clang/clang_git.bb           | 492 +++++++++++++++++++++
 meta/recipes-devtools/clang/common-clang.inc       |  24 +
 meta/recipes-devtools/clang/common-source.inc      |  17 +
 meta/recipes-devtools/clang/common.inc             |  83 ++++
 .../clang/compiler-rt-sanitizers_git.bb            | 131 ++++++
 meta/recipes-devtools/clang/compiler-rt_git.bb     | 121 +++++
 meta/recipes-devtools/clang/libcxx_git.bb          | 115 +++++
 meta/recipes-devtools/clang/llvm-project-source.bb |  12 +
 .../recipes-devtools/clang/llvm-project-source.inc |  99 +++++
 .../recipes-devtools/clang/nativesdk-clang-glue.bb |  36 ++
 meta/recipes-devtools/clang/openmp_git.bb          |  65 +++
 .../0007-llvm-allow-env-override-of-exe-path.patch |  36 --
 meta/recipes-devtools/llvm/llvm/llvm-config        |  54 ---
 meta/recipes-devtools/llvm/llvm_20.1.2.bb          | 233 ----------
 55 files changed, 3620 insertions(+), 333 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang-cross-canadian_git.bb b/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
new file mode 100644
index 0000000000000000000000000000000000000000..456c0d61bc560ee131e06fd37eb434ab366b1861
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
@@ -0,0 +1,36 @@
+# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Clang/LLVM based C/C++ compiler (cross-canadian for ${TARGET_ARCH} target)"
+HOMEPAGE = "http://clang.llvm.org/"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=0bcd48c3bdfef0c9d9fd17726e4b7dab"
+SECTION = "devel"
+
+PN = "clang-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+
+require common-clang.inc
+require common-source.inc
+inherit cross-canadian
+
+DEPENDS += "nativesdk-clang binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} virtual/nativesdk-cross-binutils virtual/nativesdk-libc"
+# We have to point gcc at a sysroot but we don't need to rebuild if this changes
+# e.g. we switch between different machines with different tunes.
+EXTRA_OECONF_PATHS[vardepsexclude] = "TUNE_PKGARCH"
+TARGET_ARCH[vardepsexclude] = "TUNE_ARCH"
+
+do_install() {
+	install -d ${D}${bindir}
+	for tool in clang clang++ clang-tidy lld ld.lld llvm-profdata \
+		llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip llvm-objcopy llvm-objdump llvm-readelf \
+		llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov
+	do
+		ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool
+	done
+}
+SSTATE_SCAN_FILES += "*-clang *-clang++ *-llvm-profdata *-llvm-ar \
+                      *-llvm-ranlib *-llvm-nm *-lld *-ld.lld *-llvm-as *-llvm-strip \
+                      *-llvm-objcopy *-llvm-objdump *-llvm-readelf *-llvm-addr2line \
+                      *-llvm-dwp *-llvm-size *-llvm-strings *-llvm-cov"
+do_install:append() {
+	cross_canadian_bindirlinks
+}
diff --git a/meta/recipes-devtools/clang/clang-cross_git.bb b/meta/recipes-devtools/clang/clang-cross_git.bb
new file mode 100644
index 0000000000000000000000000000000000000000..9b9b120a3d793f6dd989b566b3736934f1c0ff8d
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang-cross_git.bb
@@ -0,0 +1,39 @@
+# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Cross compiler wrappers for LLVM based C/C++ compiler"
+HOMEPAGE = "http://clang.llvm.org/"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=0bcd48c3bdfef0c9d9fd17726e4b7dab"
+SECTION = "devel"
+
+PN = "clang-cross-${TARGET_ARCH}"
+
+require common-clang.inc
+require common-source.inc
+inherit cross
+DEPENDS += "clang-native virtual/cross-binutils"
+
+#INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+do_install() {
+        install -d ${D}${bindir}
+	for tool in clang-tidy lld ld.lld llvm-profdata \
+            llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip llvm-objcopy llvm-objdump llvm-readelf \
+            llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov
+	do
+		ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool
+	done
+	install -m 0755 ${STAGING_BINDIR_NATIVE}/clang ${D}${bindir}/${TARGET_PREFIX}clang
+	install -m 0755 ${STAGING_BINDIR_NATIVE}/clang ${D}${bindir}/${TARGET_PREFIX}clang++
+}
+SSTATE_SCAN_FILES += "*-clang *-clang++ *-llvm-profdata *-lld *-ld.lld \
+                      *-llvm-nm *-llvm-ar *-llvm-as *-llvm-ranlib *-llvm-strip \
+                      *-llvm-objcopy *-llvm-objdump *-llvm-readelf *-llvm-addr2line \
+                      *-llvm-dwp *-llvm-size *-llvm-strings *-llvm-cov"
+
+SYSROOT_PREPROCESS_FUNCS += "clangcross_sysroot_preprocess"
+
+clangcross_sysroot_preprocess () {
+        sysroot_stage_dir ${D}${bindir} ${SYSROOT_DESTDIR}${bindir}
+}
+PACKAGES = ""
diff --git a/meta/recipes-devtools/clang/clang-crosssdk_git.bb b/meta/recipes-devtools/clang/clang-crosssdk_git.bb
new file mode 100644
index 0000000000000000000000000000000000000000..47ac96f4f93688b216adc95f4473b8c2dc3ec98b
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang-crosssdk_git.bb
@@ -0,0 +1,33 @@
+# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "SDK Cross compiler wrappers for LLVM based C/C++ compiler"
+HOMEPAGE = "http://clang.llvm.org/"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=0bcd48c3bdfef0c9d9fd17726e4b7dab"
+SECTION = "devel"
+
+PN = "clang-crosssdk-${SDK_SYS}"
+
+require common-clang.inc
+require common-source.inc
+inherit crosssdk
+DEPENDS += "clang-native nativesdk-clang-glue virtual/nativesdk-cross-binutils virtual/nativesdk-libc"
+
+do_install() {
+    install -d ${D}${bindir}
+	for tool in clang clang++ clang-tidy lld ld.lld llvm-profdata \
+		llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip llvm-objcopy llvm-objdump llvm-readelf \
+		llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov
+	do
+		ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool
+	done
+}
+SSTATE_SCAN_FILES += "*-clang *-clang++ *-llvm-profdata *-lld *-ld.lld \
+                      *-llvm-nm *-llvm-ar *-llvm-as *-llvm-ranlib *-llvm-strip \
+                      *-llvm-objcopy *-llvm-objdump *-llvm-readelf *-llvm-addr2line \
+                      *-llvm-dwp *-llvm-size *-llvm-strings *-llvm-cov"
+sysroot_stage_all () {
+	sysroot_stage_dir ${D}${bindir} ${SYSROOT_DESTDIR}${bindir}
+}
+
+PACKAGES = ""
diff --git a/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch b/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch
new file mode 100644
index 0000000000000000000000000000000000000000..21b033b498e5d66322493b84da6814d5712c0a8a
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch
@@ -0,0 +1,60 @@
+From ec9babfa91931042e7aa771915e2f1d4dc8d15e0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 27 Aug 2017 10:37:49 -0700
+Subject: [PATCH] libcxxabi: Find libunwind headers when
+ LIBCXXABI_LIBUNWIND_INCLUDES is set
+
+Currently, when LIBCXXABI_LIBUNWIND_INCLUDES is set via CMake arguments
+then it ends up not searching the specified dir and unwind.h is not found
+especially for ARM targets
+
+This patch makes the searching synthesized directories and then set
+LIBCXXABI_LIBUNWIND_INCLUDES if its there in environment
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libcxxabi/CMakeLists.txt | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/libcxxabi/CMakeLists.txt b/libcxxabi/CMakeLists.txt
+index 6dcfc51e5532..32478a62a058 100644
+--- a/libcxxabi/CMakeLists.txt
++++ b/libcxxabi/CMakeLists.txt
+@@ -465,7 +465,7 @@ set(LIBCXXABI_LIBUNWIND_PATH "${LIBCXXABI_LIBUNWIND_PATH}" CACHE PATH
+     "Specify path to libunwind source." FORCE)
+ 
+ if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARCH MATCHES ARM)
+-  find_path(LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL libunwind.h
++  find_path(LIBCXXABI_LIBUNWIND_INCLUDES libunwind.h
+     PATHS ${LIBCXXABI_LIBUNWIND_INCLUDES}
+           ${LIBCXXABI_LIBUNWIND_PATH}/include
+           ${CMAKE_BINARY_DIR}/${LIBCXXABI_LIBUNWIND_INCLUDES}
+@@ -476,18 +476,23 @@ if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARCH MATCHES ARM)
+     NO_CMAKE_FIND_ROOT_PATH
+   )
+ 
+-  if (LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL STREQUAL "LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL-NOTFOUND")
+-    set(LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL "")
++  if (LIBCXXABI_LIBUNWIND_INCLUDES STREQUAL "LIBCXXABI_LIBUNWIND_INCLUDES-NOTFOUND")
++    set(LIBCXXABI_LIBUNWIND_INCLUDES "")
+   endif()
+ endif()
+ 
+-if (NOT "${LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL}" STREQUAL "")
+-  include_directories("${LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL}")
++if (NOT "${LIBCXXABI_LIBUNWIND_INCLUDES}" STREQUAL "")
++  include_directories("${LIBCXXABI_LIBUNWIND_INCLUDES}")
+ endif()
+ 
+ add_custom_target(cxxabi-test-depends
+   COMMENT "Build dependencies required to run the libc++abi test suite.")
+ 
++set(LIBCXXABI_LIBUNWIND_INCLUDES "${LIBCXXABI_LIBUNWIND_INCLUDES}" CACHE PATH
++    "Specify path to libunwind includes." FORCE)
++set(LIBCXXABI_LIBUNWIND_PATH "${LIBCXXABI_LIBUNWIND_PATH}" CACHE PATH
++    "Specify path to libunwind source." FORCE)
++
+ # Add source code. This also contains all of the logic for deciding linker flags
+ # soname, etc...
+ add_subdirectory(include)
diff --git a/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedded-linux-target.patch b/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedded-linux-target.patch
new file mode 100644
index 0000000000000000000000000000000000000000..88cef402daad0b0470f8057e55b2a71558c428d2
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedded-linux-target.patch
@@ -0,0 +1,309 @@
+From 8cdfcfb9102c4008758bb844856e553d4fe4ae79 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 19 Apr 2015 15:16:23 -0700
+Subject: [PATCH] compiler-rt: support a new embedded linux target
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../make/platform/clang_linux_embedded.mk     | 286 ++++++++++++++++++
+ .../clang_linux_embedded_test_input.c         |   0
+ 2 files changed, 286 insertions(+)
+ create mode 100644 compiler-rt/make/platform/clang_linux_embedded.mk
+ create mode 100644 compiler-rt/make/platform/clang_linux_embedded_test_input.c
+
+diff --git a/compiler-rt/make/platform/clang_linux_embedded.mk b/compiler-rt/make/platform/clang_linux_embedded.mk
+new file mode 100644
+index 000000000000..d0a890075a1c
+--- /dev/null
++++ b/compiler-rt/make/platform/clang_linux_embedded.mk
+@@ -0,0 +1,286 @@
++# These are the functions which clang needs when it is targeting a previous
++# version of the OS. The issue is that the backend may use functions which were
++# not present in the libgcc that shipped on the platform. In such cases, we link
++# with a version of the library which contains private_extern definitions of all
++# the extra functions which might be referenced.
++
++Description := Static runtime libraries for embedded clang/Linux
++
++# A function that ensures we don't try to build for architectures that we
++# don't have working toolchains for.
++CheckArches = \
++  $(shell \
++    result=""; \
++    for arch in $(1); do \
++      if $(CC) -arch $$arch -c \
++	  -integrated-as \
++	  $(ProjSrcRoot)/make/platform/clang_linux_embedded_test_input.c \
++	  -o /dev/null > /dev/null 2> /dev/null; then \
++        result="$$result$$arch "; \
++      else \
++	printf 1>&2 \
++	  "warning: clang_linux_embedded.mk: dropping arch '$$arch' from lib '$(2)'\n"; \
++      fi; \
++    done; \
++    echo $$result)
++
++XCRun = \
++  $(shell \
++    result=`xcrun -find $(1) 2> /dev/null`; \
++    if [ "$$?" != "0" ]; then result=$(1); fi; \
++    echo $$result)
++
++###
++
++CC       := $(call XCRun,clang)
++AR       := $(call XCRun,ar)
++RANLIB   := $(call XCRun,ranlib)
++STRIP    := $(call XCRun,strip)
++LIPO     := $(call XCRun,lipo)
++DSYMUTIL := $(call XCRun,dsymutil)
++Configs :=
++UniversalArchs :=
++
++# Soft-float version of the runtime. No floating-point instructions will be used
++# and the ABI (out of necessity) passes floating values in normal registers:
++# non-VFP variant of the AAPCS.
++UniversalArchs.soft_static := $(call CheckArches,arm armv7m armv7em armv7,soft_static)
++Configs += $(if $(UniversalArchs.soft_static),soft_static)
++
++# Hard-float version of the runtime. On ARM VFP instructions and registers are
++# allowed, and floating point values get passed in them. VFP variant of the
++# AAPCS.
++UniversalArchs.hard_static := $(call CheckArches,armv7em armv7 i386 x86_64,hard_static)
++Configs += $(if $(UniversalArchs.hard_static),hard_static)
++
++UniversalArchs.soft_pic := $(call CheckArches,armv6m armv7m armv7em armv7,soft_pic)
++Configs += $(if $(UniversalArchs.soft_pic),soft_pic)
++
++UniversalArchs.hard_pic := $(call CheckArches,armv7em armv7 i386 x86_64,hard_pic)
++Configs += $(if $(UniversalArchs.hard_pic),hard_pic)
++
++CFLAGS := -Wall -Werror -Oz -fomit-frame-pointer -ffreestanding
++
++PIC_CFLAGS := -fPIC
++STATIC_CFLAGS := -static
++
++CFLAGS_SOFT := -mfloat-abi=soft
++CFLAGS_HARD := -mfloat-abi=hard
++
++CFLAGS_I386  := -march=pentium
++
++CFLAGS.soft_static := $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_SOFT)
++CFLAGS.hard_static := $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_HARD)
++CFLAGS.soft_pic    := $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_SOFT)
++CFLAGS.hard_pic    := $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_HARD)
++
++CFLAGS.soft_static.armv7 := $(CFLAGS.soft_static) $(CFLAGS_ARMV7)
++CFLAGS.hard_static.armv7 := $(CFLAGS.hard_static) $(CFLAGS_ARMV7)
++CFLAGS.soft_pic.armv7    := $(CFLAGS.soft_pic) $(CFLAGS_ARMV7)
++CFLAGS.hard_pic.armv7    := $(CFLAGS.hard_pic) $(CFLAGS_ARMV7)
++
++# x86 platforms ignore -mfloat-abi options and complain about doing so. Despite
++# this they're hard-float.
++CFLAGS.hard_static.i386   := $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_I386)
++CFLAGS.hard_pic.i386      := $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_I386)
++CFLAGS.hard_static.x86_64 := $(CFLAGS) $(STATIC_CFLAGS)
++CFLAGS.hard_pic.x86_64    := $(CFLAGS) $(PIC_CFLAGS)
++
++# Functions not wanted:
++#   + eprintf is obsolete anyway
++#   + *vfp: designed for Thumb1 CPUs with VFPv2
++
++COMMON_FUNCTIONS := \
++	absvdi2 \
++	absvsi2 \
++	addvdi3 \
++	addvsi3 \
++	ashldi3 \
++	ashrdi3 \
++	bswapdi2 \
++	bswapsi2 \
++	clzdi2 \
++	clzsi2 \
++	cmpdi2 \
++	ctzdi2 \
++	ctzsi2 \
++	divdc3 \
++	divdi3 \
++	divsc3 \
++	divmodsi4 \
++	udivmodsi4 \
++	do_global_dtors \
++	ffsdi2 \
++	fixdfdi \
++	fixsfdi \
++	fixunsdfdi \
++	fixunsdfsi \
++	fixunssfdi \
++	fixunssfsi \
++	floatdidf \
++	floatdisf \
++	floatundidf \
++	floatundisf \
++	gcc_bcmp \
++	lshrdi3 \
++	moddi3 \
++	muldc3 \
++	muldi3 \
++	mulsc3 \
++	mulvdi3 \
++	mulvsi3 \
++	negdi2 \
++	negvdi2 \
++	negvsi2 \
++	paritydi2 \
++	paritysi2 \
++	popcountdi2 \
++	popcountsi2 \
++	powidf2 \
++	powisf2 \
++	subvdi3 \
++	subvsi3 \
++	ucmpdi2 \
++	udiv_w_sdiv \
++	udivdi3 \
++	udivmoddi4 \
++	umoddi3 \
++	adddf3 \
++	addsf3 \
++	cmpdf2 \
++	cmpsf2 \
++	div0 \
++	divdf3 \
++	divsf3 \
++	divsi3 \
++	extendsfdf2 \
++	ffssi2 \
++	fixdfsi \
++	fixsfsi \
++	floatsidf \
++	floatsisf \
++	floatunsidf \
++	floatunsisf \
++	comparedf2 \
++	comparesf2 \
++	modsi3 \
++	muldf3 \
++	mulsf3 \
++	negdf2 \
++	negsf2 \
++	subdf3 \
++	subsf3 \
++	truncdfsf2 \
++	udivsi3 \
++	umodsi3 \
++	unorddf2 \
++	unordsf2
++
++ARM_FUNCTIONS := \
++	aeabi_cdcmpeq \
++	aeabi_cdrcmple \
++	aeabi_cfcmpeq \
++	aeabi_cfrcmple \
++	aeabi_dcmpeq \
++	aeabi_dcmpge \
++	aeabi_dcmpgt \
++	aeabi_dcmple \
++	aeabi_dcmplt \
++	aeabi_drsub \
++	aeabi_fcmpeq \
++	aeabi_fcmpge \
++	aeabi_fcmpgt \
++	aeabi_fcmple \
++	aeabi_fcmplt \
++	aeabi_frsub \
++	aeabi_idivmod \
++	aeabi_uidivmod \
++
++# ARM Assembly implementation which requires Thumb2 (i.e. won't work on v6M).
++THUMB2_FUNCTIONS := \
++	switch16 \
++	switch32 \
++	switch8 \
++	switchu8 \
++	sync_fetch_and_add_4 \
++	sync_fetch_and_sub_4 \
++	sync_fetch_and_and_4 \
++	sync_fetch_and_or_4 \
++	sync_fetch_and_xor_4 \
++	sync_fetch_and_nand_4 \
++	sync_fetch_and_max_4 \
++	sync_fetch_and_umax_4 \
++	sync_fetch_and_min_4 \
++	sync_fetch_and_umin_4 \
++	sync_fetch_and_add_8 \
++	sync_fetch_and_sub_8 \
++	sync_fetch_and_and_8 \
++	sync_fetch_and_or_8 \
++	sync_fetch_and_xor_8 \
++	sync_fetch_and_nand_8 \
++	sync_fetch_and_max_8 \
++	sync_fetch_and_umax_8 \
++	sync_fetch_and_min_8 \
++	sync_fetch_and_umin_8
++
++I386_FUNCTIONS :=  \
++	i686.get_pc_thunk.eax \
++	i686.get_pc_thunk.ebp \
++	i686.get_pc_thunk.ebx \
++	i686.get_pc_thunk.ecx \
++	i686.get_pc_thunk.edi \
++	i686.get_pc_thunk.edx \
++	i686.get_pc_thunk.esi
++
++# FIXME: Currently, compiler-rt is missing implementations for a number of the
++# functions. Filter them out for now.
++MISSING_FUNCTIONS := \
++	cmpdf2 cmpsf2 div0 \
++	ffssi2 \
++	udiv_w_sdiv unorddf2 unordsf2 bswapdi2 \
++	bswapsi2 \
++	gcc_bcmp \
++	do_global_dtors \
++	i686.get_pc_thunk.eax i686.get_pc_thunk.ebp i686.get_pc_thunk.ebx \
++	i686.get_pc_thunk.ecx i686.get_pc_thunk.edi i686.get_pc_thunk.edx \
++	i686.get_pc_thunk.esi \
++	aeabi_cdcmpeq aeabi_cdrcmple aeabi_cfcmpeq aeabi_cfrcmple aeabi_dcmpeq \
++	aeabi_dcmpge aeabi_dcmpgt aeabi_dcmple aeabi_dcmplt aeabi_drsub \
++	aeabi_fcmpeq \ aeabi_fcmpge aeabi_fcmpgt aeabi_fcmple aeabi_fcmplt \
++	aeabi_frsub aeabi_idivmod aeabi_uidivmod
++
++FUNCTIONS_ARMV6M  := $(COMMON_FUNCTIONS) $(ARM_FUNCTIONS)
++FUNCTIONS_ARM_ALL := $(COMMON_FUNCTIONS) $(ARM_FUNCTIONS) $(THUMB2_FUNCTIONS)
++FUNCTIONS_I386    := $(COMMON_FUNCTIONS) $(I386_FUNCTIONS)
++FUNCTIONS_X86_64  := $(COMMON_FUNCTIONS)
++
++FUNCTIONS_ARMV6M := \
++	$(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_ARMV6M))
++FUNCTIONS_ARM_ALL := \
++	$(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_ARM_ALL))
++FUNCTIONS_I386 := \
++	$(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_I386))
++FUNCTIONS_X86_64 := \
++	$(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_X86_64))
++
++FUNCTIONS.soft_static.armv6m := $(FUNCTIONS_ARMV6M)
++FUNCTIONS.soft_pic.armv6m    := $(FUNCTIONS_ARMV6M)
++
++FUNCTIONS.soft_static.armv7m := $(FUNCTIONS_ARM_ALL)
++FUNCTIONS.soft_pic.armv7m    := $(FUNCTIONS_ARM_ALL)
++
++FUNCTIONS.soft_static.armv7em := $(FUNCTIONS_ARM_ALL)
++FUNCTIONS.hard_static.armv7em := $(FUNCTIONS_ARM_ALL)
++FUNCTIONS.soft_pic.armv7em    := $(FUNCTIONS_ARM_ALL)
++FUNCTIONS.hard_pic.armv7em    := $(FUNCTIONS_ARM_ALL)
++
++FUNCTIONS.soft_static.armv7 := $(FUNCTIONS_ARM_ALL)
++FUNCTIONS.hard_static.armv7 := $(FUNCTIONS_ARM_ALL)
++FUNCTIONS.soft_pic.armv7    := $(FUNCTIONS_ARM_ALL)
++FUNCTIONS.hard_pic.armv7    := $(FUNCTIONS_ARM_ALL)
++
++FUNCTIONS.hard_static.i386 := $(FUNCTIONS_I386)
++FUNCTIONS.hard_pic.i386    := $(FUNCTIONS_I386)
++
++FUNCTIONS.hard_static.x86_64 := $(FUNCTIONS_X86_64)
++FUNCTIONS.hard_pic.x86_64    := $(FUNCTIONS_X86_64)
+diff --git a/compiler-rt/make/platform/clang_linux_embedded_test_input.c b/compiler-rt/make/platform/clang_linux_embedded_test_input.c
+new file mode 100644
+index 000000000000..e69de29bb2d1
diff --git a/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch b/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch
new file mode 100644
index 0000000000000000000000000000000000000000..a153624860873d0740bd71cc1ae35744a530b44f
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch
@@ -0,0 +1,44 @@
+From c105a2efab08776d1f4df6b9b8d26d0f89d14b41 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 May 2016 23:11:45 -0700
+Subject: [PATCH] compiler-rt: Simplify cross-compilation. Don't use
+ native-compiled llvm-config.
+
+    Note: AddLLVM.cmake does not expose the LLVM source directory.
+    So if you want to run the test suite, you need to either:
+
+    1) set LLVM_MAIN_SRC_DIR explicitly (to find lit.py)
+    2) change AddLLVM.cmake to point to an installed 'lit'.
+    3) add_subdirectory(compiler-rt/test) from clang instead of compiler-rt.
+
+https://us.codeaurora.org/patches/quic/llvm/50683/compiler-rt-cross-compilation.patch
+
+Upstream-Status: Pending
+Signed-off-by: Greg Fitzgerald <gregf@codeaurora.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ compiler-rt/CMakeLists.txt | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/compiler-rt/CMakeLists.txt b/compiler-rt/CMakeLists.txt
+index 2c52788de56a..fe409704acc3 100644
+--- a/compiler-rt/CMakeLists.txt
++++ b/compiler-rt/CMakeLists.txt
+@@ -107,7 +107,16 @@ if (COMPILER_RT_STANDALONE_BUILD)
+   set(CMAKE_CXX_EXTENSIONS NO)
+ 
+   if (NOT LLVM_RUNTIMES_BUILD)
+-    load_llvm_config()
++    find_package(LLVM REQUIRED)
++    list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
++
++    # Variables that AddLLVM.cmake depends on (included by AddCompilerRT)
++    set(LLVM_TOOLS_BINARY_DIR "${LLVM_INSTALL_PREFIX}/bin")
++    set(LLVM_LIBRARY_DIR "${LLVM_INSTALL_PREFIX}/lib")
++
++    set(LLVM_LIBRARY_OUTPUT_INTDIR
++      ${CMAKE_BINARY_DIR}/${CMAKE_CFG_INTDIR}/lib${LLVM_LIBDIR_SUFFIX})
++
+   endif()
+   if (TARGET intrinsics_gen)
+     # Loading the llvm config causes this target to be imported so place it
diff --git a/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch b/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
new file mode 100644
index 0000000000000000000000000000000000000000..c70f740222f4d3282c469139f18f3cbfdab932b8
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
@@ -0,0 +1,90 @@
+From 388a70b4a8f828b7c58a0fb7bc3ee18001bc5f9b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 21 May 2016 00:33:20 +0000
+Subject: [PATCH] llvm: TargetLibraryInfo: Undefine libc functions if they are
+ macros
+
+musl defines some functions as macros and not inline functions
+if this is the case then make sure to undefine them
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../llvm/Analysis/TargetLibraryInfo.def       | 22 ++++++++++++++++++-
+ 1 file changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/llvm/include/llvm/Analysis/TargetLibraryInfo.def b/llvm/include/llvm/Analysis/TargetLibraryInfo.def
+index db566b8ee610..578161f9c978 100644
+--- a/llvm/include/llvm/Analysis/TargetLibraryInfo.def
++++ b/llvm/include/llvm/Analysis/TargetLibraryInfo.def
+@@ -1467,6 +1467,9 @@ TLI_DEFINE_STRING_INTERNAL("fopen")
+ TLI_DEFINE_SIG_INTERNAL(Ptr, Ptr, Ptr)
+ 
+ /// FILE *fopen64(const char *filename, const char *opentype)
++#ifdef fopen64
++#undef fopen64
++#endif
+ TLI_DEFINE_ENUM_INTERNAL(fopen64)
+ TLI_DEFINE_STRING_INTERNAL("fopen64")
+ TLI_DEFINE_SIG_INTERNAL(Ptr, Ptr, Ptr)
+@@ -1545,7 +1548,9 @@ TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Long, Int)
+ TLI_DEFINE_ENUM_INTERNAL(fseeko)
+ TLI_DEFINE_STRING_INTERNAL("fseeko")
+ TLI_DEFINE_SIG_INTERNAL(Int, Ptr, IntX, Int)
+-
++#ifdef fseeko64
++#undef fseeko64
++#endif
+ /// int fseeko64(FILE *stream, off64_t offset, int whence)
+ TLI_DEFINE_ENUM_INTERNAL(fseeko64)
+ TLI_DEFINE_STRING_INTERNAL("fseeko64")
+@@ -1562,6 +1567,9 @@ TLI_DEFINE_STRING_INTERNAL("fstat")
+ TLI_DEFINE_SIG_INTERNAL(Int, Int, Ptr)
+ 
+ /// int fstat64(int filedes, struct stat64 *buf)
++#ifdef fstat64
++#undef fstat64
++#endif
+ TLI_DEFINE_ENUM_INTERNAL(fstat64)
+ TLI_DEFINE_STRING_INTERNAL("fstat64")
+ TLI_DEFINE_SIG_INTERNAL(Int, Int, Ptr)
+@@ -1587,6 +1595,9 @@ TLI_DEFINE_STRING_INTERNAL("ftello")
+ TLI_DEFINE_SIG_INTERNAL(IntPlus, Ptr)
+ 
+ /// off64_t ftello64(FILE *stream)
++#ifdef ftello64
++#undef ftello64
++#endif
+ TLI_DEFINE_ENUM_INTERNAL(ftello64)
+ TLI_DEFINE_STRING_INTERNAL("ftello64")
+ TLI_DEFINE_SIG_INTERNAL(Int64, Ptr)
+@@ -1827,6 +1838,9 @@ TLI_DEFINE_STRING_INTERNAL("lstat")
+ TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
+ 
+ /// int lstat64(const char *path, struct stat64 *buf);
++#ifdef lstat64
++#undef lstat64
++#endif
+ TLI_DEFINE_ENUM_INTERNAL(lstat64)
+ TLI_DEFINE_STRING_INTERNAL("lstat64")
+ TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
+@@ -2334,6 +2348,9 @@ TLI_DEFINE_STRING_INTERNAL("stat")
+ TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
+ 
+ /// int stat64(const char *path, struct stat64 *buf);
++#ifdef stat64
++#undef stat64
++#endif
+ TLI_DEFINE_ENUM_INTERNAL(stat64)
+ TLI_DEFINE_STRING_INTERNAL("stat64")
+ TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
+@@ -2559,6 +2576,9 @@ TLI_DEFINE_STRING_INTERNAL("tmpfile")
+ TLI_DEFINE_SIG_INTERNAL(Ptr)
+ 
+ /// FILE *tmpfile64(void)
++#ifdef tmpfile64
++#undef tmpfile64
++#endif
+ TLI_DEFINE_ENUM_INTERNAL(tmpfile64)
+ TLI_DEFINE_STRING_INTERNAL("tmpfile64")
+ TLI_DEFINE_SIG_INTERNAL(Ptr)
diff --git a/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch b/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch
new file mode 100644
index 0000000000000000000000000000000000000000..6d3f5293aab84056e9693b5d2282166fd72b1ede
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and-libdir-path.patch
@@ -0,0 +1,71 @@
+From 0b344231c49d8c145bc3ad882d259d36fb19e827 Mon Sep 17 00:00:00 2001
+From: Martin Kelly <mkelly@xevo.com>
+Date: Fri, 19 May 2017 00:22:57 -0700
+Subject: [PATCH] llvm: allow env override of exe and libdir path
+
+When using a native llvm-config from inside a sysroot, we need llvm-config to
+return the libraries, include directories, etc. from inside the sysroot rather
+than from the native sysroot. Thus provide an env override for calling
+llvm-config from a target sysroot.
+
+Add YOCTO_ALTERNATE_LIBDIR and YOCTO_ALTERNATE_EXE_PATH env variables
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Martin Kelly <mkelly@xevo.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm/tools/llvm-config/llvm-config.cpp | 25 +++++++++++++++++++------
+ 1 file changed, 19 insertions(+), 6 deletions(-)
+
+diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
+index d5b76b1bb6c1..a739f0d8dbea 100644
+--- a/llvm/tools/llvm-config/llvm-config.cpp
++++ b/llvm/tools/llvm-config/llvm-config.cpp
+@@ -246,6 +246,13 @@ Typical components:\n\
+ 
+ /// Compute the path to the main executable.
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
+@@ -325,7 +332,7 @@ int main(int argc, char **argv) {
+   // Compute various directory locations based on the derived location
+   // information.
+   std::string ActivePrefix, ActiveBinDir, ActiveIncludeDir, ActiveLibDir,
+-              ActiveCMakeDir;
++              ActiveCMakeDir, BaseLibDir;
+   std::string ActiveIncludeOption;
+   if (IsInDevelopmentTree) {
+     ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include";
+@@ -366,12 +373,18 @@ int main(int argc, char **argv) {
+       sys::fs::make_absolute(ActivePrefix, Path);
+       ActiveBinDir = std::string(Path);
+     }
+-    ActiveLibDir = ActivePrefix + "/lib" + LLVM_LIBDIR_SUFFIX;
+-    {
+-      SmallString<256> Path(LLVM_INSTALL_PACKAGE_DIR);
+-      sys::fs::make_absolute(ActivePrefix, Path);
+-      ActiveCMakeDir = std::string(Path);
++    // Hack for Yocto: we need to override the lib path when we are using
++    // llvm-config from within a target sysroot since LLVM_LIBDIR_SUFFIX
++    // maybe different for host llvm vs target e.g. ppc64 Libdir=lib64 but
++    // x86_64 Libdir = lib
++    const char *YoctoLibDir = std::getenv("YOCTO_ALTERNATE_LIBDIR");
++    if (YoctoLibDir != nullptr) {
++      BaseLibDir = std::string(YoctoLibDir);
++    } else {
++      BaseLibDir = std::string("/lib") + LLVM_LIBDIR_SUFFIX;
+     }
++    ActiveLibDir = ActivePrefix + BaseLibDir;
++    ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
+     ActiveIncludeOption = "-I" + ActiveIncludeDir;
+   }
+ 
diff --git a/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch b/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch
new file mode 100644
index 0000000000000000000000000000000000000000..02586878207cbc7393239d71082299308d426d6e
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-ldso-path.patch
@@ -0,0 +1,78 @@
+From 80cacc04e4c0d34f79ee2f112b302c4fbb797d72 Mon Sep 17 00:00:00 2001
+From: Dan McGregor <dan.mcgregor@usask.ca>
+Date: Wed, 26 Apr 2017 20:29:41 -0600
+Subject: [PATCH] clang: driver: Check sysroot for ldso path
+
+when we build multilib the ldso has different paths than clangs defaults,
+every distro kind of does that so OE is not the only one,
+it happens especially on ppc64, where OE does not necessarily follow the
+default path for the dynamic linker, therefore adjust it for OE. Check
+for the default path, and if it isn't there, check /lib.
+
+Upstream-Status: Pending
+Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Linux.cpp | 22 +++++++++++++++++++++-
+ 1 file changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
+index 0767fe6c5879..e5a696f63fd0 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -523,8 +523,12 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+         Triple.getEnvironment() == llvm::Triple::GNUEABIHFT64 ||
+         tools::arm::getARMFloatABI(*this, Args) == tools::arm::FloatABI::Hard;
+ 
+-    LibDir = "lib";
+     Loader = HF ? "ld-linux-armhf.so.3" : "ld-linux.so.3";
++    LibDir = "lib32";
++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loader) &&
++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++        LibDir = "lib";
++    }
+     break;
+   }
+   case llvm::Triple::loongarch32: {
+@@ -578,11 +582,19 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+     LibDir = "lib64";
+     Loader =
+         (tools::ppc::hasPPCAbiArg(Args, "elfv2")) ? "ld64.so.2" : "ld64.so.1";
++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loader) &&
++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++        LibDir = "lib";
++    }
+     break;
+   case llvm::Triple::ppc64le:
+     LibDir = "lib64";
+     Loader =
+         (tools::ppc::hasPPCAbiArg(Args, "elfv1")) ? "ld64.so.1" : "ld64.so.2";
++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loader) &&
++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++        LibDir = "lib";
++    }
+     break;
+   case llvm::Triple::riscv32:
+   case llvm::Triple::riscv64: {
+@@ -600,6 +612,10 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+   case llvm::Triple::sparcv9:
+     LibDir = "lib64";
+     Loader = "ld-linux.so.2";
++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loader) &&
++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++        LibDir = "lib";
++    }
+     break;
+   case llvm::Triple::systemz:
+     LibDir = "lib";
+@@ -614,6 +630,10 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+ 
+     LibDir = X32 ? "libx32" : "lib64";
+     Loader = X32 ? "ld-linux-x32.so.2" : "ld-linux-x86-64.so.2";
++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loader) &&
++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++        LibDir = "lib";
++    }
+     break;
+   }
+   case llvm::Triple::ve:
diff --git a/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch b/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
new file mode 100644
index 0000000000000000000000000000000000000000..1681080ece279b38b0806889dde067cbf6ffe836
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
@@ -0,0 +1,32 @@
+From 47dfdd42687c403c044fdb830472d7bedc1b3d39 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 May 2016 21:11:06 -0700
+Subject: [PATCH] clang: Driver/tools.cpp: Add -lssp_nonshared on musl
+
+musl driver will need to add ssp_nonshared for stack_check_local
+on the linker cmdline when using stack protector commands on
+compiler cmdline
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Gnu.cpp | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolChains/Gnu.cpp
+index f56eeda3cb5f..9f7b9e8d42a8 100644
+--- a/clang/lib/Driver/ToolChains/Gnu.cpp
++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
+@@ -631,6 +631,12 @@ void tools::gnutools::Linker::ConstructJob(Compilation &C, const JobAction &JA,
+       if (IsIAMCU)
+         CmdArgs.push_back("-lgloss");
+ 
++      if (ToolChain.getTriple().isMusl() &&
++          (Args.hasArg(options::OPT_fstack_protector) ||
++          Args.hasArg(options::OPT_fstack_protector_strong) ||
++          Args.hasArg(options::OPT_fstack_protector_all))) {
++        CmdArgs.push_back("-lssp_nonshared");
++      }
+       if (IsStatic || IsStaticPIE)
+         CmdArgs.push_back("--end-group");
+       else
diff --git a/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroot.patch b/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroot.patch
new file mode 100644
index 0000000000000000000000000000000000000000..12f670034ebb495ac5ca6313e888c7526fad56e9
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroot.patch
@@ -0,0 +1,39 @@
+From 4b64a243ce69f782964d4841d1079689a62ebdc1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 16 Mar 2017 09:02:13 -0700
+Subject: [PATCH] clang: Prepend trailing '/' to sysroot
+
+This is needed to handle a case where clang
+isntall and target sysroot are perilously same
+
+e.g.
+
+sysroot = /mnt/clang/recipe-sysroot
+clang install = /mnt/clang/recipe-sysroot-native
+
+in this case it will mistakenly assume that
+clang is installed under the same sysroot dir
+and it will try to add relative ../lib paths
+to linker steps which would then be wrong
+since they will become relative to clang
+installation and not sysroot
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Linux.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
+index e5a696f63fd0..621fa17e0603 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -216,7 +216,7 @@ Linux::Linux(const Driver &D, const llvm::Triple &Triple, const ArgList &Args)
+   Multilibs = GCCInstallation.getMultilibs();
+   SelectedMultilibs.assign({GCCInstallation.getMultilib()});
+   llvm::Triple::ArchType Arch = Triple.getArch();
+-  std::string SysRoot = computeSysRoot();
++  std::string SysRoot = computeSysRoot() + "/";
+   ToolChain::path_list &PPaths = getProgramPaths();
+ 
+   Generic_GCC::PushPPaths(PPaths);
diff --git a/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch b/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch
new file mode 100644
index 0000000000000000000000000000000000000000..5d7a292fcf6967f2a3c770651ae0e1787aa2b7a5
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch
@@ -0,0 +1,41 @@
+From edc111019281ed898add2c3f86ebfd54b0fa46d9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 16 Mar 2017 19:06:26 -0700
+Subject: [PATCH] clang: Look inside the target sysroot for compiler runtime
+
+In OE compiler-rt and libc++ are built and staged into target
+sysroot and not into resourcedir which is relative to clang
+driver installation where the libraries are not instlled
+
+Specific to cross compiling the way yocto/OE works
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChain.cpp | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/clang/lib/Driver/ToolChain.cpp b/clang/lib/Driver/ToolChain.cpp
+index acf9d264d631..3e46c88e95cb 100644
+--- a/clang/lib/Driver/ToolChain.cpp
++++ b/clang/lib/Driver/ToolChain.cpp
+@@ -16,6 +16,7 @@
+ #include "ToolChains/InterfaceStubs.h"
+ #include "clang/Basic/ObjCRuntime.h"
+ #include "clang/Basic/Sanitizers.h"
++#include "clang/Basic/Version.h"
+ #include "clang/Config/config.h"
+ #include "clang/Driver/Action.h"
+ #include "clang/Driver/Driver.h"
+@@ -708,7 +709,10 @@ StringRef ToolChain::getOSLibName() const {
+ }
+ 
+ std::string ToolChain::getCompilerRTPath() const {
+-  SmallString<128> Path(getDriver().ResourceDir);
++  SmallString<128> Path(getDriver().SysRoot);
++  StringRef ClangLibdirBasename(CLANG_INSTALL_LIBDIR_BASENAME);
++  llvm::sys::path::append(Path, "/usr/", ClangLibdirBasename, "clang",
++                            CLANG_VERSION_STRING);
+   if (isBareMetal()) {
+     llvm::sys::path::append(Path, "lib", getOSLibName());
+     if (!SelectedMultilibs.empty()) {
diff --git a/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch b/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch
new file mode 100644
index 0000000000000000000000000000000000000000..c4fbaee956a7902dd41b631f3c3bed24c2e21d07
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-installation-dir.patch
@@ -0,0 +1,123 @@
+From e79d44241dfd0f4b4ec25547e6a65e61d2a0b4b2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 20 Mar 2021 16:09:16 -0700
+Subject: [PATCH] clang: Define / releative gcc installation dir
+
+This is required for OE gcc installation to work.
+Without this its not able to find the paths for libgcc
+and other standard headers and libraries from gcc
+installation in OE
+
+* Do not use install relative libc++ headers
+In OE we use same clang for native and cross builds, therefore we need
+to ensure that native sysroot install of libc++ is not searched for
+headers when doing cross compile instead it searches the target sysroot
+this is especially troublesome when libcxx-native is staged along with
+libcxx e.g. chromium
+
+ * Fix lib paths for OpenEmbedded Host
+
+Under OpenEmbedded Host, while building with clang-native, it cannot find
+the GCCInstallPath, which causing following error:
+[snip]
+compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang
+-target x86_64-linux
+-isystem/path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/include
+-O2 -pipe
+/path/to/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/share/cmake-3.21/Modules/CMakeCCompilerABI.c`
+hosttools/ld: cannot find crtbeginS.o: No such file or directory
+[snip]
+
+Before this patch:
+compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang
+clang version 13.0.1 (https://github.com/llvm/llvm-project 08e3a5ccd952edee36b3c002e3a29c6b1b5153de)
+Target: x86_64-unknown-linux-gnu
+Thread model: posix
+InstalledDir: /build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin
+Found candidate GCC installation: /usr/lib/gcc/x86_64-wrs-linux/10.2.0
+
+After this patch:
+compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang
+clang version 13.0.1 (https://github.com/llvm/llvm-project 08e3a5ccd952edee36b3c002e3a29c6b1b5153de)
+Thread model: posix
+InstalledDir: /build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin
+Found candidate GCC installation: /usr/lib/gcc/x86_64-wrs-linux/10.2.0
+Found candidate GCC installation: /usr/lib/x86_64-wrs-linux/10.2.0
+Selected GCC installation: /usr/lib/x86_64-wrs-linux/10.2.0
+Candidate multilib: .;@m64
+Selected multilib: .;@m64
+
+For OpenEmbedded Host, sysroots are of the form<sysroot>/usr/lib/<triple>/x.y.z.
+Take x86-64 as example, the default triple is x86_64-unknown-linux-gnu.
+For clang-native, the target vendor is '-unknown', need to test current distro
+to follow above form.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Gnu.cpp | 22 ++++++++++++++--------
+ 1 file changed, 14 insertions(+), 8 deletions(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolChains/Gnu.cpp
+index 9f7b9e8d42a8..268fb7bf7167 100644
+--- a/clang/lib/Driver/ToolChains/Gnu.cpp
++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
+@@ -19,6 +19,7 @@
+ #include "Linux.h"
+ #include "clang/Config/config.h" // for GCC_INSTALL_PREFIX
+ #include "clang/Driver/Compilation.h"
++#include "clang/Driver/Distro.h"
+ #include "clang/Driver/Driver.h"
+ #include "clang/Driver/DriverDiagnostic.h"
+ #include "clang/Driver/MultilibBuilder.h"
+@@ -2860,6 +2861,7 @@ void Generic_GCC::GCCInstallationDetector::ScanLibDirForGCCTriple(
+     const llvm::Triple &TargetTriple, const ArgList &Args,
+     const std::string &LibDir, StringRef CandidateTriple,
+     bool NeedsBiarchSuffix, bool GCCDirExists, bool GCCCrossDirExists) {
++  Distro Distro(D.getVFS(), TargetTriple);
+   // Locations relative to the system lib directory where GCC's triple-specific
+   // directories might reside.
+   struct GCCLibSuffix {
+@@ -2871,19 +2873,20 @@ void Generic_GCC::GCCInstallationDetector::ScanLibDirForGCCTriple(
+     // Whether this library suffix is relevant for the triple.
+     bool Active;
+   } Suffixes[] = {
+-      // This is the normal place.
+-      {"gcc/" + CandidateTriple.str(), "../..", GCCDirExists},
+-
+-      // Debian puts cross-compilers in gcc-cross.
+-      {"gcc-cross/" + CandidateTriple.str(), "../..", GCCCrossDirExists},
+-
+       // The Freescale PPC SDK has the gcc libraries in
+       // <sysroot>/usr/lib/<triple>/x.y.z so have a look there as well. Only do
+       // this on Freescale triples, though, since some systems put a *lot* of
+       // files in that location, not just GCC installation data.
+       {CandidateTriple.str(), "..",
+        TargetTriple.getVendor() == llvm::Triple::Freescale ||
+-           TargetTriple.getVendor() == llvm::Triple::OpenEmbedded}};
++           TargetTriple.getVendor() == llvm::Triple::OpenEmbedded ||
++           Distro.IsOpenEmbedded()},
++
++      // This is the normal place.
++      {"gcc/" + CandidateTriple.str(), "../..", GCCDirExists},
++
++      // Debian puts cross-compilers in gcc-cross.
++      {"gcc-cross/" + CandidateTriple.str(), "../..", GCCCrossDirExists}};
+ 
+   for (auto &Suffix : Suffixes) {
+     if (!Suffix.Active)
+@@ -3274,8 +3277,11 @@ Generic_GCC::addLibCxxIncludePaths(const llvm::opt::ArgList &DriverArgs,
+   // incompatible with the NDK libraries.
+   SmallString<128> DriverIncludeDir(getDriver().Dir);
+   llvm::sys::path::append(DriverIncludeDir, "..", "include");
++
++  // do not add it when --sysroot is specified, since it would expect
++  // libc++ headers from sysroot and not relative to compiler install location
+   if (AddIncludePath(DriverIncludeDir,
+-                     /*TargetDirRequired=*/getTriple().isAndroid()))
++                     /*TargetDirRequired=*/getTriple().isAndroid() | !computeSysRoot().empty()))
+     return;
+   // If this is a development, non-installed, clang, libcxx will
+   // not be found at ../include/c++ but it likely to be found at
diff --git a/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch b/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch
new file mode 100644
index 0000000000000000000000000000000000000000..e50e3bf026129aac9604cac380d241cae8053cb2
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch
@@ -0,0 +1,35 @@
+From 42dc7f1fd3e7bc549f87b9c28fb3024a3970e96d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Jul 2019 22:51:39 -0700
+Subject: [PATCH] clang: Add -lpthread and -ldl along with -lunwind for static
+ linking
+
+When doing static liking with --unwindlib=libunwind -static we encounter
+undefined symbols
+libunwind/src/RWMutex.hpp:68: undefined reference to `pthread_rwlock_wrlock'
+
+and
+
+libunwind/src/AddressSpace.hpp:597: undefined reference to `dladdr'
+
+therefore we need to link in libpthread and libdl to fill these symbols
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/CommonArgs.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/clang/lib/Driver/ToolChains/CommonArgs.cpp b/clang/lib/Driver/ToolChains/CommonArgs.cpp
+index ae635fb6a180..255e7e0b7150 100644
+--- a/clang/lib/Driver/ToolChains/CommonArgs.cpp
++++ b/clang/lib/Driver/ToolChains/CommonArgs.cpp
+@@ -2254,6 +2254,8 @@ static void AddUnwindLibrary(const ToolChain &TC, const Driver &D,
+         CmdArgs.push_back("-lunwind");
+     } else if (LGT == LibGccType::StaticLibGcc) {
+       CmdArgs.push_back("-l:libunwind.a");
++      CmdArgs.push_back("-lpthread");
++      CmdArgs.push_back("-ldl");
+     } else if (LGT == LibGccType::SharedLibGcc) {
+       if (TC.getTriple().isOSCygMing())
+         CmdArgs.push_back("-l:libunwind.dll.a");
diff --git a/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch b/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch
new file mode 100644
index 0000000000000000000000000000000000000000..0f386cd1a6c5d9633d700a77cb5493d337a739d1
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch
@@ -0,0 +1,24 @@
+From 0e60706bcddbb9a97ab28df6fba39bf6bd49ab27 Mon Sep 17 00:00:00 2001
+From: Anuj Mittal <anuj.mittal@intel.com>
+Date: Thu, 26 Dec 2019 12:56:16 -0800
+Subject: [PATCH] Pass PYTHON_EXECUTABLE when cross compiling for native build
+
+Upstream-Status: Pending
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm/cmake/modules/CrossCompile.cmake | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/llvm/cmake/modules/CrossCompile.cmake b/llvm/cmake/modules/CrossCompile.cmake
+index 3b31d3e218a3..a07ab45878fd 100644
+--- a/llvm/cmake/modules/CrossCompile.cmake
++++ b/llvm/cmake/modules/CrossCompile.cmake
+@@ -100,6 +100,7 @@ function(llvm_create_cross_target project_name target_name toolchain buildtype)
+         -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN="${LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN}"
+         -DLLVM_INCLUDE_BENCHMARKS=OFF
+         -DLLVM_INCLUDE_TESTS=OFF
++        -DPYTHON_EXECUTABLE="${PYTHON_EXECUTABLE}"
+         ${build_type_flags} ${linker_flag} ${external_clang_dir} ${libc_flags}
+         ${ARGN}
+     WORKING_DIRECTORY ${${project_name}_${target_name}_BUILD}
diff --git a/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrinsics.patch b/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrinsics.patch
new file mode 100644
index 0000000000000000000000000000000000000000..3a6713a2deeb5e863d0543649d92c44ccf22037d
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrinsics.patch
@@ -0,0 +1,34 @@
+From f7ef28286dd0adfd384ef55c9039022b4f92f99c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 18 Nov 2019 17:00:29 -0800
+Subject: [PATCH] Check for atomic<double> intrinsics
+
+On some architectures e.g. x86/32bit gcc decides to inline calls to
+double atomic variables but clang does not and defers it to libatomic
+therefore detect if clang can use built-ins for atomic<double> if not
+then link libatomic, this helps building clangd for x86 on linux systems
+with gcc runtime
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm/cmake/modules/CheckAtomic.cmake | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/llvm/cmake/modules/CheckAtomic.cmake b/llvm/cmake/modules/CheckAtomic.cmake
+index f11cadf39ff6..80a18a92956a 100644
+--- a/llvm/cmake/modules/CheckAtomic.cmake
++++ b/llvm/cmake/modules/CheckAtomic.cmake
+@@ -30,10 +30,11 @@ function(check_working_cxx_atomics64 varname)
+ #include <atomic>
+ #include <cstdint>
+ std::atomic<uint64_t> x (0);
++std::atomic<double> y (0);
+ int main() {
+   uint64_t i = x.load(std::memory_order_relaxed);
+   (void)i;
+-  return 0;
++  return int(y);
+ }
+ " ${varname})
+   set(CMAKE_REQUIRED_FLAGS ${OLD_CMAKE_REQUIRED_FLAGS})
diff --git a/meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-for-packages-using-find_package.patch b/meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packages-using-find_package.patch
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-for-packages-using-find_package.patch
rename to meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packages-using-find_package.patch
index 94c056ab8e0abcdf4b96fc3c9bf22842018941e8..033f9e6d7ca2e1b61c223db37d1653a4663f3510 100644
--- a/meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-for-packages-using-find_package.patch
+++ b/meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packages-using-find_package.patch
@@ -1,4 +1,4 @@
-From 93141cee493022d9f39dbd1f5f0bb0a1110ac829 Mon Sep 17 00:00:00 2001
+From aae87f7ce9d07ba1c401de8f2981b046321fba3b Mon Sep 17 00:00:00 2001
 From: Ovidiu Panait <ovidiu.panait@windriver.com>
 Date: Fri, 31 Jan 2020 10:56:11 +0200
 Subject: [PATCH] cmake: Fix configure for packages using find_package()
diff --git a/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch b/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch
new file mode 100644
index 0000000000000000000000000000000000000000..479cc01004ed8441bdf235409e6e7577b865bce2
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch
@@ -0,0 +1,50 @@
+From e374b21872c382d0450a5813184c72fdaabcac11 Mon Sep 17 00:00:00 2001
+From: Jim Broadus <jbroadus@xevo.com>
+Date: Thu, 26 Mar 2020 16:05:53 -0700
+Subject: [PATCH] clang: Fix resource dir location for cross toolchains
+
+When clang looks for the resources directory, it does so based on the binary
+location and assumes that the containing directory is a sibling to lib. The
+Yocto cross.bbclass defines the default bindir as
+${exec_prefix}/bin/${CROSS_TARGET_SYS_DIR}. ex: /usr/bin/aarch64-poky-linux/.
+This causes clang to form a path that looks like /usr/bin/lib/clang/...
+
+As a fix for this, check the parent directory name. If that is "bin", then
+use that directory's parent.
+
+Upstream-Status: Pending
+Signed-off-by: Jim Broadus <jbroadus@xevo.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/Driver.cpp | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/clang/lib/Driver/Driver.cpp b/clang/lib/Driver/Driver.cpp
+index 87855fdb7997..036c9d09df26 100644
+--- a/clang/lib/Driver/Driver.cpp
++++ b/clang/lib/Driver/Driver.cpp
+@@ -176,6 +176,7 @@ std::string Driver::GetResourcesPath(StringRef BinaryPath) {
+ 
+   // Dir is bin/ or lib/, depending on where BinaryPath is.
+   StringRef Dir = llvm::sys::path::parent_path(BinaryPath);
++  StringRef LastDirName = llvm::sys::path::filename(Dir);
+   SmallString<128> P(Dir);
+ 
+   StringRef ConfiguredResourceDir(CLANG_RESOURCE_DIR);
+@@ -187,9 +188,15 @@ std::string Driver::GetResourcesPath(StringRef BinaryPath) {
+     // With a static-library build of libclang, LibClangPath will contain the
+     // path of the embedding binary, which for LLVM binaries will be in bin/.
+     // ../lib gets us to lib/ in both cases.
+-    P = llvm::sys::path::parent_path(Dir);
+     // This search path is also created in the COFF driver of lld, so any
+     // changes here also needs to happen in lld/COFF/Driver.cpp
++
++    // OE cross toolchains are installed, by default, in a subdir of bin.
++    if (LastDirName == "bin") {
++      P = llvm::sys::path::parent_path(Dir);
++    } else {
++      P = llvm::sys::path::parent_path(llvm::sys::path::parent_path(Dir));
++    }
+     llvm::sys::path::append(P, CLANG_INSTALL_LIBDIR_BASENAME, "clang",
+                             CLANG_VERSION_MAJOR_STRING);
+   }
diff --git a/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch b/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch
new file mode 100644
index 0000000000000000000000000000000000000000..3803603355d808bec4a895bea57eed4e6478b87c
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch
@@ -0,0 +1,79 @@
+From 3acdfa74ce633bfebf1c3982d86b4931b8b606c8 Mon Sep 17 00:00:00 2001
+From: Oleksandr Ocheretnyi <oocheret@cisco.com>
+Date: Wed, 15 Apr 2020 00:08:39 +0300
+Subject: [PATCH] clang: driver: Add dyld-prefix when checking sysroot for ldso
+ path
+
+ * the dyld-prefix shall be taken into account when the default
+   path for the dynamic linker has to be checked.
+
+ * this patch shall be used as annex to the next patch:
+   'clang: driver: Check sysroot for ldso path' which includes
+   the usrmerge scenario.
+
+Upstream-Status: Pending
+Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Linux.cpp | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
+index 621fa17e0603..8fd454d4eff4 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -525,8 +525,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+ 
+     Loader = HF ? "ld-linux-armhf.so.3" : "ld-linux.so.3";
+     LibDir = "lib32";
+-    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loader) &&
+-         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++    if (!getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "/" + LibDir + "/" + Loader) &&
++         getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "/lib/" + Loader)) {
+         LibDir = "lib";
+     }
+     break;
+@@ -582,8 +582,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+     LibDir = "lib64";
+     Loader =
+         (tools::ppc::hasPPCAbiArg(Args, "elfv2")) ? "ld64.so.2" : "ld64.so.1";
+-    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loader) &&
+-         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++    if (!getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "/" + LibDir + "/" + Loader) &&
++         getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "/lib/" + Loader)) {
+         LibDir = "lib";
+     }
+     break;
+@@ -591,8 +591,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+     LibDir = "lib64";
+     Loader =
+         (tools::ppc::hasPPCAbiArg(Args, "elfv1")) ? "ld64.so.1" : "ld64.so.2";
+-    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loader) &&
+-         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++    if (!getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "/" + LibDir + "/" + Loader) &&
++         getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "/lib/" + Loader)) {
+         LibDir = "lib";
+     }
+     break;
+@@ -612,8 +612,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+   case llvm::Triple::sparcv9:
+     LibDir = "lib64";
+     Loader = "ld-linux.so.2";
+-    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loader) &&
+-         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++    if (!getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "/" + LibDir + "/" + Loader) &&
++         getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "/lib/" + Loader)) {
+         LibDir = "lib";
+     }
+     break;
+@@ -630,8 +630,8 @@ std::string Linux::getDynamicLinker(const ArgList &Args) const {
+ 
+     LibDir = X32 ? "libx32" : "lib64";
+     Loader = X32 ? "ld-linux-x32.so.2" : "ld-linux-x86-64.so.2";
+-    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loader) &&
+-         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++    if (!getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "/" + LibDir + "/" + Loader) &&
++         getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "/lib/" + Loader)) {
+         LibDir = "lib";
+     }
+     break;
diff --git a/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scripts.patch b/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scripts.patch
new file mode 100644
index 0000000000000000000000000000000000000000..329cd8b0237816fbe3d7a550c58c3772fa9f2fcd
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scripts.patch
@@ -0,0 +1,35 @@
+From 02ce42db3325d5fab553627dfc73750270c0b665 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 14 Oct 2020 22:19:57 -0700
+Subject: [PATCH] clang: Use python3 in python scripts
+
+Some scripts ask for python, but they work fine with python3
+and in OE python symlink is not exposed to build, only python3 is
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../find-all-symbols/tool/run-find-all-symbols.py               | 2 +-
+ clang/tools/scan-view/bin/scan-view                             | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-all-symbols.py b/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-all-symbols.py
+index 471dbf8c110b..f98385dc6651 100755
+--- a/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-all-symbols.py
++++ b/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-all-symbols.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ #
+ # =- run-find-all-symbols.py - Parallel find-all-symbols runner -*- python  -*-=#
+ #
+diff --git a/clang/tools/scan-view/bin/scan-view b/clang/tools/scan-view/bin/scan-view
+index d01aebb4029a..f3375804654d 100755
+--- a/clang/tools/scan-view/bin/scan-view
++++ b/clang/tools/scan-view/bin/scan-view
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ 
+ from __future__ import print_function
+ 
diff --git a/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch b/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch
new file mode 100644
index 0000000000000000000000000000000000000000..bf46b22f361def855b1a402d3970dbea577fad1b
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch
@@ -0,0 +1,167 @@
+From aec307904022e138d1004ceb44b9600deaa7fbdb Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 25 Jan 2021 16:14:35 +0800
+Subject: [PATCH] llvm/clang: Insert anchor for adding OE distro vendor names
+
+This helps in making right detection for OE built gcc toolchains
+
+The //CLANG_EXTRA_OE_VENDORS_CASES string is replaced with list of
+additional Ceses based on CLANG_EXTRA_OE_VENDORS variable in
+recipes-devtools/clang/llvm-project-source.inc:add_distro_vendor()
+
+* For x86_64, set Yocto based GCC install search path
+
+Under Yocto host, while using clang-native to build, it searches
+install host gcc failed which causing the include file not found
+[snip]
+|clang++ -target x86_64-linux  -MMD -MF src/base/files/file_path_constants.o.d -I../../../tools/gn/src -I. \
+-isystem/tmp-glibc/work/x86_64-linux/gn-native/87.0.4280.141-r0/recipe-sysroot-native/usr/include -O2 -pipe \
+-std=c++17 -c ../../../tools/gn/src/base/files/file_path_constants.cc -o src/base/files/file_path_constants.o
+|../../../tools/gn/src/base/files/file_path_constants.cc:7:10: fatal error: 'iterator' file not found
+|#include <iterator>
+|         ^~~~~~~~
+[snip]
+
+* Set three Yocto based GCC triple: poky, oe-core and wind river
+
+Before aplly the patch
+[snip]
+$ ../recipe-sysroot-native/usr/bin/clang++ -v
+clang version 11.0.1 (https://github.com/llvm/llvm-project 43ff75f2c3feef64f9d73328230d34dac8832a91)
+Target: x86_64-unknown-linux-gnu
+Thread model: posix
+InstalledDir:tmp-glibc/work/x86_64-linux/gn-native/87.0.4280.141-r0/chromium-87.0.4280.141/../recipe-sysroot-native/usr/bin
+[snip]
+
+After this patch:
+[snip]
+$ ../recipe-sysroot-native/usr/bin/clang++ -v
+clang version 11.0.1 (https://github.com/llvm/llvm-project 22c3241ff9a6224261df48d0258957fd8acc3d64)
+Target: x86_64-unknown-linux-gnu
+Thread model: posix
+InstalledDir:tmp-glibc/work/x86_64-linux/gn-native/87.0.4280.141-r0/chromium-87.0.4280.141/../recipe-sysroot-native/usr/bin
+Found candidate GCC installation: /usr/lib//x86_64-wrs-linux/10.1.0
+Found candidate GCC installation: /usr/lib/gcc/x86_64-wrs-linux/10.1.0
+Selected GCC installation: /usr/lib//x86_64-wrs-linux/10.1.0
+Candidate multilib: .;@m64
+Selected multilib: .;@m64
+[snip]
+
+BTW, it is hardly to insert a triple by the replacement of TARGET_SYS
+(=${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}), since TARGET_VENDOR
+is different between clang and clang-native
+
+* The //CLANG_EXTRA_OE_VENDORS_TRIPLES string is replaced with list of
+additional triples based on CLANG_EXTRA_OE_VENDORS variable in
+recipes-devtools/clang/llvm-project-source.inc:add_distro_vendor()
+
+* Correct library search path for OpenEmbedded Host
+
+For OpenEmbedded Host, the gcc install path is
+/usr/lib/x86_64-[distroname]-linux/[gcc-version].
+So the library search path is not found with default triple
+'x86_64-linux-gnu' for x86_64. Causing following error:
+[snip]
+compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang
+-target x86_64-linux
+-isystem/path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/include
+-O2 -pipe
+/path/to/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/share/cmake-3.21/Modules/CMakeCCompilerABI.c`
+|     /build/tmp-glibc/hosttools/ld: cannot find -lgcc
+|     /build/tmp-glibc/hosttools/ld: cannot find -lgcc
+|     clang-13: error: linker command failed with exit code 1 (use -v to see invocation)
+[snip]
+
+before this patch:
+b59da142f2b0:$ /path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang --print-search-dirs
+programs: =/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin
+libraries: =/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/lib/clang/13.0.1:/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/../lib://lib://usr/lib
+
+after this patch:
+b59da142f2b0:$ /path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang --print-search-dirs
+programs: =/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin
+libraries: =/build/tmp-glibc/work/x84_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/lib/clang/13.0.1:/usr/lib/x86_64-wrs-linux/10.2.0://lib/x86_64-wrs-linux://usr/lib/x86_64-wrs-linux:/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/../lib://lib://usr/lib
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/include/clang/Driver/Distro.h   | 2 ++
+ clang/lib/Driver/Distro.cpp           | 1 +
+ clang/lib/Driver/ToolChains/Gnu.cpp   | 1 +
+ clang/lib/Driver/ToolChains/Linux.cpp | 1 +
+ llvm/lib/TargetParser/Triple.cpp      | 2 +-
+ 5 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/clang/include/clang/Driver/Distro.h b/clang/include/clang/Driver/Distro.h
+index b4d485dac8a2..ac0bf25b7c63 100644
+--- a/clang/include/clang/Driver/Distro.h
++++ b/clang/include/clang/Driver/Distro.h
+@@ -45,6 +45,7 @@ public:
+     RHEL7,
+     Fedora,
+     Gentoo,
++    //CLANG_EXTRA_OE_DISTRO_NAME
+     OpenSUSE,
+     UbuntuHardy,
+     UbuntuIntrepid,
+@@ -139,6 +140,7 @@ public:
+ 
+   bool IsGentoo() const { return DistroVal == Gentoo; }
+ 
++  //CLANG_EXTRA_OE_DISTRO_CHECK
+   /// @}
+ };
+ 
+diff --git a/clang/lib/Driver/Distro.cpp b/clang/lib/Driver/Distro.cpp
+index 3cc79535de8d..595656179bdc 100644
+--- a/clang/lib/Driver/Distro.cpp
++++ b/clang/lib/Driver/Distro.cpp
+@@ -43,6 +43,7 @@ static Distro::DistroType DetectOsRelease(llvm::vfs::FileSystem &VFS) {
+                     .Case("sles", Distro::OpenSUSE)
+                     .Case("opensuse", Distro::OpenSUSE)
+                     .Case("exherbo", Distro::Exherbo)
++                    //CLANG_EXTRA_OE_DISTRO_CASE
+                     .Default(Distro::UnknownDistro);
+   return Version;
+ }
+diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolChains/Gnu.cpp
+index 268fb7bf7167..868d32f501e8 100644
+--- a/clang/lib/Driver/ToolChains/Gnu.cpp
++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
+@@ -2452,6 +2452,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
+       "x86_64-pc-linux-gnu",    "x86_64-redhat-linux6E",
+       "x86_64-redhat-linux",    "x86_64-suse-linux",
+       "x86_64-manbo-linux-gnu", "x86_64-slackware-linux",
++      "x86_64-oe-linux",//CLANG_EXTRA_OE_VENDORS_TRIPLES
+       "x86_64-unknown-linux",   "x86_64-amazon-linux"};
+   static const char *const X32Triples[] = {"x86_64-linux-gnux32",
+                                            "x86_64-pc-linux-gnux32"};
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
+index 8fd454d4eff4..fb9d433a80be 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -82,6 +82,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
+       return "x86_64-linux-android";
+     if (TargetEnvironment == llvm::Triple::GNUX32)
+       return "x86_64-linux-gnux32";
++    //CLANG_EXTRA_OE_DISTRO_TRIPLE
+     return "x86_64-linux-gnu";
+   case llvm::Triple::aarch64:
+     if (IsAndroid)
+diff --git a/llvm/lib/TargetParser/Triple.cpp b/llvm/lib/TargetParser/Triple.cpp
+index e9e6f130f757..97f426dd863b 100644
+--- a/llvm/lib/TargetParser/Triple.cpp
++++ b/llvm/lib/TargetParser/Triple.cpp
+@@ -663,7 +663,7 @@ static Triple::VendorType parseVendor(StringRef VendorName) {
+       .Case("mesa", Triple::Mesa)
+       .Case("suse", Triple::SUSE)
+       .Case("oe", Triple::OpenEmbedded)
+-      .Case("intel", Triple::Intel)
++      .Case("intel", Triple::Intel) //CLANG_EXTRA_OE_VENDORS_CASES
+       .Default(Triple::UnknownVendor);
+ }
+ 
diff --git a/meta/recipes-devtools/clang/clang/0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch b/meta/recipes-devtools/clang/clang/0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch
new file mode 100644
index 0000000000000000000000000000000000000000..9518716c00ae820c331b0b20cea832d86699140d
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch
@@ -0,0 +1,68 @@
+From d0f40e9309a3f5734fa76c00994c5ebb70570c6c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 May 2021 17:32:13 -0700
+Subject: [PATCH] compiler-rt: Do not use backtrace APIs on non-glibc linux
+
+musl e.g. does not provide backtrace APIs
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../lib/gwp_asan/optional/backtrace_linux_libc.cpp  | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp b/compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp
+index ea8e72be287d..0344074dd254 100644
+--- a/compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp
++++ b/compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp
+@@ -7,7 +7,9 @@
+ //===----------------------------------------------------------------------===//
+ 
+ #include <assert.h>
++#ifdef __GLIBC__
+ #include <execinfo.h>
++#endif
+ #include <stddef.h>
+ #include <stdint.h>
+ #include <stdlib.h>
+@@ -21,8 +23,11 @@
+ namespace {
+ size_t Backtrace(uintptr_t *TraceBuffer, size_t Size) {
+   static_assert(sizeof(uintptr_t) == sizeof(void *), "uintptr_t is not void*");
+-
++#ifdef __GLIBC__
+   return backtrace(reinterpret_cast<void **>(TraceBuffer), Size);
++#else
++  return -1;
++#endif
+ }
+ 
+ // We don't need any custom handling for the Segv backtrace - the libc unwinder
+@@ -30,7 +35,11 @@ size_t Backtrace(uintptr_t *TraceBuffer, size_t Size) {
+ // to avoid the additional frame.
+ GWP_ASAN_ALWAYS_INLINE size_t SegvBacktrace(uintptr_t *TraceBuffer, size_t Size,
+                                             void * /*Context*/) {
++#ifdef __GLIBC__
+   return Backtrace(TraceBuffer, Size);
++#else
++  return -1;
++#endif
+ }
+ 
+ static void PrintBacktrace(uintptr_t *Trace, size_t TraceLength,
+@@ -40,6 +49,7 @@ static void PrintBacktrace(uintptr_t *Trace, size_t TraceLength,
+     return;
+   }
+ 
++#ifdef __GLIBC__
+   char **BacktraceSymbols =
+       backtrace_symbols(reinterpret_cast<void **>(Trace), TraceLength);
+ 
+@@ -53,6 +63,7 @@ static void PrintBacktrace(uintptr_t *Trace, size_t TraceLength,
+   Printf("\n");
+   if (BacktraceSymbols)
+     free(BacktraceSymbols);
++#endif
+ }
+ } // anonymous namespace
+ 
diff --git a/meta/recipes-devtools/clang/clang/0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch b/meta/recipes-devtools/clang/clang/0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch
new file mode 100644
index 0000000000000000000000000000000000000000..fd2b434fe27b6e4e926235e5594aee7a28b0e534
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch
@@ -0,0 +1,28 @@
+From 1ef38e252a55d2cdb00c3b29154387fce02e9911 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 May 2021 17:56:03 -0700
+Subject: [PATCH] clang: Fix x86 triple for non-debian multiarch linux distros
+
+OpenEmbedded does not hardcode mutli-arch like debian therefore ensure
+that it still uses the proper tuple
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Linux.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
+index fb9d433a80be..ee0b4acbcef0 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -728,6 +728,9 @@ void Linux::addLibStdCxxIncludePaths(const llvm::opt::ArgList &DriverArgs,
+       GCCInstallation.getTriple().getArch() == llvm::Triple::x86
+           ? "i386-linux-gnu"
+           : TripleStr;
++  // OpenEmbedded does not hardcode the triple to i386-linux-gnu like debian
++  if (GCCInstallation.getTriple().getVendor() == llvm::Triple::OpenEmbedded)
++	  DebianMultiarch = TripleStr;
+ 
+   // Try generic GCC detection first.
+   if (Generic_GCC::addGCCLibStdCxxIncludePaths(DriverArgs, CC1Args,
diff --git a/meta/recipes-devtools/clang/clang/0021-libunwind-Added-unw_backtrace-method.patch b/meta/recipes-devtools/clang/clang/0021-libunwind-Added-unw_backtrace-method.patch
new file mode 100644
index 0000000000000000000000000000000000000000..2f0479bdd45cecf9d184566c021ffdfb31fd6fe5
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0021-libunwind-Added-unw_backtrace-method.patch
@@ -0,0 +1,56 @@
+From 5782e495684d6c056175ea16be83cfe788742d0a Mon Sep 17 00:00:00 2001
+From: Maksim Kita <maksim-kita@yandex-team.ru>
+Date: Sun, 23 May 2021 10:27:29 +0000
+Subject: [PATCH] libunwind: Added unw_backtrace method
+
+Source: https://github.com/ClickHouse-Extras/libunwind/commit/52f0f7861926cbfaef7e6c97d8a6d7ba2a1f6747#diff-a82fc885e2e4facf4b92d26171c13aa4aa5db296f77e1158ba2f8664e3bd1f5c
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libunwind/include/libunwind.h |  1 +
+ libunwind/src/libunwind.cpp   | 20 ++++++++++++++++++++
+ 2 files changed, 21 insertions(+)
+
+diff --git a/libunwind/include/libunwind.h b/libunwind/include/libunwind.h
+index b2dae8feed9a..0ab974c9bfa4 100644
+--- a/libunwind/include/libunwind.h
++++ b/libunwind/include/libunwind.h
+@@ -130,6 +130,7 @@ extern int unw_is_fpreg(unw_cursor_t *, unw_regnum_t) LIBUNWIND_AVAIL;
+ extern int unw_is_signal_frame(unw_cursor_t *) LIBUNWIND_AVAIL;
+ extern int unw_get_proc_name(unw_cursor_t *, char *, size_t, unw_word_t *) LIBUNWIND_AVAIL;
+ //extern int       unw_get_save_loc(unw_cursor_t*, int, unw_save_loc_t*);
++extern int unw_backtrace(void **, int) LIBUNWIND_AVAIL;
+ 
+ extern unw_addr_space_t unw_local_addr_space;
+ 
+diff --git a/libunwind/src/libunwind.cpp b/libunwind/src/libunwind.cpp
+index cf39ec5f7dbd..1896f20d57f8 100644
+--- a/libunwind/src/libunwind.cpp
++++ b/libunwind/src/libunwind.cpp
+@@ -431,6 +431,26 @@ int __unw_remove_find_dynamic_unwind_sections(
+ 
+ #endif // __APPLE__
+ 
++int unw_backtrace(void **buffer, int size) {
++  unw_context_t context;
++  unw_cursor_t cursor;
++  if (unw_getcontext(&context) || unw_init_local(&cursor, &context)) {
++    return 0;
++  }
++
++  unw_word_t ip;
++  int current = 0;
++  while (unw_step(&cursor) > 0) {
++    if (current >= size || unw_get_reg(&cursor, UNW_REG_IP, &ip)) {
++      break;
++    }
++
++    buffer[current++] = reinterpret_cast<void *>(static_cast<uintptr_t>(ip));
++  }
++
++  return current;
++}
++
+ // Add logging hooks in Debug builds only
+ #ifndef NDEBUG
+ #include <stdlib.h>
diff --git a/meta/recipes-devtools/clang/clang/0022-lldb-Link-with-libatomic-on-x86.patch b/meta/recipes-devtools/clang/clang/0022-lldb-Link-with-libatomic-on-x86.patch
new file mode 100644
index 0000000000000000000000000000000000000000..4996bc1c874982b07e2bd0d2cad390801d1684b3
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0022-lldb-Link-with-libatomic-on-x86.patch
@@ -0,0 +1,33 @@
+From f4f9b07a41449a0acbe5ea1717bb0e2ceabbfaab Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Feb 2022 01:31:26 -0800
+Subject: [PATCH] lldb: Link with libatomic on x86
+
+cmake atomic check is not sufficient for i686 target where clang14 still
+generates __atomic_store calls but the check does not entail this
+function and happily thinks that compiler can resolve all atomic via intrinsics
+on i686, but thats not the case, ideally the check for determining
+atomic operation should be make more robust but until then lets ask to
+link with libatomic on i686/linux
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lldb/source/Utility/CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lldb/source/Utility/CMakeLists.txt b/lldb/source/Utility/CMakeLists.txt
+index 6954a2508ffe..b8bf8c07fefb 100644
+--- a/lldb/source/Utility/CMakeLists.txt
++++ b/lldb/source/Utility/CMakeLists.txt
+@@ -19,6 +19,10 @@ if (CMAKE_SYSTEM_NAME MATCHES "Windows")
+   list(APPEND LLDB_SYSTEM_LIBS ws2_32 rpcrt4)
+ endif ()
+ 
++if (CMAKE_SYSTEM_PROCESSOR MATCHES "i686" AND CMAKE_SYSTEM_NAME MATCHES "Linux")
++    list(APPEND LLDB_SYSTEM_LIBS atomic)
++endif()
++
+ if (NOT HAVE_CXX_ATOMICS64_WITHOUT_LIB )
+     list(APPEND LLDB_SYSTEM_LIBS atomic)
+ endif()
diff --git a/meta/recipes-devtools/clang/clang/0023-compiler-rt-Enable-__int128-for-ppc32.patch b/meta/recipes-devtools/clang/clang/0023-compiler-rt-Enable-__int128-for-ppc32.patch
new file mode 100644
index 0000000000000000000000000000000000000000..eeaca43ae012486a787d42ef5afafabb0d050c1a
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0023-compiler-rt-Enable-__int128-for-ppc32.patch
@@ -0,0 +1,73 @@
+From a63acbeb8db17aa113dc2b2058540c61c2a16ac6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Mar 2022 16:28:16 -0800
+Subject: [PATCH] compiler-rt: Enable __int128 for ppc32
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ compiler-rt/lib/builtins/CMakeLists.txt | 15 +++++++--------
+ compiler-rt/lib/builtins/int_types.h    |  2 +-
+ 2 files changed, 8 insertions(+), 9 deletions(-)
+
+diff --git a/compiler-rt/lib/builtins/CMakeLists.txt b/compiler-rt/lib/builtins/CMakeLists.txt
+index 19316c52d12c..cb276311b290 100644
+--- a/compiler-rt/lib/builtins/CMakeLists.txt
++++ b/compiler-rt/lib/builtins/CMakeLists.txt
+@@ -720,11 +720,9 @@ set(mips64el_SOURCES ${GENERIC_TF_SOURCES}
+ 
+ set(nvptx64_SOURCES ${GENERIC_SOURCES})
+ 
+-set(powerpc_SOURCES ${GENERIC_SOURCES})
+-
+ set(powerpcspe_SOURCES ${GENERIC_SOURCES})
+ 
+-set(powerpc64_SOURCES
++set(powerpc_SOURCES
+   ppc/divtc3.c
+   ppc/fixtfdi.c
+   ppc/fixunstfdi.c
+@@ -739,14 +737,15 @@ set(powerpc64_SOURCES
+ )
+ # These routines require __int128, which isn't supported on AIX.
+ if (NOT OS_NAME MATCHES "AIX")
+-  set(powerpc64_SOURCES
++  set(powerpc_SOURCES
+     ppc/floattitf.c
+     ppc/fixtfti.c
+     ppc/fixunstfti.c
+-    ${powerpc64_SOURCES}
++    ${powerpc_SOURCES}
+   )
+ endif()
+-set(powerpc64le_SOURCES ${powerpc64_SOURCES})
++set(powerpc64le_SOURCES ${powerpc_SOURCES})
++set(powerpc64_SOURCES ${powerpc_SOURCES})
+ 
+ set(riscv_SOURCES
+   cpu_model/riscv.c
+@@ -904,9 +903,9 @@ else ()
+         list(APPEND BUILTIN_CFLAGS_${arch} -fomit-frame-pointer -DCOMPILER_RT_ARMHF_TARGET)
+       endif()
+ 
+-      # For RISCV32, we must force enable int128 for compiling long
++      # For RISCV32/PPC32, we must force enable int128 for compiling long
+       # double routines.
+-      if(COMPILER_RT_ENABLE_SOFTWARE_INT128 OR "${arch}" STREQUAL "riscv32")
++      if(COMPILER_RT_ENABLE_SOFTWARE_INT128 OR "${arch}" STREQUAL "riscv32" OR "${arch}" STREQUAL "powerpc")
+         list(APPEND BUILTIN_CFLAGS_${arch} -fforce-enable-int128)
+       endif()
+ 
+diff --git a/compiler-rt/lib/builtins/int_types.h b/compiler-rt/lib/builtins/int_types.h
+index 48862f364217..cc47d3e33f67 100644
+--- a/compiler-rt/lib/builtins/int_types.h
++++ b/compiler-rt/lib/builtins/int_types.h
+@@ -64,7 +64,7 @@ typedef union {
+ } udwords;
+ 
+ #if defined(__LP64__) || defined(__wasm__) || defined(__mips64) ||             \
+-    defined(__SIZEOF_INT128__) || defined(_WIN64)
++    defined(__SIZEOF_INT128__) || defined(_WIN64) || defined(__powerpc__)
+ #define CRT_HAS_128BIT
+ #endif
+ 
diff --git a/meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch b/meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch
new file mode 100644
index 0000000000000000000000000000000000000000..831e3e7d3a4a9752c6f6e516d6807280b62390aa
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch
@@ -0,0 +1,62 @@
+From abe955ac96370a16258fba1348edb938f3649096 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 12 Aug 2022 11:50:57 -0700
+Subject: [PATCH] llvm: Do not use cmake infra to detect libzstd
+
+OE's version is build using plain make not cmake as a result we do not
+have the cmake support files and this probing method can get this info
+from build host and force linking with libzstd from /usr/lib which is
+not what we want when cross building.
+
+Fixes errors building llvm-config like
+/usr/lib/libzstd.so.1.5.2: error adding symbols: file in wrong
+format
+| clang-15: error: linker command failed with exit code 1 (use -v to see invocation)
+| ninja: build stopped: subcommand failed.
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm/lib/Support/CMakeLists.txt | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/llvm/lib/Support/CMakeLists.txt b/llvm/lib/Support/CMakeLists.txt
+index a6d8a2581886..5b461547bdde 100644
+--- a/llvm/lib/Support/CMakeLists.txt
++++ b/llvm/lib/Support/CMakeLists.txt
+@@ -22,7 +22,7 @@ if (HAS_WERROR_GLOBAL_CTORS)
+ endif()
+ 
+ if(LLVM_ENABLE_ZLIB)
+-  list(APPEND imported_libs ZLIB::ZLIB)
++  list(APPEND imported_libs z)
+ endif()
+ 
+ if(LLVM_ENABLE_ZSTD)
+@@ -34,7 +34,7 @@ if(LLVM_ENABLE_ZSTD)
+ endif()
+ 
+ if(LLVM_ENABLE_ZSTD)
+-  list(APPEND imported_libs ${zstd_target})
++  list(APPEND imported_libs zstd)
+ endif()
+ 
+ if( WIN32 )
+@@ -325,7 +325,7 @@ if(LLVM_ENABLE_ZLIB)
+     get_property(zlib_library TARGET ZLIB::ZLIB PROPERTY LOCATION)
+   endif()
+   get_library_name(${zlib_library} zlib_library)
+-  set(llvm_system_libs ${llvm_system_libs} "${zlib_library}")
++  set(llvm_system_libs ${llvm_system_libs} z)
+ endif()
+ 
+ if(LLVM_ENABLE_ZSTD)
+@@ -339,7 +339,7 @@ if(LLVM_ENABLE_ZSTD)
+   endif()
+   if (zstd_target STREQUAL zstd::libzstd_shared)
+     get_library_name(${zstd_library} zstd_library)
+-    set(llvm_system_libs ${llvm_system_libs} "${zstd_library}")
++    set(llvm_system_libs ${llvm_system_libs} zstd)
+   else()
+     set(llvm_system_libs ${llvm_system_libs} "${zstd_STATIC_LIBRARY}")
+   endif()
diff --git a/meta/recipes-devtools/clang/clang/0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch b/meta/recipes-devtools/clang/clang/0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch
new file mode 100644
index 0000000000000000000000000000000000000000..4b8a915837ddac138e85d3cd11517d73af9f9a8f
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch
@@ -0,0 +1,46 @@
+From 7cafe5615d91a429048c8baa824769cdf34aafd1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 3 Jan 2023 18:44:34 -0800
+Subject: [PATCH] compiler-rt: Fix stat struct's size for O32 ABI
+
+stat struct size differs on glibc based on ABI choices e.g. 64bit off_t
+and/or 64bit time_t will make this size different. Therefore separate
+out the O32 case out, makes it more readable.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../sanitizer_platform_limits_posix.h               | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h b/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h
+index 1a7d9e64048e..854a87e17236 100644
+--- a/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -98,6 +98,18 @@ const unsigned struct_kernel_stat64_sz = 104;
+ const unsigned struct_kernel_stat_sz = 144;
+ const unsigned struct_kernel_stat64_sz = 104;
+ #elif defined(__mips__)
++#if defined(__mips_o32) // O32 ABI
++#if _TIME_BITS == 64
++const unsigned struct_kernel_stat_sz = 112;
++const unsigned struct_kernel_stat64_sz = 112;
++#elif _FILE_OFFSET_BITS == 64
++const unsigned struct_kernel_stat_sz = 160;
++const unsigned struct_kernel_stat64_sz = 160;
++#else
++const unsigned struct_kernel_stat_sz = 144;
++const unsigned struct_kernel_stat64_sz = 160;
++#endif
++#else // __mips_o32
+ const unsigned struct_kernel_stat_sz = SANITIZER_ANDROID
+                                            ? FIRST_32_SECOND_64(104, 128)
+ #      if defined(_ABIN32) && _MIPS_SIM == _ABIN32
+@@ -106,6 +118,7 @@ const unsigned struct_kernel_stat_sz = SANITIZER_ANDROID
+                                            : FIRST_32_SECOND_64(160, 216);
+ #      endif
+ const unsigned struct_kernel_stat64_sz = 104;
++#endif
+ #elif defined(__s390__) && !defined(__s390x__)
+ const unsigned struct_kernel_stat_sz = 64;
+ const unsigned struct_kernel_stat64_sz = 104;
diff --git a/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch b/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch
new file mode 100644
index 0000000000000000000000000000000000000000..0e67129705787a6bd1fcff60f637e9ae7c11356e
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch
@@ -0,0 +1,43 @@
+From 92bf97247bb0df984410a6c1ee6b0d2577e82013 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 21 Feb 2023 12:46:10 -0800
+Subject: [PATCH] compiler-rt: Undef _TIME_BITS along with _FILE_OFFSET_BITS in
+ sanitizers
+
+On 32bit systems using 64bit time_t build fails because
+_FILE_OFFSET_BITS is undefined here but _TIME_BITS is still set to 64
+
+Fixes
+In file included from compiler-rt/lib/sanitizer_common/sanitizer_procmaps_solaris.cpp:17:
+In file included from compiler-rt/lib/sanitizer_common/sanitizer_platform.h:25:
+In file included from /usr/include/features.h:393:
+/usr/include/features-time64.h:26:5: error: "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
+    ^
+1 error generated.
+
+Upstream-Status: Submitted [https://reviews.llvm.org/D144514]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ compiler-rt/lib/sanitizer_common/sanitizer_platform.h | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_platform.h b/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
+index 57966403c92a..efa83f30eca0 100644
+--- a/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
++++ b/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
+@@ -22,6 +22,15 @@
+ // function declarations into a .S file which doesn't compile.
+ // https://crbug.com/1162741
+ #if __has_include(<features.h>) && !defined(__ANDROID__)
++// Some sources undefine _FILE_OFFSET_BITS deliberately e.g.
++// sanitizer_procmaps_solaris.cpp. This is problematic on glibc systems with
++// 32-bit architectures using 64-bit time_t and users passing _TIME_BITS=64
++// from build environment, therefore both _FILE_OFFSET_BITS and _TIME_BITS
++// need to be undefined together since features.h will check for both being 64
++// if one is set to 64.
++#  if !defined(_FILE_OFFSET_BITS)
++#    undef _TIME_BITS
++#  endif
+ #  include <features.h>
+ #endif
+ 
diff --git a/meta/recipes-devtools/clang/clang/0027-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch b/meta/recipes-devtools/clang/clang/0027-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
new file mode 100644
index 0000000000000000000000000000000000000000..8362acf8d41a0d47d870f04b3eefdd9eb3156e39
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0027-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
@@ -0,0 +1,81 @@
+From 86a5a81c556e27cd097493a040580362d0217721 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 31 Aug 2023 18:14:47 +0200
+Subject: [PATCH] ToolChains/Gnu.cpp: ARMLibDirs search also in lib32
+
+* in some strange multilib configs we build lib32-image where
+  32bit libs are in /usr/lib32 and 64bit in /usr/lib64 but in such
+  setup the clang search for GCC candidate installation doesn't
+  check lib32 directory in sysroot and fails to find the installation
+
+  X86LibDirs was already searching in lib32 for very long time:
+  https://github.com/llvm/llvm-project/commit/621fed5f5a051a0333415aaed75b8f2ed2350dbd
+  but ARMLibDirs didn't include it for some reason.
+
+* if we don't add lib32 for arm in getOSLibDir(), then it will
+  find -lgcc, crtbeginS.o, crtendS.o, but still fail to find
+  -lgcc_s, -lc, Scrt1.o, crti.o, crtn.o
+
+* fixes lib32-compiler-rt build failure:
+
+-- Configuring incomplete, errors occurred!
+CMake Error at TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sysroot-native/usr/share/cmake-3.26/Modules/CMakeTestCCompiler.cmake:67 (message):
+  The C compiler
+
+    "TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sysroot-native/usr/bin/arm-oemllib32-linux-gnueabi/arm-oemllib32-linux-gnueabi-clang"
+
+  is not able to compile a simple test program.
+
+  It fails with the following output:
+
+    Change Dir: TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build/CMakeFiles/CMakeScratch/TryCompile-rWXyQZ
+
+    Run Build Command(s):ninja -v cmTC_84d18 && [1/2] TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sysroot-native/usr/bin/arm-oemllib32-linux-gnueabi/arm-oemllib32-linux-gnueabi-clang --target=arm-oemllib32-linux-gnueabi --sysroot=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot   -target arm-oemllib32-linux-gnueabi  -march=armv7ve -mthumb -mfpu=neon-vfpv4 -mfloat-abi=softfp -mlittle-endian --dyld-prefix=/usr -Qunused-arguments -funwind-tables -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Werror=return-type -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types   -fmacro-prefix-map=TOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/git=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=TOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/git=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=  -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sysroot-native=    -fPIE -MD -MT CMakeFiles/cmTC_84d18.dir/testCCompiler.c.o -MF CMakeFiles/cmTC_84d18.dir/testCCompiler.c.o.d -o CMakeFiles/cmTC_84d18.dir/testCCompiler.c.o -c TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build/CMakeFiles/CMakeScratch/TryCompile-rWXyQZ/testCCompiler.c
+    [2/2] : && TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sysroot-native/usr/bin/arm-oemllib32-linux-gnueabi/arm-oemllib32-linux-gnueabi-clang --target=arm-oemllib32-linux-gnueabi --sysroot=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot -target arm-oemllib32-linux-gnueabi  -march=armv7ve -mthumb -mfpu=neon-vfpv4 -mfloat-abi=softfp -mlittle-endian --dyld-prefix=/usr -Qunused-arguments -funwind-tables -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Werror=return-type -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types   -fmacro-prefix-map=TOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/git=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=TOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/git=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=  -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sysroot-native= -target arm-oemllib32-linux-gnueabi  -march=armv7ve -mthumb -mfpu=neon-vfpv4 -mfloat-abi=softfp -mlittle-endian --dyld-prefix=/usr -Qunused-arguments -funwind-tables -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Werror=return-type -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed   -fmacro-prefix-map=TOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/git=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=TOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/git=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=  -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sysroot-native=  -Wl,-z,relro,-z,now -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++   -fuse-ld=lld -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed   -fmacro-prefix-map=TOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/git=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=TOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/git=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=  -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sysroot-native=  -Wl,-z,relro,-z,now -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++   -fuse-ld=lld CMakeFiles/cmTC_84d18.dir/testCCompiler.c.o -o cmTC_84d18   && :
+    FAILED: cmTC_84d18
+    : && TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sysroot-native/usr/bin/arm-oemllib32-linux-gnueabi/arm-oemllib32-linux-gnueabi-clang --target=arm-oemllib32-linux-gnueabi --sysroot=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot -target arm-oemllib32-linux-gnueabi  -march=armv7ve -mthumb -mfpu=neon-vfpv4 -mfloat-abi=softfp -mlittle-endian --dyld-prefix=/usr -Qunused-arguments -funwind-tables -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Werror=return-type -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types   -fmacro-prefix-map=TOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/git=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=TOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/git=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=  -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sysroot-native= -target arm-oemllib32-linux-gnueabi  -march=armv7ve -mthumb -mfpu=neon-vfpv4 -mfloat-abi=softfp -mlittle-endian --dyld-prefix=/usr -Qunused-arguments -funwind-tables -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Werror=return-type -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed   -fmacro-prefix-map=TOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/git=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=TOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/git=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=  -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sysroot-native=  -Wl,-z,relro,-z,now -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++   -fuse-ld=lld -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed   -fmacro-prefix-map=TOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/git=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=TOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/git=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=  -fmacro-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=  -fdebug-prefix-map=TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sysroot-native=  -Wl,-z,relro,-z,now -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++   -fuse-ld=lld CMakeFiles/cmTC_84d18.dir/testCCompiler.c.o -o cmTC_84d18   && :
+    arm-oemllib32-linux-gnueabi-ld.lld: error: cannot open Scrt1.o: No such file or directory
+    arm-oemllib32-linux-gnueabi-ld.lld: error: cannot open crti.o: No such file or directory
+    arm-oemllib32-linux-gnueabi-ld.lld: error: cannot open crtbeginS.o: No such file or directory
+    arm-oemllib32-linux-gnueabi-ld.lld: error: unable to find library -lgcc
+    arm-oemllib32-linux-gnueabi-ld.lld: error: unable to find library -lgcc_s
+    arm-oemllib32-linux-gnueabi-ld.lld: error: unable to find library -lc
+    arm-oemllib32-linux-gnueabi-ld.lld: error: unable to find library -lgcc
+    arm-oemllib32-linux-gnueabi-ld.lld: error: unable to find library -lgcc_s
+    arm-oemllib32-linux-gnueabi-ld.lld: error: cannot open crtendS.o: No such file or directory
+    arm-oemllib32-linux-gnueabi-ld.lld: error: cannot open crtn.o: No such file or directory
+    clang-16: error: linker command failed with exit code 1 (use -v to see invocation)
+    ninja: build stopped: subcommand failed.
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Gnu.cpp   | 2 +-
+ clang/lib/Driver/ToolChains/Linux.cpp | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolChains/Gnu.cpp
+index 868d32f501e8..beed8d34a127 100644
+--- a/clang/lib/Driver/ToolChains/Gnu.cpp
++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
+@@ -2428,7 +2428,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
+   static const char *const AArch64beLibDirs[] = {"/lib"};
+   static const char *const AArch64beTriples[] = {"aarch64_be-none-linux-gnu"};
+ 
+-  static const char *const ARMLibDirs[] = {"/lib"};
++  static const char *const ARMLibDirs[] = {"/lib", "/lib32"};
+   static const char *const ARMTriples[] = {"arm-linux-gnueabi"};
+   static const char *const ARMHFTriples[] = {"arm-linux-gnueabihf",
+                                              "armv7hl-redhat-linux-gnueabi",
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
+index ee0b4acbcef0..b02409fd72ee 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -199,6 +199,7 @@ static StringRef getOSLibDir(const llvm::Triple &Triple, const ArgList &Args) {
+   // reasoning about oslibdir spellings with the lib dir spellings in the
+   // GCCInstallationDetector, but that is a more significant refactoring.
+   if (Triple.getArch() == llvm::Triple::x86 || Triple.isPPC32() ||
++      Triple.getArch() == llvm::Triple::arm || Triple.getArch() == llvm::Triple::thumb ||
+       Triple.getArch() == llvm::Triple::sparc)
+     return "lib32";
+ 
diff --git a/meta/recipes-devtools/clang/clang/0028-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch b/meta/recipes-devtools/clang/clang/0028-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch
new file mode 100644
index 0000000000000000000000000000000000000000..a919a983c38db7c20aa9d7692a9be9cde87ac07f
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0028-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch
@@ -0,0 +1,78 @@
+From 721b7868a57fe3943557c405dd88365526d3728f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 3 Feb 2024 16:47:10 -0800
+Subject: [PATCH] clang/llvm: Add OE specific ABI triple for N32 ABI
+
+Its gnun32 when using OE
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Gnu.cpp   | 1 +
+ clang/lib/Driver/ToolChains/Linux.cpp | 4 ++--
+ llvm/lib/TargetParser/Triple.cpp      | 4 +++-
+ 3 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolChains/Gnu.cpp
+index beed8d34a127..c47b93a4e142 100644
+--- a/clang/lib/Driver/ToolChains/Gnu.cpp
++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
+@@ -2491,6 +2491,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
+ 
+   static const char *const MIPSN32LibDirs[] = {"/lib32"};
+   static const char *const MIPSN32Triples[] = {"mips64-linux-gnuabin32",
++                                               "mips64-linux-gnun32",
+                                                "mipsisa64r6-linux-gnuabin32"};
+   static const char *const MIPSN32ELLibDirs[] = {"/lib32"};
+   static const char *const MIPSN32ELTriples[] = {
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/ToolChains/Linux.cpp
+index b02409fd72ee..4999b0fc17a6 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -139,7 +139,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
+     return IsMipsR6 ? "mipsisa32r6el-linux-gnu" : "mipsel-linux-gnu";
+   case llvm::Triple::mips64: {
+     std::string MT = std::string(IsMipsR6 ? "mipsisa64r6" : "mips64") +
+-                     "-linux-" + (IsMipsN32Abi ? "gnuabin32" : "gnuabi64");
++                     "-linux-" + (IsMipsN32Abi ? "gnun32" : "gnu");
+     if (D.getVFS().exists(concat(SysRoot, "/lib", MT)))
+       return MT;
+     if (D.getVFS().exists(concat(SysRoot, "/lib/mips64-linux-gnu")))
+@@ -148,7 +148,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
+   }
+   case llvm::Triple::mips64el: {
+     std::string MT = std::string(IsMipsR6 ? "mipsisa64r6el" : "mips64el") +
+-                     "-linux-" + (IsMipsN32Abi ? "gnuabin32" : "gnuabi64");
++                     "-linux-" + (IsMipsN32Abi ? "gnun32" : "gnu");
+     if (D.getVFS().exists(concat(SysRoot, "/lib", MT)))
+       return MT;
+     if (D.getVFS().exists(concat(SysRoot, "/lib/mips64el-linux-gnu")))
+diff --git a/llvm/lib/TargetParser/Triple.cpp b/llvm/lib/TargetParser/Triple.cpp
+index 97f426dd863b..dc57d5ff2d4a 100644
+--- a/llvm/lib/TargetParser/Triple.cpp
++++ b/llvm/lib/TargetParser/Triple.cpp
+@@ -336,7 +336,7 @@ StringRef Triple::getEnvironmentTypeName(EnvironmentType Kind) {
+   case GNU: return "gnu";
+   case GNUT64: return "gnut64";
+   case GNUABI64: return "gnuabi64";
+-  case GNUABIN32: return "gnuabin32";
++  case GNUABIN32: return "gnun32";
+   case GNUEABI: return "gnueabi";
+   case GNUEABIT64: return "gnueabit64";
+   case GNUEABIHF: return "gnueabihf";
+@@ -719,6 +719,7 @@ static Triple::EnvironmentType parseEnvironment(StringRef EnvironmentName) {
+       .StartsWith("eabihf", Triple::EABIHF)
+       .StartsWith("eabi", Triple::EABI)
+       .StartsWith("gnuabin32", Triple::GNUABIN32)
++      .StartsWith("gnun32", Triple::GNUABIN32)
+       .StartsWith("gnuabi64", Triple::GNUABI64)
+       .StartsWith("gnueabihft64", Triple::GNUEABIHFT64)
+       .StartsWith("gnueabihf", Triple::GNUEABIHF)
+@@ -1035,6 +1036,7 @@ Triple::Triple(const Twine &Str)
+       Environment =
+           StringSwitch<Triple::EnvironmentType>(Components[0])
+               .StartsWith("mipsn32", Triple::GNUABIN32)
++              .StartsWith("mips64-n32", Triple::GNUABIN32)
+               .StartsWith("mips64", Triple::GNUABI64)
+               .StartsWith("mipsisa64", Triple::GNUABI64)
+               .StartsWith("mipsisa32", Triple::GNU)
diff --git a/meta/recipes-devtools/clang/clang/0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch b/meta/recipes-devtools/clang/clang/0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
new file mode 100644
index 0000000000000000000000000000000000000000..8eda4fb205b66d5d27a69f22614f498d98580758
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
@@ -0,0 +1,90 @@
+From cc2fb22ae8e64f65fd726b476c3bf85b4d31906d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 14 May 2024 22:04:43 -0700
+Subject: [PATCH] llvm: Add libunwind.pc.in and llvm-config scripts
+
+These are added by OE project
+
+Upstream-Status: Inappropriate [ OE-Specific ]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libunwind/libunwind.pc.in          |  9 ++++++
+ llvm/tools/llvm-config/llvm-config | 52 ++++++++++++++++++++++++++++++
+ 2 files changed, 61 insertions(+)
+ create mode 100644 libunwind/libunwind.pc.in
+ create mode 100644 llvm/tools/llvm-config/llvm-config
+
+diff --git a/libunwind/libunwind.pc.in b/libunwind/libunwind.pc.in
+new file mode 100644
+index 000000000000..a93d676604f9
+--- /dev/null
++++ b/libunwind/libunwind.pc.in
+@@ -0,0 +1,9 @@
++prefix=/usr
++exec_prefix=/usr
++libdir=@LIBDIR@
++includedir=/usr/include
++
++Name: libunwind
++Description: libunwind base library
++Version: @VERSION@
++Libs: -lunwind
+diff --git a/llvm/tools/llvm-config/llvm-config b/llvm/tools/llvm-config/llvm-config
+new file mode 100644
+index 000000000000..6a0dd54b8eab
+--- /dev/null
++++ b/llvm/tools/llvm-config/llvm-config
+@@ -0,0 +1,52 @@
++#!/bin/bash
++#
++# Wrapper script for llvm-config. Supplies the right environment variables
++# for the target and delegates to the native llvm-config for anything else. This
++# is needed because arguments like --ldflags, --cxxflags, etc. are set by the
++# native compile rather than the target compile.
++#
++SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
++NEXT_LLVM_CONFIG="$(which -a llvm-config | sed -n 2p)"
++export YOCTO_ALTERNATE_EXE_PATH="${YOCTO_ALTERNATE_EXE_PATH:="$(readlink -f "$SCRIPT_DIR/../llvm-config")"}"
++if [ -n "$( echo $base_libdir | sed -n '/lib64/p')" ]; then
++    export YOCTO_ALTERNATE_LIBDIR="${YOCTO_ALTERNATE_LIBDIR:="/lib64"}"
++else
++    export YOCTO_ALTERNATE_LIBDIR="${YOCTO_ALTERNATE_LIBDIR:="/lib"}"
++fi
++if [[ $# == 0 ]]; then
++  exec "$NEXT_LLVM_CONFIG"
++fi
++
++remain=""
++output=""
++for arg in "$@"; do
++  case "$arg" in
++    --cppflags)
++      output="${output} ${CPPFLAGS}"
++      ;;
++    --cflags)
++      output="${output} ${CFLAGS}"
++      ;;
++    --cxxflags)
++      output="${output} ${CXXFLAGS}"
++      ;;
++    --ldflags)
++      output="${output} ${LDFLAGS}"
++      ;;
++    --shared-mode)
++      output="${output} shared"
++      ;;
++    --link-shared)
++      break
++      ;;
++    *)
++      remain="${remain} ${arg}"
++      ;;
++  esac
++done
++
++if [ "${remain}" != "" ]; then
++      output="${output} "$("$NEXT_LLVM_CONFIG" ${remain})
++fi
++
++echo "${output}"
diff --git a/meta/recipes-devtools/clang/clang/0030-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch b/meta/recipes-devtools/clang/clang/0030-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
new file mode 100644
index 0000000000000000000000000000000000000000..01d054512fbd46439e2e62205ad1d13cad6d3ace
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0030-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
@@ -0,0 +1,92 @@
+From e468c9f5b5cf85583c0435ad934affd5b900caec Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Fri, 13 Sep 2024 13:38:08 +0200
+Subject: [PATCH] scan-build-py: respect LLVM_LIBDIR_SUFFIX like other tools do
+
+* other libraries are installed in 'lib64' or 'lib32' based on
+  LLVM_LIBDIR_SUFFIX value, but libscanbuild files were always
+  installed in 'lib'
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/108549]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ clang/tools/scan-build-py/CMakeLists.txt | 38 ++++++++++++------------
+ 1 file changed, 19 insertions(+), 19 deletions(-)
+
+diff --git a/clang/tools/scan-build-py/CMakeLists.txt b/clang/tools/scan-build-py/CMakeLists.txt
+index 9273eb5ed977..9033786d2da5 100644
+--- a/clang/tools/scan-build-py/CMakeLists.txt
++++ b/clang/tools/scan-build-py/CMakeLists.txt
+@@ -77,52 +77,52 @@ foreach(lib ${LibExecs})
+ endforeach()
+ 
+ foreach(lib ${LibScanbuild})
+-  add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib/libscanbuild/${lib}
++  add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/${lib}
+                      COMMAND ${CMAKE_COMMAND} -E make_directory
+-                       ${CMAKE_BINARY_DIR}/lib
++                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}
+                      COMMAND ${CMAKE_COMMAND} -E make_directory
+-                       ${CMAKE_BINARY_DIR}/lib/libscanbuild
++                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild
+                      COMMAND ${CMAKE_COMMAND} -E copy
+                        ${CMAKE_CURRENT_SOURCE_DIR}/lib/libscanbuild/${lib}
+-                       ${CMAKE_BINARY_DIR}/lib/libscanbuild/
++                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/
+                      DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/lib/libscanbuild/${lib})
+-  list(APPEND Depends ${CMAKE_BINARY_DIR}/lib/libscanbuild/${lib})
++  list(APPEND Depends ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/${lib})
+   install(FILES lib/libscanbuild/${lib}
+-          DESTINATION lib/libscanbuild
++          DESTINATION lib${LLVM_LIBDIR_SUFFIX}/libscanbuild
+           COMPONENT scan-build-py)
+ endforeach()
+ 
+ foreach(resource ${LibScanbuildResources})
+-  add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib/libscanbuild/resources/${resource}
++  add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/resources/${resource}
+                      COMMAND ${CMAKE_COMMAND} -E make_directory
+-                       ${CMAKE_BINARY_DIR}/lib
++                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}
+                      COMMAND ${CMAKE_COMMAND} -E make_directory
+-                       ${CMAKE_BINARY_DIR}/lib/libscanbuild
++                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild
+                      COMMAND ${CMAKE_COMMAND} -E make_directory
+-                       ${CMAKE_BINARY_DIR}/lib/libscanbuild/resources
++                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/resources
+                      COMMAND ${CMAKE_COMMAND} -E copy
+                        ${CMAKE_CURRENT_SOURCE_DIR}/lib/libscanbuild/resources/${resource}
+-                       ${CMAKE_BINARY_DIR}/lib/libscanbuild/resources
++                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/resources
+                      DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/lib/libscanbuild/resources/${resource})
+-  list(APPEND Depends ${CMAKE_BINARY_DIR}/lib/libscanbuild/resources/${resource})
++  list(APPEND Depends ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/resources/${resource})
+   install(FILES lib/libscanbuild/resources/${resource}
+-          DESTINATION lib/libscanbuild/resources
++          DESTINATION lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/resources
+           COMPONENT scan-build-py)
+ endforeach()
+ 
+ foreach(lib ${LibEar})
+-  add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib/libear/${lib}
++  add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libear/${lib}
+                      COMMAND ${CMAKE_COMMAND} -E make_directory
+-                       ${CMAKE_BINARY_DIR}/lib
++                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}
+                      COMMAND ${CMAKE_COMMAND} -E make_directory
+-                       ${CMAKE_BINARY_DIR}/lib/libear
++                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libear
+                      COMMAND ${CMAKE_COMMAND} -E copy
+                        ${CMAKE_CURRENT_SOURCE_DIR}/lib/libear/${lib}
+-                       ${CMAKE_BINARY_DIR}/lib/libear/
++                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libear/
+                      DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/lib/libear/${lib})
+-  list(APPEND Depends ${CMAKE_BINARY_DIR}/lib/libear/${lib})
++  list(APPEND Depends ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libear/${lib})
+   install(FILES lib/libear/${lib}
+-          DESTINATION lib/libear
++          DESTINATION lib${LLVM_LIBDIR_SUFFIX}/libear
+           COMPONENT scan-build-py)
+ endforeach()
+ 
diff --git a/meta/recipes-devtools/clang/clang/0031-compiler-rt-Do-not-pass-target-to-clang-compiler.patch b/meta/recipes-devtools/clang/clang/0031-compiler-rt-Do-not-pass-target-to-clang-compiler.patch
new file mode 100644
index 0000000000000000000000000000000000000000..01fcc0689d21394f3f4de6c3648a6e3255bdb365
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0031-compiler-rt-Do-not-pass-target-to-clang-compiler.patch
@@ -0,0 +1,29 @@
+From cbb5bca513714f539c899a123bf5dc17651c9737 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Mar 2025 00:30:38 -0700
+Subject: [PATCH] compiler-rt: Do not pass --target to clang compiler
+
+In OE we use <tuple>-clang and <tuple>-clang++ which
+should resolve the --target correctly.
+
+Upstream-Status: Inappropriate [ OE-Specific ]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ compiler-rt/lib/fuzzer/CMakeLists.txt | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/compiler-rt/lib/fuzzer/CMakeLists.txt b/compiler-rt/lib/fuzzer/CMakeLists.txt
+index 6db24610df1f..692e194c2a98 100644
+--- a/compiler-rt/lib/fuzzer/CMakeLists.txt
++++ b/compiler-rt/lib/fuzzer/CMakeLists.txt
+@@ -140,10 +140,6 @@ if(OS_NAME MATCHES "Android|Linux|Fuchsia" AND
+    COMPILER_RT_LIBCXXABI_PATH)
+   macro(partially_link_libcxx name dir arch)
+     get_target_flags_for_arch(${arch} target_cflags)
+-    if(CMAKE_CXX_COMPILER_ID MATCHES Clang)
+-      get_compiler_rt_target(${arch} target)
+-      set(target_cflags --target=${target} ${target_cflags})
+-    endif()
+     set(cxx_${arch}_merge_dir "${CMAKE_CURRENT_BINARY_DIR}/cxx_${arch}_merge.dir")
+     file(MAKE_DIRECTORY ${cxx_${arch}_merge_dir})
+     add_custom_command(TARGET clang_rt.${name}-${arch} POST_BUILD
diff --git a/meta/recipes-devtools/clang/clang/0032-Fix-build-on-ppc64-musl.patch b/meta/recipes-devtools/clang/clang/0032-Fix-build-on-ppc64-musl.patch
new file mode 100644
index 0000000000000000000000000000000000000000..e1fcb3a2037a686d5a67edbec864ed4d4a259808
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0032-Fix-build-on-ppc64-musl.patch
@@ -0,0 +1,97 @@
+From bb99b65d884185a2eb1d4601e5135da582cbd8a9 Mon Sep 17 00:00:00 2001
+From: mojyack <mojyack@gmail.com>
+Date: Mon, 16 Dec 2024 13:42:04 +0900
+Subject: [PATCH] Fix build on ppc64+musl
+
+In powerpc64-unknown-linux-musl, signal.h does not include asm/ptrace.h,
+which causes "member access into incomplete type 'struct pt_regs'" errors.
+Include the header explicitly to fix this.
+
+Also in sanitizer_linux_libcdep.cpp, there is a usage of
+TlsPreTcbSize which is not defined in such a platform.
+Guard the branch with macro.
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/pull/120036]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../lib/sanitizer_common/sanitizer_linux.cpp        |  4 ++++
+ .../sanitizer_common/sanitizer_linux_libcdep.cpp    | 13 +++++++------
+ .../sanitizer_platform_limits_posix.cpp             |  2 +-
+ .../sanitizer_stoptheworld_linux_libcdep.cpp        |  3 ++-
+ 4 files changed, 14 insertions(+), 8 deletions(-)
+
+diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_linux.cpp b/compiler-rt/lib/sanitizer_common/sanitizer_linux.cpp
+index 7aa48d29d2d5..a4d526b4466c 100644
+--- a/compiler-rt/lib/sanitizer_common/sanitizer_linux.cpp
++++ b/compiler-rt/lib/sanitizer_common/sanitizer_linux.cpp
+@@ -86,6 +86,10 @@
+ #    include <sys/sysmacros.h>
+ #  endif
+ 
++#  if SANITIZER_LINUX && defined(__powerpc64__)
++#    include <asm/ptrace.h>
++#  endif
++
+ #  if SANITIZER_FREEBSD
+ #    include <machine/atomic.h>
+ #    include <sys/exec.h>
+diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_linux_libcdep.cpp b/compiler-rt/lib/sanitizer_common/sanitizer_linux_libcdep.cpp
+index e11eff13cd32..331e1c7d8d15 100644
+--- a/compiler-rt/lib/sanitizer_common/sanitizer_linux_libcdep.cpp
++++ b/compiler-rt/lib/sanitizer_common/sanitizer_linux_libcdep.cpp
+@@ -619,21 +619,22 @@ static void GetTls(uptr *addr, uptr *size) {
+   *addr = tp - RoundUpTo(*size, align);
+   *size = tp - *addr + ThreadDescriptorSize();
+ #      else
+-  if (SANITIZER_GLIBC)
+-    *size += 1664;
+-  else if (SANITIZER_FREEBSD)
+-    *size += 128;  // RTLD_STATIC_TLS_EXTRA
+-#        if defined(__mips__) || defined(__powerpc64__) || SANITIZER_RISCV64
++#        if SANITIZER_GLIBC
++  *size += 1664;
++#        elif SANITIZER_FREEBSD
++  *size += 128;  // RTLD_STATIC_TLS_EXTRA
++#          if defined(__mips__) || defined(__powerpc64__) || SANITIZER_RISCV64
+   const uptr pre_tcb_size = TlsPreTcbSize();
+   *addr -= pre_tcb_size;
+   *size += pre_tcb_size;
+-#        else
++#          else
+   // arm and aarch64 reserve two words at TP, so this underestimates the range.
+   // However, this is sufficient for the purpose of finding the pointers to
+   // thread-specific data keys.
+   const uptr tcb_size = ThreadDescriptorSize();
+   *addr -= tcb_size;
+   *size += tcb_size;
++#          endif
+ #        endif
+ #      endif
+ #    elif SANITIZER_NETBSD
+diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.cpp b/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.cpp
+index a5311d266b0c..ec5f2edab6a6 100644
+--- a/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.cpp
++++ b/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.cpp
+@@ -96,7 +96,7 @@
+ # include <sys/ptrace.h>
+ #    if defined(__mips64) || defined(__aarch64__) || defined(__arm__) ||       \
+         defined(__hexagon__) || defined(__loongarch__) || SANITIZER_RISCV64 || \
+-        defined(__sparc__)
++        defined(__sparc__) || defined(__powerpc64__)
+ #      include <asm/ptrace.h>
+ #      ifdef __arm__
+ typedef struct user_fpregs elf_fpregset_t;
+diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cpp b/compiler-rt/lib/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cpp
+index 945da99d41f4..58d17d90c343 100644
+--- a/compiler-rt/lib/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cpp
++++ b/compiler-rt/lib/sanitizer_common/sanitizer_stoptheworld_linux_libcdep.cpp
+@@ -31,7 +31,8 @@
+ #include <sys/types.h> // for pid_t
+ #include <sys/uio.h> // for iovec
+ #include <elf.h> // for NT_PRSTATUS
+-#if (defined(__aarch64__) || SANITIZER_RISCV64 || SANITIZER_LOONGARCH64) && \
++#if (defined(__aarch64__) || defined(__powerpc64__) || \
++     SANITIZER_RISCV64 || SANITIZER_LOONGARCH64) &&    \
+      !SANITIZER_ANDROID
+ // GLIBC 2.20+ sys/user does not include asm/ptrace.h
+ # include <asm/ptrace.h>
diff --git a/meta/recipes-devtools/clang/clang/0033-clangd-Add-a-build-option-to-disable-building-dexp.patch b/meta/recipes-devtools/clang/clang/0033-clangd-Add-a-build-option-to-disable-building-dexp.patch
new file mode 100644
index 0000000000000000000000000000000000000000..198989cd422502e47f143a36eb4c9d71f6ce9071
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0033-clangd-Add-a-build-option-to-disable-building-dexp.patch
@@ -0,0 +1,85 @@
+From 49fbbb928d5cafba3d367e3750d402b53425943a Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Tue, 25 Mar 2025 22:25:55 +0100
+Subject: [PATCH] clangd: Add a build option to disable building dexp
+
+Building dexp on Debian 11 currently causes intermittent failure[0][1].
+
+Adding the CLANGD_BUILD_DEXP option to disable dexp from the build
+allows Debian 11 users to build clang (albeit without the dexp tool).
+
+This option is set to "Build Dexp" by default so, no change is expected
+without manual setting.
+
+[0]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15803
+[1]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1101322
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/133124]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang-tools-extra/clangd/CMakeLists.txt          | 8 +++++++-
+ clang-tools-extra/clangd/test/CMakeLists.txt     | 7 +++++--
+ clang-tools-extra/clangd/test/lit.site.cfg.py.in | 1 +
+ 3 files changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/clang-tools-extra/clangd/CMakeLists.txt b/clang-tools-extra/clangd/CMakeLists.txt
+index 6f10afe4a562..a1e9da41b4b3 100644
+--- a/clang-tools-extra/clangd/CMakeLists.txt
++++ b/clang-tools-extra/clangd/CMakeLists.txt
+@@ -210,6 +210,9 @@ if (CLANGD_ENABLE_REMOTE)
+   include(AddGRPC)
+ endif()
+ 
++option(CLANGD_BUILD_DEXP "Build the dexp tool as part of Clangd" ON)
++llvm_canonicalize_cmake_booleans(CLANGD_BUILD_DEXP)
++
+ if(CLANG_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+@@ -220,4 +223,7 @@ option(CLANGD_ENABLE_REMOTE "Use gRPC library to enable remote index support for
+ set(GRPC_INSTALL_PATH "" CACHE PATH "Path to gRPC library manual installation.")
+ 
+ add_subdirectory(index/remote)
+-add_subdirectory(index/dex/dexp)
++
++if(CLANGD_BUILD_DEXP)
++  add_subdirectory(index/dex/dexp)
++endif()
+diff --git a/clang-tools-extra/clangd/test/CMakeLists.txt b/clang-tools-extra/clangd/test/CMakeLists.txt
+index b51f461a4986..42fc3506641f 100644
+--- a/clang-tools-extra/clangd/test/CMakeLists.txt
++++ b/clang-tools-extra/clangd/test/CMakeLists.txt
+@@ -3,8 +3,6 @@ set(CLANGD_TEST_DEPS
+   ClangdTests
+   clangd-indexer
+   split-file
+-  # No tests for it, but we should still make sure they build.
+-  dexp
+   )
+ 
+ if(CLANGD_BUILD_XPC)
+@@ -12,6 +10,11 @@ if(CLANGD_BUILD_XPC)
+   list(APPEND CLANGD_TEST_DEPS ClangdXpcUnitTests)
+ endif()
+ 
++if(CLANGD_BUILD_DEXP)
++  # No tests for it, but we should still make sure they build.
++  list(APPEND CLANGD_TEST_DEPS dexp)
++endif()
++
+ if(CLANGD_ENABLE_REMOTE)
+   list(APPEND CLANGD_TEST_DEPS clangd-index-server clangd-index-server-monitor)
+ endif()
+diff --git a/clang-tools-extra/clangd/test/lit.site.cfg.py.in b/clang-tools-extra/clangd/test/lit.site.cfg.py.in
+index 1fe7c8d0f324..a0bb3561e19e 100644
+--- a/clang-tools-extra/clangd/test/lit.site.cfg.py.in
++++ b/clang-tools-extra/clangd/test/lit.site.cfg.py.in
+@@ -15,6 +15,7 @@ config.llvm_shlib_dir = "@SHLIBDIR@"
+ config.clangd_source_dir = "@CMAKE_CURRENT_SOURCE_DIR@/.."
+ config.clangd_binary_dir = "@CMAKE_CURRENT_BINARY_DIR@/.."
+ config.clangd_build_xpc = @CLANGD_BUILD_XPC@
++config.clangd_build_dexp = @CLANGD_BUILD_DEXP@
+ config.clangd_enable_remote = @CLANGD_ENABLE_REMOTE@
+ config.clangd_tidy_checks = @CLANGD_TIDY_CHECKS@
+ config.have_zlib = @LLVM_ENABLE_ZLIB@
diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/clang/clang/0034-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
similarity index 92%
rename from meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
rename to meta/recipes-devtools/clang/clang/0034-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
index f71c5d4bd4748b286b4354fd5ca7c686512da8ac..7545ba365b87abb3f5eedfb9b14cf4d58d21aa9f 100644
--- a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ b/meta/recipes-devtools/clang/clang/0034-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -1,4 +1,4 @@
-From 001d56983078842c5aa2a1786b84dc429bd46abd Mon Sep 17 00:00:00 2001
+From 59921cb127dcfb2c655b357e8deb95004f3da41f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 27 Nov 2020 10:11:08 +0000
 Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-index 7684387d8..d225a3b6d 100644
+index 7684387d80fe..d225a3b6dfa9 100644
 --- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 +++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 @@ -361,7 +361,10 @@ public:
diff --git a/meta/recipes-devtools/llvm/llvm/0001-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch b/meta/recipes-devtools/clang/clang/0035-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
similarity index 86%
rename from meta/recipes-devtools/llvm/llvm/0001-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
rename to meta/recipes-devtools/clang/clang/0035-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
index 2320399d5f7de44cf9cc4269d180c097c1b4a616..81820eeaca3bc71afdc01e9eaa09b1a04084657b 100644
--- a/meta/recipes-devtools/llvm/llvm/0001-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
+++ b/meta/recipes-devtools/clang/clang/0035-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
@@ -1,4 +1,4 @@
-From caff2482f786dd7fd5f1f46f2667f7ed847cb8f8 Mon Sep 17 00:00:00 2001
+From e414f6489e055c981970b7210b941c2a41cc322b Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 2 Apr 2025 17:05:17 +0300
 Subject: [PATCH] llvm-config: remove LLVM_LDFLAGS from --ldflags output
@@ -10,17 +10,18 @@ behaviour in llvm-config since crossscripts are not being used for
 native builds. As a OE-specific modification ignore LLVM_LDFLAGS for
 native builds.
 
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  llvm/tools/llvm-config/llvm-config.cpp | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
-index d5b76b1bb6c1..29f7c2eaa419 100644
+index a739f0d8dbea..3120f95fba9d 100644
 --- a/llvm/tools/llvm-config/llvm-config.cpp
 +++ b/llvm/tools/llvm-config/llvm-config.cpp
-@@ -529,7 +529,7 @@ int main(int argc, char **argv) {
+@@ -542,7 +542,7 @@ int main(int argc, char **argv) {
          OS << ActiveIncludeOption << ' ' << LLVM_CXXFLAGS << '\n';
        } else if (Arg == "--ldflags") {
          OS << ((HostTriple.isWindowsMSVCEnvironment()) ? "-LIBPATH:" : "-L")
@@ -29,6 +30,3 @@ index d5b76b1bb6c1..29f7c2eaa419 100644
        } else if (Arg == "--system-libs") {
          PrintSystemLibs = true;
        } else if (Arg == "--libs") {
--- 
-2.39.5
-
diff --git a/meta/recipes-devtools/clang/clang/0036-openmp-Do-not-emit-date-and-time-into-generate-files.patch b/meta/recipes-devtools/clang/clang/0036-openmp-Do-not-emit-date-and-time-into-generate-files.patch
new file mode 100644
index 0000000000000000000000000000000000000000..91c718e2a4f3507d61c28d02c7c7b5e8e538e02e
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0036-openmp-Do-not-emit-date-and-time-into-generate-files.patch
@@ -0,0 +1,37 @@
+From f79ebc5bc696e8747c79a2277ffcf8d91bdadfd5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 23 Apr 2025 11:52:48 -0700
+Subject: [PATCH] openmp: Do not emit date and time into generate files
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This improves reproducibility where the generated files do not
+contain time stamps e.g.
+
+//·The·file·was·generated·from·en_US.txt·by·message-converter.py·on·Wed·Apr·23·16:00:53·2025.·//
+./usr/src/debug/openmp/20.1.2/runtime/src/kmp_i18n_id.inc
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ openmp/runtime/tools/message-converter.py | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/openmp/runtime/tools/message-converter.py b/openmp/runtime/tools/message-converter.py
+index a493d64c1692..0bd5f929fab6 100644
+--- a/openmp/runtime/tools/message-converter.py
++++ b/openmp/runtime/tools/message-converter.py
+@@ -188,11 +188,10 @@ def insert_header(f, data, commentChar="//"):
+     f.write(
+         "{0} Do not edit this file! {0}\n"
+         "{0} The file was generated from"
+-        " {1} by {2} on {3}. {0}\n\n".format(
++        " {1} by {2} {0}\n\n".format(
+             commentChar,
+             os.path.basename(data.filename),
+             os.path.basename(__file__),
+-            datetime.datetime.now().ctime(),
+         )
+     )
+ 
diff --git a/meta/recipes-devtools/llvm/llvm/spirv-internal-build.patch b/meta/recipes-devtools/clang/clang/spirv-internal-build.patch
similarity index 100%
rename from meta/recipes-devtools/llvm/llvm/spirv-internal-build.patch
rename to meta/recipes-devtools/clang/clang/spirv-internal-build.patch
diff --git a/meta/recipes-devtools/llvm/llvm/spirv-shared-library.patch b/meta/recipes-devtools/clang/clang/spirv-shared-library.patch
similarity index 100%
rename from meta/recipes-devtools/llvm/llvm/spirv-shared-library.patch
rename to meta/recipes-devtools/clang/clang/spirv-shared-library.patch
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
new file mode 100644
index 0000000000000000000000000000000000000000..8ae67c8c66fe1834a526be9d274020f1e1fdb6a5
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -0,0 +1,492 @@
+# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "LLVM based C/C++ compiler"
+DESCRIPTION = "Clang is an LLVM based C/C++/Objective-C compiler, \
+                which aims to deliver amazingly fast compiles, \
+                extremely useful error and warning messages and \
+                to provide a platform for building great source \
+                level tools. The Clang Static Analyzer and \
+                clang-tidy are tools that automatically find bugs \
+                in your code, and are great examples of the sort \
+                of tools that can be built using the Clang frontend \
+                as a library to parse C/C++ code"
+HOMEPAGE = "http://clang.llvm.org/"
+SECTION = "devel"
+
+require common-clang.inc
+require common-source.inc
+
+INHIBIT_DEFAULT_DEPS:class-native = "1"
+
+LDFLAGS:append:class-target:riscv32 = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
+LDFLAGS:append:class-target:mips = " -Wl,--no-as-needed -latomic -Wl,--as-needed"
+
+inherit cmake pkgconfig python3native python3targetconfig
+
+OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
+
+def get_clang_arch(bb, d, arch_var):
+    import re
+    a = d.getVar(arch_var)
+    if   re.match('(i.86|athlon|x86.64)$', a):         return 'X86'
+    elif re.match('arm$', a):                          return 'ARM'
+    elif re.match('armeb$', a):                        return 'ARM'
+    elif re.match('aarch64$', a):                      return 'AArch64'
+    elif re.match('aarch64_be$', a):                   return 'AArch64'
+    elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
+    elif re.match('riscv32$', a):                      return 'riscv32'
+    elif re.match('riscv64$', a):                      return 'riscv64'
+    elif re.match('p(pc|owerpc)(|64)', a):             return 'PowerPC'
+    elif re.match('loongarch64$', a):                  return 'loongarch64'
+    else:
+        bb.note("'%s' is not a primary llvm architecture" % a)
+    return ""
+
+def get_clang_host_arch(bb, d):
+    return get_clang_arch(bb, d, 'HOST_ARCH')
+
+def get_clang_target_arch(bb, d):
+    return get_clang_arch(bb, d, 'TARGET_ARCH')
+
+PACKAGECONFIG_CLANG_COMMON = "build-id eh libedit rtti shared-libs \
+                              ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcplusplus libomp unwindlib', '', d)} \
+                              "
+
+PACKAGECONFIG ??= "lldb-wchar terminfo \
+                   ${PACKAGECONFIG_CLANG_COMMON} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'lto thin-lto', d)} \
+                   "
+PACKAGECONFIG:class-native = "clangd \
+                              ${PACKAGECONFIG_CLANG_COMMON} \
+                              "
+PACKAGECONFIG:class-nativesdk = "clangd \
+                                 ${PACKAGECONFIG_CLANG_COMMON} \
+                                 ${@bb.utils.filter('DISTRO_FEATURES', 'lto thin-lto', d)} \
+                                 "
+
+PACKAGECONFIG[bootstrap] = "-DCLANG_ENABLE_BOOTSTRAP=On -DCLANG_BOOTSTRAP_PASSTHROUGH='${PASSTHROUGH}' -DBOOTSTRAP_LLVM_ENABLE_LTO=Thin -DBOOTSTRAP_LLVM_ENABLE_LLD=ON,,,"
+PACKAGECONFIG[build-id] = "-DENABLE_LINKER_BUILD_ID=ON,-DENABLE_LINKER_BUILD_ID=OFF,,"
+PACKAGECONFIG[clangd] = "-DCLANG_ENABLE_CLANGD=ON,-DCLANG_ENABLE_CLANGD=OFF,,"
+
+# Activate to build the dexp tool in clangd
+# Disabled by default for -native since it is known to trigger compiler failure on Debian 11
+# See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15803
+PACKAGECONFIG[clangd-dexp] = "-DCLANGD_BUILD_DEXP=ON,-DCLANGD_BUILD_DEXP=OFF,,"
+
+PACKAGECONFIG[compiler-rt] = "-DCLANG_DEFAULT_RTLIB=compiler-rt,,"
+PACKAGECONFIG[eh] = "-DLLVM_ENABLE_EH=ON,-DLLVM_ENABLE_EH=OFF,,"
+PACKAGECONFIG[libcplusplus] = "-DCLANG_DEFAULT_CXX_STDLIB=libc++,,"
+PACKAGECONFIG[libedit] = "-DLLVM_ENABLE_LIBEDIT=ON -DLLDB_ENABLE_LIBEDIT=ON,-DLLVM_ENABLE_LIBEDIT=OFF -DLLDB_ENABLE_LIBEDIT=OFF,libedit libedit-native"
+PACKAGECONFIG[libomp] = "-DCLANG_DEFAULT_OPENMP_RUNTIME=libomp,,"
+PACKAGECONFIG[lld] = "-DCLANG_DEFAULT_LINKER=lld,,"
+PACKAGECONFIG[lldb-lua] = "-DLLDB_ENABLE_LUA=ON,-DLLDB_ENABLE_LUA=OFF,lua"
+PACKAGECONFIG[lldb-wchar] = "-DLLDB_EDITLINE_USE_WCHAR=1,-DLLDB_EDITLINE_USE_WCHAR=0,"
+PACKAGECONFIG[lto] = "-DLLVM_ENABLE_LTO=Full -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
+PACKAGECONFIG[pfm] = "-DLLVM_ENABLE_LIBPFM=ON,-DLLVM_ENABLE_LIBPFM=OFF,libpfm,"
+PACKAGECONFIG[rtti] = "-DLLVM_ENABLE_RTTI=ON,-DLLVM_ENABLE_RTTI=OFF,,"
+PACKAGECONFIG[shared-libs] = "-DLLVM_BUILD_LLVM_DYLIB=ON -DLLVM_LINK_LLVM_DYLIB=ON,,,"
+PACKAGECONFIG[split-dwarf] = "-DLLVM_USE_SPLIT_DWARF=ON,-DLLVM_USE_SPLIT_DWARF=OFF,,"
+PACKAGECONFIG[terminfo] = "-DLLVM_ENABLE_TERMINFO=ON -DCOMPILER_RT_TERMINFO_LIB=ON,-DLLVM_ENABLE_TERMINFO=OFF -DCOMPILER_RT_TERMINFO_LIB=OFF,ncurses,"
+PACKAGECONFIG[thin-lto] = "-DLLVM_ENABLE_LTO=Thin -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
+PACKAGECONFIG[unwindlib] = "-DCLANG_DEFAULT_UNWINDLIB=libunwind,-DCLANG_DEFAULT_UNWINDLIB=libgcc,,"
+
+OECMAKE_SOURCEPATH = "${S}/llvm"
+
+OECMAKE_TARGET_COMPILE = "${@bb.utils.contains('PACKAGECONFIG', 'bootstrap', 'stage2', 'all', d)}"
+OECMAKE_TARGET_INSTALL = "${@bb.utils.contains('PACKAGECONFIG', 'bootstrap', 'stage2-install', 'install', d)}"
+BINPATHPREFIX = "${@bb.utils.contains('PACKAGECONFIG', 'bootstrap', '/tools/clang/stage2-bins/NATIVE', '', d)}"
+
+PASSTHROUGH = "\
+CLANG_DEFAULT_RTLIB;CLANG_DEFAULT_CXX_STDLIB;LLVM_BUILD_LLVM_DYLIB;LLVM_LINK_LLVM_DYLIB;\
+LLVM_ENABLE_ASSERTIONS;LLVM_ENABLE_EXPENSIVE_CHECKS;LLVM_ENABLE_PIC;\
+LLVM_BINDINGS_LIST;LLVM_ENABLE_FFI;FFI_INCLUDE_DIR;LLVM_OPTIMIZED_TABLEGEN;\
+LLVM_ENABLE_RTTI;LLVM_ENABLE_EH;LLVM_BUILD_EXTERNAL_COMPILER_RT;CMAKE_SYSTEM_NAME;\
+CMAKE_BUILD_TYPE;BUILD_SHARED_LIBS;LLVM_ENABLE_PROJECTS;LLVM_ENABLE_RUNTIMES;LLVM_BINUTILS_INCDIR;\
+LLVM_TARGETS_TO_BUILD;LLVM_EXPERIMENTAL_TARGETS_TO_BUILD;PYTHON_EXECUTABLE;\
+PYTHON_LIBRARY;PYTHON_INCLUDE_DIR;LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN;LLDB_EDITLINE_USE_WCHAR;\
+LLVM_ENABLE_LIBEDIT;LLDB_ENABLE_LIBEDIT;LLDB_PYTHON_RELATIVE_PATH;LLDB_PYTHON_EXE_RELATIVE_PATH;\
+LLDB_PYTHON_EXT_SUFFIX;CMAKE_C_FLAGS_RELEASE;CMAKE_CXX_FLAGS_RELEASE;CMAKE_ASM_FLAGS_RELEASE;\
+CLANG_DEFAULT_CXX_STDLIB;CLANG_DEFAULT_RTLIB;CLANG_DEFAULT_UNWINDLIB;\
+CLANG_DEFAULT_OPENMP_RUNTIME;LLVM_ENABLE_PER_TARGET_RUNTIME_DIR;\
+LLVM_BUILD_TOOLS;LLVM_USE_HOST_TOOLS;LLVM_CONFIG_PATH;LLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR;\
+"
+#
+# Default to build all OE-Core supported target arches (user overridable).
+# Gennerally setting LLVM_TARGETS_TO_BUILD = "" in local.conf is ok in most simple situations
+# where only one target architecture is needed along with just one build arch (usually X86)
+#
+LLVM_TARGETS_TO_BUILD ?= "AMDGPU;AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;NVPTX;SPIRV"
+
+LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?= ""
+
+HF = ""
+HF:class-target = "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', 'hf', '', d)}"
+HF[vardepvalue] = "${HF}"
+
+# Ensure that LLVM_PROJECTS does not contain compiler runtime components e.g. libcxx etc
+# they are enabled via LLVM_ENABLE_RUNTIMES
+LLVM_PROJECTS ?= "clang;clang-tools-extra;libclc;lld${LLDB}"
+LLDB ?= ";lldb"
+# LLDB support for RISCV32/Mips32 does not work yet
+LLDB:riscv32 = ""
+LLDB:mips = ""
+LLDB:mipsel = ""
+LLDB:powerpc = ""
+
+# linux hosts (.so) on Windows .pyd
+SOLIBSDEV:mingw32 = ".pyd"
+
+#CMAKE_VERBOSE = "VERBOSE=1"
+
+EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
+                  -DLLVM_APPEND_VC_REV=OFF \
+                  -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
+                  -DLLVM_ENABLE_EXPENSIVE_CHECKS=OFF \
+                  -DLLVM_ENABLE_PIC=ON \
+                  -DCLANG_DEFAULT_PIE_ON_LINUX=ON \
+                  -DLLVM_BINDINGS_LIST='' \
+                  -DLLVM_ENABLE_FFI=ON \
+                  -DLLVM_ENABLE_ZSTD=ON \
+                  -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
+                  -DLLVM_OPTIMIZED_TABLEGEN=ON \
+                  -DLLVM_BUILD_EXTERNAL_COMPILER_RT=ON \
+                  -DCMAKE_SYSTEM_NAME=Linux \
+                  -DCMAKE_BUILD_TYPE=Release \
+                  -DCMAKE_CXX_FLAGS_RELEASE='${CXXFLAGS} -DNDEBUG -g0' \
+                  -DCMAKE_C_FLAGS_RELEASE='${CFLAGS} -DNDEBUG -g0' \
+                  -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${S}/llvm/projects/SPIRV-LLVM-Translator/SPIRV-Headers \
+                  -DLLVM_ENABLE_PROJECTS='${LLVM_PROJECTS}' \
+                  -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR} \
+                  -DLLVM_VERSION_SUFFIX='${VER_SUFFIX}' \
+                  -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
+                  -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS_TO_BUILD}' \
+                  -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD='${LLVM_EXPERIMENTAL_TARGETS_TO_BUILD}' \
+"
+
+EXTRA_OECMAKE:append:class-native = "\
+                  -DPYTHON_EXECUTABLE='${PYTHON}' \
+"
+EXTRA_OECMAKE:append:class-nativesdk = "\
+                  -DCROSS_TOOLCHAIN_FLAGS_NATIVE='-DLLDB_PYTHON_RELATIVE_PATH=${PYTHON_SITEPACKAGES_DIR} \
+                                                  -DLLDB_PYTHON_EXE_RELATIVE_PATH=${PYTHON_PN} \
+                                                  -DLLDB_PYTHON_EXT_SUFFIX=${SOLIBSDEV} \
+                                                  -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${S}/llvm/projects/SPIRV-LLVM-Translator/SPIRV-Headers \
+                                                  -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain-native.cmake' \
+                  -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib \
+                  -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
+                  -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
+                  -DCMAKE_STRIP=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-strip \
+                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
+                  -DLLVM_HEADERS_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-min-tblgen \
+                  -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so \
+                  -DLLDB_PYTHON_RELATIVE_PATH=${PYTHON_SITEPACKAGES_DIR} \
+                  -DLLDB_PYTHON_EXE_RELATIVE_PATH=${PYTHON_PN} \
+                  -DLLDB_PYTHON_EXT_SUFFIX=${SOLIBSDEV} \
+                  -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
+                  -DPYTHON_EXECUTABLE='${PYTHON}' \
+"
+EXTRA_OECMAKE:append:class-target = "\
+                  -DCROSS_TOOLCHAIN_FLAGS_NATIVE='-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${S}/llvm/projects/SPIRV-LLVM-Translator/SPIRV-Headers \
+' \
+                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
+                  -DLLVM_HEADERS_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-min-tblgen \
+                  -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib \
+                  -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
+                  -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
+                  -DCMAKE_STRIP=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-strip \
+                  -DLLVM_TARGET_ARCH=${@get_clang_target_arch(bb, d)} \
+                  -DLLVM_DEFAULT_TARGET_TRIPLE=${TARGET_SYS}${HF} \
+                  -DLLVM_HOST_TRIPLE=${TARGET_SYS}${HF} \
+                  -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so \
+                  -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
+                  -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
+                  -DLLDB_PYTHON_RELATIVE_PATH=${PYTHON_SITEPACKAGES_DIR} \
+                  -DLLDB_PYTHON_EXE_RELATIVE_PATH=${bindir} \
+                  -DLLDB_PYTHON_EXT_SUFFIX=${SOLIBSDEV} \
+"
+
+DEPENDS = "binutils zlib zstd libffi libxml2 libxml2-native ninja-native swig-native spirv-tools-native"
+DEPENDS:append:class-nativesdk = " clang-crosssdk-${SDK_SYS} virtual/nativesdk-cross-binutils nativesdk-python3"
+DEPENDS:append:class-target = " clang-cross-${TARGET_ARCH} python3 ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}"
+
+RRECOMMENDS:${PN} = "binutils"
+RRECOMMENDS:${PN}:append:class-target = "${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', ' libcxx-dev', '', d)}"
+
+# patch out build host paths for reproducibility
+reproducible_build_variables() {
+    sed -i -e "s,${DEBUG_PREFIX_MAP},,g" \
+        -e "s,--sysroot=${RECIPE_SYSROOT},,g" \
+        -e "s,${STAGING_DIR_HOST},,g" \
+        -e "s,${S}/llvm,,g"  \
+        -e "s,${B},,g" \
+        ${B}/tools/llvm-config/BuildVariables.inc
+}
+
+do_configure:append:class-target() {
+    reproducible_build_variables
+}
+
+do_configure:append:class-nativesdk() {
+    reproducible_build_variables
+}
+
+do_install:append() {
+    rm -rf ${D}${libdir}/python*/site-packages/six.py
+    for t in clang-pseudo clang-pseudo-gen clang-rename; do
+        if [ -e ${B}${BINPATHPREFIX}/bin/$t ]; then
+            install -Dm 0755 ${B}${BINPATHPREFIX}/bin/$t ${D}${bindir}/$t
+        fi
+    done
+}
+
+do_install:append:class-target () {
+    # Allow bin path to change based on YOCTO_ALTERNATE_EXE_PATH
+    sed -i 's;${_IMPORT_PREFIX}/bin;${_IMPORT_PREFIX_BIN};g' ${D}${libdir}/cmake/llvm/LLVMExports-release.cmake
+
+    # Insert function to populate Import Variables
+    sed -i "4i\
+if(DEFINED ENV{YOCTO_ALTERNATE_EXE_PATH})\n\
+  execute_process(COMMAND \"llvm-config\" \"--bindir\" OUTPUT_VARIABLE _IMPORT_PREFIX_BIN OUTPUT_STRIP_TRAILING_WHITESPACE)\n\
+else()\n\
+  set(_IMPORT_PREFIX_BIN \"\${_IMPORT_PREFIX}/bin\")\n\
+endif()\n" ${D}${libdir}/cmake/llvm/LLVMExports-release.cmake
+
+    if [ -n "${LLVM_LIBDIR_SUFFIX}" ]; then
+        mkdir -p ${D}${nonarch_libdir}
+        mv ${D}${libdir}/clang ${D}${nonarch_libdir}/clang
+        ln -rs ${D}${nonarch_libdir}/clang ${D}${libdir}/clang
+        rmdir --ignore-fail-on-non-empty ${D}${libdir}
+    fi
+    for t in clang clang++ llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip llvm-objcopy llvm-objdump llvm-readelf \
+        llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov; do
+        ln -sf $t ${D}${bindir}/${TARGET_PREFIX}$t
+    done
+
+    # reproducibility
+    sed -i -e 's,${B},,g' ${D}${libdir}/cmake/llvm/LLVMConfig.cmake
+}
+
+do_install:append:class-native () {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'clangd', 'true', 'false', d)}; then
+        install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}${bindir}/clangd-indexer
+    fi
+    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-chars-gen ${D}${bindir}/clang-tidy-confusable-chars-gen
+    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tblgen ${D}${bindir}/clang-tblgen
+    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/lldb-tblgen ${D}${bindir}/lldb-tblgen
+    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/llvm-min-tblgen ${D}${bindir}/llvm-min-tblgen
+    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/prepare_builtins ${D}${bindir}/prepare_builtins
+
+    for f in `find ${D}${bindir} -executable -type f -not -type l`; do
+        test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
+        echo "stripped $f"
+    done
+    ln -sf clang-tblgen ${D}${bindir}/clang-tblgen${PV}
+    ln -sf llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
+    ln -sf llvm-config ${D}${bindir}/llvm-config${PV}
+}
+
+do_install:append:class-nativesdk () {
+    if [ -e ${D}${libdir}/cmake/llvm/LLVMConfig.cmake ] ; then
+        sed -i -e "s|${B}/./bin/||g" ${D}${libdir}/cmake/llvm/LLVMConfig.cmake
+    fi
+    if ${@bb.utils.contains('PACKAGECONFIG', 'clangd', 'true', 'false', d)}; then
+        install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}${bindir}/clangd-indexer
+    fi
+    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tblgen ${D}${bindir}/clang-tblgen
+    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-chars-gen ${D}${bindir}/clang-tidy-confusable-chars-gen
+    for f in `find ${D}${bindir} -executable -type f -not -type l`; do
+        test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
+    done
+    ln -sf clang-tblgen ${D}${bindir}/clang-tblgen${PV}
+    ln -sf llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
+    ln -sf llvm-config ${D}${bindir}/llvm-config${PV}
+    rm -rf ${D}${datadir}/llvm/cmake
+    rm -rf ${D}${datadir}/llvm
+
+    #reproducibility
+    if [ -e ${D}${libdir}/cmake/llvm/LLVMConfig.cmake ] ; then
+        sed -i -e 's,${B},,g' ${D}${libdir}/cmake/llvm/LLVMConfig.cmake
+    fi
+}
+
+PROVIDES:append:class-native = " llvm-native libclc-native spirv-llvm-translator-native"
+PROVIDES:append:class-target = " llvm libclc spirv-llvm-translator"
+PROVIDES:append:class-nativesdk = " nativesdk-llvm nativesdk-libclc nativesdk-spirv-llvm-translator"
+
+PACKAGES =+ "${PN}-libllvm ${PN}-lldb-python ${PN}-libclang-cpp ${PN}-tidy ${PN}-format ${PN}-tools ${PN}-clc ${PN}-spirv \
+             libclang lldb lldb-server liblldb llvm-linker-tools"
+
+
+BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:lldb += "${PN}-lldb-python lldb-server"
+
+RDEPENDS:${PN}-tools += "\
+  perl-module-digest-md5 \
+  perl-module-file-basename \
+  perl-module-file-copy \
+  perl-module-file-find \
+  perl-module-file-path \
+  perl-module-findbin \
+  perl-module-hash-util \
+  perl-module-sys-hostname \
+  perl-module-term-ansicolor \
+"
+
+RRECOMMENDS:${PN}-tidy += "${PN}-tools"
+
+FILES:llvm-linker-tools = "${libdir}/LLVMgold* ${libdir}/libLTO.so.* ${libdir}/LLVMPolly*"
+
+FILES:${PN}-libclang-cpp = "${libdir}/libclang-cpp.so.*"
+
+FILES:${PN}-lldb-python = "${libdir}/python*/site-packages/lldb/*"
+
+FILES:${PN}-tidy = "${bindir}/*clang-tidy*"
+FILES:${PN}-format = "${bindir}/*clang-format*"
+
+FILES:${PN}-tools = "${bindir}/analyze-build \
+  ${bindir}/c-index-test \
+  ${bindir}/clang-apply-replacements \
+  ${bindir}/clang-change-namespace \
+  ${bindir}/clang-check \
+  ${bindir}/clang-doc \
+  ${bindir}/clang-extdef-mapping \
+  ${bindir}/clang-include-fixer \
+  ${bindir}/clang-linker-wrapper \
+  ${bindir}/clang-move \
+  ${bindir}/clang-nvlink-wrapper \
+  ${bindir}/clang-offload-bundler \
+  ${bindir}/clang-offload-packager \
+  ${bindir}/clang-pseudo* \
+  ${bindir}/clang-query \
+  ${bindir}/clang-refactor \
+  ${bindir}/clang-rename* \
+  ${bindir}/clang-reorder-fields \
+  ${bindir}/clang-repl \
+  ${bindir}/clang-scan-deps \
+  ${bindir}/diagtool \
+  ${bindir}/find-all-symbols \
+  ${bindir}/hmaptool \
+  ${bindir}/hwasan_symbolize \
+  ${bindir}/intercept-build \
+  ${bindir}/modularize \
+  ${bindir}/pp-trace \
+  ${bindir}/sancov \
+  ${bindir}/scan-build \
+  ${bindir}/scan-build-py \
+  ${bindir}/scan-view \
+  ${bindir}/split-file \
+  ${libdir}/libscanbuild/* \
+  ${libdir}/libear/* \
+  ${libexecdir}/analyze-c++ \
+  ${libexecdir}/analyze-cc \
+  ${libexecdir}/c++-analyzer \
+  ${libexecdir}/ccc-analyzer \
+  ${libexecdir}/intercept-c++ \
+  ${libexecdir}/intercept-cc \
+  ${datadir}/scan-build/* \
+  ${datadir}/scan-view/* \
+  ${datadir}/opt-viewer/* \
+  ${datadir}/clang/* \
+"
+
+FILES:${PN} += "\
+  ${bindir}/clang-cl \
+  ${libdir}/BugpointPasses.so \
+  ${libdir}/LLVMHello.so \
+  ${libdir}/*Plugin.so \
+  ${libdir}/${BPN} \
+  ${nonarch_libdir}/${BPN}/*/include/ \
+"
+
+FILES:${PN}-clc += "${datadir}/clc"
+
+FILES:${PN}-spirv = " \
+    ${bindir}/llvm-spirv \
+    ${libdir}/libLLVMSPIRV.so.* \
+"
+
+FILES:lldb = "\
+  ${bindir}/lldb \
+  ${bindir}/lldb-argdumper \
+  ${bindir}/lldb-instr \
+  ${bindir}/lldb-vscode \
+"
+
+FILES:lldb-server = "\
+  ${bindir}/lldb-server \
+"
+
+FILES:liblldb = "\
+  ${libdir}/liblldbIntelFeatures.so.* \
+  ${libdir}/liblldb.so.* \
+"
+
+FILES:${PN}-libllvm =+ "\
+  ${libdir}/libLLVM.so.${MAJOR_VER}.${MINOR_VER} \
+  ${libdir}/libLLVM-${MAJOR_VER}.so \
+  ${libdir}/libRemarks.so.* \
+"
+
+FILES:libclang = "\
+  ${libdir}/libclang.so.* \
+"
+
+FILES:${PN}-dev += "\
+  ${datadir}/llvm/cmake \
+  ${libdir}/cmake \
+  ${nonarch_libdir}/libear \
+  ${nonarch_libdir}/${BPN}/*.la \
+"
+FILES:${PN}-doc += "${datadir}/clang-doc"
+
+FILES:${PN}-staticdev += "${nonarch_libdir}/${BPN}/*.a"
+
+FILES:${PN}-staticdev:remove = "${libdir}/${BPN}/*.a"
+FILES:${PN}-dev:remove = "${libdir}/${BPN}/*.la"
+FILES:${PN}:remove = "${libdir}/${BPN}/*"
+
+INSANE_SKIP:${PN} += "already-stripped"
+#INSANE_SKIP:${PN}-dev += "dev-elf"
+INSANE_SKIP:${PN}-lldb-python += "dev-so dev-deps"
+INSANE_SKIP:${MLPREFIX}liblldb = "dev-so"
+INSANE_SKIP:${PN}-libllvm = "dev-so"
+
+# SPIRV-LLVM-Translator provides only static libraries, they are included into
+# the clang-spirv package.
+INSANE_SKIP:${PN}-spirv += "dev-so"
+
+#Avoid SSTATE_SCAN_COMMAND running sed over llvm-config.
+SSTATE_SCAN_FILES:remove = "*-config"
+
+COMPILER_RT:class-nativesdk:toolchain-clang:runtime-llvm = "-rtlib=libgcc --unwindlib=libgcc"
+LIBCPLUSPLUS:class-nativesdk:toolchain-clang:runtime-llvm = "-stdlib=libstdc++"
+
+SYSROOT_DIRS:append:class-target = " ${nonarch_libdir}"
+
+SYSROOT_PREPROCESS_FUNCS:append:class-target = " clang_sysroot_preprocess"
+SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " clang_sysroot_preprocess"
+
+clang_sysroot_preprocess() {
+	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+	install -m 0755 ${S}/llvm/tools/llvm-config/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+	ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
+	# LLDTargets.cmake references the lld executable(!) that some modules/plugins link to
+	install -d ${SYSROOT_DESTDIR}${bindir}
+
+	binaries="lld diagtool clang-${MAJOR_VER} clang-format clang-offload-packager
+	                clang-offload-bundler clang-scan-deps clang-repl
+	                clang-refactor clang-check clang-extdef-mapping clang-apply-replacements
+	                clang-reorder-fields clang-tidy clang-change-namespace clang-doc clang-include-fixer
+	                find-all-symbols clang-move clang-query pp-trace modularize"
+
+	if ${@bb.utils.contains('PACKAGECONFIG', 'clangd', 'true', 'false', d)}; then
+	        binaries="${binaries} clangd"
+	fi
+
+	for f in ${binaries}
+	do
+		install -m 755 ${D}${bindir}/$f ${SYSROOT_DESTDIR}${bindir}/
+	done
+}
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
new file mode 100644
index 0000000000000000000000000000000000000000..bb152d2c566a6c61b95be2e7922cfe9c64a27afa
--- /dev/null
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -0,0 +1,24 @@
+LLVM_RELEASE = ""
+LLVM_DIR = "llvm${LLVM_RELEASE}"
+
+LLVM_HTTP ?= "https://github.com/llvm"
+
+MAJOR_VER = "20"
+MINOR_VER = "1"
+PATCH_VER = "2"
+# could be 'rcX' or 'git' or empty ( for release )
+VER_SUFFIX = ""
+
+PV = "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}${VER_SUFFIX}"
+
+LLVMMD5SUM = "8a15a0759ef07f2682d2ba4b893c9afe"
+CLANGMD5SUM = "ff42885ed2ab98f1ecb8c1fc41205343"
+LLDMD5SUM = "ae7dc7c027b1fa89b5b013d391d3ee2b"
+LLDBMD5SUM = "2e0d44968471fcde980034dbb826bea9"
+
+LLVM_LIBDIR_SUFFIX = "${@d.getVar('baselib').replace('lib', '')}"
+
+# set the default pigz thread
+export PIGZ = "-p ${@oe.utils.cpu_count(at_least=2)}"
+
+require common.inc
diff --git a/meta/recipes-devtools/clang/common-source.inc b/meta/recipes-devtools/clang/common-source.inc
new file mode 100644
index 0000000000000000000000000000000000000000..d8a0f68175cf5effe72d2be4ae847eba122f94e8
--- /dev/null
+++ b/meta/recipes-devtools/clang/common-source.inc
@@ -0,0 +1,17 @@
+do_fetch() {
+        :
+}
+do_fetch[noexec] = "1"
+deltask do_unpack
+deltask do_patch
+
+SRC_URI = ""
+
+do_configure[depends] += "llvm-project-source-${PV}:do_preconfigure"
+do_populate_lic[depends] += "llvm-project-source-${PV}:do_unpack"
+do_create_spdx[depends] += "llvm-project-source-${PV}:do_preconfigure"
+
+# spdx shared workdir detection fails as not WORKDIR is altered but S and B
+# return always true to fix that
+def is_work_shared_spdx(d):
+    return True
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
new file mode 100644
index 0000000000000000000000000000000000000000..5a1fa0bacf7f8504f58b2866be8d42b3621787da
--- /dev/null
+++ b/meta/recipes-devtools/clang/common.inc
@@ -0,0 +1,83 @@
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/clang:"
+
+LIC_FILES_CHKSUM = "file://llvm/LICENSE.TXT;md5=${LLVMMD5SUM} \
+                    file://clang/LICENSE.TXT;md5=${CLANGMD5SUM} \
+"
+LICENSE = "Apache-2.0-with-LLVM-exception"
+
+# Snapshot
+#RELEASE ?= "a69568efe6c4972e71af295c6577b3412dd57c22"
+#BASEURI ?= "https://api.github.com/repos/llvm/llvm-project/tarball/${RELEASE};downloadfilename=llvm-${PV}-${RELEASE}.tar.gz"
+#SOURCEDIR ?= "llvm-llvm-project-${@'${RELEASE}'[0:7]}"
+#SRC_URI[sha256sum] = "aed4f66cd72867b36cc55a0588436933c3d58d3e61ca782b6bf57605d3fdcb09"
+
+# GA Release
+RELEASE ?= "${PV}"
+BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz"
+SOURCEDIR ?= "llvm-project-${PV}.src"
+SRC_URI[sha256sum] = "f0a4a240aabc9b056142d14d5478bb6d962aeac549cbd75b809f5499240a8b38"
+
+SRCREV_spirv = "6dd8f2a1681a27f16c53d932d2765920f312aeb2"
+SRCREV_spirvheaders = "09913f088a1197aba4aefd300a876b2ebbaa3391"
+SRCREV_FORMAT .= "spirv_spirvheaders"
+# pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
+SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
+SPIRVURI = " \
+    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;name=spirv;branch=${SPIRV_BRANCH};destsuffix=llvm-project-${PV}.src/llvm/projects/SPIRV-LLVM-Translator \
+    git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;destsuffix=llvm-project-${PV}.src/llvm/projects/SPIRV-LLVM-Translator/SPIRV-Headers;name=spirvheaders;branch=main \
+    file://spirv-internal-build.patch \
+    file://spirv-shared-library.patch \
+"
+
+SRC_URI = "\
+    ${BASEURI} \
+    ${SPIRVURI} \
+    file://0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch \
+    file://0002-compiler-rt-support-a-new-embedded-linux-target.patch \
+    file://0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch \
+    file://0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch \
+    file://0005-llvm-allow-env-override-of-exe-and-libdir-path.patch \
+    file://0006-clang-driver-Check-sysroot-for-ldso-path.patch \
+    file://0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch \
+    file://0008-clang-Prepend-trailing-to-sysroot.patch \
+    file://0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch \
+    file://0010-clang-Define-releative-gcc-installation-dir.patch \
+    file://0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch \
+    file://0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch \
+    file://0013-Check-for-atomic-double-intrinsics.patch \
+    file://0014-cmake-Fix-configure-for-packages-using-find_package.patch \
+    file://0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch \
+    file://0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch \
+    file://0017-clang-Use-python3-in-python-scripts.patch \
+    file://0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch \
+    file://0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch \ 
+    file://0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch \
+    file://0021-libunwind-Added-unw_backtrace-method.patch \
+    file://0022-lldb-Link-with-libatomic-on-x86.patch \
+    file://0023-compiler-rt-Enable-__int128-for-ppc32.patch \
+    file://0024-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch \
+    file://0025-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch \
+    file://0026-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch \
+    file://0027-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch \
+    file://0028-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch \
+    file://0029-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch \
+    file://0030-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch \
+    file://0031-compiler-rt-Do-not-pass-target-to-clang-compiler.patch \
+    file://0032-Fix-build-on-ppc64-musl.patch \
+    file://0033-clangd-Add-a-build-option-to-disable-building-dexp.patch \
+    file://0034-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
+    file://0035-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch \
+    file://0036-openmp-Do-not-emit-date-and-time-into-generate-files.patch \
+"
+# Fallback to no-PIE if not set
+GCCPIE ??= ""
+
+S = "${TMPDIR}/work-shared/llvm-project-source-${PV}-${PR}/${SOURCEDIR}"
+B ?= "${WORKDIR}/llvm-project-source-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
+
+# We need to ensure that for the shared work directory, the do_patch signatures match
+# The real WORKDIR location isn't a dependency for the shared workdir.
+src_patches[vardepsexclude] = "WORKDIR"
+should_apply[vardepsexclude] += "PN"
+
+BPN = "clang"
diff --git a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
new file mode 100644
index 0000000000000000000000000000000000000000..b3c4bfcffdc64ec7ab7f4361bba85fa15d2fc3ba
--- /dev/null
+++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
@@ -0,0 +1,131 @@
+# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "LLVM based C/C++ compiler Sanitizers Runtime"
+DESCRIPTION = "Runtime libraries that are required \
+				to run the code with sanitizer instrumentation"
+HOMEPAGE = "http://compiler-rt.llvm.org/"
+SECTION = "base"
+
+require common-clang.inc
+require common-source.inc
+
+BPN = "compiler-rt-sanitizers"
+
+inherit cmake pkgconfig python3native
+
+
+LIC_FILES_CHKSUM = "file://compiler-rt/LICENSE.TXT;md5=d846d1d65baf322d4c485d6ee54e877a"
+
+TUNE_CCARGS:remove = "-no-integrated-as"
+
+CC = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+CXX = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+
+DEPENDS += "ninja-native virtual/crypt compiler-rt"
+DEPENDS:append:class-native = " clang-native libxcrypt-native libcxx-native"
+DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-native clang-crosssdk-${SDK_SYS} nativesdk-libxcrypt nativesdk-gcc-runtime"
+DEPENDS:append:class-target = " virtual/cross-c++ clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc gcc-runtime"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[crt] = "-DCOMPILER_RT_BUILD_CRT:BOOL=ON,-DCOMPILER_RT_BUILD_CRT:BOOL=OFF"
+PACKAGECONFIG[static-libcxx] = "-DSANITIZER_USE_STATIC_CXX_ABI=ON -DSANITIZER_USE_STATIC_LLVM_UNWINDER=ON -DCOMPILER_RT_ENABLE_STATIC_UNWINDER=ON,,"
+# Context Profiling
+PACKAGECONFIG[ctx-profile] = "-DCOMPILER_RT_BUILD_CTX_PROFILE=ON,-DCOMPILER_RT_BUILD_CTX_PROFILE=OFF"
+
+CXXFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
+
+OECMAKE_TARGET_COMPILE = "compiler-rt"
+OECMAKE_TARGET_INSTALL = "install-compiler-rt install-compiler-rt-headers"
+OECMAKE_SOURCEPATH = "${S}/llvm"
+EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
+                  -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
+                  -DCOMPILER_RT_STANDALONE_BUILD=ON \
+                  -DCOMPILER_RT_USE_BUILTINS_LIBRARY=ON \
+                  -DCOMPILER_RT_BUILD_BUILTINS=OFF \
+                  -DCOMPILER_RT_INCLUDE_TESTS=OFF \
+                  -DSANITIZER_CXX_ABI_LIBNAME=${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "libc++", "libstdc++", d)} \
+                  -DCOMPILER_RT_BUILD_XRAY=ON \
+                  -DCOMPILER_RT_BUILD_SANITIZERS=ON \
+                  -DCOMPILER_RT_BUILD_LIBFUZZER=ON \
+                  -DCOMPILER_RT_BUILD_PROFILE=ON \
+                  -DCOMPILER_RT_BUILD_MEMPROF=ON \
+                  -DLLVM_ENABLE_RUNTIMES='compiler-rt' \
+                  -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
+                  -DLLVM_APPEND_VC_REV=OFF \
+                  -S ${S}/runtimes \
+"
+
+EXTRA_OECMAKE:append:class-native = "\
+               -DCOMPILER_RT_USE_BUILTINS_LIBRARY=OFF \
+               -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH}${HOST_VENDOR}-${HOST_OS} \
+               -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
+               -DCOMPILER_RT_DEFAULT_TARGET_ARCH=${HOST_ARCH} \
+"
+
+EXTRA_OECMAKE:append:class-target = "\
+               -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib \
+               -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
+               -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
+               -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH}${HOST_VENDOR}-${HOST_OS} \
+               -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
+               -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
+"
+
+EXTRA_OECMAKE:append:class-nativesdk = "\
+               -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib \
+               -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
+               -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
+               -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
+               -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
+               -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH}${HOST_VENDOR}-${HOST_OS} \
+               -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
+"
+
+EXTRA_OECMAKE:append:libc-musl = " -DLIBCXX_HAS_MUSL_LIBC=ON "
+EXTRA_OECMAKE:append:powerpc = " -DCOMPILER_RT_DEFAULT_TARGET_ARCH=powerpc "
+
+do_install:append () {
+    mkdir -p ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib
+    mv ${D}${nonarch_libdir}/linux ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib
+    # Already shipped with compile-rt Orc support
+    rm -rf ${D}${nonarch_libdir}/clang/${MAJOR_VER}/lib/linux/liborc_rt-*.a
+    rm -rf ${D}${nonarch_libdir}/clang/${MAJOR_VER}/include/orc/
+}
+
+FILES_SOLIBSDEV = ""
+FILES:${PN} += "${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER} \
+				${nonarch_libdir}/clang/${MAJOR_VER}/lib/linux/lib*${SOLIBSDEV} \
+                ${nonarch_libdir}/clang/${MAJOR_VER}/*.txt \
+                ${nonarch_libdir}/clang/${MAJOR_VER}/share/*.txt"
+FILES:${PN}-staticdev += "${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/*.a"
+FILES:${PN}-dev += "${datadir} ${nonarch_libdir}/clang/${MAJOR_VER}/lib/linux/*.syms \
+                    ${nonarch_libdir}/clang/${MAJOR_VER}/include \
+                    ${nonarch_libdir}/clang/${MAJOR_VER}/lib/linux/clang_rt.crt*.o \
+                    ${nonarch_libdir}/clang/${MAJOR_VER}/lib/linux/libclang_rt.asan-preinit*.a"
+INSANE_SKIP:${PN} = "dev-so libdir"
+INSANE_SKIP:${PN}-dbg = "libdir"
+
+#PROVIDES:append:class-target = "\
+#        virtual/${MLPREFIX}compilerlibs \
+#        libgcc \
+#        libgcc-initial \
+#        libgcc-dev \
+#        libgcc-initial-dev \
+#        "
+#
+
+RDEPENDS:${PN}-dev += "${PN}-staticdev"
+
+BBCLASSEXTEND = "native nativesdk"
+
+ALLOW_EMPTY:${PN} = "1"
+ALLOW_EMPTY:${PN}-dev = "1"
+
+SYSROOT_DIRS:append:class-target = " ${nonarch_libdir}"
+
+# riscv and x86_64 Sanitizers work on musl too
+COMPATIBLE_HOST:libc-musl:x86-64 = "(.*)"
+COMPATIBLE_HOST:libc-musl:riscv64 = "(.*)"
+COMPATIBLE_HOST:libc-musl:riscv32 = "(.*)"
+COMPATIBLE_HOST:libc-musl = "null"
diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
new file mode 100644
index 0000000000000000000000000000000000000000..93928541273462127dd28cf1ed5807da347900fa
--- /dev/null
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -0,0 +1,121 @@
+# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "LLVM based C/C++ compiler Runtime"
+DESCRIPTIOM = "Simple builtin library that provides an \
+				implementation of the low-level target-specific \
+				hooks required by code generation and other runtime \
+				components"
+HOMEPAGE = "http://compiler-rt.llvm.org/"
+SECTION = "base"
+
+require common-clang.inc
+require common-source.inc
+
+BPN = "compiler-rt"
+
+inherit cmake pkgconfig python3native
+
+
+LIC_FILES_CHKSUM = "file://compiler-rt/LICENSE.TXT;md5=d846d1d65baf322d4c485d6ee54e877a"
+
+LIBCPLUSPLUS = ""
+COMPILER_RT = ""
+
+TUNE_CCARGS:remove = "-no-integrated-as"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+DEPENDS += "ninja-native libgcc"
+DEPENDS:append:class-target = " virtual/cross-c++ clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc gcc-runtime"
+DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-native clang-crosssdk-${SDK_SYS} nativesdk-gcc-runtime"
+DEPENDS:append:class-native = " clang-native"
+
+# Trick clang.bbclass into not creating circular dependencies
+UNWINDLIB:class-nativesdk:toolchain-clang = "--unwindlib=libgcc"
+COMPILER_RT:class-nativesdk:toolchain-clang = "-rtlib=libgcc --unwindlib=libgcc"
+LIBCPLUSPLUS:class-nativesdk:toolchain-clang = "-stdlib=libstdc++"
+UNWINDLIB:class-native:toolchain-clang = "--unwindlib=libgcc"
+COMPILER_RT:class-native:toolchain-clang = "-rtlib=libgcc --unwindlib=libgcc"
+LIBCPLUSPLUS:class-native:toolchain-clang = "-stdlib=libstdc++"
+UNWINDLIB:class-target:toolchain-clang = "--unwindlib=libgcc"
+COMPILER_RT:class-target:toolchain-clang = "-rtlib=libgcc --unwindlib=libgcc"
+LIBCPLUSPLUS:class-target:toolchain-clang = "-stdlib=libstdc++"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[crt] = "-DCOMPILER_RT_BUILD_CRT:BOOL=ON,-DCOMPILER_RT_BUILD_CRT:BOOL=OFF"
+PACKAGECONFIG[profile] = "-DCOMPILER_RT_BUILD_PROFILE=ON,-DCOMPILER_RT_BUILD_PROFILE=OFF"
+# Context Profiling, might need to enable 'profile' too
+PACKAGECONFIG[ctx-profile] = "-DCOMPILER_RT_BUILD_CTX_PROFILE=ON,-DCOMPILER_RT_BUILD_CTX_PROFILE=OFF"
+
+HF = ""
+HF:class-target = "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', 'hf', '', d)}"
+HF[vardepvalue] = "${HF}"
+
+OECMAKE_TARGET_COMPILE = "compiler-rt"
+OECMAKE_TARGET_INSTALL = "install-compiler-rt install-compiler-rt-headers"
+OECMAKE_SOURCEPATH = "${S}/llvm"
+EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
+                  -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
+                  -DCOMPILER_RT_STANDALONE_BUILD=ON \
+                  -DCOMPILER_RT_INCLUDE_TESTS=OFF \
+                  -DCOMPILER_RT_BUILD_XRAY=OFF \
+                  -DCOMPILER_RT_BUILD_SANITIZERS=OFF \
+                  -DCOMPILER_RT_BUILD_MEMPROF=OFF \
+                  -DCOMPILER_RT_BUILD_LIBFUZZER=OFF \
+                  -DLLVM_ENABLE_RUNTIMES='compiler-rt' \
+                  -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
+                  -DLLVM_APPEND_VC_REV=OFF \
+                  -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
+                  -S ${S}/runtimes \
+"
+
+EXTRA_OECMAKE:append:class-native = "\
+                  -DCOMPILER_RT_DEFAULT_TARGET_ARCH=${HOST_ARCH} \
+                  -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH} \
+"
+
+EXTRA_OECMAKE:append:class-target = "\
+               -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib \
+               -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
+               -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
+               -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}${HF} \
+               -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
+"
+
+EXTRA_OECMAKE:append:class-nativesdk = "\
+               -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib \
+               -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
+               -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
+               -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
+               -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
+               -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}${HF} \
+"
+EXTRA_OECMAKE:append:powerpc = " -DCOMPILER_RT_DEFAULT_TARGET_ARCH=powerpc "
+
+do_install:append () {
+    mkdir -p ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib
+    mv ${D}${nonarch_libdir}/linux ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib
+}
+
+FILES_SOLIBSDEV = ""
+
+FILES:${PN} += "${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/lib*${SOLIBSDEV} \
+                ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/*.txt \
+                ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/share/*.txt"
+FILES:${PN}-staticdev += "${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/*.a"
+FILES:${PN}-dev += "${datadir} ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/*.syms \
+                    ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/include \
+                    ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/clang_rt.crt*.o \
+                    ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/libclang_rt.asan-preinit*.a"
+
+INSANE_SKIP:${PN} = "dev-so libdir"
+INSANE_SKIP:${PN}-dbg = "libdir"
+
+RDEPENDS:${PN}-dev += "${PN}-staticdev"
+
+BBCLASSEXTEND = "native nativesdk"
+
+ALLOW_EMPTY:${PN} = "1"
+
+SYSROOT_DIRS:append:class-target = " ${nonarch_libdir}"
diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
new file mode 100644
index 0000000000000000000000000000000000000000..d2655d9da947a2e8c0eca451593cb0c0014a4108
--- /dev/null
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -0,0 +1,115 @@
+# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "libc++ is a new implementation of the C++ standard library, targeting C++11 and above"
+HOMEPAGE = "http://libcxx.llvm.org/"
+SECTION = "base"
+
+require common-clang.inc
+require common-source.inc
+
+inherit cmake python3native
+
+BPN = "libcxx"
+
+PACKAGECONFIG ??= "compiler-rt exceptions ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "unwind unwind-shared", "", d)}"
+PACKAGECONFIG:append:armv5 = " no-atomics"
+PACKAGECONFIG:remove:class-native = "compiler-rt"
+PACKAGECONFIG[unwind] = "-DLIBCXXABI_USE_LLVM_UNWINDER=ON -DLIBCXXABI_ENABLE_STATIC_UNWINDER=ON,-DLIBCXXABI_USE_LLVM_UNWINDER=OFF,,"
+PACKAGECONFIG[exceptions] = "-DLIBCXXABI_ENABLE_EXCEPTIONS=ON -DLIBCXX_ENABLE_EXCEPTIONS=ON,-DLIBCXXABI_ENABLE_EXCEPTIONS=OFF -DLIBCXX_ENABLE_EXCEPTIONS=OFF -DCMAKE_REQUIRED_FLAGS='-fno-exceptions',"
+PACKAGECONFIG[no-atomics] = "-D_LIBCXXABI_HAS_ATOMIC_BUILTINS=OFF -DCMAKE_SHARED_LINKER_FLAGS='-latomic',,"
+PACKAGECONFIG[compiler-rt] = "-DLIBCXX_USE_COMPILER_RT=ON -DLIBCXXABI_USE_COMPILER_RT=ON -DLIBUNWIND_USE_COMPILER_RT=ON,,compiler-rt"
+PACKAGECONFIG[unwind-shared] = "-DLIBUNWIND_ENABLE_SHARED=ON,-DLIBUNWIND_ENABLE_SHARED=OFF,,"
+
+DEPENDS += "ninja-native"
+DEPENDS:append:class-target = " virtual/cross-c++ clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc virtual/${MLPREFIX}compilerlibs"
+DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-crosssdk-${SDK_SYS} nativesdk-compiler-rt"
+DEPENDS:append:class-native = " clang-native compiler-rt-native"
+
+COMPILER_RT ?= "${@bb.utils.contains("PACKAGECONFIG", "compiler-rt", "-rtlib=compiler-rt", "-rtlib=libgcc", d)}"
+UNWINDLIB ?= "${@bb.utils.contains("PACKAGECONFIG", "unwind", "-unwindlib=none", "-unwindlib=libgcc", d)}"
+LIBCPLUSPLUS ?= "-stdlib=libstdc++"
+# Trick clang.bbclass into not creating circular dependencies
+UNWINDLIB:class-nativesdk = "-unwindlib=libgcc"
+LIBCPLUSPLUS:class-nativesdk = "-stdlib=libstdc++"
+UNWINDLIB:class-native = "-unwindlib=libgcc"
+LIBCPLUSPLUS:class-native = "-stdlib=libstdc++"
+
+LDFLAGS:append = " ${UNWINDLIB}"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+LIC_FILES_CHKSUM = "file://libcxx/LICENSE.TXT;md5=55d89dd7eec8d3b4204b680e27da3953 \
+                    file://libcxxabi/LICENSE.TXT;md5=7b9334635b542c56868400a46b272b1e \
+                    file://libunwind/LICENSE.TXT;md5=f66970035d12f196030658b11725e1a1 \
+"
+
+OECMAKE_TARGET_COMPILE = "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "unwind", "", d)} cxxabi cxx"
+OECMAKE_TARGET_INSTALL = "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "install-unwind", "", d)} install-cxxabi install-cxx"
+
+CC = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+CXX = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+OECMAKE_SOURCEPATH = "${S}/llvm"
+EXTRA_OECMAKE += "\
+                  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
+                  -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
+                  -DCMAKE_CROSSCOMPILING=ON \
+                  -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
+                  -DLLVM_ENABLE_RTTI=ON \
+                  -DLIBUNWIND_ENABLE_CROSS_UNWINDING=ON \
+                  -DLIBCXX_ENABLE_STATIC_ABI_LIBRARY=ON \
+                  -DLIBCXXABI_INCLUDE_TESTS=OFF \
+                  -DLIBCXXABI_ENABLE_SHARED=ON \
+                  -DLIBCXXABI_LIBCXX_INCLUDES=${S}/libcxx/include \
+                  -DLIBCXX_CXX_ABI=libcxxabi \
+                  -DLIBCXX_CXX_ABI_INCLUDE_PATHS=${S}/libcxxabi/include \
+                  -DLIBCXX_CXX_ABI_LIBRARY_PATH=${B}/lib${LLVM_LIBDIR_SUFFIX} \
+                  -S ${S}/runtimes \
+                  -DLLVM_ENABLE_RUNTIMES='libcxx;libcxxabi;libunwind' \
+                  -DLLVM_RUNTIME_TARGETS=${HOST_SYS} \
+                  -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
+                  -DLLVM_APPEND_VC_REV=OFF \
+                  -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
+"
+
+EXTRA_OECMAKE:append:class-target = " \
+                  -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${AR} \
+                  -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${NM} \
+                  -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${RANLIB} \
+                  -DLLVM_DEFAULT_TARGET_TRIPLE=${HOST_SYS} \
+                  -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
+"
+
+EXTRA_OECMAKE:append:class-nativesdk = " \
+                  -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${AR} \
+                  -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${NM} \
+                  -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${RANLIB} \
+                  -DLLVM_DEFAULT_TARGET_TRIPLE=${HOST_SYS} \
+"
+
+EXTRA_OECMAKE:append:libc-musl = " -DLIBCXX_HAS_MUSL_LIBC=ON "
+
+CXXFLAGS:append:armv5 = " -mfpu=vfp2"
+
+ALLOW_EMPTY:${PN} = "1"
+
+PROVIDES:append:runtime-llvm = " libunwind"
+
+do_install:append() {
+    if ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "true", "false", d)}
+    then
+        for f in libunwind.h __libunwind_config.h unwind.h unwind_itanium.h unwind_arm_ehabi.h
+        do
+            install -Dm 0644 ${S}/libunwind/include/$f ${D}${includedir}/$f
+        done
+        install -d ${D}${libdir}/pkgconfig
+        sed -e 's,@LIBDIR@,${libdir},g;s,@VERSION@,${PV},g' ${S}/libunwind/libunwind.pc.in > ${D}${libdir}/pkgconfig/libunwind.pc
+    fi
+}
+
+PACKAGES:append:runtime-llvm = " libunwind"
+FILES:libunwind:runtime-llvm = "${libdir}/libunwind.so.*"
+# Package library module manifest path
+FILES:${PN}-dev += "${datadir}/libc++/v1/ ${libdir}/libc++.modules.json"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/clang/llvm-project-source.bb b/meta/recipes-devtools/clang/llvm-project-source.bb
new file mode 100644
index 0000000000000000000000000000000000000000..ba945fb591c8a2c75437baf4aaf597c111ee5528
--- /dev/null
+++ b/meta/recipes-devtools/clang/llvm-project-source.bb
@@ -0,0 +1,12 @@
+# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "This is the canonical git mirror of the LLVM subversion repository."
+HOMEPAGE = "https://github.com/llvm/llvm-project"
+
+require llvm-project-source.inc
+require common-clang.inc
+
+BPN = "llvm-project-source"
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/recipes-devtools/clang/llvm-project-source.inc
new file mode 100644
index 0000000000000000000000000000000000000000..0820dd349278f30c08ed3e5a16d3a8c9b1d7c6db
--- /dev/null
+++ b/meta/recipes-devtools/clang/llvm-project-source.inc
@@ -0,0 +1,99 @@
+deltask do_configure
+deltask do_compile
+deltask do_install
+deltask do_populate_sysroot
+deltask do_populate_lic
+RM_WORK_EXCLUDE += "${PN}"
+
+inherit nopackages
+
+PN = "llvm-project-source-${PV}"
+WORKDIR = "${TMPDIR}/work-shared/llvm-project-source-${PV}-${PR}"
+SSTATE_SWSPEC = "sstate:llvm-project-source::${PV}:${PR}::${SSTATE_VERSION}:"
+
+STAMP = "${STAMPS_DIR}/work-shared/llvm-project-source-${PV}-${PR}"
+STAMPCLEAN = "${STAMPS_DIR}/work-shared/llvm-project-source-${PV}-*"
+
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS = ""
+PACKAGES = ""
+TARGET_ARCH = "allarch"
+TARGET_AS_ARCH = "none"
+TARGET_CC_ARCH = "none"
+TARGET_LD_ARCH = "none"
+TARGET_OS = "linux"
+baselib = "lib"
+PACKAGE_ARCH = "all"
+
+B = "${WORKDIR}/build"
+
+# space separated list of additional distro vendor values we want to support e.g.
+# "yoe webos" or "-yoe -webos" '-' is optional
+CLANG_EXTRA_OE_VENDORS ?= "${TARGET_VENDOR} ${SDK_VENDOR}"
+# Extra OE DISTRO that want to support as build host. space separated list of additional distro.
+# ":" separated the ID in "/etc/os-release" and the triple for finding gcc on this OE DISTRO.
+# eg: "poky:poky wrlinux:wrs"
+CLANG_EXTRA_OE_DISTRO ?= "poky:poky"
+# Match with MULTILIB_GLOBAL_VARIANTS
+ML_VARIANTS = "lib32 lib64 libx32"
+
+python do_preconfigure() {
+    import subprocess
+    case = ""
+    triple = ""
+    vendors = d.getVar('CLANG_EXTRA_OE_VENDORS')
+    multilib_variants = (d.getVar("ML_VARIANTS") or "").split()
+    vendors_to_add = []
+    for vendor in vendors.split():
+        # convert -yoe into yoe
+        vendor = vendor.lstrip('-')
+        # generate possible multilib vendor names for yoe
+        # such as yoemllib32
+        vendors_to_add.extend([vendor + 'ml' + variant for variant in multilib_variants])
+        # skip oe since already part of the cpp file
+        if vendor != "oe":
+            vendors_to_add.append(vendor)
+
+    for vendor_to_add in vendors_to_add:
+        case += '\\n    .Case("' + vendor_to_add + '", Triple::OpenEmbedded)'
+        triple += ' "x86_64-' + vendor_to_add + '-linux",'
+
+    bb.note("Adding support following TARGET_VENDOR values")
+    bb.note(str(vendors_to_add))
+    bb.note("in llvm/lib/TargetParser/Triple.cpp and ${S}/clang/lib/Driver/ToolChains/Gnu.cpp")
+    cmd = d.expand("sed -i 's#//CLANG_EXTRA_OE_VENDORS_TRIPLES#%s#g' ${S}/clang/lib/Driver/ToolChains/Gnu.cpp" % (triple))
+    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+    cmd = d.expand("sed -i 's#//CLANG_EXTRA_OE_VENDORS_CASES#%s#g' -i ${S}/llvm/lib/TargetParser/Triple.cpp" % (case))
+    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+
+
+    case = ""
+    triple = ""
+    name = ""
+    check = ""
+    oe_names = ""
+    distros = d.getVar('CLANG_EXTRA_OE_DISTRO')
+    for distro in distros.split():
+        distro_id = distro.split(":")[0].replace('-','_')
+        distro_triple = distro.split(":")[1]
+        case += '\\n    .Case("' + distro_id + '", Distro::' + distro_id.upper() + ')'
+        triple += '\\n   if (Distro.Is' + distro_id.upper() + '())\\n     return "x86_64-' + distro_triple + '-linux",'
+        name += '\\n    '+ distro_id.upper() + ','
+        check += '\\nbool Is' + distro_id.upper() + '() const { return DistroVal == ' + distro_id.upper() + '; }'
+        oe_names +=  distro_id.upper() + ' ||'
+
+    check += '\\nbool IsOpenEmbedded() const { return DistroVal == ' + oe_names[0:-3] + '; }'
+
+    cmd = d.expand("sed -i 's#//CLANG_EXTRA_OE_DISTRO_NAME#%s#g' ${S}/clang/include/clang/Driver/Distro.h" % (name))
+    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+    cmd = d.expand("sed -i 's#//CLANG_EXTRA_OE_DISTRO_CHECK#%s#g' ${S}/clang/include/clang/Driver/Distro.h" % (check))
+    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+    cmd = d.expand("sed -i 's#//CLANG_EXTRA_OE_DISTRO_TRIPLES#%s#g' ${S}/clang/lib/Driver/ToolChains/Linux.cpp" % (triple))
+    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+    cmd = d.expand("sed -i 's#//CLANG_EXTRA_OE_DISTRO_CASES#%s#g' -i ${S}/clang/lib/Driver/Distro.cpp" % (case))
+    subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+}
+
+do_patch[vardepsexclude] += "MULTILIBS MULTILIB_VARIANTS"
+addtask do_preconfigure after do_patch
+do_create_spdx[depends] += "${PN}:do_preconfigure"
diff --git a/meta/recipes-devtools/clang/nativesdk-clang-glue.bb b/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
new file mode 100644
index 0000000000000000000000000000000000000000..8e5622f6c18853e97441ab66c693e9255d68ebfa
--- /dev/null
+++ b/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
@@ -0,0 +1,36 @@
+# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "SDK Cross compiler wrappers for LLVM based C/C++ compiler"
+HOMEPAGE = "http://clang.llvm.org/"
+LICENSE = "Apache-2.0-with-LLVM-exception"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=0bcd48c3bdfef0c9d9fd17726e4b7dab"
+SECTION = "devel"
+
+inherit_defer nativesdk
+DEPENDS += "nativesdk-clang"
+
+do_install() {
+    install -d ${D}${prefix_nativesdk}
+    cd ${D}${prefix_nativesdk}
+    ln -s ..${libdir} .
+    ln -s ..${includedir} .
+    cd ..
+    ln -s .${base_libdir} .
+}
+
+sysroot_stage_all () {
+	sysroot_stage_dir ${D} ${SYSROOT_DESTDIR}
+}
+
+FILES:${PN} += "${prefix_nativesdk} ${base_libdir_nativesdk}"
+FILES:${PN}-dbg = ""
+
+deltask do_configure
+deltask do_compile
+deltask do_patch
+deltask do_fetch
+deltask do_unpack
+deltask do_create_spdx
+deltask do_create_package_spdx
+deltask do_create_runtime_spdx
diff --git a/meta/recipes-devtools/clang/openmp_git.bb b/meta/recipes-devtools/clang/openmp_git.bb
new file mode 100644
index 0000000000000000000000000000000000000000..cc0c7fbcd4c39562153342d76d1f73bc2273aecd
--- /dev/null
+++ b/meta/recipes-devtools/clang/openmp_git.bb
@@ -0,0 +1,65 @@
+# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "LLVM OpenMP compiler Runtime"
+HOMEPAGE = "https://openmp.llvm.org/"
+SECTION = "libs"
+
+require common-clang.inc
+require common-source.inc
+
+BPN = "openmp"
+
+LIC_FILES_CHKSUM = "file://openmp/LICENSE.TXT;md5=d75288d1ce0450b28b8d58a284c09c79"
+
+inherit cmake pkgconfig perlnative python3native python3targetconfig
+
+DEPENDS += "elfutils libffi clang"
+
+EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
+                  -DLLVM_APPEND_VC_REV=OFF \
+                  -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
+                  -DOPENMP_LIBDIR_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
+                  -DOPENMP_STANDALONE_BUILD=ON \
+                  -DCLANG_TOOL=${STAGING_BINDIR_NATIVE}/clang \
+                  -DLINK_TOOL=${STAGING_BINDIR_NATIVE}/llvm-link \
+                  -DOPT_TOOL=${STAGING_BINDIR_NATIVE}/opt \
+                  -DOPENMP_LLVM_LIT_EXECUTABLE=${STAGING_BINDIR_NATIVE}/llvm-lit \
+                  -DEXTRACT_TOOL=${STAGING_BINDIR_NATIVE}/llvm-extract \
+                  -DPACKAGER_TOOL=${STAGING_BINDIR_NATIVE}/clang-offload-packager \
+                  -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
+                  "
+
+OECMAKE_SOURCEPATH = "${S}/openmp"
+
+PACKAGECONFIG ?= "ompt-tools offloading-plugin"
+
+PACKAGECONFIG:remove:arm = "ompt-tools offloading-plugin"
+PACKAGECONFIG:remove:powerpc = "ompt-tools offloading-plugin"
+
+PACKAGECONFIG:append:mipsarcho32 = " no-atomics"
+
+PACKAGECONFIG[ompt-tools] = "-DOPENMP_ENABLE_OMPT_TOOLS=ON,-DOPENMP_ENABLE_OMPT_TOOLS=OFF,"
+PACKAGECONFIG[aliases] = "-DLIBOMP_INSTALL_ALIASES=ON,-DLIBOMP_INSTALL_ALIASES=OFF,"
+PACKAGECONFIG[offloading-plugin] = ",,elfutils libffi,libelf libffi"
+PACKAGECONFIG[no-atomics] = "-DLIBOMP_HAVE_BUILTIN_ATOMIC=OFF -DLIBOMP_LIBFLAGS='-latomic',,"
+
+PACKAGES += "${PN}-libomptarget ${PN}-gdb-plugin"
+FILES_SOLIBSDEV = ""
+FILES:${PN} += "${libdir}/lib*${SOLIBSDEV}"
+FILES:${PN}-libomptarget = "${libdir}/libomptarget-*.bc"
+FILES:${PN}-gdb-plugin = "${datadir}/gdb/python/ompd"
+
+RDEPENDS:${PN}-gdb-plugin += "python3-core"
+
+INSANE_SKIP:${PN} = "dev-so"
+# Currently the static libraries contain buildpaths
+INSANE_SKIP:${PN}-staticdev += "buildpaths"
+
+COMPATIBLE_HOST:mips64 = "null"
+COMPATIBLE_HOST:riscv32 = "null"
+COMPATIBLE_HOST:powerpc = "null"
+
+BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2022-26345] = "cpe-incorrect: specific to the Intel distribution before 2022.1"
diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
deleted file mode 100644
index f1ab0054640c56f78b13ec2fdd1870fc207472be..0000000000000000000000000000000000000000
--- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 3eb1eefed6fc654d19ab97bbc748454c22a29009 Mon Sep 17 00:00:00 2001
-From: Martin Kelly <mkelly@xevo.com>
-Date: Fri, 19 May 2017 00:22:57 -0700
-Subject: [PATCH] llvm: allow env override of exe and libdir path
-
-When using a native llvm-config from inside a sysroot, we need llvm-config to
-return the libraries, include directories, etc. from inside the sysroot rather
-than from the native sysroot. Thus provide an env override for calling
-llvm-config from a target sysroot.
-
-Upstream-Status: Inappropriate [OE-specific]
-
-Signed-off-by: Martin Kelly <mkelly@xevo.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
-index d5b76b1bb..6c28c34bc 100644
---- a/llvm/tools/llvm-config/llvm-config.cpp
-+++ b/llvm/tools/llvm-config/llvm-config.cpp
-@@ -246,6 +246,13 @@ Typical components:\n\
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
diff --git a/meta/recipes-devtools/llvm/llvm/llvm-config b/meta/recipes-devtools/llvm/llvm/llvm-config
deleted file mode 100644
index 6cf3e7578fa96f2893f73077bece4db45f29547c..0000000000000000000000000000000000000000
--- a/meta/recipes-devtools/llvm/llvm/llvm-config
+++ /dev/null
@@ -1,54 +0,0 @@
-#!/bin/bash
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-# Wrap llvm-config since the native llvm-config will remap some values correctly
-# if placed in the target sysroot but for flags, it would provide the native ones.
-# Provide ours from the environment instead.
-
-NEXT_LLVM_CONFIG="$(which -a llvm-config | sed -n 2p)"
-if [[ $# == 0 ]]; then
-  exec "$NEXT_LLVM_CONFIG"
-fi
-
-remain=""
-output=""
-for arg in "$@"; do
-  case "$arg" in
-    --cppflags)
-      output="${output} ${CPPFLAGS}"
-      ;;
-    --cflags)
-      output="${output} ${CFLAGS}"
-      ;;
-    --cxxflags)
-      output="${output} ${CXXFLAGS}"
-      ;;
-    --ldflags)
-      output="${output} ${LDFLAGS}"
-      ;;
-    --shared-mode)
-      output="${output} shared"
-      ;;
-    --libs)
-      output="${output} -lLLVM"
-      ;;
-    --libdir)
-      output="${output} ${libdir}"
-      ;;
-    --link-shared)
-      break
-      ;;
-    *)
-      remain="${remain} ${arg}"
-      ;;
-  esac
-done
-
-if [ "${remain}" != "" ]; then
-      output="${output} "$("$NEXT_LLVM_CONFIG" ${remain})
-fi
-
-echo "${output}"
diff --git a/meta/recipes-devtools/llvm/llvm_20.1.2.bb b/meta/recipes-devtools/llvm/llvm_20.1.2.bb
deleted file mode 100644
index 98855fa4c14d1f5eef6dd946a64927d778b99e3d..0000000000000000000000000000000000000000
--- a/meta/recipes-devtools/llvm/llvm_20.1.2.bb
+++ /dev/null
@@ -1,233 +0,0 @@
-# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-SUMMARY = "The LLVM Compiler Infrastructure"
-HOMEPAGE = "http://llvm.org"
-LICENSE = "Apache-2.0-with-LLVM-exception"
-SECTION = "devel"
-
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=8a15a0759ef07f2682d2ba4b893c9afe"
-
-DEPENDS = "libffi libxml2 zlib zstd libedit ninja-native llvm-native"
-
-RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
-
-inherit cmake pkgconfig
-# could be 'rcX' or 'git' or empty ( for release )
-VER_SUFFIX = ""
-
-PV .= "${VER_SUFFIX}"
-
-MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
-MAJ_MIN_VERSION = "${@oe.utils.trim_version("${PV}", 2)}"
-
-LLVM_RELEASE = "${PV}"
-
-SRCREV_spirv = "68edc9d3d10ff6ec6353803a1bc60a5c25e7b715"
-# pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
-SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
-
-SRC_URI_SPIRV = " \
-    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;name=spirv;branch=${SPIRV_BRANCH};destsuffix=llvm-project-${PV}.src/llvm/projects/SPIRV-LLVM-Translator \
-    file://spirv-internal-build.patch \
-"
-
-SRC_URI_SPIRV:append:class-native = " \
-    file://spirv-shared-library.patch \
-"
-
-SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz \
-           file://0007-llvm-allow-env-override-of-exe-path.patch \
-           file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
-           file://0014-cmake-Fix-configure-for-packages-using-find_package.patch \
-           ${@bb.utils.contains('PACKAGECONFIG', 'spirv-llvm-translator', '${SRC_URI_SPIRV}', '', d)} \
-           file://llvm-config \
-           "
-SRC_URI[sha256sum] = "f0a4a240aabc9b056142d14d5478bb6d962aeac549cbd75b809f5499240a8b38"
-UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
-UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
-
-SRC_URI:append:class-native = " file://0001-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch"
-
-S = "${WORKDIR}/llvm-project-${PV}.src"
-
-OECMAKE_SOURCEPATH = "${S}/llvm"
-
-LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
-
-PACKAGECONFIG ??= "libllvm libclc spirv-llvm-translator"
-# if optviewer OFF, force the modules to be not found or the ones on the host would be found
-PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=OFF -DPY_YAML_FOUND=OFF,python3-pygments python3-pyyaml,python3-pygments python3-pyyaml"
-PACKAGECONFIG[libllvm] = ""
-PACKAGECONFIG[libclc] = ""
-PACKAGECONFIG[spirv-llvm-translator] = "-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${STAGING_INCDIR}/.. ,,spirv-tools-native spirv-headers"
-
-#
-# Default to build all OE-Core supported target arches (user overridable).
-#
-LLVM_TARGETS ?= "AMDGPU;AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;NVPTX;SPIRV"
-
-ARM_INSTRUCTION_SET:armv5 = "arm"
-ARM_INSTRUCTION_SET:armv4t = "arm"
-
-LLVM_PROJECTS_CLANG = "${@bb.utils.contains_any('PACKAGECONFIG', 'libclc spirv-llvm-translator', 'clang', '', d)}"
-LLVM_PROJECTS_CLC = "${@bb.utils.contains('PACKAGECONFIG', 'libclc', ';libclc', '', d)}"
-LLVM_PROJECTS = "${LLVM_PROJECTS_CLANG}${LLVM_PROJECTS_CLC}"
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
-                  -DLLVM_VERSION_SUFFIX='${VER_SUFFIX}' \
-                  -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
-                  -DCMAKE_BUILD_TYPE=Release \
-                  -DLLVM_ENABLE_PROJECTS='${LLVM_PROJECTS}' \
-                 "
-
-EXTRA_OECMAKE:append:class-target = "\
-                  -DCMAKE_CROSSCOMPILING:BOOL=ON \
-                  -DLLVM_HOST_TRIPLE=${TARGET_SYS} \
-                  -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
-                  -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
-                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
-                 "
-
-EXTRA_OECMAKE:append:class-nativesdk = "\
-                  -DCMAKE_CROSSCOMPILING:BOOL=ON \
-                  -DLLVM_HOST_TRIPLE=${SDK_SYS} \
-                  -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
-                  -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
-                  -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
-                 "
-
-# patch out build host paths for reproducibility
-do_compile:prepend:class-target() {
-        sed -i -e "s,${WORKDIR},,g" ${B}/tools/llvm-config/BuildVariables.inc
-}
-
-do_compile:prepend:class-nativesdk() {
-        sed -i -e "s,${WORKDIR},,g" ${B}/tools/llvm-config/BuildVariables.inc
-}
-
-do_compile() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'libllvm', 'true', 'false', d)}; then
-	ninja -v ${PARALLEL_MAKE}
-    else
-	ninja -v ${PARALLEL_MAKE} llvm-config llvm-tblgen
-    fi
-}
-
-do_install() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'libllvm', 'true', 'false', d)}; then
-	DESTDIR=${D} ninja -v install
-
-        # llvm harcodes usr/lib as install path, so this corrects it to actual libdir
-        mv -T -n ${D}/${prefix}/lib ${D}/${libdir} || true
-
-        # Remove opt-viewer: https://llvm.org/docs/Remarks.html
-        rm -rf ${D}${datadir}/opt-viewer
-
-        # reproducibility
-        sed -i -e 's,${WORKDIR},,g' ${D}/${libdir}/cmake/llvm/LLVMConfig.cmake
-    fi
-
-    # Remove clang bits from target packages, we are not providing it for the system
-    if ${@bb.utils.contains_any('PACKAGECONFIG', 'libclc spirv-llvm-translator', 'true', 'false', d)} &&
-       [ "${CLASSOVERRIDE}" != "class-native" ] ; then
-        rm -f  ${D}${bindir}/clang*
-        rm -fr ${D}${libdir}/clang
-        rm -fr ${D}${datadir}/clang
-
-        rm -f  ${D}${bindir}/scan*
-        rm -fr ${D}${libdir}/libscanbuild
-        rm -fr ${D}${datadir}/scan-build
-        rm -fr ${D}${datadir}/scan-view
-
-        rm -fr ${D}${libdir}/libear
-    fi
-
-    # Try to clean up datadir if it is empty, but don't fail if there are
-    # libclc files there
-    rmdir ${D}${datadir} || true
-}
-
-do_install:append:class-native() {
-	install -D -m 0755 ${B}/bin/llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
-	install -D -m 0755 ${B}/bin/llvm-min-tblgen ${D}${bindir}/llvm-min-tblgen
-	install -D -m 0755 ${B}/bin/llvm-config ${D}${bindir}/llvm-config${PV}
-	ln -sf llvm-config${PV} ${D}${bindir}/llvm-config
-
-        if ${@bb.utils.contains('PACKAGECONFIG', 'libclc', 'true', 'false', d)} ; then
-            install -D -m 0755 ${B}/bin/prepare_builtins ${D}${bindir}/prepare_builtins
-        fi
-}
-
-SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess"
-SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " llvm_sysroot_preprocess"
-
-llvm_sysroot_preprocess() {
-	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-	install -m 0755 ${UNPACKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-	ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
-}
-
-PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto ${PN}-clc ${PN}-spirv"
-PROVIDES = "${@bb.utils.filter('PACKAGECONFIG', 'libclc spirv-llvm-translator', d)}"
-
-RRECOMMENDS:${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liboptremarks"
-RPROVIDES:${PN}-clc = "${@bb.utils.filter('PACKAGECONFIG', 'libclc', d)}"
-RPROVIDES:${PN}-spirv = "${@bb.utils.filter('PACKAGECONFIG', 'spirv-llvm-translator', d)}"
-
-FILES:${PN}-bugpointpasses = "\
-    ${libdir}/BugpointPasses.so \
-"
-
-FILES:${PN}-libllvm = "\
-    ${libdir}/libLLVM-${MAJOR_VERSION}.so \
-    ${libdir}/libLLVM.so.${MAJ_MIN_VERSION} \
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
-FILES:${PN}-clc += "${datadir}/clc"
-
-FILES:${PN}-spirv = " \
-    ${bindir}/llvm-spirv \
-    ${includedir}/LLVMSPIRVLib \
-    ${libdir}/pkgconfig/LLVMSPIRVLib.pc \
-    ${libdir}/libLLVMSPIRV* \
-"
-
-INSANE_SKIP:${PN}-libllvm += "dev-so"
-
-# SPIRV-LLVM-Translator provides only static libraries, they are included into
-# the llvm-spirv package.
-INSANE_SKIP:${PN}-spirv += "staticdev"
-
-BBCLASSEXTEND = "native nativesdk"

-- 
2.49.0


