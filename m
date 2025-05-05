Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE384C3ABBC
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 04:15:23 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.42940.1746418521808355329
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 21:15:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cQURXccT;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so3191696b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 21:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746418521; x=1747023321; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xlxbvZNGHychsXf+SapiDk3re+J3axZeqtmznfgxJuA=;
        b=cQURXccTfN64DMR5KcChatjJ5Gwq/wEggpFZuvMrw2IQSmxSx7qQR/wGQpB0ivm8v7
         ZiHprnowk8oa+hG585bSoTii2V551U8/LdYFrb1an1bJPZ+EwQ46/3wakBgz470Oh/8P
         qDd6sRyiVaAAsLOsZKcVCrJs/qMFKRu/JsRyrXCo0b+M9OpZw20M1Vtll67o/3NNyE7+
         a+WNbH6YpFwy0msUkRxXk/kGJJAaov3N4PsJiZAvAOKAcKJkHqRd2ndu6KLoY9e8DztI
         C4xNeuUtFJb46EaeHI6yrCZvm/tx5hIWqBccNDeXq8sb/VgCLsmPESpGOvHUUYOsCAbb
         X3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746418521; x=1747023321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlxbvZNGHychsXf+SapiDk3re+J3axZeqtmznfgxJuA=;
        b=Lm3ZMJKhqXA8feTZmVSJSenaH7s+lvNEEt0/oSRbNwdd8knF6Hz/2rI59bCC7oLE7O
         x9WSRwNAt6JBmFH+KmfY+acn1RDxk3gYktoj2inBSCkpYrpE92RukLMFU5MxvpeBE/sL
         vEaiNvPuOSQudaD/8aMWFkXsYj+EGQNlxKwJJ0RLN7SQGeSj4p7I6BEJ7bM/8fvNmjvV
         S834TCfsNGNkUEupymwdiFFRUOPUSXM0B9bf0dvSQD0jVVCbUOu6hEzJHPmVFnRIMkV/
         8BixEzDjVF86mPGoVqecQb9ysRO1PzhczYBiiruxQnxfROmIhpbzOdjOSzR5DXUXGo6l
         z2cw==
X-Gm-Message-State: AOJu0YyzF+JIZXpPxt+md7h0LkfGwN1mcaEi0EOlfoyRGiBQh/31WuM/
	TU2seabvWvEz9W60V/B8QKP2sNoXoh3m7LLY+KG+Qz9EF4GEdP/V2Hc6knQj
X-Gm-Gg: ASbGncvzqAAGFL2zVbTKu4YTmM5kdqrX5yPK4wIrkX41o7p4Hp4S32NwnRDJiTtvW/h
	9msnsz/cF9aSSVzhOoJLYJj+j+XDn+OisUy0+JoyY2Oi+a4311zE1Cwdr/dMzuUz+EjRzxjSD5r
	1w0SLNkUMfOajydSUb7PgXbBeFm2f0UuFvi9XHRxOIJY8vFlsPY4spKI4gtCR+mmA9jBFNYIRfz
	cWTzIP3X/KzqOcUnMbHTZ8fUBCEaRDuONN8paZkVLVAelq9e8V8jGd/FGt8lEnqs7f+yksBf9/h
	9SOHZA0jcYApoDOtGV/FcBd5OaG+Ah4h
X-Google-Smtp-Source: AGHT+IHmvzHQeqBoON9Y9CAhvNn0ieKTl03GmqBJYr/AQWFfbSfshxWv2UEwqv0f8FMjXmk9xp3erg==
X-Received: by 2002:a05:6a00:1d8f:b0:73c:3060:d53 with SMTP id d2e1a72fcca58-740673f2459mr11069611b3a.18.1746418521180;
        Sun, 04 May 2025 21:15:21 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059021044sm5905039b3a.96.2025.05.04.21.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 21:15:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 04 May 2025 21:15:17 -0700
Subject: [PATCH v7 7/8] libcxx,compiler-rt-sanitizers: Add cflags to build
 with clang compiler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250504-clang-merge-v7-7-165be7b96180@gmail.com>
References: <20250504-clang-merge-v7-0-165be7b96180@gmail.com>
In-Reply-To: <20250504-clang-merge-v7-0-165be7b96180@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 04:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215983

We are using clang-native to build the native versions of these recipes
but we are missing the needed compiler flags to let it c/c++ runtime
appropriately. This also ensures that meta-clang does not have to worry
about the compiler settings for nativesdk/native pieces separately.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb | 6 ++++++
 meta/recipes-devtools/clang/libcxx_git.bb                 | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
index b3c4bfcffdc64ec7ab7f4361bba85fa15d2fc3ba..b987a5cc768e6951d877b2e7516eb58ae6465058 100644
--- a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
@@ -18,9 +18,15 @@ inherit cmake pkgconfig python3native
 LIC_FILES_CHKSUM = "file://compiler-rt/LICENSE.TXT;md5=d846d1d65baf322d4c485d6ee54e877a"
 
 TUNE_CCARGS:remove = "-no-integrated-as"
+COMPILER_RT ??= "-rtlib=libgcc -unwindlib=libgcc"
+LIBCPLUSPLUS ??= "-stdlib=libstdc++"
 
 CC = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 CXX = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+BUILD_CC = "${CCACHE}${HOST_PREFIX}clang ${BUILD_CC_ARCH}"
+BUILD_CXX = "${CCACHE}${HOST_PREFIX}clang++ ${BUILD_CC_ARCH}$"
+CFLAGS += "${COMPILER_RT}"
+CXXFLAGS += "${COMPILER_RT} ${LIBCPLUSPLUS}"
 
 DEPENDS += "ninja-native virtual/crypt compiler-rt"
 DEPENDS:append:class-native = " clang-native libxcrypt-native libcxx-native"
diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
index d2655d9da947a2e8c0eca451593cb0c0014a4108..f5987199ecf78900f82a0e568a51b97de875c86e 100644
--- a/meta/recipes-devtools/clang/libcxx_git.bb
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -49,6 +49,11 @@ OECMAKE_TARGET_INSTALL = "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "instal
 
 CC = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 CXX = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+BUILD_CC = "${CCACHE}clang ${BUILD_CC_ARCH}"
+BUILD_CXX = "${CCACHE}clang++ ${BUILD_CC_ARCH}"
+CFLAGS += "${COMPILER_RT}"
+CXXFLAGS += "${COMPILER_RT} ${LIBCPLUSPLUS}"
+
 OECMAKE_SOURCEPATH = "${S}/llvm"
 EXTRA_OECMAKE += "\
                   -DCMAKE_BUILD_TYPE=RelWithDebInfo \

-- 
2.49.0


