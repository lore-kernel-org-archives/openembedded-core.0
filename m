Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9259C8303C
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 05:32:31 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.16694.1751434345576669036
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 22:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E+T+/oV3;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235a3dd4f0dso40085695ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 22:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751434345; x=1752039145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4De4DZCX7CI8/PjQHYBc9xmmIfZwJI41VJFne5PB+M=;
        b=E+T+/oV3MpzqUtIPkD/rWu5nufYdERYAIvsGP/LB6ihc1cXm2j09WGhwKhd48ZVVvO
         BS2xYkYoiGGTi7RtZwR7k+hUINPlmVl2cZQQq9U1Zmy/YIuRkuo1h80apNIGB8pgXfKW
         b4578y3trrFuMvi3NmhAm0WY+FrtueIdBBjH8IZCIPq6TxwbEyxtjsIYpaT6m7ZHQ0uS
         GeVtDkIZckFfwvaDtvvlDP4CwXS2wsv9/uOXdrRtXeDTNo1nOqj4cU/Ml+Lk1+XinYxQ
         l4djJmQpgx0WgxEhnrXVHu+dKn1jEVp3sUt2YoNz2FRED9eCgr6Obeu9Bw9cW14RDT+A
         RpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751434345; x=1752039145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4De4DZCX7CI8/PjQHYBc9xmmIfZwJI41VJFne5PB+M=;
        b=k1eBlvWrm7WTlscnb6Vo4YKAZd02Mt1I7LItKkvAAMpOUGtRUF8KcTJqgG8xlpYVT1
         agA0bvvoyDK0kD4+tBrP7Wi8mZDI4i9g4BJsqBBnshzQGnxf213UkNcmiO9k2BDrwDXG
         Vg2JLcbWsVcwYaluj/KtfO6Qr0XR95RViYP9MY3XyIW1UbfY0BpemT9aY7f/IGS4IGAs
         u195b3v6WRkRxJ+AwwO29jaoR242wRf8GcKcF6RkzuG5iflv4tDCwcXuvUEqyE77Vqgd
         hhGIhFawDTC5Fw7l97xChqG2UbJehOKnJsr/YTSP+aD14U8wrqH6SXKROtM1/PC6bFUT
         DIxA==
X-Gm-Message-State: AOJu0Ywck0C7jtX4OwvGQLvtKRRkimKCGHtUIJCC8oqy9PmTfCu2W2pJ
	ZZBtgRGpDIVgZ+az/NgXBJxVjD6EzHTa9FaxhMf+w36geBFOpN784W81cjcDFtcZ
X-Gm-Gg: ASbGncvV/2J2SVEnlduW/3SPevzNXKIGD8P9VxEuma8iKGU7E/1+jYifTPWtDi1YEUE
	sAFlzDPY7Y6qSWfpbjIArNNOhGH4Fl484/Ookipz3YzHeThZeGZB6oKwEGoPI5WUQ9EkiHoB00E
	VK8qYM871G3WnGZH4wWxZNpIBieQ9QiRtmwgrI0fkcdIIb0FIqQpjkntiuDLBEd9LCMELBuZDBU
	hV3s1Q+AtV/SxgMgm09GBFQr8NXsPL2bBpeXdo9C7IIbO9LN1cn0snpj/WtvlWLnb93DOglymWo
	HsOMSgYMyrSPPHP1sU6qe9PK2/lzVFxTfdZKnk8/pSImRA5aXU422A==
X-Google-Smtp-Source: AGHT+IH9ntDdq7QN16jLuKFQZchDZq2+NIP8nt8cT6bnuLnQYtLWU1k+ZYcI0SFa2gudjro0w18A5Q==
X-Received: by 2002:a17:902:d592:b0:220:ea90:191e with SMTP id d9443c01a7336-23c6e4d3362mr19914665ad.4.1751434344633;
        Tue, 01 Jul 2025 22:32:24 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e2423sm120125985ad.37.2025.07.01.22.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:32:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 3/5] compiler-rt,libcxx: Use clang for native versions as well
Date: Tue,  1 Jul 2025 22:32:18 -0700
Message-ID: <20250702053220.4104358-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702053220.4104358-1-raj.khem@gmail.com>
References: <20250702053220.4104358-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 05:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219776

Set TOOLCHAIN_NATIVE for using clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb | 1 +
 meta/recipes-devtools/clang/compiler-rt_git.bb            | 2 ++
 meta/recipes-devtools/clang/libcxx_git.bb                 | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
index 47438014b23..087a7663023 100644
--- a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
@@ -37,6 +37,7 @@ CFLAGS += "${COMPILER_RT}"
 CXXFLAGS += "${COMPILER_RT} ${LIBCPLUSPLUS}"
 
 TOOLCHAIN = "clang"
+TOOLCHAIN_NATIVE = "clang"
 
 DEPENDS += "ninja-native virtual/crypt compiler-rt"
 DEPENDS:append:class-native = " clang-native libxcrypt-native libcxx-native"
diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index ff6cc29bf32..c7bf38c33d2 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -29,6 +29,7 @@ DEPENDS += "ninja-native libgcc"
 DEPENDS:append:class-target = " virtual/cross-c++ clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc gcc-runtime"
 DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-native clang-crosssdk-${SDK_SYS} nativesdk-gcc-runtime"
 DEPENDS:append:class-native = " clang-native"
+DEPENDS:remove:class-native = "libcxx-native compiler-rt-native"
 
 # Trick clang.bbclass into not creating circular dependencies
 UNWINDLIB:class-nativesdk = "--unwindlib=libgcc"
@@ -58,6 +59,7 @@ LDFLAGS += "${COMPILER_RT} ${UNWINDLIB}"
 CXXFLAGS += "${LIBCPLUSPLUS}"
 
 TOOLCHAIN = "clang"
+TOOLCHAIN_NATIVE = "clang"
 
 def get_compiler_rt_arch(bb, d):
     if bb.utils.contains('TUNE_FEATURES', 'armv5 thumb dsp', True, False, d):
diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
index f5bf17f30ae..d355fc3a0f8 100644
--- a/meta/recipes-devtools/clang/libcxx_git.bb
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -25,6 +25,7 @@ DEPENDS += "ninja-native"
 DEPENDS:append:class-target = " virtual/cross-c++ clang-cross-${TARGET_ARCH} virtual/${MLPREFIX}libc virtual/${MLPREFIX}compilerlibs"
 DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-crosssdk-${SDK_SYS} nativesdk-compiler-rt"
 DEPENDS:append:class-native = " clang-native compiler-rt-native"
+DEPENDS:remove:class-native = "libcxx-native"
 
 COMPILER_RT ?= "${@bb.utils.contains("PACKAGECONFIG", "compiler-rt", "-rtlib=compiler-rt", "-rtlib=libgcc", d)}"
 UNWINDLIB ?= "${@bb.utils.contains("PACKAGECONFIG", "unwind", "-unwindlib=none", "-unwindlib=libgcc", d)}"
@@ -55,6 +56,7 @@ LDFLAGS += "${COMPILER_RT} ${UNWINDLIB} ${LIBCPLUSPLUS}"
 CXXFLAGS += "${LIBCPLUSPLUS}"
 
 TOOLCHAIN = "clang"
+TOOLCHAIN_NATIVE = "clang"
 
 OECMAKE_SOURCEPATH = "${S}/llvm"
 EXTRA_OECMAKE += "\

