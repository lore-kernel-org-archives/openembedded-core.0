Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B78C3ABBE
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 20:11:37 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.84.1746562290398628950
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 13:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jXTiM63f;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736e52948ebso7850873b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 13:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746562289; x=1747167089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CzMHqZNUBqVyHZuWrWTjWDZgtEwJA2VWq27G5iKqCJ4=;
        b=jXTiM63fYGYq/jkEai7yD7SoQ6Vuyg6R6m2wsgLWpQ2CRI+VA/WKo0p2gDnBTBUr+6
         Eh5pIKQ0rxZ2Dzv3v0WyXEaUN58+HyYP05ifp3KdBbxFx9Mw/FSWR0yV1Sp6X24xhmzM
         fPPLK/Ye1yYtao6XOr0zzQhm9aUzIJVwoG5S8ToC9y0bQrsP4+qlMnwT8jLNjAXlt6Q0
         S4FT2uw+A3ouVWyzvMjL9bMMLOyOVdVYRsi4M2h0mCnKmi0z1VWcIJpapFJMvtoF/353
         gCb4cBq2AchNWyZ24bM5YKFCUieCnUIZGRaxGd+6686+YH0yz6EN5g/ai43c8amY/Eua
         daeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746562289; x=1747167089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzMHqZNUBqVyHZuWrWTjWDZgtEwJA2VWq27G5iKqCJ4=;
        b=O4Vm9mrPp4/QicrmnmOaJe3X9vMml3rChuLjuHxzqBWUmSaN7HSH3Uj/cPdPDlwHQa
         N9/Q/OC6ivgFoIoiNYloofeZ5eVTG2Y0VpYSn/ndQ66eB977esDfApw11GXQYKH/97wb
         ZMq4sd8Xel68o5j50ATwzrS2jNp0Bcu5HYpK2hm16+12k1xZi2vmvtOYKX/zhPopAJlb
         FOg15EuDgopSRvAEtMmUdpxswSeAYoXGUrp3ky+hVll1Buks7C69AFYO/9MemmO2qceT
         22VptuGT2SMZLqf5rJcv5vrqrhvFkd9ccmPkPmLxs3BQ7pDgf69x5Y877EwLmi4NwqEu
         29Tg==
X-Gm-Message-State: AOJu0YwISJ2hgLZlxoqNfllOQ43L75kMBqHtdGwW+iRvUkuPwKZlK+rg
	AadOq7ruzfqiVbG8cuqXsTEQ4l7fWgALT30/uTDzoVREjTJSBfqdEgisaVam
X-Gm-Gg: ASbGncuExfKS6OP0lxnxd/Eu1cNCqSp9MUAF7UiLwerrgXL0X6WdgIKxpfDdt9SZuny
	UghO0XAH6Q5KQ4JmaQ9zbtqPKXNZ3Pcnwkuj/rRxB5Wjz0vTt3Fvp8pDRh+5Unwvx9dNwORVslJ
	8m8ojSKqY5G1W/Tz4T8TH4NFnVyMxywZT0t+M7ewmkPFyZcuE8g2F0ldEkho9aMAPsInzWhaMnY
	dDwMHF0rD5EoIQrR/wG0hjqs3EogLEmWrGJdYfah3UHiEZdpfhGzKvxoW3JnA7GjshhvcRoJXBf
	5fWJxaxble5AUcCWx3uiRiHT1yjrThuHkKodHIEnOJo=
X-Google-Smtp-Source: AGHT+IH99y+dU1B2DVx0Q3h12lE8gDeOLo+wf5eHiOf6FBQzJYnmd8shO1JLDK//jTj6UrxCPrYMlQ==
X-Received: by 2002:a05:6a00:8010:b0:736:3768:6d74 with SMTP id d2e1a72fcca58-7409cf4da8bmr557270b3a.7.1746562289488;
        Tue, 06 May 2025 13:11:29 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7a3a6sm9384258b3a.2.2025.05.06.13.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:11:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] compiler-rt: Always use clang for compiler
Date: Tue,  6 May 2025 13:11:27 -0700
Message-ID: <20250506201127.4188369-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 20:11:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216082

This makes it build for all architectures e.g. riscv/mips/ppc etc.

Using clang-native to build all variants of recipe makes it easier to
handle compiling with various distros choosing different runtimes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix builds when using clang as default system compiler

 .../recipes-devtools/clang/compiler-rt_git.bb | 29 ++++++++++++-------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index 93928541273..a0f9c769a06 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -32,15 +32,15 @@ DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-native clang-crosssdk
 DEPENDS:append:class-native = " clang-native"
 
 # Trick clang.bbclass into not creating circular dependencies
-UNWINDLIB:class-nativesdk:toolchain-clang = "--unwindlib=libgcc"
-COMPILER_RT:class-nativesdk:toolchain-clang = "-rtlib=libgcc --unwindlib=libgcc"
-LIBCPLUSPLUS:class-nativesdk:toolchain-clang = "-stdlib=libstdc++"
-UNWINDLIB:class-native:toolchain-clang = "--unwindlib=libgcc"
-COMPILER_RT:class-native:toolchain-clang = "-rtlib=libgcc --unwindlib=libgcc"
-LIBCPLUSPLUS:class-native:toolchain-clang = "-stdlib=libstdc++"
-UNWINDLIB:class-target:toolchain-clang = "--unwindlib=libgcc"
-COMPILER_RT:class-target:toolchain-clang = "-rtlib=libgcc --unwindlib=libgcc"
-LIBCPLUSPLUS:class-target:toolchain-clang = "-stdlib=libstdc++"
+UNWINDLIB:class-nativesdk = "--unwindlib=libgcc"
+COMPILER_RT:class-nativesdk = "-rtlib=libgcc"
+LIBCPLUSPLUS:class-nativesdk = "-stdlib=libstdc++"
+UNWINDLIB:class-native = "--unwindlib=libgcc"
+COMPILER_RT:class-native = "-rtlib=libgcc"
+LIBCPLUSPLUS:class-native = "-stdlib=libstdc++"
+UNWINDLIB:class-target = "--unwindlib=libgcc"
+COMPILER_RT:class-target = "-rtlib=libgcc"
+LIBCPLUSPLUS:class-target = "-stdlib=libstdc++"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[crt] = "-DCOMPILER_RT_BUILD_CRT:BOOL=ON,-DCOMPILER_RT_BUILD_CRT:BOOL=OFF"
@@ -52,6 +52,13 @@ HF = ""
 HF:class-target = "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', 'hf', '', d)}"
 HF[vardepvalue] = "${HF}"
 
+CC = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+CXX = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+BUILD_CC = "${CCACHE}clang ${BUILD_CC_ARCH}"
+BUILD_CXX = "${CCACHE}clang++ ${BUILD_CC_ARCH}"
+LDFLAGS += "${COMPILER_RT} ${UNWINDLIB}"
+CXXFLAGS += "${LIBCPLUSPLUS}"
+
 OECMAKE_TARGET_COMPILE = "compiler-rt"
 OECMAKE_TARGET_INSTALL = "install-compiler-rt install-compiler-rt-headers"
 OECMAKE_SOURCEPATH = "${S}/llvm"
@@ -72,7 +79,7 @@ EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
 
 EXTRA_OECMAKE:append:class-native = "\
                   -DCOMPILER_RT_DEFAULT_TARGET_ARCH=${HOST_ARCH} \
-                  -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH} \
+                  -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
 "
 
 EXTRA_OECMAKE:append:class-target = "\
@@ -89,7 +96,7 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
                -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
                -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
                -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
-               -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}${HF} \
+               -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
 "
 EXTRA_OECMAKE:append:powerpc = " -DCOMPILER_RT_DEFAULT_TARGET_ARCH=powerpc "
 

