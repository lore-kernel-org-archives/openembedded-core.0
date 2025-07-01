Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3ADC83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 21:18:58 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.8521.1751404730348768457
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 14:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bMw4JTjq;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-748e378ba4fso8309326b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 14:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751404729; x=1752009529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anmPpmshf+fYxMVoVXjF6GBfiyHkpra7JHyMNybJThk=;
        b=bMw4JTjqOJjIui3MI1XlCeQeOyLxkEjS+NGwllgHQZUPYSF8qvN0JdjSTOjHuuVQq3
         zKJHvrXCUAWfFmpUIQs7oJiCA1pwLT5ZKV3AvhOmbh3nISJ6LwTCkJ5mW9ZS1zCtbKgE
         AAPmftnVPIL/XXG2n9/xI2zEwoRfvx30Du54RSyftdRRNQ0MWyt3Mpx50XB1AX9kE2b2
         8An2S9v0CKDYjgQ4zgaunrLaqu7T9k8E8o/XAxKza+u8rQiwGGLP8QgR/oAYNcfTjoBH
         PWiDg09hn9ibD2MiGhZt9JgDqbPr1VvXQU8kEFfd/mR6+inwpnGdmr2suBXP++XMpGmF
         yXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751404729; x=1752009529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anmPpmshf+fYxMVoVXjF6GBfiyHkpra7JHyMNybJThk=;
        b=gmjeH933BdU9gnDekF/umFvxAAecMBwvnmMA4khIm6fV+gfilxWrgi0oTG12ESIl4w
         KwO1XYTSaiVDLxpGuma7B9LJ+/3ljIYfZ78QOWTQczTNjYxWtxyE0jicMYkD2h3QHQI3
         1KpYJAi+bvDUOuZDaL9GVKM1vFLH3rOsZv/iMiw8QctF1eopLjISbhH69ZZAW9UFaOCa
         Z3bUASXKRoblMmCUIOfYJKBrIdDBYGBk0dAtCdP4MUNGjAo4IXqKhYviJ/7xnRVooNhO
         S9aX7evkXKwKxV36jNmcqdaFGdmYruLiisfrfq8mwECrn1FE2m3Rf8ED1Qu0S0Lfqnog
         6Gsg==
X-Gm-Message-State: AOJu0YwO4Ydk/7ghihwbmDX60wZI9yr20qLcbHkUeDDigviSHRYTCxPn
	eBXvkOU3HAmlolW9FYdfx5X6z937cCDXap0TfBQJyoifslzLuRzHSHLsR/c0DdJJ
X-Gm-Gg: ASbGncvr6GuBhyCst8kceSq03XfB8FUZLttXi7V1U3asUpVSxsKBHuFwoAnaT27nSYp
	BPsPwhZVmd2I+rVcjgkYO09voFDmiGy0FdOtG6uFUv1PAWVDz5P2aDM09pa7uELmoMxUy7iiZ0x
	8lcWp14BehGopLR/22rzquHBZ7evcJ4ujJ79w7PW5wKAzR2pUdFWIp37YbLwLDgLit5A6/17/wK
	Z2DFzErSMR+oOHF0O1tHFipD63ij/viBeUkbJewjAcNEA6R4g6rCdBKRW20ZIGi8TZbNL8H+YSw
	FUcDmGvWYmwPP5430fn8to+qO+N7IwjfBi8IzU3wTOek0j900q+6pQ==
X-Google-Smtp-Source: AGHT+IFSMVkTYms/ioiB7679Y0KDGlzsmvsnhSu02PUG7zEHGQKFnmwYdPpqIFlbZeGNNrzTHY0YhA==
X-Received: by 2002:a05:6a00:18a7:b0:736:6043:69f9 with SMTP id d2e1a72fcca58-74b5126bd1amr437376b3a.19.1751404729466;
        Tue, 01 Jul 2025 14:18:49 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ef669sm12116095b3a.158.2025.07.01.14.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 14:18:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 4/4] compiler-rt,libcxx: Use clang for native versions as well
Date: Tue,  1 Jul 2025 14:18:43 -0700
Message-ID: <20250701211843.3960784-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250701211843.3960784-1-raj.khem@gmail.com>
References: <20250701211843.3960784-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 21:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219728

Set TOOLCHAIN_NATIVE for using clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb | 1 +
 meta/recipes-devtools/clang/compiler-rt_git.bb            | 1 +
 meta/recipes-devtools/clang/libcxx_git.bb                 | 1 +
 3 files changed, 3 insertions(+)

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
index ff6cc29bf32..2c4ac44ba45 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -58,6 +58,7 @@ LDFLAGS += "${COMPILER_RT} ${UNWINDLIB}"
 CXXFLAGS += "${LIBCPLUSPLUS}"
 
 TOOLCHAIN = "clang"
+TOOLCHAIN_NATIVE = "clang"
 
 def get_compiler_rt_arch(bb, d):
     if bb.utils.contains('TUNE_FEATURES', 'armv5 thumb dsp', True, False, d):
diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
index f5bf17f30ae..7293ef4411a 100644
--- a/meta/recipes-devtools/clang/libcxx_git.bb
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -55,6 +55,7 @@ LDFLAGS += "${COMPILER_RT} ${UNWINDLIB} ${LIBCPLUSPLUS}"
 CXXFLAGS += "${LIBCPLUSPLUS}"
 
 TOOLCHAIN = "clang"
+TOOLCHAIN_NATIVE = "clang"
 
 OECMAKE_SOURCEPATH = "${S}/llvm"
 EXTRA_OECMAKE += "\

