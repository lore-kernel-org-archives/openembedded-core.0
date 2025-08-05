Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AA8C87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 16:09:05 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.3314.1754410138489762766
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 09:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xq/B/T7E;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23636167afeso40350885ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 09:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754410138; x=1755014938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Ytb1Bzbb0I5/A7fm9Z/ue6WKOnDw9jcOYjlW/RRQ5k=;
        b=Xq/B/T7EXjxQ/5O1YIjJ61ni5QrEb9hCX4Vp+sZUNV/IEC81SFXNdGzL8C5fFjrwHP
         PQfKPg9nkbQ31kYHfUAG8yyWPCNlU+D8U6qh7ZQW+lqyW2B2ReSKG1dfaFV6PMY7+G57
         zFPcGozwf92TIdEMXzsVjKpAeeWT2FBgJ6U9bEPSj2msxAPyn/pbLczftSCzppmX1pIN
         s28bD2vnplEaYf37kyRC2hQ0fJxl+yKIE1emiTLEVkgAUgQEhtzpOch8lUGt+tk+3Psc
         RLKRtNzmDTvIrKaycc8FB+Apb6c5NkyyduhEx35oy+jF7zQkOX6+ROx+b2wXMxFq7tXv
         EzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754410138; x=1755014938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Ytb1Bzbb0I5/A7fm9Z/ue6WKOnDw9jcOYjlW/RRQ5k=;
        b=enUdHk23HoSETnfGxs+flO7nS3HhJKc51j0rrw/YVOqce3NoYpwYS2XN7RNK6Gn3LE
         3qqd7LigTRXFwvJhWyv89QMyQv1r7dBALVyX7yGxKHvxApDRK6sh5dnZv14t17sw31Pu
         ml0PFI0PvJ4ZaSJkisCXHUZ5hmXmHS30iE/RwJ/L8Ak8zLrImf5GtavpOBrlOgiu6BjT
         BWg8WGE3O1tyB1fTNLTnuwRr3BBmITVFLhtJtYmYD75WRAlwilqHn9wc9suOhRICaBgr
         DT6HLFj6IPEBNBscIgIROQtpTPsHN3RAOZIDZkam5VCzY53QK4T0yoYMvUSoKzmSZ2BZ
         Yd1g==
X-Gm-Message-State: AOJu0Yx27YlrMYhWCISI9jDV5/JAzEVqzwjK5q8B3xVfz38pYLuMEBEP
	45bLxzxS859S8LXjNAjk/SU8i34V8L/NwCrToRjZ23TesCilRrPDlJaYHL9WbqGgInE=
X-Gm-Gg: ASbGncub0nrXq1RHGSftwXgbUSsRjsk0zgMjJvbvmOcaEqS6+5UkT0qDWAQeGUJotsp
	k75zpXrAEgYMw4speDTiIFXKouxLthz3xVMBJIX9wioQlLdLKpmjCQ75EqZZ8RR8Bgwno+5Ea1N
	DtNHT4V/aTIPdeOvBJBD1rBPojkHbV1izNXhzVQuiz+e+SGjphVjpJFgcxSSEkSDvwY+G+XLaBE
	eHWnxVw/NWOU8/VJD+DlTalPpT09bkHwD3+2hZf0Uu5VnfVh6u1U7HW6LKh7T1hLP++XR4goZ0H
	C0Xr3+FJvVKTNrj3WrKyKqsQlWQqk+dVnGHQRM8/yUyawGZEeoVuUQaApEgi6Cn4uq5fTO5LSMZ
	ZcIalLTzN5R51LNC4mVv9rw==
X-Google-Smtp-Source: AGHT+IHR2h9+0KexbHNO+BpyqWwfta3WKyc9/yw7JuGca30YM/d5hu3I9MzewgYa+e5HEBaRbO3tUA==
X-Received: by 2002:a17:903:183:b0:23f:d903:d867 with SMTP id d9443c01a7336-24247013eefmr199751265ad.35.1754410137331;
        Tue, 05 Aug 2025 09:08:57 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ccc5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b6a9sm136944245ad.134.2025.08.05.09.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 09:08:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] clang: Add packageconfig knob for opt-viewer
Date: Tue,  5 Aug 2025 09:08:54 -0700
Message-ID: <20250805160854.926408-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 16:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221478

The optimization viewer is a web-based tool that helps developers visualize
and analyze LLVM's optimization passes. It generates reports showing
Which optimizations were applied to specific functions.
Why certain optimizations were or weren't performed.
Performance remarks and missed optimization opportunities
Interactive views of the optimization pipeline.

Its a nice add-on, keep it disabled by default.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Do not install opt-viewer if modules are not there

 ...-to-set-LLVM_HAVE_OPT_VIEWER_MODULES.patch | 91 +++++++++++++++++++
 meta/recipes-devtools/clang/clang_git.bb      |  3 +
 meta/recipes-devtools/clang/common.inc        |  1 +
 3 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang/0001-llvm-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_MODULES.patch

diff --git a/meta/recipes-devtools/clang/clang/0001-llvm-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_MODULES.patch b/meta/recipes-devtools/clang/clang/0001-llvm-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_MODULES.patch
new file mode 100644
index 00000000000..4211cd2e3c0
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0001-llvm-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_MODULES.patch
@@ -0,0 +1,91 @@
+From e396fbe0e698c80e112af76fcdff8bbd61a30740 Mon Sep 17 00:00:00 2001
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
+ llvm/CMakeLists.txt                  |  2 ++
+ llvm/cmake/config-ix.cmake           | 13 ++++++++++---
+ llvm/tools/opt-viewer/CMakeLists.txt | 24 +++++++++++++-----------
+ 3 files changed, 25 insertions(+), 14 deletions(-)
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
+diff --git a/llvm/tools/opt-viewer/CMakeLists.txt b/llvm/tools/opt-viewer/CMakeLists.txt
+index 4bcf6932ee77..d231c39bcc5d 100644
+--- a/llvm/tools/opt-viewer/CMakeLists.txt
++++ b/llvm/tools/opt-viewer/CMakeLists.txt
+@@ -6,16 +6,18 @@ set (files
+   "optrecord.py"
+   "style.css")
+ 
+-foreach (file ${files})
+-  install(PROGRAMS ${file}
+-    DESTINATION "${CMAKE_INSTALL_DATADIR}/opt-viewer"
+-    COMPONENT opt-viewer)
+-endforeach (file)
++if(LLVM_HAVE_OPT_VIEWER_MODULES)
++  foreach (file ${files})
++    install(PROGRAMS ${file}
++      DESTINATION "${CMAKE_INSTALL_DATADIR}/opt-viewer"
++      COMPONENT opt-viewer)
++  endforeach (file)
+ 
+-add_custom_target(opt-viewer DEPENDS ${files})
+-set_target_properties(opt-viewer PROPERTIES FOLDER "LLVM/Tools")
+-if(NOT LLVM_ENABLE_IDE)
+-  add_llvm_install_targets("install-opt-viewer"
+-                           DEPENDS opt-viewer
+-                           COMPONENT opt-viewer)
++  add_custom_target(opt-viewer DEPENDS ${files})
++  set_target_properties(opt-viewer PROPERTIES FOLDER "LLVM/Tools")
++  if(NOT LLVM_ENABLE_IDE)
++    add_llvm_install_targets("install-opt-viewer"
++                             DEPENDS opt-viewer
++                             COMPONENT opt-viewer)
++  endif()
+ endif()
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 195a7be43b1..0009a95628d 100644
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

