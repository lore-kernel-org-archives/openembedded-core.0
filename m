Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E2CCCFA18
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 23:06:33 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1143.1762556782206322046
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 15:06:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nE+yGCaw;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-33ff5149ae8so795184a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 15:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762556781; x=1763161581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFnWMb9R89S6o/JDaVaFchrWpYMS/UxWW3T7IeGGnvI=;
        b=nE+yGCawB/PQ715VS5ZdDgpQja291LNOVtCZyOctAc0aX0dc48eNM26ssgFcR7Ve8/
         GCWwRGMDW+YR0nq0lAURSR75I8xZF6dTxZcuY3BtnvHh5UexFnn/tB5HJdUBz/kPpiVT
         2GqhWwZ8aS/ln+x/cbOKvkEaNyDvaPMbhgnUVGJGrcikSaN8OAoIphnyYuWvqmbMre0a
         kIBeqhjy+/jjvS/k7ArQ/QNyJechsKov7PvRV3Fq5BaRAWh7THxixdAFmaZeh8yVvoCC
         xRvnJRkJjQU0KaNQ2B0bKWAwDECZy9HbO6wRqE7oXvzOOXg0KzqcuMZP+bB6JkVMmoRh
         nSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762556781; x=1763161581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gFnWMb9R89S6o/JDaVaFchrWpYMS/UxWW3T7IeGGnvI=;
        b=cdjxhSrF1eDpuT+ag8SYRHlRKpB8baO+Mv/mY4Iya/zOe68awJMApJQxKUQZZM7Gux
         geycjSo1oeNTvq+DLzksWKzRZ8ppoHx7ClkfgA3xvPha4owyz+HVEbdgIGTmcLeKjHLD
         ac8FangDEWRMq8czPOLzn257CjdKmeFxjbRzANUA+vBHCa1MT/szqXT4118EGa6ROYMt
         7C3qvZyKjMaeai4JzNmMRd9dPVI7eoSHWzanKS7IprQV1y7sy40ahEMPTNJungZJO07c
         Np3R1TBQqFzi/BoBnYNohUzuwVi2+2Zxp0Pomwtq91hwOfK7dfreZyLycvsvy9RLAE4w
         NOaA==
X-Gm-Message-State: AOJu0YzUTwZi8RzgXUW/hrPYP9AkRnDBPPRIhGbWblS6SYHRv12vFG94
	n/v23RCnZxh4jJb6WDAXhAcSDWOpCP+V7WMnBsdm9yKneTs1do5cjsW2nIyTbqdxX6k=
X-Gm-Gg: ASbGncuw3ttvpYkyaCuuoTKnGSTTWu12J9TD+396OrPPu8Cf5bnXie90XH6jNKq6TKK
	l3xHe08eSup8rr8TDOFvkdcMnIDW+/kdKOjtARKb4bfXmDKOiobaYHyn6raayU83ti9XsfMpAa9
	d8XTzaBgkWU1MiVX/pzEiMQqhdvIYP67dPlhzA1JWbcc4dpdqHxKgmuTO1pqbvjbEIrwGCf3BKr
	ht51eCqUbDPYvYwkJFEma1a5v3sXsORqa/xRb3NFFA2VXGGPj2o7Ty1Xk4F2PKCpph+sH1SsJKx
	IrO48G4R14cxiHtw/TSADPoh7RQ1xwVukFNnYbGREX0X3M1U9F9KUlD7nE7OJFz8+oGVyX5BWLD
	YPqtaoQD4IpQLq9Rkc724LlTCiHzK3IR54m4oHaSVl5p3oQNOlzVriGVeIeeWYwq8xs33Fvl1ke
	PuXBSLlANvKLhv6Fc/YhvyC3cTlc4tNGnVISJc0fDLEP99Vm7XilPcWhIlnSnviQ==
X-Google-Smtp-Source: AGHT+IEifayCyIqBP0Na/DnhdoVMMXA2eXrL44zAK9mzVrWSp4dP+tqFz+97RtULBlbLTUtABah6Iw==
X-Received: by 2002:a17:90b:4a81:b0:340:ff89:8b63 with SMTP id 98e67ed59e1d1-3436cbf3965mr784076a91.22.1762556781251;
        Fri, 07 Nov 2025 15:06:21 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a69b626csm10526282a91.19.2025.11.07.15.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 15:06:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/6] compiler-rt: Remove the need to depend on libgcc
Date: Fri,  7 Nov 2025 15:06:13 -0800
Message-ID: <20251107230617.364804-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107230617.364804-1-raj.khem@gmail.com>
References: <20251107230617.364804-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 23:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226069

libgcc is only used in cmake tests for compiler checks
which works in contained environment like OE, add depedencies
on native version of compiler-rt and libcxx for compiler to
use

Do not build orc builtins, its only needed for JIT which OE
does not use.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/compiler-rt_git.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index 8cf11edf85f..f42f17e9ba6 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -25,9 +25,8 @@ TUNE_CCARGS:remove = "-no-integrated-as"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-DEPENDS += "libgcc"
-DEPENDS:append:class-target = " virtual/cross-c++ ${MLPREFIX}clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc gcc-runtime"
-DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-native clang-crosssdk-${SDK_SYS} nativesdk-gcc-runtime"
+DEPENDS:append:class-target = " virtual/cross-c++ ${MLPREFIX}clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc libcxx-native compiler-rt-native"
+DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-native clang-crosssdk-${SDK_SYS}"
 DEPENDS:append:class-native = " clang-native"
 DEPENDS:remove:class-native = "libcxx-native compiler-rt-native"
 
@@ -76,6 +75,8 @@ INSTALL_VER ?= "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}${VER_SUFFIX}"
 INSTALL_VER:class-native = "${@oe.utils.trim_version("${PV}", 1)}"
 
 EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
+                  -DCMAKE_C_COMPILER_WORKS=ON \
+                  -DCMAKE_CXX_COMPILER_WORKS=ON \
                   -DCOMPILER_RT_STANDALONE_BUILD=ON \
                   -DCOMPILER_RT_INCLUDE_TESTS=OFF \
                   -DCOMPILER_RT_BUILD_XRAY=OFF \
@@ -100,6 +101,7 @@ EXTRA_OECMAKE:append:class-target = "\
                -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
                -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
                -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
+               -DCOMPILER_RT_BUILD_ORC=OFF \
 "
 
 EXTRA_OECMAKE:append:class-nativesdk = "\
@@ -111,14 +113,13 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
                -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
                -DCOMPILER_RT_DEFAULT_TARGET_ONLY=ON \
                -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF \
+               -DCOMPILER_RT_BUILD_ORC=OFF \
 "
 
 do_install:append () {
     if [ "${HF}" = "hf" ]; then
         mv -f ${D}${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/libclang_rt.builtins-arm.a \
               ${D}${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/libclang_rt.builtins-armhf.a
-        mv -f ${D}${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/liborc_rt-arm.a \
-              ${D}${nonarch_libdir}/clang/${INSTALL_VER}/lib/linux/liborc_rt-armhf.a
     fi
 }
 

