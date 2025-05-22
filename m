Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC22C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 19:02:01 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.31596.1747940519741839382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 12:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DnrA92Qe;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2301ac32320so89153235ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 12:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747940519; x=1748545319; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lqe+qh24FXVRjutE8OlQN3NzdjN3eVOIJ4PJr3lzdas=;
        b=DnrA92QeqtPRsm/pIDnDv9NNLS0CwLjwCHo7mN4aSbX0JlAdOcbZGAoCEantlExCou
         GChCR6nr5MrVu/QR6p+yy4iBKJH8t8aw3LzizVRYjQnZ4TH37qOiRavtQWnZRr9IkPoI
         VauDpkx56MOPemHmOpG+ag/hT0rKxkzAatOcp6Y6HKPxai0vEyvUJJku7GUxTl5BbHCB
         Y2N4jm8ICTnPy54Fo3j/N0nKH7R8AxoqviI2GeGzOa6GCnwjKY2CPbxRXe8Y0oxB1dDk
         OuL1AlfiaVHg4kd6IpMe73KQnLM4nHjRZXjRpvk9JWF3uGFqaQOgs5Ha0lKSdZoGWnqx
         tTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940519; x=1748545319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lqe+qh24FXVRjutE8OlQN3NzdjN3eVOIJ4PJr3lzdas=;
        b=g0+ks9jCmNkn1mg2HvYUqcSpGdu6xPeKqOYd+FlvmxngtXkfs72OpxW+2YGNsow9P+
         E3tqtVa6IsnplI2umCOX3+yo4re5gnJ0d05ZFnpoSUiSqr4FqERpaiKIxKAL+9Bk4qBD
         z0L4mvqZSTa+0tu+XqTg8z4Rg4IzoB2/lJh6YGrH42EUIzL71EskXo9KRPJj1KoyhmBx
         QsXlUy31fP2+SfM1njTSORNqH/BNb/5BFBcX8Ohl5sClrzBeFPX8VwS6PmSFWjWLymbn
         eXdeLxNtGBRrnRigd1chlImnnOY0ZrE5oDCQiHPbUYuUZH9tHcGh0aWuD6hL1i+elN/N
         3OhQ==
X-Gm-Message-State: AOJu0YxZzoGb9TU+D72p8M7mriPT7GubBddIkWjwbqL6EVKP7YLVWxir
	MwfNWCyYE2vN0ZsypKgtKK8/qJgoPKZIxWYwNjmr+tYndcodw6+LScJHC+meGGmI
X-Gm-Gg: ASbGncv1o8LlXcLCc0aiF/KW+xpKyEPwyyGEovDkzKHro1pqJFPyR6qIbBsPHTJ8AXX
	uWgp84QV1kj44kQ7PWqm0jZJqffT2llMD6F167sLRtJ2XASIrvl/FFe/x67FXsZgUnI6QbD6hma
	GzMYndQ6BNHJ3i+rP3nikNMxp/7OonzQeVChges5q2LLmd+knz/slARk+elqlS5Nbu4J4c3Pgv+
	YtYiuBSFpOA+USP2hKiksLerK7Hy8Kchq1RT/zprqLiQ+Sno9P4tztBClYAYUbL+V4W6YWUbjbq
	TqrAM4vrvDdXXwntWEO5n92bOWY4aThYvOeh1t+lTpk=
X-Google-Smtp-Source: AGHT+IHQ/padIQzX3d4J9O3CR3RdJzf1zI/atKYJBPQksLoxw8ds++lEXBSd0yWxEF/XBZaf6L7mhA==
X-Received: by 2002:a17:903:1ace:b0:231:c90e:292d with SMTP id d9443c01a7336-231d45af19fmr409316995ad.44.1747940518791;
        Thu, 22 May 2025 12:01:58 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5f56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adbfcbsm112238895ad.75.2025.05.22.12.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:01:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] rust: Fix build with clang/musl for aarch64
Date: Thu, 22 May 2025 12:01:55 -0700
Message-ID: <20250522190156.731992-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 19:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217146

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...bunwind-cross-architecture-unwinding.patch | 31 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0001-Disable-libunwind-cross-architecture-unwinding.patch

diff --git a/meta/recipes-devtools/rust/files/0001-Disable-libunwind-cross-architecture-unwinding.patch b/meta/recipes-devtools/rust/files/0001-Disable-libunwind-cross-architecture-unwinding.patch
new file mode 100644
index 00000000000..f21c9d6c08b
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0001-Disable-libunwind-cross-architecture-unwinding.patch
@@ -0,0 +1,31 @@
+From ecc0a33b49d46a657ddf2ecd2c6ebb0b95eead45 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 21 May 2025 18:47:09 -0700
+Subject: [PATCH] Disable libunwind cross-architecture unwinding
+
+Building with _LIBUNWIND_IS_NATIVE_ONLY disables code for cross-architecture unwinding
+It also enables some additional code that handles PAC-specific unwind info
+it helps compiling with the -mbranch-protection=pac or -mbranch-protection=standard flags
+
+This fixes build with clang/musl on aarch64
+
+Upstream-Status: Submitted [https://github.com/rust-lang/rust/pull/141375]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/bootstrap/src/core/build_steps/llvm.rs | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/bootstrap/src/core/build_steps/llvm.rs b/src/bootstrap/src/core/build_steps/llvm.rs
+index a3788197471..b45e6a9b2f9 100644
+--- a/src/bootstrap/src/core/build_steps/llvm.rs
++++ b/src/bootstrap/src/core/build_steps/llvm.rs
+@@ -1454,6 +1454,9 @@ fn run(self, builder: &Builder<'_>) -> Self::Output {
+                 cfg.define("_LIBUNWIND_HIDE_SYMBOLS", "1");
+                 cfg.define("_LIBUNWIND_IS_NATIVE_ONLY", "1");
+             }
++            if self.target.starts_with("aarch64") && self.target.contains("musl") {
++                cfg.define("_LIBUNWIND_IS_NATIVE_ONLY", "1");
++            }
+         }
+ 
+         cc_cfg.compiler(builder.cc(self.target));
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 82d28cf09f4..6cb08b7c382 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -9,6 +9,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
             file://Zdual-proc-macros-additional-check.patch;patchdir=${RUSTSRC} \
             file://0001-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch;patchdir=${RUSTSRC} \
+            file://0001-Disable-libunwind-cross-architecture-unwinding.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "b1fbf809efe9f036939401e142631c201a53bcf43ec1696bd9f5290ba236a266"
 

