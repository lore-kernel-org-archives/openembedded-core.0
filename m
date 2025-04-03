Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA54C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 05:23:48 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.6465.1743657827616124151
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 22:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D4OPENJ3;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so445579a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 22:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743657827; x=1744262627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bpyt9XjFb/4kQns8XVO+XfRpfTs1Hu9VdAYoxxZbszE=;
        b=D4OPENJ3wEJjEyJenK2N89sJmnZPEkqdU2520cqMTGVG9Yy6bxrHUXN1H9iAHSh9tK
         fwOp79EFwih3ZxwipBL9EAubLXKp5Y9eJcuQUXKRrVM+p7qdjMH4qwqhrEJTp98+KQXG
         i3JsZBlDn8zWW6ZKNC8heAQpzDGRGQXq7KUqcvtVclZoXZJUJpXETSlueIkg9vRSa0px
         iet4b+R1iU9x8If9sGnJ1K/gVj29Q4fPoZ+N5Gr6pPHgjD9zEMdNvNR4mATcWbDZHx+E
         tpbzP9J+MBN3mvYeMErB4GwlYH7oHn/uyeYeSfZkjIk8mAxH3tDKPnEJ7zk2zFTuIHjQ
         9bGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743657827; x=1744262627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpyt9XjFb/4kQns8XVO+XfRpfTs1Hu9VdAYoxxZbszE=;
        b=kEvyMDNktzhDmkf74Tio9hKWDfqMHEZI5fw2nj+rZWqVyDNqwXdoyaTO8FLhQlLa9p
         8lVuI1Il5ZpUYDgqnrwH3zuAI43X4a7Bqj7Azl8oZB/ZN4s+uqQ4AGrbQr8xkC7gOYwO
         AjlNy7txIFWodFK+CnqhDMcsQhtiIOK/gDj2xDp3RZ7IknHxmrD+RB99JJK1box7j2Pi
         va/pZFZZEcQW5c9rIhNLyrtPG3SHvi0b1KmIFg6wuo0EMMDCfcpeWsdRiky7btDXsbZz
         tUtcrxaIExMaEyn0lfNm6Lz7in5jF2r5V5iGEVlI2XuhaBiYAehDtHKuP2EfQD6CqHs9
         D8jQ==
X-Gm-Message-State: AOJu0YysRi661EqhjJj4QK7GqmPylGZjeDEhkbzlrw9Hp6eM39CiI4fu
	VkHcNV6zfHJ1+iZFkPHo9m3hsQOiIvqlvfjwVTZIausuN+TEZHEy/7W5c3Nz
X-Gm-Gg: ASbGncuSQY86KwAEzN/PfNQ6IGLoR5OS4NJ6DhOPhAzfvhiPfCFs3DBbqpNR/dE3qBZ
	GRBbVz/Ut8JFrqgB4bkCH6HeVQwOaFbNHPxGqwj9HEbVTySLmrkv28UHZ7HHUgSqi8dLkm4MeYs
	JDWPsT62ei8aDGVNmCaJw/nEbfxd06vtgOPetRdtacvZuMYhFiwj+ib+RujWcl2kcjKYYHhAT7W
	aIKi0P0rYiHGkBcPKilvukwqeAjakvBq5AmHtEjRla4QaYHN4+vkI+EPZUqZCTNknkRCtma8Odq
	T1cVdSijUIxrNlQWZJtNPAJmnpT7LX9mAS/6
X-Google-Smtp-Source: AGHT+IEE9TUH8V5q37zzvOtLlZ882nttXsXLIpe8+Gz+ytj+jhVqUs1tmwZ0vuUdpiys6ruyHiQd5A==
X-Received: by 2002:a17:902:c950:b0:226:30f6:1639 with SMTP id d9443c01a7336-2292fa0f3b2mr245497365ad.51.1743657826486;
        Wed, 02 Apr 2025 22:23:46 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::78d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c016asm5511825ad.62.2025.04.02.22.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 22:23:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] rust-llvm: Disable benchmarks by cmake options
Date: Wed,  2 Apr 2025 22:23:43 -0700
Message-ID: <20250403052343.3916330-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 05:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214299

Drop patch to exclusively disable it in code
It seems to be fixed upstream [1]

[1] https://github.com/rust-lang/cmake-rs/pull/158

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0003-llvm-fix-include-benchmarks.patch    | 25 -------------------
 .../recipes-devtools/rust/rust-llvm_1.85.1.bb |  2 +-
 2 files changed, 1 insertion(+), 26 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm/0003-llvm-fix-include-benchmarks.patch

diff --git a/meta/recipes-devtools/rust/rust-llvm/0003-llvm-fix-include-benchmarks.patch b/meta/recipes-devtools/rust/rust-llvm/0003-llvm-fix-include-benchmarks.patch
deleted file mode 100644
index ff31c0bc323..00000000000
--- a/meta/recipes-devtools/rust/rust-llvm/0003-llvm-fix-include-benchmarks.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Subject: LLVM_INCLUDE_BENCHMARKS with llvm 14.0.1 failing to build
-
-https://github.com/llvm/llvm-project/issues/54941
-
-The LLVM_INCLUDE_BENCHMARKS is turned OFF to fix the build error as
-per the discussions in the above link. We will work on the issue and
-replace the workaround with actual fix once committed in LLVM.
-
-Please refer the following link for more discussions on the issue:-
-https://github.com/rust-lang/rust/issues/96054
-
-Upstream-Status: Pending
-Signed-off-by: Pgowda <pgowda.cve@gmail.com>
-
---- a/llvm/CMakeLists.txt	2022-04-22 00:45:30.543445478 -0700
-+++ b/llvm/CMakeLists.txt	2022-04-22 00:45:42.095232974 -0700
-@@ -615,7 +615,7 @@ option(LLVM_INCLUDE_GO_TESTS "Include th
- 
- option(LLVM_BUILD_BENCHMARKS "Add LLVM benchmark targets to the list of default
- targets. If OFF, benchmarks still could be built using Benchmarks target." OFF)
--option(LLVM_INCLUDE_BENCHMARKS "Generate benchmark targets. If OFF, benchmarks can't be built." ON)
-+option(LLVM_INCLUDE_BENCHMARKS "Generate benchmark targets. If OFF, benchmarks can't be built." OFF)
- 
- option (LLVM_BUILD_DOCS "Build the llvm documentation." OFF)
- option (LLVM_INCLUDE_DOCS "Generate build targets for llvm documentation." ON)
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb b/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
index 12d7b2f1817..2ba37f0784a 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
@@ -10,7 +10,6 @@ require rust-source.inc
 
 SRC_URI += "file://0002-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
             file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-            file://0003-llvm-fix-include-benchmarks.patch;striplevel=2 \
            "
 
 S = "${RUSTSRC}/src/llvm-project/llvm"
@@ -50,6 +49,7 @@ EXTRA_OECMAKE = " \
     -DLLVM_INCLUDE_EXAMPLES=OFF \
     -DLLVM_BUILD_TESTS=OFF \
     -DLLVM_INCLUDE_TESTS=OFF \
+    -DLLVM_INCLUDE_BENCHMARKS=OFF \
     -DLLVM_TARGET_ARCH=${TARGET_ARCH} \
     -DCMAKE_INSTALL_PREFIX:PATH=${libdir}/llvm-rust \
 "

