Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8AF7C87FCF
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 21:29:43 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.7478.1754602181209909616
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 14:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ejDksN+6;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2403ca0313aso12267385ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 14:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754602180; x=1755206980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MFyth78zRIMV3s7Su05uYVkB6Jds+6RfdJOpxfK9Svw=;
        b=ejDksN+6IydCiuCd4HXCkpLYdaAcDO2IGhN8uaL1cpVTiyK8GANshxJpPqF4iMoZ0j
         3TbrQoAiFo3bFy2JydEUEGFr5SjVAeaNg4QsHwjlWy77h5MiKEvwnYdwukrB+SSm6QAc
         cM0d5q3uY0h+FFJYmvbWG6PqBm8nKdoQZqpgI68Opou5Z08z1kuEASkN4b4MKatay8RY
         bUNq0wLbGfLkagNe3Ts33vCwYDLgUqfW4fWFFkH76mv3a47TtsRPxOwWoyvfuDBEhB/3
         pz09Nw3NazcpsScK2DHO/Sa1q5BrGlwvdBAJA/l6LDQFCowlMwTBNTknzBSyUqGyquDb
         c7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754602180; x=1755206980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFyth78zRIMV3s7Su05uYVkB6Jds+6RfdJOpxfK9Svw=;
        b=cyDr7VFoueR73bvUF/gs7X7vO7mhBv6GSDCfeyxkjmycPba/n2pgvVLeqzGTbSa6pQ
         QL1yE/zpZ9WMuqHRKdj2auJCq5oGgOYyM+4MtMyBK97C9UCRvU5Mn21Z/lpNLutQKKuO
         TDQkP96HVXi0EgWlDRfMvNmECX5SXdWZTRP59ZNLWfY1YaoKuBsRhG9siyIHCAGucNDX
         t0qu1VllBxFnCC62EBozS0s0YV2W21kTioGR3rUW9XEwU/v76PODaosmUpBrgWCkuW6G
         PMAyoizTPFeQ6i7bHNCkH2kj8wl9hFzcE3MoaJv6Oxyy2j1b1FDpWGBC1M/ewZW7Le6d
         K7ww==
X-Gm-Message-State: AOJu0Yycbx+HPt0ffy7brqzSl3Akqx77FbYCpCfrzlfJOgWwrj/SDJiQ
	7gIfrQWrbeVexhgjeEgA3b33uHhB/RxCgjcNHwJFXX6QW4asLxCuRDu5rX5KxEnOVSk=
X-Gm-Gg: ASbGncs1Rif5vYnRO81HKY9P8TTp82rtybWoPeVJbh1dpig+xbjxYdDR4DA9Jz3lzVQ
	AJT5jTJwhri2hk6WiU5myghP4j0BVwg6KbhH2MZuPJlZJ+J68xzSycUOPH/BB/H/O8ABBYlCV3T
	rjRdyRe7lhIwRU5/mzd8RI50hcMxdFsFFIecXJ2xCOuYba6L2lrIO4fG/+On7dK8Fj+2mMMGz2S
	/nI2Fl/2ovqqTzxizglDp8IeehKd7y2CAw0QfQ94oZc8DW8RcaQ+8ZmOYH1a9d9n7ZwW9jT4IO0
	z441c/VQYtKxVijU0hL8n83MHXrlPs0+OenviJYmGwhKNCO6U8X9YPfu0tY1ootq4H7y2Uiz6OZ
	M2ZQLlgeUceozxXFXAcPRIw==
X-Google-Smtp-Source: AGHT+IFNy6AcNqf5GMVJfAqoUe44YMnURTU+/s6Zl+Lj1VhP/YBzzaKE956y5UdpD1/yal3rgjG9iw==
X-Received: by 2002:a17:902:e744:b0:242:9bca:863c with SMTP id d9443c01a7336-242c22fb1c0mr7789085ad.54.1754602180164;
        Thu, 07 Aug 2025 14:29:40 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::7606])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7e4b75sm16044505a12.27.2025.08.07.14.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 14:29:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] clang: Fix GCS annotations in compiler-rt on aarch64
Date: Thu,  7 Aug 2025 14:29:37 -0700
Message-ID: <20250807212937.2927262-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 21:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221586

Fixes builds for Distros with

TC_CXX_RUNTIME = "llvm"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...h64-Add-GCS-property-in-assembly-fil.patch | 150 ++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |   1 +
 2 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang/0001-compiler-rt-AArch64-Add-GCS-property-in-assembly-fil.patch

diff --git a/meta/recipes-devtools/clang/clang/0001-compiler-rt-AArch64-Add-GCS-property-in-assembly-fil.patch b/meta/recipes-devtools/clang/clang/0001-compiler-rt-AArch64-Add-GCS-property-in-assembly-fil.patch
new file mode 100644
index 00000000000..9340a856ece
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0001-compiler-rt-AArch64-Add-GCS-property-in-assembly-fil.patch
@@ -0,0 +1,150 @@
+From c088b5ffca4c4b81a8fa0e7f006e9391eba1f191 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Csan=C3=A1d=20Hajd=C3=BA?= <csanad.hajdu@arm.com>
+Date: Thu, 7 Aug 2025 16:40:36 +0200
+Subject: [PATCH] [compiler-rt][AArch64] Add GCS property in assembly files (#152502)
+
+Only BTI and PAC properties were added previously.
+
+Fixes https://github.com/llvm/llvm-project/issues/152427.
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/pull/152502]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ compiler-rt/lib/builtins/aarch64/lse.S         |  4 ++--
+ compiler-rt/lib/builtins/aarch64/sme-abi.S     |  4 ++--
+ compiler-rt/lib/builtins/assembly.h            | 18 +++++++++++++-----
+ .../lib/hwasan/hwasan_interceptors_vfork.S     |  2 +-
+ compiler-rt/lib/hwasan/hwasan_setjmp_aarch64.S |  2 +-
+ .../lib/hwasan/hwasan_tag_mismatch_aarch64.S   |  2 +-
+ ...zer_common_interceptors_vfork_aarch64.inc.S |  2 +-
+ compiler-rt/lib/tsan/rtl/tsan_rtl_aarch64.S    |  2 +-
+ 8 files changed, 22 insertions(+), 14 deletions(-)
+
+diff --git a/compiler-rt/lib/builtins/aarch64/lse.S b/compiler-rt/lib/builtins/aarch64/lse.S
+index d7c1db7243ef..a444d82892c3 100644
+--- a/compiler-rt/lib/builtins/aarch64/lse.S
++++ b/compiler-rt/lib/builtins/aarch64/lse.S
+@@ -264,7 +264,7 @@ END_COMPILERRT_OUTLINE_FUNCTION(NAME(LDNM))
+ 
+ NO_EXEC_STACK_DIRECTIVE
+ 
+-// GNU property note for BTI and PAC
+-GNU_PROPERTY_BTI_PAC
++// GNU property note for BTI, PAC, and GCS
++GNU_PROPERTY_BTI_PAC_GCS
+ 
+ #endif // defined(__aarch64__) || defined(__arm64ec__)
+diff --git a/compiler-rt/lib/builtins/aarch64/sme-abi.S b/compiler-rt/lib/builtins/aarch64/sme-abi.S
+index 7c47336cfc57..d5510ac0cfa5 100644
+--- a/compiler-rt/lib/builtins/aarch64/sme-abi.S
++++ b/compiler-rt/lib/builtins/aarch64/sme-abi.S
+@@ -371,5 +371,5 @@ END_COMPILERRT_FUNCTION(__arm_sme_restore)
+ 
+ NO_EXEC_STACK_DIRECTIVE
+ 
+-// GNU property note for BTI and PAC
+-GNU_PROPERTY_BTI_PAC
++// GNU property note for BTI, PAC, and GCS
++GNU_PROPERTY_BTI_PAC_GCS
+diff --git a/compiler-rt/lib/builtins/assembly.h b/compiler-rt/lib/builtins/assembly.h
+index 89372f18c84b..d7db7d818945 100644
+--- a/compiler-rt/lib/builtins/assembly.h
++++ b/compiler-rt/lib/builtins/assembly.h
+@@ -79,11 +79,12 @@
+ #define FUNC_ALIGN
+ #endif
+ 
+-// BTI and PAC gnu property note
++// BTI, PAC, and GCS gnu property note
+ #define NT_GNU_PROPERTY_TYPE_0 5
+ #define GNU_PROPERTY_AARCH64_FEATURE_1_AND 0xc0000000
+ #define GNU_PROPERTY_AARCH64_FEATURE_1_BTI 1
+ #define GNU_PROPERTY_AARCH64_FEATURE_1_PAC 2
++#define GNU_PROPERTY_AARCH64_FEATURE_1_GCS 4
+ 
+ #if defined(__ARM_FEATURE_BTI_DEFAULT)
+ #define BTI_FLAG GNU_PROPERTY_AARCH64_FEATURE_1_BTI
+@@ -97,6 +98,12 @@
+ #define PAC_FLAG 0
+ #endif
+ 
++#if defined(__ARM_FEATURE_GCS_DEFAULT)
++#define GCS_FLAG GNU_PROPERTY_AARCH64_FEATURE_1_GCS
++#else
++#define GCS_FLAG 0
++#endif
++
+ #define GNU_PROPERTY(type, value)                                              \
+   .pushsection .note.gnu.property, "a" SEPARATOR                               \
+   .p2align 3 SEPARATOR                                                         \
+@@ -118,11 +125,12 @@
+ #define BTI_J
+ #endif
+ 
+-#if (BTI_FLAG | PAC_FLAG) != 0
+-#define GNU_PROPERTY_BTI_PAC                                                   \
+-  GNU_PROPERTY(GNU_PROPERTY_AARCH64_FEATURE_1_AND, BTI_FLAG | PAC_FLAG)
++#if (BTI_FLAG | PAC_FLAG | GCS_FLAG) != 0
++#define GNU_PROPERTY_BTI_PAC_GCS                                               \
++  GNU_PROPERTY(GNU_PROPERTY_AARCH64_FEATURE_1_AND,                             \
++               BTI_FLAG | PAC_FLAG | GCS_FLAG)
+ #else
+-#define GNU_PROPERTY_BTI_PAC
++#define GNU_PROPERTY_BTI_PAC_GCS
+ #endif
+ 
+ #if defined(__clang__) || defined(__GCC_HAVE_DWARF2_CFI_ASM)
+diff --git a/compiler-rt/lib/hwasan/hwasan_interceptors_vfork.S b/compiler-rt/lib/hwasan/hwasan_interceptors_vfork.S
+index fd20825e3dac..825f41156509 100644
+--- a/compiler-rt/lib/hwasan/hwasan_interceptors_vfork.S
++++ b/compiler-rt/lib/hwasan/hwasan_interceptors_vfork.S
+@@ -11,4 +11,4 @@
+ 
+ NO_EXEC_STACK_DIRECTIVE
+ 
+-GNU_PROPERTY_BTI_PAC
++GNU_PROPERTY_BTI_PAC_GCS
+diff --git a/compiler-rt/lib/hwasan/hwasan_setjmp_aarch64.S b/compiler-rt/lib/hwasan/hwasan_setjmp_aarch64.S
+index 0c0abb6de861..b8d98b09ada2 100644
+--- a/compiler-rt/lib/hwasan/hwasan_setjmp_aarch64.S
++++ b/compiler-rt/lib/hwasan/hwasan_setjmp_aarch64.S
+@@ -99,4 +99,4 @@ ASM_TRAMPOLINE_ALIAS(_setjmp, setjmp)
+ // We do not need executable stack.
+ NO_EXEC_STACK_DIRECTIVE
+ 
+-GNU_PROPERTY_BTI_PAC
++GNU_PROPERTY_BTI_PAC_GCS
+diff --git a/compiler-rt/lib/hwasan/hwasan_tag_mismatch_aarch64.S b/compiler-rt/lib/hwasan/hwasan_tag_mismatch_aarch64.S
+index fd060c51cd8e..be82475101c8 100644
+--- a/compiler-rt/lib/hwasan/hwasan_tag_mismatch_aarch64.S
++++ b/compiler-rt/lib/hwasan/hwasan_tag_mismatch_aarch64.S
+@@ -157,4 +157,4 @@ mismatch:
+ // We do not need executable stack.
+ NO_EXEC_STACK_DIRECTIVE
+ 
+-GNU_PROPERTY_BTI_PAC
++GNU_PROPERTY_BTI_PAC_GCS
+diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_common_interceptors_vfork_aarch64.inc.S b/compiler-rt/lib/sanitizer_common/sanitizer_common_interceptors_vfork_aarch64.inc.S
+index cdfa6f1d7f53..5066953980af 100644
+--- a/compiler-rt/lib/sanitizer_common/sanitizer_common_interceptors_vfork_aarch64.inc.S
++++ b/compiler-rt/lib/sanitizer_common/sanitizer_common_interceptors_vfork_aarch64.inc.S
+@@ -43,6 +43,6 @@ ASM_SIZE(vfork)
+ ASM_INTERCEPTOR_TRAMPOLINE(vfork)
+ ASM_TRAMPOLINE_ALIAS(vfork, vfork)
+ 
+-GNU_PROPERTY_BTI_PAC
++GNU_PROPERTY_BTI_PAC_GCS
+ 
+ #endif
+diff --git a/compiler-rt/lib/tsan/rtl/tsan_rtl_aarch64.S b/compiler-rt/lib/tsan/rtl/tsan_rtl_aarch64.S
+index 7d920bee4a2d..f1d11a3e7f54 100644
+--- a/compiler-rt/lib/tsan/rtl/tsan_rtl_aarch64.S
++++ b/compiler-rt/lib/tsan/rtl/tsan_rtl_aarch64.S
+@@ -222,6 +222,6 @@ ASM_SIZE(ASM_SYMBOL_INTERCEPTOR(__sigsetjmp))
+ 
+ NO_EXEC_STACK_DIRECTIVE
+ 
+-GNU_PROPERTY_BTI_PAC
++GNU_PROPERTY_BTI_PAC_GCS
+ 
+ #endif
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index fb96d0679ce..cbcc4feded5 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -62,6 +62,7 @@ SRC_URI = "\
     file://0001-libclc-allow-existing-prepare-builtins-in-standalone.patch \
     file://no-c-index-test.patch \
     file://0001-llvm-Allow-users-to-set-LLVM_HAVE_OPT_VIEWER_MODULES.patch \
+    file://0001-compiler-rt-AArch64-Add-GCS-property-in-assembly-fil.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""

