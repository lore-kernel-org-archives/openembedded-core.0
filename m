Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC587C87FD2
	for <webhook@archiver.kernel.org>; Sun,  3 Aug 2025 03:35:04 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.11151.1754192101717339710
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 20:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RiwRCF+E;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b4239091facso1396352a12.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 20:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754192101; x=1754796901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mBCseIBNEj9FTTubZabzCargwzu7K46D+JW3GM0MUXo=;
        b=RiwRCF+EBOvJFq/9QMhUGwlDAD7ngISRX2DSDBUyBr1dyBR9yxreuUsLQ60Uwm1EYd
         K1iA/hishhMF8cfrN2kvR7QEwehBUMTRj5M3JWB+kR7ir605YO7sGMq8kWv3HcHmPWqe
         ftKL8pVveFogQ/xgmdQSa1ol1w87kXuJm3IYbRE4hG6ECKmSa4qW8amRPFeD24zoDduR
         wHvLyVAjRMtCFZQgA8Tpf/X9UutrvJBYk7YuE7VGqLXETmZRXfG9/pregVOSgF8O1edm
         FMXWYp3YkEja1XbEYpzrCFBMsDnGYNsPi/LtmfYGJkaMicysf/cM0Xu8DVP9CoEOyJyw
         SHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754192101; x=1754796901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBCseIBNEj9FTTubZabzCargwzu7K46D+JW3GM0MUXo=;
        b=Kt2TkavSFhBAbAH+ZHRIxElbHFOsYzfAfh7NAOyedhHtfptz2eGQwU0Xs2Z38BFfmZ
         gShLJl8POZNKhGZcTWzY0dF/3SbQBSEAiejssd+VbcL7TSV+dGPP2tSyL+D6ZYz+KVC5
         tmJ+hER2dIZiQ1J0X9IL4aRK0Y5hyNzi0xt4E2yCN8WRO+8xP3PcQiZnWo1k3CIB/gax
         G8CvQFgODuEULDzYAfYKqHB2UyD1tebtjQvRaLx7wJhDADDPg2oex+ZpivBsMEvJyz4s
         sb6xo0Ey1SRYbfFlhQ3X4noRzxw3Sk7AlfqyUitbFs6b5P9sIT5olsTf/Ta34p9Z0UNF
         95Xg==
X-Gm-Message-State: AOJu0Yy/JIP9tMIWNZRhxK6vW3BNTGLOsoOUwZH5bwghmkUekUJEa3HG
	7k9Od4PnY6ww6TwoCfp5BWgbhNmIQnAMhn3+k8B1LQcSmyJD5ODMjrWWbDvBUVNCxJU=
X-Gm-Gg: ASbGncsRcLYrml5qJ+eEa36yqqLG0MUw365HdzTnHr9Y70NUTo5v7yQCBn+RyORCCrf
	S3k9EB80tsUR1q5wgDgooXW1/rxYvZ4VKtgVZ7cmibIfrk2gZJPk2aa9qFikwLHvNQRElwtIigp
	epS8RNe1V/D/HyVxe5qy07NsdkrE9p4kkBnHYHsvvISAQ+8h0XN4KxHY0VatyOZgkuX9W0nFL91
	cdJvJ5hRLpqQ0oXBvdXi8TvdEpbikrd/rjtFpj3jU6RTuTCC+fhH9h/RTWZrYvYQYElDaB2SDJe
	2mEoYZcYSGdVR+w7waJoUegmMigu/pr21E41++162fN5R6LOEJH4z+NqBRoirCfQsBqRLdqXrK+
	BaHTHoLHrpp4EZWixQHNwa65zMOjHuJt+
X-Google-Smtp-Source: AGHT+IFzAmn1jA180988xSNR9QSg17NoZcth0uodb7DNR6IRuwEzO+e6G4to9pfdwCn7XilFHSR1Nw==
X-Received: by 2002:a17:902:e5c6:b0:240:92f9:7b75 with SMTP id d9443c01a7336-24246f30922mr65878705ad.2.1754192100722;
        Sat, 02 Aug 2025 20:35:00 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8ac8dbcsm77830365ad.194.2025.08.02.20.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:35:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] clang: Add packageconfig knob for opt-viewer
Date: Sat,  2 Aug 2025 20:34:55 -0700
Message-ID: <20250803033456.2029035-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Aug 2025 03:35:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221402

The optimization viewer is a web-based tool that helps developers visualize
and analyze LLVM's optimization passes. It generates reports showing
Which optimizations were applied to specific functions.
Why certain optimizations were or weren't performed.
Performance remarks and missed optimization opportunities
Interactive views of the optimization pipeline.

Its a nice add-on, keep it disabled by default.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Update upstream status of patch

 ...-to-set-LLVM_HAVE_OPT_VIEWER_MODULES.patch | 71 +++++++++++++++++++
 meta/recipes-devtools/clang/clang_git.bb      |  3 +
 meta/recipes-devtools/clang/common.inc        |  1 +
 3 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang/0001-llvm-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_MODULES.patch

diff --git a/meta/recipes-devtools/clang/clang/0001-llvm-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_MODULES.patch b/meta/recipes-devtools/clang/clang/0001-llvm-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_MODULES.patch
new file mode 100644
index 00000000000..ff135563cb3
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
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/151845]
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

