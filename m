Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86F3C8303C
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 06:42:45 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.7826.1752216158527624194
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jul 2025 23:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MmIJtzmM;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2363616a1a6so15173985ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 23:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752216158; x=1752820958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMjdAewE5JtTbF40SB7hlOBLOu2zYV88/6mRAln5HaQ=;
        b=MmIJtzmM7zw11xOEMOcc1FCWhyYcTaw6jrKxg5ySvKce/mO1vHzwhoVF0TolFmqIdI
         Q/9w7rVnyMEmi9iGvRuE+dZ9m1c8fxhbNS3W9dLdHEUyO4zH8njmsMTglr5FLBEgvgq7
         3pf64UUZ4d6TBMIBTvA39CcD/+89uFxkULSGfCEGO+c5ZSw9s9H0TvilM6Bd2At+IYu1
         TJMfmmNrl0I0jB8DMhs44t9E+jT5abM6bpoFdG6ZyiBjBSJ9/fVQsKmAT0xAjvrAa+Jx
         MaIdRiIiNtQ7qgsKox5PuG5avd0Q7UGyGw2qE+RUYejoi+XtxkKFC4eM3cfWz3Q90wNL
         4wKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752216158; x=1752820958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMjdAewE5JtTbF40SB7hlOBLOu2zYV88/6mRAln5HaQ=;
        b=mggv90CunFEjzRUfPx4JuvNsNltgKiXNoI8gdqllTt9pBUr5xjFOlpaPswPbkGeOnM
         JZkiXaPb34rrRcsXMlaS/a84f+ddTeQOdWEMYEPCUwGGIMYiKFu7wLjG/VRwplKR6VkG
         1ZbEAIGOvjHgwHoojPPqHq3kdsEH4Ie6DTIz75it41NBWJaE4yvGJNoJDQ1sAV5mrlac
         FiQ0i2Bbx+t+Wnvfx3hsnSTLaIyTTgMRGLt61yaisA9M40FeyE0gftjq5572zGBSx6ga
         2drI4l+AJkzqKJisHL2djpNUGtFXhT0mWexxRrfXzE3m2dMZ4yaNFeNQKqdAYZi7MG9/
         9UxA==
X-Gm-Message-State: AOJu0YySog25z0bppNCHJ5DMcsODmakUDoMoMOYGq3FpBjDwL0wBhRSu
	2sLuevSMg+arFVYhzCaxzhkZE+8cL6pzXBIVheRXgE7FKf/qbvQEcQxUoBfpLv9w
X-Gm-Gg: ASbGncs3nEcfh9oEwxmFm92nntb//9KL8i1+lgAAXbggWSl66FaiCwe/wZNXdFFTD0U
	28v6F9NZqU2yErEiPTKQt4EdEGilV6Z4dU8t+tVKirEL4PoEgnGPMBn8qnG4Fz98VLvrTNOvjuV
	EN5Iqh7JECFsmBjnLmr0TVpU/kDyzH4IknuRR/+/U10kot4gzEWcNtgoC43leFlgcaXiIMIByDq
	inDVQPjmtYi315aXRWPEhN7p069phu8zEMcUn0CXLwn2ZJ6tZxw+NIaOrkBl8yxZKni1B0eHRVh
	Q1B9kDQLDHKWYGOWfSQMCjKBl8oWeRh5aJQpEzYIThx05CcFtXB+LNCNM1VSqzRPwg3wJdvjtkb
	nFGfvOtubsPPPEg==
X-Google-Smtp-Source: AGHT+IF5r/VatL0vh0XXASkidzrfJhP5pihYa61pq9PQmLT/1lZfcAgrC8ImXYnpBNVf2jud8blx5A==
X-Received: by 2002:a17:902:c403:b0:235:e942:cb9e with SMTP id d9443c01a7336-23dee1ae47dmr22904715ad.9.1752216157388;
        Thu, 10 Jul 2025 23:42:37 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4350bb0sm44626115ad.205.2025.07.10.23.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 23:42:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] compiler-rt: Fix install location for native builds
Date: Thu, 10 Jul 2025 23:42:33 -0700
Message-ID: <20250711064233.590809-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250711064233.590809-1-raj.khem@gmail.com>
References: <20250711064233.590809-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 06:42:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220136

Currently, clang when used for native builds and uses --rtlib=compiler-rt
does not find the LLVM runtime because its installed in different
directory than where compiler expects it to be. As a result, build fails
for packages using clang in both capacity ( native and cross )
e.g. qtwebengine

Make the build work across native sanitizers as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../clang/compiler-rt-sanitizers_git.bb       | 15 +++++---
 .../recipes-devtools/clang/compiler-rt_git.bb | 38 +++++++++++--------
 2 files changed, 32 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
index 087a7663023..198942ec359 100644
--- a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
@@ -55,8 +55,11 @@ CXXFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
 OECMAKE_TARGET_COMPILE = "compiler-rt"
 OECMAKE_TARGET_INSTALL = "install-compiler-rt install-compiler-rt-headers"
 OECMAKE_SOURCEPATH = "${S}/llvm"
+
+INSTALL_VER ?= "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}"
+INSTALL_VER:class-native = "${@oe.utils.trim_version("${PV}", 1)}"
+
 EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
-                  -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
                   -DCOMPILER_RT_STANDALONE_BUILD=ON \
                   -DCOMPILER_RT_USE_BUILTINS_LIBRARY=ON \
                   -DCOMPILER_RT_BUILD_BUILTINS=OFF \
@@ -71,11 +74,13 @@ EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
                   -DLLVM_ENABLE_RUNTIMES='compiler-rt' \
                   -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
                   -DLLVM_APPEND_VC_REV=OFF \
+                  -DCOMPILER_RT_INSTALL_PATH=${nonarch_libdir}/clang/${INSTALL_VER} \
                   -S ${S}/runtimes \
 "
 
 EXTRA_OECMAKE:append:class-native = "\
                -DCOMPILER_RT_USE_BUILTINS_LIBRARY=OFF \
+               -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=ON \
 "
 
 EXTRA_OECMAKE:append:class-target = "\
@@ -85,6 +90,7 @@ EXTRA_OECMAKE:append:class-target = "\
                -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
                -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
                -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
+               -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
 "
 
 EXTRA_OECMAKE:append:class-nativesdk = "\
@@ -95,24 +101,23 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
                -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
                -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
                -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
+               -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
 "
 
 EXTRA_OECMAKE:append:libc-musl = " -DLIBCXX_HAS_MUSL_LIBC=ON "
 
 do_install:append () {
-    mkdir -p ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib
-    mv ${D}${nonarch_libdir}/linux ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib
     # Already shipped with compile-rt Orc support
     rm -rf ${D}${nonarch_libdir}/clang/${MAJOR_VER}/lib/linux/liborc_rt-*.a
     rm -rf ${D}${nonarch_libdir}/clang/${MAJOR_VER}/include/orc/
 }
 
 FILES_SOLIBSDEV = ""
-FILES:${PN} += "${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER} \
+FILES:${PN} += "${nonarch_libdir}/clang/${INSTALL_VER} \
 				${nonarch_libdir}/clang/${MAJOR_VER}/lib/linux/lib*${SOLIBSDEV} \
                 ${nonarch_libdir}/clang/${MAJOR_VER}/*.txt \
                 ${nonarch_libdir}/clang/${MAJOR_VER}/share/*.txt"
-FILES:${PN}-staticdev += "${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/*.a"
+FILES:${PN}-staticdev += "${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/*.a"
 FILES:${PN}-dev += "${datadir} ${nonarch_libdir}/clang/${MAJOR_VER}/lib/linux/*.syms \
                     ${nonarch_libdir}/clang/${MAJOR_VER}/include \
                     ${nonarch_libdir}/clang/${MAJOR_VER}/lib/linux/clang_rt.crt*.o \
diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index 4da85f29378..c88000d33b0 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -71,8 +71,11 @@ def get_compiler_rt_arch(bb, d):
 OECMAKE_TARGET_COMPILE = "compiler-rt"
 OECMAKE_TARGET_INSTALL = "install-compiler-rt install-compiler-rt-headers"
 OECMAKE_SOURCEPATH = "${S}/llvm"
+
+INSTALL_VER ?= "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}"
+INSTALL_VER:class-native = "${@oe.utils.trim_version("${PV}", 1)}"
+
 EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
-                  -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
                   -DCOMPILER_RT_STANDALONE_BUILD=ON \
                   -DCOMPILER_RT_INCLUDE_TESTS=OFF \
                   -DCOMPILER_RT_BUILD_XRAY=OFF \
@@ -83,9 +86,12 @@ EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
                   -DLLVM_ENABLE_RUNTIMES='compiler-rt' \
                   -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
                   -DLLVM_APPEND_VC_REV=OFF \
+                  -DCOMPILER_RT_INSTALL_PATH=${nonarch_libdir}/clang/${INSTALL_VER} \
                   -S ${S}/runtimes \
 "
-
+EXTRA_OECMAKE:append:class-native = "\
+               -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=ON \
+"
 EXTRA_OECMAKE:append:class-target = "\
                -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib \
                -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
@@ -93,6 +99,7 @@ EXTRA_OECMAKE:append:class-target = "\
                -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
                -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
                -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
+               -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
 "
 
 EXTRA_OECMAKE:append:class-nativesdk = "\
@@ -103,29 +110,28 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
                -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
                -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
                -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
+               -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
 "
 
 do_install:append () {
-    mkdir -p ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib
-    mv ${D}${nonarch_libdir}/linux ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib
     if [ "${HF}" = "hf" ]; then
-        mv -f ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/libclang_rt.builtins-arm.a \
-              ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/libclang_rt.builtins-armhf.a
-        mv -f ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/liborc_rt-arm.a \
-              ${D}${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/liborc_rt-armhf.a
+        mv -f ${D}${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/libclang_rt.builtins-arm.a \
+              ${D}${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/libclang_rt.builtins-armhf.a
+        mv -f ${D}${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/liborc_rt-arm.a \
+              ${D}${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/liborc_rt-armhf.a
     fi
 }
 
 FILES_SOLIBSDEV = ""
 
-FILES:${PN} += "${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/lib*${SOLIBSDEV} \
-                ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/*.txt \
-                ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/share/*.txt"
-FILES:${PN}-staticdev += "${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/*.a"
-FILES:${PN}-dev += "${datadir} ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/*.syms \
-                    ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/include \
-                    ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/clang_rt.crt*.o \
-                    ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}/lib/linux/libclang_rt.asan-preinit*.a"
+FILES:${PN} += "${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/lib*${SOLIBSDEV} \
+                ${nonarch_libdir}/clang/${INSTALL_VER}/*.txt \
+                ${nonarch_libdir}/clang/${INSTALL_VER}/share/*.txt"
+FILES:${PN}-staticdev += "${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/*.a"
+FILES:${PN}-dev += "${datadir} ${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/*.syms \
+                    ${nonarch_libdir}/clang/${INSTALL_VER}/include \
+                    ${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/clang_rt.crt*.o \
+                    ${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/libclang_rt.asan-preinit*.a"
 
 INSANE_SKIP:${PN} = "dev-so libdir"
 INSANE_SKIP:${PN}-dbg = "libdir"

