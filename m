Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F20C87FCA
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 21:38:43 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.7660.1754602719297229331
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 14:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N9Vf3B6f;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2402bbb4bf3so18110605ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 14:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754602718; x=1755207518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UfbL0OhTCMbC9PVKjwQi3Eha0R7Ko3TWUy/8rLXVrq4=;
        b=N9Vf3B6fTnkrqIlDV8smS+r+/mhzUdfbNthC1rEv/G9Tsm/Lz7gqrmdKIe3f9YUU8j
         4LHRi9hDnOkiUg19WZJ615npOFKd6blDFnSutLH4cTda5vNiDzVHUnE78WHdulx0sLuT
         YoDLZKqjFcwjUKYUCcaKfSIoRNh8KhvDO4x1dBmdCYXfKwCfdlhwVJ/8+TSPiH5d1pdA
         W0ypFe9CqPXMFIW5kKbWArH0ODCrBb0zjwpR6vfMuE6cBKfXNA+NMUxzPmDhANUawSau
         MMMywIPGNV/qT9Eh7mxBkkk7XsXCvohXc7EAJSgjdtfLO+SgKHmQLmwezu8GB1FeAecl
         x4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754602718; x=1755207518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UfbL0OhTCMbC9PVKjwQi3Eha0R7Ko3TWUy/8rLXVrq4=;
        b=uUOzMtrFkxbcsEnIU8fTLQfzQbbMqLMEQNYr88cmu9f8MiR7/JcF5n78lRV59m5K/F
         d0dWVcQxtzIlFuupPSi17vEppEYR8ly/YvIcYQVfg4AcXspKjzhWTAcxYf/hqEHR9xQo
         K4L0C5BFGEQ0GKC51btKoOPOIjlEhaAG5iqaAU4Ya+l+2ZiNWrF/CTbLbi5rvdOYMs78
         fgNBK7aMwzvcQErSIMBcHl+onufZ8bWmWHbKP60QiuFmMmw5tORlv7Vn2dKO3KIGIbXJ
         OOmpLIntrrE52vDd+lTqXCVpnM/EOSmW8jmN4TIcVwqH0C3aMrwCVE3dp32eazP699vL
         AB3g==
X-Gm-Message-State: AOJu0YwoGBW24wIOLN9npGVeFvWJHYyT0t/ETHlG+HK+ieTthdgTz/w1
	RkN0MXC1h6WUGvORIXEER7mNeUscMqhMY8i/NnDUU0jCzuxhQP8FcnFSc+7mRExfr3A=
X-Gm-Gg: ASbGncuKC13UqzoZkBrS02JDrj83Lf53gnP6HjC6zHmTZGWt9rpX1xaiRddvula0XqM
	apKlWCmAy/xX9TN1dCRnxpulecYVMRaJ7b3WYmkBL4b2js5TKZ5i18ftt1FYxFZZHYgHzOCfl0n
	j1D+Hast3XmrWHTHPSkQw5q3UFqdzLLBVJx2pvoqFdSlJA+OIagPYo+yt/UErKjLS6Ddb4+xLA3
	9JaqQoJLRNA3ZuAQWJwziWEAlKGAAOIBSENyp152ko/hinypPZ5tQ2BZdsuj5zbmXNdq+CQG8aX
	JnNiJiqYeO93F0R2qKAgNrx7HVqAkrqxlBmS5vMd84sKDRwqjtSmyl16aaN9dy3DQtdnFPEzWAX
	Cx6pxMrWFi/Htf8fmEm9VOnHFTLOb36bC
X-Google-Smtp-Source: AGHT+IFZSRNY3Rk1KV9FwLFjvjaDPT0KA4djt5BHIdMHfwXowhGcnAJaofveVYgP6QogjGhdMpCokQ==
X-Received: by 2002:a17:902:d481:b0:223:619e:71da with SMTP id d9443c01a7336-242c225767emr8680455ad.49.1754602718277;
        Thu, 07 Aug 2025 14:38:38 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::7606])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aaadadsm194650855ad.156.2025.08.07.14.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 14:38:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] clang: Fix GCS annotations in compiler-rt on aarch64
Date: Thu,  7 Aug 2025 14:38:35 -0700
Message-ID: <20250807213835.2996849-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 21:38:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221588

Fixes builds for Distros with

TC_CXX_RUNTIME = "llvm"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Remove patch fuzz

 ...h64-Add-GCS-property-in-assembly-fil.patch | 151 ++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |   1 +
 2 files changed, 152 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang/0001-compiler-rt-AArch64-Add-GCS-property-in-assembly-fil.patch

diff --git a/meta/recipes-devtools/clang/clang/0001-compiler-rt-AArch64-Add-GCS-property-in-assembly-fil.patch b/meta/recipes-devtools/clang/clang/0001-compiler-rt-AArch64-Add-GCS-property-in-assembly-fil.patch
new file mode 100644
index 00000000000..5935c42d90e
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0001-compiler-rt-AArch64-Add-GCS-property-in-assembly-fil.patch
@@ -0,0 +1,151 @@
+From 2d102880766a5e55e5d7b4f9a2fb106d7d1ee55c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Csan=C3=A1d=20Hajd=C3=BA?= <csanad.hajdu@arm.com>
+Date: Thu, 7 Aug 2025 16:40:36 +0200
+Subject: [PATCH] [compiler-rt][AArch64] Add GCS property in assembly files
+ (#152502)
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
+index 1fe18f4a4681..abad047096cc 100644
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
+ #endif // __aarch64__
+diff --git a/compiler-rt/lib/builtins/aarch64/sme-abi.S b/compiler-rt/lib/builtins/aarch64/sme-abi.S
+index 8dbbe061edb9..29d7ad53047d 100644
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
+index 34c71241524d..a554c10c18ac 100644
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

