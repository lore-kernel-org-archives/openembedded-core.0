Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00C8CCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 23:06:23 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1160.1762556780900261766
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 15:06:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VJg25Gmk;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3436d6aa66dso127746a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 15:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762556780; x=1763161580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JynNlKzpVBb389fKI7UOdDhwQEr3kuPDoM825xicWq4=;
        b=VJg25GmkraOLGXmJ/T+gQAO94P5Bs2MrDTI/o5Zq54on1KIomHoq98gExMKE8JpcvQ
         onKqpv+uwELUHxuXdlu/Va2jnCJIkToimRaIPX+Vesq9weRDDvgiUsZvpoOcddnDe9y5
         IXGfF5lENty+DzYJAGDi0KU7JoqXb5YZBSjCO1U1hG2+6CCJfC0dRejhM7R+FM3VnmXM
         PTxKlg+4njdvINkJnrPbv77mrR0jOwbym5MvJzmOJkRkHLrn2Q8Go6S3rvmRDTBF9/pQ
         WZlaTa6aYUSqx1sE2Le2rlSxarV7kRKUh37i+57ByUN/Xihm3teCjJsME5Y8dgBb6qJQ
         ikpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762556780; x=1763161580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JynNlKzpVBb389fKI7UOdDhwQEr3kuPDoM825xicWq4=;
        b=vWdptxi5PzF2n+tyRHQNmL5F1NHXrdLPxxifFnHS78tKJRC8+Q8SV0alJybxWWFRxU
         fWr6SvJ5Q8UD+isVhgJRfCZLRxFPXPZ0HmBIX9GsmsdLSzd1nQ3y4y9HYLU3xXjZyrKZ
         /L+3YOkP6Vx1/1SAolR5zc24jiU9zy2oAmk2O1Ztck8imQhIwf4HjFnx+T8ihDwYJT0d
         GnlglpC7SQ2eO7bfQevaJ2VGRw7DMA2dXR7ZXhiIqVFtdRk6Lj2d1rHjNBAWdB1qqhHF
         T0wHqnr8DgMlDslR6KqcphaG8d/ZPE9QcYyJaE1m73HU5/VGFgqbv1mtIhoiJODEpI3J
         aZlA==
X-Gm-Message-State: AOJu0YzQWEjSrllmwoimwD/OYhjojpn3kJci4yETVJoiyIlhxkUIk0P/
	uCBt1eklPV0MUvlQq3zv6GksZ/CFzxIPSCHWWXu0WKZo7Ffresn9QKzoKFuWMISuIqA=
X-Gm-Gg: ASbGncumFxLL2rBVuNQTJlzLJnZCv8lemZyGmU3a/K3tn+cIAbbeKz9zLWsOshl/7yV
	DDd0tqdqY5pQlD84wc/GpsMhL/a7hF4AieJW1/evRmChUhYHI+NQTgasfQerxAGwT03XatwFyfx
	B4tM9myrGdDKKp0BEK6ahDUgbqCVaII0VDz/X8H7c5OgYAqsBjTrtigaWmTtp2yFsEgxSJiYiZd
	eqqteQgvcxJGUe4ETQ4wRWt4etAJ1oIjPsA004DEuu798FpFlNMAqqcOX2hMRmi1cHUXBUOezQX
	euPIN6swoZFEBDQtmzy1xrpE+cCZquqhTL3L/kHgeKgPjUyWtkF+rIEE2zLSAche8MxwVJe6VxI
	Gshoo2UHBdPuw9ycvY4mlNq0uLuaqwG/ircvpHK/YR0Fw9Q9FeKpLw0/MEOq6z6trNRkII/rmL9
	nhd4rfzATj9Mo439cFErfoTnPEgfVJ1eYVlCKXmzXyOnLxu3JX/nHnSd0wXD8gU1rA0KX4cWB8
X-Google-Smtp-Source: AGHT+IE5o5xPs9Z80006FsPOroFcwBi6RoxuX/scnCdFiXmFcQAsdX2uyra0u4a/XargcoSuKFMjwQ==
X-Received: by 2002:a17:90b:1644:b0:33d:5e2a:891b with SMTP id 98e67ed59e1d1-343537796edmr4295487a91.14.1762556779850;
        Fri, 07 Nov 2025 15:06:19 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a69b626csm10526282a91.19.2025.11.07.15.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 15:06:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/6] clang: Fix libgcc.so.1.0 symlink to point to libunwind.so.1
Date: Fri,  7 Nov 2025 15:06:12 -0800
Message-ID: <20251107230617.364804-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 23:06:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226068

Pointing to libunwind.so results in build QA errors since libunwind.so
ends up in -dev package

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...symlink-path-for-libcc-when-LLVM_ENA.patch | 33 ++++++++
 ...libgcc.a-symlink-path-when-LLVM_ENAB.patch | 83 +++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |  4 +-
 3 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/clang/clang/0040-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0041-llvm-libgcc-Fix-libgcc.a-symlink-path-when-LLVM_ENAB.patch

diff --git a/meta/recipes-devtools/clang/clang/0040-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch b/meta/recipes-devtools/clang/clang/0040-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch
new file mode 100644
index 00000000000..f385dc83ea5
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0040-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch
@@ -0,0 +1,33 @@
+From 4204fd1b62de30418433139fea1b7dad4fff9c59 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Oct 2025 15:44:49 -0700
+Subject: [PATCH] [llvm-libgcc] Fix symlink path for libgcc
+
+The symlink for libgcc_so.1.0 is made to point to libunwind.so
+which is functionally correct but it fails some linux distro packaging
+complain because libunwind.so is made part of -dev package but
+libgcc_so.1.0 ends up in the real package, and creates an unneeded
+package -> dev dependency
+
+create the symlink to point to libunwind.so.1 instead then the boundaries
+of packaging are not crossed and all is well.
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/165487]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm-libgcc/CMakeLists.txt | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/llvm-libgcc/CMakeLists.txt b/llvm-libgcc/CMakeLists.txt
+index 47208fc19869..54009c1104c3 100644
+--- a/llvm-libgcc/CMakeLists.txt
++++ b/llvm-libgcc/CMakeLists.txt
+@@ -137,7 +147,7 @@ add_custom_target(llvm-libgcc ALL
+   DEPENDS unwind_shared unwind_static clang_rt.builtins-${COMPILER_RT_DEFAULT_TARGET_ARCH}
+   COMMAND ${CMAKE_COMMAND} -E create_symlink ${LLVM_LIBGCC_COMPILER_RT} libgcc.a
+   COMMAND ${CMAKE_COMMAND} -E create_symlink libunwind.a libgcc_eh.a
+-  COMMAND ${CMAKE_COMMAND} -E create_symlink libunwind.so libgcc_s.so.1.0
++  COMMAND ${CMAKE_COMMAND} -E create_symlink libunwind.so.1 libgcc_s.so.1.0
+   COMMAND ${CMAKE_COMMAND} -E create_symlink libgcc_s.so.1.0 libgcc_s.so.1
+   COMMAND ${CMAKE_COMMAND} -E create_symlink libgcc_s.so.1 libgcc_s.so
+ )
diff --git a/meta/recipes-devtools/clang/clang/0041-llvm-libgcc-Fix-libgcc.a-symlink-path-when-LLVM_ENAB.patch b/meta/recipes-devtools/clang/clang/0041-llvm-libgcc-Fix-libgcc.a-symlink-path-when-LLVM_ENAB.patch
new file mode 100644
index 00000000000..789d6d727a3
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0041-llvm-libgcc-Fix-libgcc.a-symlink-path-when-LLVM_ENAB.patch
@@ -0,0 +1,83 @@
+From 919fcd11ad53bdfab9a14d5df6de0895bf24e456 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Oct 2025 19:02:44 -0700
+Subject: [PATCH] [llvm-libgcc] Fix libgcc.a symlink path when LLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF
+
+The llvm-libgcc installation was creating incorrect symlinks for libgcc.a
+when built with LLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF, particularly seen with
+Yocto cross-compilation environments.
+
+Issues seen:
+
+-  Absolute path in symlink: The previous code didn't handle absolute paths
+   returned by get_compiler_rt_install_dir() in staging/sysroot environments,
+   resulting in symlinks like:
+   libgcc.a -> /absolute/path/to/sysroot/usr/lib/clang/.../libclang_rt.builtins.a
+
+-  Missing architecture suffix: When the install path contained "clang", the
+   code would skip setting builtins_suffix, creating:
+   libgcc.a -> clang/21.1.4/lib/linux/libclang_rt.builtins.a
+   instead of:
+   libgcc.a -> clang/21.1.4/lib/linux/libclang_rt.builtins-aarch64.a
+
+-  Incorrect relative path calculation: The original regex stripped too much
+   or too little of the path, either creating symlinks pointing to non-existent
+   locations or stripping the clang/ directory prefix entirely.
+
+Solution:
+
+- Extract the relative path starting from 'clang/' when present in absolute
+  paths, ensuring the symlink points to the correct location within the
+  installation hierarchy
+- Always append the architecture suffix to the builtins library name
+- Only prepend '../' to the path when LLVM_ENABLE_PER_TARGET_RUNTIME_DIR is
+  enabled, as this is when the builtins are in a different directory level
+
+The symlink now correctly points to the existing compiler-rt builtins library
+without creating duplicate copies.
+
+Tested with LLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF in cross-compilation
+environments (aarch64 target).
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/165487]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm-libgcc/CMakeLists.txt | 24 ++++++++++++++++++++----
+ 1 file changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/llvm-libgcc/CMakeLists.txt b/llvm-libgcc/CMakeLists.txt
+index cd9c5011d410..ee7fe768bda0 100644
+--- a/llvm-libgcc/CMakeLists.txt
++++ b/llvm-libgcc/CMakeLists.txt
+@@ -124,11 +124,27 @@ target_link_libraries(unwind_shared PUBLIC
+ #===============================================================================
+
+ get_compiler_rt_install_dir(${COMPILER_RT_DEFAULT_TARGET_ARCH} install_dir_builtins)
+-string(REGEX REPLACE "^lib/" "" install_dir_builtins "${install_dir_builtins}")
+-string(FIND "${install_dir_builtins}" "clang" install_path_contains_triple)
+-if(install_path_contains_triple EQUAL -1)
+-  set(builtins_suffix "-${COMPILER_RT_DEFAULT_TARGET_ARCH}")
++
++# Extract the relative path starting from 'clang' or after 'lib/'
++if(IS_ABSOLUTE "${install_dir_builtins}")
++  # For absolute paths, extract starting from 'clang/' if it exists
++  string(REGEX MATCH "clang/.*$" install_dir_builtins_temp "${install_dir_builtins}")
++  if(install_dir_builtins_temp)
++    set(install_dir_builtins "${install_dir_builtins_temp}")
++  else()
++    # Fallback: strip up to first lib/
++    string(REGEX REPLACE "^.*/lib/" "" install_dir_builtins "${install_dir_builtins}")
++  endif()
+ else()
++  string(REGEX REPLACE "^lib/" "" install_dir_builtins "${install_dir_builtins}")
++endif()
++
++# Always add the architecture suffix
++set(builtins_suffix "-${COMPILER_RT_DEFAULT_TARGET_ARCH}")
++
++# Only prepend ../ when using per-target runtime directories
++string(FIND "${install_dir_builtins}" "clang" install_path_contains_triple)
++if(install_path_contains_triple GREATER -1 AND LLVM_ENABLE_PER_TARGET_RUNTIME_DIR)
+   string(PREPEND install_dir_builtins "../")
+ endif()
+ set(LLVM_LIBGCC_COMPILER_RT ${install_dir_builtins}/libclang_rt.builtins${builtins_suffix}.a)
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 20adbf2610f..2b76c690588 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -38,7 +38,7 @@ SRC_URI = "\
     file://0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch \
     file://0017-clang-Use-python3-in-python-scripts.patch \
     file://0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch \
-    file://0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch \ 
+    file://0019-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch \
     file://0020-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch \
     file://0021-libunwind-Added-unw_backtrace-method.patch \
     file://0022-lldb-Link-with-libatomic-on-x86.patch \
@@ -59,6 +59,8 @@ SRC_URI = "\
     file://0037-Revert-libc-Remap-headers-in-the-debug-info-when-bui.patch \
     file://0038-Prevent-revisiting-block-when-searching-for-noreturn.patch \
     file://0039-Only-build-c-index-test-when-clang-tests-are-include.patch \
+    file://0040-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch \
+    file://0041-llvm-libgcc-Fix-libgcc.a-symlink-path-when-LLVM_ENAB.patch \
     file://0001-Install-lldb-tblgen.patch \
     file://0001-dont-expose-LLVM_HAVE_OPT_VIEWER_MODULES.patch \
     file://0001-clang-Support-building-native-tools-when-cross-compi.patch \

