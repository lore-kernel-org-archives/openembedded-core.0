Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F082ACCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 23:06:33 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1146.1762556784487285731
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 15:06:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ggEdvS9r;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3414de5b27eso990192a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 15:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762556784; x=1763161584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSLxkLkGRUnVwwE5/hmrbzstWBNNkJ+nQgum/BsKohQ=;
        b=ggEdvS9riVLegBRfEQ+MzMBmpz1jNWSoj0I7/mNmqCIhQlbalLbIYPDaEmGWNyuBeL
         vjODtDE/2QEzSfq2LNUcQDgOUnyfSSJcP8V2j6WLHR/4hOT3do3943VCt9GtuUOTu3y1
         neXEwRzMTkgaAvNjhnGP+i4ts/TJxLK+wP6ru2OLVIZ3zyGCV1PmnghkvY2Ei2+ellJ9
         +DKaKctYh3cZ4k0OvUEcMtbM+E0V4xjZwCsOVkBxwPPioHMGXpaqIDb1vGYa/xMxa11z
         XH4tZfh5Znmn8fXrTOF8b5xfVMwriwxU+XWlsytY+NCa7RmYdPlD+UGesRDbY3Qbxz8E
         QdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762556784; x=1763161584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MSLxkLkGRUnVwwE5/hmrbzstWBNNkJ+nQgum/BsKohQ=;
        b=p0V/DzgBBFMpM/dFOkGeobbni4OaHWjq/HJg+t6VcRn0610ped8HK/f2R302T7foZH
         dFRmoKkWGIAYrJM+W01hu7ehnEpo3Y1kFA8xpkCsJDJ774uVjCP6dgj8iw5MFa4qvTUi
         1klGeTOemRdD3dqRoPsHSZ6GcQFooc7ZJux+PzSOheQgcj3G+pw88Bd+SBjLaP6nQWU9
         aFutMxLEM/PgietJQsSAtfkSG0HJWabBpEbB2oSPJkWMahAorAubGUbmCc9ev/p32gT3
         EcpkGOQvb71GW5/nrYwjV2SfTULGOiagzb0onCbdD6qLkvbDPTQZZFIqpYeDzE/eN+EM
         7uJQ==
X-Gm-Message-State: AOJu0Yy77a7LKtMQBVE/zErV/hD6Uxoy8jzEcYbKSK19n/TTOoPBiz3U
	6CvWZfbwpYbhrKrF9Mh7L30z7w+rsW1N/1hpUECd1F8MN9CUynRph66rQaRjm41LczI=
X-Gm-Gg: ASbGnctmkHEMLEKfov8G5+BuKmwxfB4ozsDbk86dB6bLngxXGzsB1DHVLZ4WRbUPrLk
	BqZSFM5/UU/CuwfJvNphdR+i0H1wCFrQzETBVfV+vOfUoTlf2RDsdNHnvnyGKeMq48IA2duCjl3
	jOafkCU6ON+CfDMcFp6bePFIy7nFJ0ITs11Y0sGyf95k+HIs41okCk/rtOV5kAsFnC2fre72W1o
	Vs8CeWazVyYww+kqCuToWnTifBntTsES6JwU7H9UIdI5MV7xWh9bwkl2r7Xy5o/ftpx6Lbdc+Y9
	AKfTyloQ8jhPP6yD4HoipcYfVdYHHvyOPOwwjS8bc9i8Fai/1c0iGV4Cm5hsgOI5TKncLONHdVz
	yluz7ZhgVC7phB2oLhovj2Ok8i1/VbwuTAzSRbiNke4qb1OPApAZ0u4fPfJeTujErZ+iy+XwPto
	2iQ+/x3FPGqTdVNdqxXII4ONJnsCyQxcxxphAXZ+2aUSvcZRVcTfynWQTDydfIAQObs3vED9Sy
X-Google-Smtp-Source: AGHT+IHwtSGQcGRXGJFaMGW2/K8mFOxUN1c5+QLAfcWM7SXgRrMBPzbMQM0Xfvg0scj3w0JhhE406w==
X-Received: by 2002:a17:90b:3904:b0:341:8c15:959e with SMTP id 98e67ed59e1d1-3436cb91af6mr1144529a91.17.1762556783559;
        Fri, 07 Nov 2025 15:06:23 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a69b626csm10526282a91.19.2025.11.07.15.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 15:06:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/6] libcxx: Remove gnu runtime from dependencies
Date: Fri,  7 Nov 2025 15:06:15 -0800
Message-ID: <20251107230617.364804-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107230617.364804-1-raj.khem@gmail.com>
References: <20251107230617.364804-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 23:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226071

There is no need to have these dependencies if we can cache some of
cmake values, it really does not need these packages to build or run

It also simplifies the depchain a bit.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/libcxx_git.bb | 25 +++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
index c630bd973ea..1cea430e6ba 100644
--- a/meta/recipes-devtools/clang/libcxx_git.bb
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -12,7 +12,7 @@ inherit cmake
 
 BPN = "libcxx"
 
-PACKAGECONFIG ??= "compiler-rt exceptions ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "unwind unwind-shared", "", d)}"
+PACKAGECONFIG ??= "compiler-rt exceptions unwind ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "unwind unwind-shared", "", d)}"
 PACKAGECONFIG:append:armv5 = " no-atomics"
 PACKAGECONFIG:remove:class-native = "compiler-rt"
 PACKAGECONFIG[unwind] = "-DLIBCXXABI_USE_LLVM_UNWINDER=ON -DLIBCXXABI_ENABLE_STATIC_UNWINDER=ON,-DLIBCXXABI_USE_LLVM_UNWINDER=OFF,,"
@@ -22,19 +22,20 @@ PACKAGECONFIG[compiler-rt] = "-DLIBCXX_USE_COMPILER_RT=ON -DLIBCXXABI_USE_COMPIL
 PACKAGECONFIG[unwind-shared] = "-DLIBUNWIND_ENABLE_SHARED=ON,-DLIBUNWIND_ENABLE_SHARED=OFF,,"
 PACKAGECONFIG[unwind-cross] = "-DLIBUNWIND_ENABLE_CROSS_UNWINDING=ON,-DLIBUNWIND_ENABLE_CROSS_UNWINDING=OFF,,"
 
-DEPENDS:append:class-target = " virtual/cross-c++ ${MLPREFIX}clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc virtual/${MLPREFIX}compilerlibs"
-DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-crosssdk-${SDK_SYS} nativesdk-compiler-rt"
+DEPENDS:append:class-target = " virtual/cross-c++ ${MLPREFIX}clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc"
+DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-crosssdk-${SDK_SYS} nativesdk-compiler-rt virtual/nativesdk-libc"
 DEPENDS:append:class-native = " clang-native compiler-rt-native"
 DEPENDS:remove:class-native = "libcxx-native"
 
 COMPILER_RT ?= "${@bb.utils.contains("PACKAGECONFIG", "compiler-rt", "-rtlib=compiler-rt", "-rtlib=libgcc", d)}"
 UNWINDLIB ?= "${@bb.utils.contains("PACKAGECONFIG", "unwind", "-unwindlib=none", "-unwindlib=libgcc", d)}"
-LIBCPLUSPLUS ?= "-stdlib=libstdc++"
+LIBCPLUSPLUS ?= ""
+#LIBCPLUSPLUS ?= "-stdlib=libstdc++"
 # Trick clang.bbclass into not creating circular dependencies
-UNWINDLIB:class-nativesdk = "-unwindlib=libgcc"
-LIBCPLUSPLUS:class-nativesdk = "-stdlib=libstdc++"
+#UNWINDLIB:class-nativesdk = "-unwindlib=libgcc"
+#LIBCPLUSPLUS:class-nativesdk = "-stdlib=libstdc++"
 UNWINDLIB:class-native = "-unwindlib=libgcc"
-LIBCPLUSPLUS:class-native = "-stdlib=libstdc++"
+#LIBCPLUSPLUS:class-native = "-stdlib=libstdc++"
 
 LDFLAGS:append = " ${UNWINDLIB}"
 
@@ -65,7 +66,7 @@ EXTRA_OECMAKE += "\
                   -DCMAKE_CROSSCOMPILING=ON \
                   -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
                   -DLLVM_ENABLE_RTTI=ON \
-                  -DLIBCXX_ENABLE_STATIC_ABI_LIBRARY=ON \
+                  -DLIBCXX_ENABLE_STATIC_ABI_LIBRARY=OFF \
                   -DLIBCXXABI_INCLUDE_TESTS=OFF \
                   -DLIBCXXABI_ENABLE_SHARED=ON \
                   -DLIBCXXABI_LIBCXX_INCLUDES=${S}/libcxx/include \
@@ -80,6 +81,10 @@ EXTRA_OECMAKE += "\
 "
 
 EXTRA_OECMAKE:append:class-target = " \
+                  -DCMAKE_C_COMPILER_WORKS=ON \
+                  -DCMAKE_CXX_COMPILER_WORKS=ON \
+                  -DCXX_SUPPORTS_FNO_EXCEPTIONS_FLAG=ON \
+                  -DCOMPILER_RT_USE_BUILTINS_LIBRARY=ON \
                   -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${AR} \
                   -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${NM} \
                   -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${RANLIB} \
@@ -88,6 +93,10 @@ EXTRA_OECMAKE:append:class-target = " \
 "
 
 EXTRA_OECMAKE:append:class-nativesdk = " \
+                  -DCMAKE_C_COMPILER_WORKS=ON \
+                  -DCMAKE_CXX_COMPILER_WORKS=ON \
+                  -DCXX_SUPPORTS_FNO_EXCEPTIONS_FLAG=ON \
+                  -DCOMPILER_RT_USE_BUILTINS_LIBRARY=ON \
                   -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${AR} \
                   -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${NM} \
                   -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${RANLIB} \

