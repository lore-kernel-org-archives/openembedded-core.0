Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF5FC87FD2
	for <webhook@archiver.kernel.org>; Sun,  3 Aug 2025 03:16:14 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.10975.1754190965759642336
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 20:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YygTOgUv;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7682560a2f2so3287353b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 20:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754190965; x=1754795765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RM1/2I8I7h9cCEDCyFYDQpcywiGpRh6FjJvLouiGvY8=;
        b=YygTOgUvdl76Yk7QHxRk91D7TIybddFp1giXKQWKyivy1wnKbsigi77GJTslMTcUI6
         3fT+aYN4decrI7vKHDg6ZDF1B/esi7rCdkyp5dWAAywxEK0rtmTY4iqBPishQLg1S/XH
         BDGkGltuYf23Top7DlhfX4jY4tAfSFfyJF2nY3u/kh82isv7ifma2ovGeYcWYxyWBcWK
         1+aS0b/kDOo5NdR6syKIGVpiVRLvShxbcAtH9AyKW/fDbVQQPtJxPay0Xkh5x9AkSr/o
         IPSlK1kfpRQaIo3H7qEGFJLl5tmO+4TV0V2+XqgDy7IxodSxXW9Vf98biIhTUdEAJHB0
         gcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754190965; x=1754795765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RM1/2I8I7h9cCEDCyFYDQpcywiGpRh6FjJvLouiGvY8=;
        b=SHKqa2CWy685KcBqW+IyEj0/EPfW6+ulCvcZIatqETA8UvP81nYZ+TIVoNmNWf2Ppp
         jjevHtboHXTR7jxHt9pIHiZKvSlJpdXsmHKs7wlH12Els9alZ7efjMqWKw7rFPaEjNFL
         ufVY9OqXIXnQMSn8b+SliqwTXPQU+PRiFIN8PRtVZz1HsqGSPcVupzdfltxNUhXbQ68t
         hFCrTVq+09T0FbPFO4Ob3VqbdjDZhzcFI3YBsCDWfwTU1qDeGnsvmp0ivre9gOP1QvXa
         HdDevS+avGcjhpvTsnzo1Kc3+gAld+83kVIJdDmMvWRsHL+h1H4j5lwKXEv5HUHZbCj3
         Ysqg==
X-Gm-Message-State: AOJu0Yww3ya3iZ52/QvYOsWqZhyxE1oIh+LR214tMKFEhH+/lnA0/xpG
	qsD74mdJASXW6MLaOolxVAY3y/lqYBarc7oErOswtS71l9kNSB2IjFuAt+LvWfWNdg0=
X-Gm-Gg: ASbGncusLsAq3gkXJQyq+qiOdX2KuadsoWLQYGHObkwtkOdc3ysOPuqYW1CwUJnM6g4
	w4ACuMpR3lA/r/xI4Ig8sMBkUV8wJRcJw2mJNPJUQrm7hTN/xaEiQLeFwTdOwaWrm2Id3W7yg4S
	2W/NOpXn/8ev9d50uaWek5WoXxBst4RyjgUVS0eLFtUL8s5KkYbYjxRDQ2vrkm68zV2rmXr2ZP5
	ZHJeC9hhy9Ny3ERJsUn9jkSP30hmpKDW1hVsiAIvDq2/Z4HNQwHOpzTCynTpS2JaEaCC2wH5x6w
	HXjPwTP5mM3FAG7ut1HtxWUZWwSp/CRA1LifS3lTrbPYO7WvUoAHu04jnbCR4tv0jcgHaN6Ny6A
	1k31rtE/DIM/4D4KPG87sPORtM1zp7KZdIcTxlJBM4t4=
X-Google-Smtp-Source: AGHT+IEouogkDTznloR+KCxsi+Ybut4+RQquRuUMZydV/rNK6HRsNcNjCKKO4X0ejBpYhlrStrFuog==
X-Received: by 2002:a05:6300:218c:b0:238:abe:6363 with SMTP id adf61e73a8af0-23dd7bd86ddmr20284092637.14.1754190964599;
        Sat, 02 Aug 2025 20:16:04 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bb09d1dsm6455365a12.58.2025.08.02.20.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:16:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] clang: Add packageconfig knob for opt-viewer
Date: Sat,  2 Aug 2025 20:16:01 -0700
Message-ID: <20250803031601.1960181-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Aug 2025 03:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221401

The optimization viewer is a web-based tool that helps developers visualize
and analyze LLVM's optimization passes. It generates reports showing
Which optimizations were applied to specific functions.
Why certain optimizations were or weren't performed.
Performance remarks and missed optimization opportunities
Interactive views of the optimization pipeline.

Its a nice add-on, keep it disabled by default.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-to-set-LLVM_HAVE_OPT_VIEWER_MODULES.patch | 71 +++++++++++++++++++
 meta/recipes-devtools/clang/clang_git.bb      |  3 +
 meta/recipes-devtools/clang/common.inc        |  1 +
 3 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang/0001-llvm-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_MODULES.patch

diff --git a/meta/recipes-devtools/clang/clang/0001-llvm-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_MODULES.patch b/meta/recipes-devtools/clang/clang/0001-llvm-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_MODULES.patch
new file mode 100644
index 00000000000..52c8340c547
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0001-llvm-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_MODULES.patch
@@ -0,0 +1,71 @@
+From 0a45750694f304af68e8c960bb1a8b95a756cb42 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 2 Aug 2025 17:58:20 -0700
+Subject: [PATCH] llvm: Allow users to set LLVM_HAVE_OPT_VIEWER_MODULES
+ manually from the CMake
+
+Check right before setting LLVM_HAVE_OPT_VIEWER_MODULES
+so that if the user specifies the variable on the commandline
+it takes precedence. If not, fall back to the old logic
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm/CMakeLists.txt                     |  2 ++
+ llvm/cmake/config-ix.cmake              | 13 ++++++++++---
+ llvm/include/llvm/Config/config.h.cmake |  3 +++
+ 3 files changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/llvm/CMakeLists.txt b/llvm/CMakeLists.txt
+index 4c70b98a32f9..60b786ca39c2 100644
+--- a/llvm/CMakeLists.txt
++++ b/llvm/CMakeLists.txt
+@@ -7,6 +7,8 @@ set(LLVM_COMMON_CMAKE_UTILS ${CMAKE_CURRENT_SOURCE_DIR}/../cmake)
+ include(${LLVM_COMMON_CMAKE_UTILS}/Modules/CMakePolicy.cmake
+   NO_POLICY_SCOPE)
+ 
++option(LLVM_HAVE_OPT_VIEWER_MODULES "Enable opt-viewer modules support" ON)
++
+ # Builds with custom install names and installation rpath setups may not work
+ # in the build tree. Allow these cases to use CMake's default build tree
+ # behavior by setting `LLVM_NO_INSTALL_NAME_DIR_FOR_BUILD_TREE` to do this.
+diff --git a/llvm/cmake/config-ix.cmake b/llvm/cmake/config-ix.cmake
+index a8e4e5a63244..17af3dc1e93f 100644
+--- a/llvm/cmake/config-ix.cmake
++++ b/llvm/cmake/config-ix.cmake
+@@ -805,10 +805,17 @@ foreach(module ${PYTHON_MODULES})
+   find_python_module(${module})
+ endforeach()
+ 
+-if(PY_PYGMENTS_FOUND AND PY_PYGMENTS_LEXERS_C_CPP_FOUND AND PY_YAML_FOUND)
+-  set (LLVM_HAVE_OPT_VIEWER_MODULES 1)
++if(NOT DEFINED LLVM_HAVE_OPT_VIEWER_MODULES)
++  if(PY_PYGMENTS_FOUND AND PY_PYGMENTS_LEXERS_C_CPP_FOUND AND PY_YAML_FOUND)
++    set (LLVM_HAVE_OPT_VIEWER_MODULES 1)
++  else()
++    set (LLVM_HAVE_OPT_VIEWER_MODULES 0)
++  endif()
++elseif(LLVM_HAVE_OPT_VIEWER_MODULES)
++  # Use the user-provided value
++  set(LLVM_HAVE_OPT_VIEWER_MODULES 1)
+ else()
+-  set (LLVM_HAVE_OPT_VIEWER_MODULES 0)
++  set(LLVM_HAVE_OPT_VIEWER_MODULES 0)
+ endif()
+ 
+ function(llvm_get_host_prefixes_and_suffixes)
+diff --git a/llvm/include/llvm/Config/config.h.cmake b/llvm/include/llvm/Config/config.h.cmake
+index ce83de8e4cba..02cf6d2ec363 100644
+--- a/llvm/include/llvm/Config/config.h.cmake
++++ b/llvm/include/llvm/Config/config.h.cmake
+@@ -287,6 +287,9 @@
+ /* Define to a function implementing strdup */
+ #cmakedefine strdup ${strdup}
+ 
++/* Define indicating opt-viewer modules */
++#cmakedefine LLVM_HAVE_OPT_VIEWER_MODULES
++
+ /* Whether GlobalISel rule coverage is being collected */
+ #cmakedefine01 LLVM_GISEL_COV_ENABLED
+ 
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 3b803ead835..7ffecc4637f 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -59,6 +59,9 @@ PACKAGECONFIG[libedit] = "-DLLVM_ENABLE_LIBEDIT=ON,-DLLVM_ENABLE_LIBEDIT=OFF,lib
 PACKAGECONFIG[libomp] = "-DCLANG_DEFAULT_OPENMP_RUNTIME=libomp,,"
 PACKAGECONFIG[lld] = "-DCLANG_DEFAULT_LINKER=lld,,,"
 PACKAGECONFIG[lto] = "-DLLVM_ENABLE_LTO=Full -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
+PACKAGECONFIG[opt-viewer] = "-DLLVM_HAVE_OPT_VIEWER_MODULES=ON,-DLLVM_HAVE_OPT_VIEWER_MODULES=OFF, \
+                             python3-pyyaml-native python3-pygments-native python3-pyyaml python3-pygments, \
+                             python3-pyyaml python3-pygments,"
 PACKAGECONFIG[pfm] = "-DLLVM_ENABLE_LIBPFM=ON,-DLLVM_ENABLE_LIBPFM=OFF,libpfm,"
 PACKAGECONFIG[rtti] = "-DLLVM_ENABLE_RTTI=ON,-DLLVM_ENABLE_RTTI=OFF,,"
 PACKAGECONFIG[shared-libs] = "-DLLVM_BUILD_LLVM_DYLIB=ON -DLLVM_LINK_LLVM_DYLIB=ON,,,"
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index b2e08f829b0..fb96d0679ce 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -61,6 +61,7 @@ SRC_URI = "\
     file://0038-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch \
     file://0001-libclc-allow-existing-prepare-builtins-in-standalone.patch \
     file://no-c-index-test.patch \
+    file://0001-llvm-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_MODULES.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""

