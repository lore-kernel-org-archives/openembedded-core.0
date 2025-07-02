Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A19C83F03
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 01:56:00 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.13685.1751421357775527959
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 18:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V7cwuneT;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23636167b30so36350445ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 18:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751421357; x=1752026157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4De4DZCX7CI8/PjQHYBc9xmmIfZwJI41VJFne5PB+M=;
        b=V7cwuneT7q0R89IS/VCo7IVd7jC5BpnrpkBGUGX/U2Y4OGOFgwqWE7i0rmi99GcQ4R
         oinjSSEz/2jJ0ajD/IDrKq4oG0IokV7avpWBvQPLylqJkWro2OYoC8C0lrpRXyxjvH69
         56FjP0r8Eu0BqtINKCST0VdcLapSkPbcQvPU9fnQX2kwjLesDlDvYzrWvNXSJ2E9q1jn
         FgsGS9F8jS1gf45UxUig7JxEjr72T3TuqD1mlvs7AZyiSTOuFmca8t/A/Vl4u6VzUC9r
         Y++uTVA8xrBjynZhjNCfseSsNV6vXhxCSlPl3Ef/3GfFdYNhbfFHvF260CS6/N9cUp7n
         VS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751421357; x=1752026157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4De4DZCX7CI8/PjQHYBc9xmmIfZwJI41VJFne5PB+M=;
        b=KdA1BdF51lzsj3jVYr0nkbMQ+GfyxQJ7Fe+ckG0AxK2o5YxfcR1/skQUfn4YkSosEE
         1b/i5zAbP0xh8lYPzT0d2570Oe5gRSL+bnotY0n302C2xxKTX6Bhd/A+bFJXx2BPKUD4
         NbPsz6iUbvN9g3HjeKDOrnK/kNBtz8oizPQBFXmp56zxuBKKLFARrT12MKUEDTZPiZrM
         0unBFuFrIICQKIZFSCRkIGvC14glWW6qpJFyQIklXZ/cYqBFKIoZpikMoRSnDA9N1yGl
         jOadLM+Pvk5U0OZoBwMSklPjl+fC+JPfol/LCLauaxJvVswoI88UPoEabWJFqdgDjG7O
         FWrw==
X-Gm-Message-State: AOJu0YxKpwMi8MDNRxPGIf0GmpNY+9kENzrQ7bSpO7uI/xC0IlQqvKf0
	zA0dqVfx5eQcWPwEtk2a5nA8hbEJqQVom90cJMUbkru26qj/5tGLOVc0RmoySwu0
X-Gm-Gg: ASbGncsYA3gzcox8YJk5ysN9POlMnDkYTE0rZ27jcY2nvAW0Z9bIX4RH3QPMLNskdPY
	NbUav8YtISJS0Rh4lFtuXccWtQWO20pL2pjdZJ63Gi7RZ6WEoEvr0GvqBp02CH6xYUlZFlx+8S2
	xvrRs0ESO7+P5oJMb9HEH3znQcq7uZpcvCkQz+R7Xq7aJQ1StzFBWh+xtTR33pJcFmK9hB/xtYF
	tbhDBr1FyTBxq42/HVWpYFrYpqhsoQl4OpJ8NxIw1hmjMKU/HmZHv+7+4BO8t1jZdYgL1/8VRjP
	lK6DZDGfB7AWSXAPf0s8chbkckPTnEtOxCJv9n6ywb3zgUf5jPYuatvHmV6DqbFp
X-Google-Smtp-Source: AGHT+IFHudaohhr/cJ4qzHTMqX6RkMmql6ptQJftBx9ZboSiumF1zpQU5ADSZkam0Thxl9RYqj5OUA==
X-Received: by 2002:a17:903:124a:b0:237:c8de:f289 with SMTP id d9443c01a7336-23c6e5708d5mr15329255ad.36.1751421356761;
        Tue, 01 Jul 2025 18:55:56 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e25c6sm114404595ad.6.2025.07.01.18.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 18:55:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 4/4] compiler-rt,libcxx: Use clang for native versions as well
Date: Tue,  1 Jul 2025 18:55:51 -0700
Message-ID: <20250702015551.1453616-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702015551.1453616-1-raj.khem@gmail.com>
References: <20250702015551.1453616-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 01:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219750

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

