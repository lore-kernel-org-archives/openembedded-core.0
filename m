Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C50C54ED1
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 03:01:34 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.7271.1748401288554556168
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 20:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c7lNQUKV;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-742c5f3456fso3210037b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 20:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748401287; x=1749006087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8+wUCKsOitW+Ao1EE7m3oo/FiWk1ccMtqbN0Q6irgoY=;
        b=c7lNQUKVfl7LQABqDQ7ByrYHgLkwBt14OBQjVL5oNUBdzLe0lV0+R2VVYAdaVZMJPv
         KU9xkXF65+7SkAv0lFIS/TrEVaZ4uSqe6Um6X9LqrZzKzQ6KgXSPIyKppKp6zNsBWeYv
         rfKx2P4Jx2GIGIs2813/Y4U8fxEWiyPYVUztf6Q9RWfF5XKnvZ9uVM3V2YFz5WDmPnhe
         mSayyLDeh+TuSw9rlCyaTrY6wVcRHo0OmLLLz4Hb+beW4+3H9LMDaVVXRmx/cpoXxoww
         5UJcVgyv1DjNsoxe3WO3te6Rhik4G4PhF15RVXEqrpZhTDlJjF049it0llItpL9Gl4H0
         NwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748401287; x=1749006087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+wUCKsOitW+Ao1EE7m3oo/FiWk1ccMtqbN0Q6irgoY=;
        b=oVosSouzlNFpigkHNIb04FPl3khQSp2F1ePpEdq/0T1Ck1q9SRbWUjQXMB8cL3CN63
         tTfzGx9uPm5hYqyvkRiJaRxuDG4FzYlF0hLHiN2JkWqS07klA8ffHtT+rHuTgd/7LdjP
         0PonbnA8Oc3ga8TTF5//gOmCKh0WlOxx41CZ0rgNIayM+KW20QPi4dqfLUVegQvGEc8k
         OToM0tzTmIIu8x8aBQ474g/x9GNgDQAGgLZR9WV0nPph0ECniFbQZzjhrIlN6DsUC8D/
         PJ5/ih4mV4Tv2DppuNPwmwthvEtLwwBuQstWNNafQdOcLmZ/eILz2xOUi1GUzutlIAHt
         klsQ==
X-Gm-Message-State: AOJu0Yxj9puFSu/8SS1NriJUtjy2tdwHr/jqruAW4ncW5YrUg8j5w1gX
	lRX6xSGvhuBtGJWvIGKTnLKigoqPnKXBGckOvHyxaGAMOlHbqr0bdSF88sQkaxB9
X-Gm-Gg: ASbGncsiqSHICTxnnvZXfI9vQWG0BKZPmBrxxPl5jncGbnAyrycB0P6YvwpNXvoca1T
	bI9JbB2xGtUaCsXoj2H18kakEQ3esNwqsRWXuo3EReEG76hBG0Z2O5EePh7fXaxqlcFXMtp41R1
	PusZHEd9T4rlflk4dy2W1NQ3syqHUJHnmrP2/zm6ey5UGqHaLPXhXb8gCDIEIDlaQugXrzHbTt/
	9y+q0GQtAVB9vEPzwO69eAMwPS0sU2WDGHGbioMQQt3e2YsTr5WB+M03ea6JpMEFqm9Yf2BqErX
	xNJaENDcU2VcR5G6Typ2Ey/gm2DkEUmcaI0i9mqF9jsQyhCHJSNf8g==
X-Google-Smtp-Source: AGHT+IEBkeiIZ4hiKMtRY9PTCa+CEwJoysBv+I7xxOypOTY8pqOkZbUHHhXqjDVqcfhp8Ct4TA/vvQ==
X-Received: by 2002:a17:903:2f4e:b0:220:d257:cdbd with SMTP id d9443c01a7336-23414fe55a6mr264301305ad.48.1748401287480;
        Tue, 27 May 2025 20:01:27 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::deb9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d2fe3fa4sm1661665ad.75.2025.05.27.20.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 20:01:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] rust: Disable cross-unwinding support in llvm libunwind
Date: Tue, 27 May 2025 20:01:24 -0700
Message-ID: <20250528030124.2645808-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 03:01:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217329

This is default in LLVM but rust does not use cmake to build itself
so it needs to replicate the behavior

Fixes rust build with clang/musl for aarch64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Apply the v2 of upstream submitted patch

 ...bunwind-cross-architecture-unwinding.patch | 46 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0001-Disable-libunwind-cross-architecture-unwinding.patch

diff --git a/meta/recipes-devtools/rust/files/0001-Disable-libunwind-cross-architecture-unwinding.patch b/meta/recipes-devtools/rust/files/0001-Disable-libunwind-cross-architecture-unwinding.patch
new file mode 100644
index 00000000000..4a282032eb2
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0001-Disable-libunwind-cross-architecture-unwinding.patch
@@ -0,0 +1,46 @@
+From 56b669cd7adcc413bb1e64c3d2d7c347a82ae35a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 21 May 2025 18:47:09 -0700
+Subject: [PATCH] Disable libunwind cross-architecture unwinding
+
+Building with _LIBUNWIND_IS_NATIVE_ONLY disables code for cross-architecture unwinding
+it is disabled by default in LLVM [1], replicate the cmake behavior in bootstrap process
+
+It also enables some additional code that handles PAC-specific unwind info
+it helps compiling with the -mbranch-protection=pac or -mbranch-protection=standard flags
+
+This fixes build with clang/musl on aarch64
+
+[1] https://github.com/llvm/llvm-project/commit/85624c5de3e831ffa01fdc2d159e3d69c30de08d
+
+Upstream-Status: Submitted [https://github.com/rust-lang/rust/pull/141375]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/bootstrap/src/core/build_steps/llvm.rs | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/bootstrap/src/core/build_steps/llvm.rs b/src/bootstrap/src/core/build_steps/llvm.rs
+index a3788197471..5e4a1c7d9f0 100644
+--- a/src/bootstrap/src/core/build_steps/llvm.rs
++++ b/src/bootstrap/src/core/build_steps/llvm.rs
+@@ -1430,6 +1430,7 @@ fn run(self, builder: &Builder<'_>) -> Self::Output {
+             cfg.flag("-funwind-tables");
+             cfg.flag("-fvisibility=hidden");
+             cfg.define("_LIBUNWIND_DISABLE_VISIBILITY_ANNOTATIONS", None);
++            cfg.define("_LIBUNWIND_IS_NATIVE_ONLY", "1");
+             cfg.include(root.join("include"));
+             cfg.cargo_metadata(false);
+             cfg.out_dir(&out_dir);
+@@ -1447,12 +1448,10 @@ fn run(self, builder: &Builder<'_>) -> Self::Output {
+                 cfg.define("__NO_STRING_INLINES", None);
+                 cfg.define("__NO_MATH_INLINES", None);
+                 cfg.define("_LIBUNWIND_IS_BAREMETAL", None);
+-                cfg.define("__LIBUNWIND_IS_NATIVE_ONLY", None);
+                 cfg.define("NDEBUG", None);
+             }
+             if self.target.is_windows() {
+                 cfg.define("_LIBUNWIND_HIDE_SYMBOLS", "1");
+-                cfg.define("_LIBUNWIND_IS_NATIVE_ONLY", "1");
+             }
+         }
+ 
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
 

