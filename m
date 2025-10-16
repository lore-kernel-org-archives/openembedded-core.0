Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77D6CCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:28:40 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.3389.1760603313701937690
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 01:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yz/MPiRH;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-426f1574a14so240005f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 01:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760603312; x=1761208112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LomR39NJOheYPd04AlP3htEogrhy+Wz5ljJ+L6KV3nw=;
        b=Yz/MPiRHC02+qxiVXZT7I3sHRegH9UNmZPl0vtGFBalgzBQSbo1L7JoE19S9Vn+DMt
         ptOrOP7KCWSE4KlaPTnrFJKs5oB+tAiY23/cIazfU1BxlGJSjnt1RfGWuTIZdTcjxGg4
         jQ+3E6a2BwCBRg7/BYzjA4gzreAyg3mzwIRKXuKRxlpHIQlUpRFusCtfVCmNGsPT+VGS
         8U2xmZDW6D7oDb/PcOKg1l5zGMnGoVjEnqq6xN8q9LH8og61DOUYJcDHWXFnkHZfO9RE
         6n3skVpUKD4D1UczKCGtTrUL03wPyP/vqUhrWYz5In9n8Pe50gkFZKJ5k0kiBbXwdy/W
         EbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760603312; x=1761208112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LomR39NJOheYPd04AlP3htEogrhy+Wz5ljJ+L6KV3nw=;
        b=SwrKjlvxPjQQSduQsf1Q+qJQtL2+eYOr7CB59WYO4fIjhNu5v/AKiqfV2je4J2r1m5
         mgiKNniggPm2Bam/m8g9Z67Y9j6chRGqDU6RF1arcnFO7wBDL6ok6buhyePVb7iklWfH
         +eWokpgyRG8Pl3hUFadFcDxq1w0Nt7yof8vwNcF9rWU9shkK/mawEeBWSWMlhYfFCgSw
         uVptH+1Sqo7EutmfiSwp9o8zn/RQ6et1TzZXnYgDEDx1cQKHDwu9v8crsgHCGjLP8NnG
         cXzZF2qiH2XYhkcFrDS2MEstBbT42EN90SdCbZLwKh0P1RwrN4DOCiL99lq3jbMoUk4P
         PFKg==
X-Gm-Message-State: AOJu0YzB5hyms1Skox/MfM7VaJNGeoQog3hvsZxOfOwaLyVpexmQ9tv6
	MOGeqmoOpVwdVwvaGP/6lD2LTLrwtqATNetmWuKDN+4wI1aXETOUY/oTFojXww==
X-Gm-Gg: ASbGncsSlITImbwPOpPfXYK5Qz1t6Ddy65NzM+S+miIK6hpEI6j+iDHRiUBMvGV3V9S
	KZcLyIx8AZufeale2974Z2ksKf/tCqL7TyQLE/wuinYc21K8da0uTNdtoV8Q87SrgLsmIp/EeGG
	6y1mIOCa4DtHCQsEZpeK0HNB1P7GufPwIfKbhgFVjt74E0f4q+M3Ef2Ks7pqEnxCICNumjYkYEF
	QgnJ+Ab1B2rA5Llkj3VKSae5wAU2o+3PkzMJxIBg7+5l00aqMEkbivAOR7k0GJl9y7wQtHmSmo5
	72zi2358WKl3CqTgcUpa7MH0v6E0JfKNSroblT+qLZRNkFaIa5ee70htlq+tHEwSlNbjuW0z9vy
	zBnYRHoVptSIw85CRn8slWudpCLIN37PDoNamfHtNkbZZbBlZrIq6NaDHJpzpb4eF2fuvGqXCGw
	==
X-Google-Smtp-Source: AGHT+IFcndBwFhhdn0IpJVos5gKQ/TlYpMcE8/NBAE5zauhy9h7n+I184Om09BnniXb2rK/kcCRZyQ==
X-Received: by 2002:a05:600c:a41c:b0:46f:aac5:daf with SMTP id 5b1f17b1804b1-46faac50ea8mr148291165e9.35.1760603311821;
        Thu, 16 Oct 2025 01:28:31 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444c8adsm12206715e9.13.2025.10.16.01.28.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 01:28:31 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] webkitgtk: upgrade 2.48.5 -> 2.50.0
Date: Thu, 16 Oct 2025 10:28:29 +0200
Message-ID: <20251016082830.1938981-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 08:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224957

Dropped fix-armv7-compilation.patch, because it is included in this
release.
Dropped no-musttail-arm.patch, because it has been solved by project
(a bit differently)[1]

Added a new backported patch, fix-musl-compilation.patch
to avoid build error when compiling with musl libc:

.../Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c:52:10: fatal error: execinfo.h: No such file or directory
|    52 | #include <execinfo.h>
|       |          ^~~~~~~~~~~~

Another patch, fix_op_instanceof_handler_for_32-bit_C-loop_build.patch is under review by
upstream. It fixes compiling for 32-bit targets by fixing the following error:

error: label 'op_instanceof_return_location' used but not defined

[1]: https://github.com/WebKit/WebKit/blob/webkitgtk-2.50.0/Source/WTF/wtf/Compiler.h#L280

Changelog:
2.50.0:
- Fix rendering with software rasterization enabled.
- Fix WebAudio issues after idling for a minute.
- Fix several crashes and rendering issues.

2.49.90:
- Add support for font collection / fragment identifiers.
- Fix web process deadlock on exit.
- Fix stuttering when playing WebP animations
- Fix CSS animations with cubic-bezier timing function.
- Do not start the MemoryPressureMonitor if it's disabled
- Translation updates: Polish, Slovenian.
- Fix several crashes and rendering issues.

2.49.4:
- Enable CSS property font-variant-emoji is now enabled by default.
- Improve emoji font selection.
- Add SVT-AV1 encoder support to media backend.
- Show device scale factor in webkit://gpu.
- Fix font rendering of composed characters with certain fonts.
- Fix handling of font synthesis properties (bold/italic).
- Fix documentation of WebKitDeviceInfoPermissionRequest.
- Fix several crashes and rendering issues.

2.49.3:
- Add new API to get the theme color of a WebKitWebView.
- Fix rendering with GTK 3.
- Notify automation session on abnormal disconnections.
- Fix a crash by ensuring SkiaRecordingResult is destroyed on the main thread.
- Fix build on s390x.
- Fix the build with GTK 3.
- Fix several crashes and rendering issues.

2.49.2:
- Enable damage propagation to the UI process by default.
- Pass available input devices from UI process to web process for Interaction Media Features.
- Always have a fallback when domain does not have known base.
- Fix URL after HSTS upgrade in case of redirection.
- Fix rendering when device scale factor change comes before the web view geometry update.
- Ensure web view is focused on tap gesture.
- Fix a crash when setting WEBKIT_SKIA_GPU_PAINTING_THREADS=0.
- Fix several crashes and rendering issues.
- Translation updates: Brazilian Portuguese, Swedish.

2.49.1:
- Change threaded rendering implementation to use Skia API instead of WebCore display
  list that is not thread safe. This also allowed to improve performance by recording
  layers once and replaying every dirty region in different worker threads.
- Added hybrid rendering mode that tries to use the GPU worker threads, but if they
  are all busy the CPU worker threads are used if possible.
- Add volume locking support to media player.
- Add support for tracing counters with Sysprof.
- Fix several crashes and rendering issues.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../webkitgtk/fix-armv7-compilation.patch     |  32 -----
 .../webkitgtk/fix-musl-compilation.patch      |  94 ++++++++++++++
 ...ceof_handler_for_32-bit_C-loop_build.patch | 122 ++++++++++++++++++
 .../webkit/webkitgtk/no-musttail-arm.patch    |  34 -----
 ...ebkitgtk_2.48.5.bb => webkitgtk_2.50.0.bb} |   6 +-
 5 files changed, 219 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-musl-compilation.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/fix_op_instanceof_handler_for_32-bit_C-loop_build.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.48.5.bb => webkitgtk_2.50.0.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch b/meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch
deleted file mode 100644
index a857d55ae4..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7999ecd5ee4ea3123f7e75634d2bc57f57ca7070 Mon Sep 17 00:00:00 2001
-From: Justin Michaud <jmichaud@igalia.com>
-Date: Wed, 6 Aug 2025 21:14:26 +0300
-Subject: [PATCH] REGRESSION(2.48.5): [WPE][GTK] Does not compile on ARMv7
- https://bugs.webkit.org/show_bug.cgi?id=296921
-
-Unreviewed build fix.
-
-* Source/JavaScriptCore/llint/WebAssembly.asm: Replace addq with addp
-  for sp on armv7
-
-Canonical link: https://commits.webkit.org/290945.344@webkitglib/2.48
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/7999ecd5ee4ea3123f7e75634d2bc57f57ca7070]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- Source/JavaScriptCore/llint/WebAssembly.asm | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Source/JavaScriptCore/llint/WebAssembly.asm b/Source/JavaScriptCore/llint/WebAssembly.asm
-index 1ac3e2accf3c..bd9041404eb1 100644
---- a/Source/JavaScriptCore/llint/WebAssembly.asm
-+++ b/Source/JavaScriptCore/llint/WebAssembly.asm
-@@ -736,7 +736,7 @@ if JSVALUE64
-     storep memoryBase, Callee[cfr]
- else
-     loadp [sp], ws0
--    addq 2 * SlotSize, sp
-+    addp 2 * SlotSize, sp
-     storep ws0, Callee[cfr]
- end
- 
diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-musl-compilation.patch b/meta/recipes-sato/webkit/webkitgtk/fix-musl-compilation.patch
new file mode 100644
index 0000000000..c0112cad18
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-musl-compilation.patch
@@ -0,0 +1,94 @@
+From 820e4bb46d7e72ba2b14b15819166919c2e81205 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Wed, 15 Oct 2025 00:58:59 +0300
+Subject: [PATCH] [libpas] Build fails with libc implementations that lack
+ execinfo.h https://bugs.webkit.org/show_bug.cgi?id=300701
+
+Reviewed by NOBODY (OOPS!).
+
+Change guards to use backtrace() and execinfo.h on Linux only when using
+glibc as the C library. The PlayStation and Windows cases no longer need
+to be matched, as they are neither Linux nor Darwin, both of which are now
+explicitly listed. The Android check is kept as it was.
+
+* Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c:
+* Source/bmalloc/libpas/src/test/PGMTests.cpp:
+(addPGMTests):
+
+
+Fixes the following error in OE, when compiled with musl:
+
+| ${UNPACKDIR}/webkitgtk-2.50.0/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c:52:10: fatal error: execinfo.h: No such file or directory
+|    52 | #include <execinfo.h>
+
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/pull/52300]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
+---
+ .../pas_probabilistic_guard_malloc_allocator.c      |  4 ++--
+ Source/bmalloc/libpas/src/test/PGMTests.cpp         | 13 ++++++-------
+ 2 files changed, 8 insertions(+), 9 deletions(-)
+
+diff --git a/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c b/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c
+index ff3adefa7dcc..58ec32eb4fed 100644
+--- a/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c
++++ b/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c
+@@ -43,8 +43,8 @@
+ #include <unistd.h>
+ #endif
+ 
+-/* PlayStation does not currently support the backtrace API. Android API versions < 33 don't, either. Windows does not either. */
+-#if !PAS_PLATFORM(PLAYSTATION) && (!PAS_OS(ANDROID) || __ANDROID_API__ >= 33) && !PAS_OS(WINDOWS)
++/* PlayStation does not currently support the backtrace API. Android API versions < 33 don't, either. Windows does not either. Linux only with GLibc and not uCLibc/Musl. */
++#if (PAS_OS(ANDROID) && __ANDROID_API__ >= 33) || PAS_OS(DARWIN) || (PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
+ #include <execinfo.h>
+ #else
+ size_t backtrace(void** buffer, size_t size)
+diff --git a/Source/bmalloc/libpas/src/test/PGMTests.cpp b/Source/bmalloc/libpas/src/test/PGMTests.cpp
+index 0432f46ba3b0..dfbf957a3421 100644
+--- a/Source/bmalloc/libpas/src/test/PGMTests.cpp
++++ b/Source/bmalloc/libpas/src/test/PGMTests.cpp
+@@ -43,9 +43,9 @@
+ #include "pas_report_crash.h"
+ #include "pas_root.h"
+ 
+-#if !PAS_PLATFORM(PLAYSTATION)
++#if (PAS_OS(ANDROID) && __ANDROID_API__ >= 33) || PAS_OS(DARWIN) || (PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
+ #include <execinfo.h>
+-#endif // !PAS_PLATFORM(PLAYSTATION)
++#endif
+ 
+ using namespace std;
+ 
+@@ -383,8 +383,7 @@ void testPGMMetadataVectorManagementFewDeallocations()
+     pas_heap_lock_unlock();
+ }
+ 
+-/* Backtrace API is currently not supported on PlayStation. */
+-#if !PAS_PLATFORM(PLAYSTATION)
++#if (PAS_OS(ANDROID) && __ANDROID_API__ >= 33) || PAS_OS(DARWIN) || (PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
+ void testPGMMetadataDoubleFreeBehavior()
+ {
+     pas_probabilistic_guard_malloc_initialize_pgm_as_enabled(1);
+@@ -583,7 +582,7 @@ void testPGMAllocMetadataOnly()
+         CHECK(!dealloc_metadata);
+     }
+ }
+-#endif // !PAS_PLATFORM(PLAYSTATION)
++#endif
+ 
+ } // anonymous namespace
+ 
+@@ -598,9 +597,9 @@ void addPGMTests()
+     ADD_TEST(testPGMMetadataVectorManagement());
+     ADD_TEST(testPGMMetadataVectorManagementFewDeallocations());
+     ADD_TEST(testPGMMetadataVectorManagementRehash());
+-#if !PAS_PLATFORM(PLAYSTATION)
++#if (PAS_OS(ANDROID) && __ANDROID_API__ >= 33) || PAS_OS(DARWIN) || (PAS_OS(LINUX) && defined(__GLIBC__) && !defined(__UCLIBC__))
+     ADD_TEST(testPGMMetadataDoubleFreeBehavior());
+     ADD_TEST(testPGMBmallocAllocationBacktrace());
+     ADD_TEST(testPGMAllocMetadataOnly());
+-#endif // !PAS_PLATFORM(PLAYSTATION)
++#endif
+ }
diff --git a/meta/recipes-sato/webkit/webkitgtk/fix_op_instanceof_handler_for_32-bit_C-loop_build.patch b/meta/recipes-sato/webkit/webkitgtk/fix_op_instanceof_handler_for_32-bit_C-loop_build.patch
new file mode 100644
index 0000000000..aa3b53e1bb
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/fix_op_instanceof_handler_for_32-bit_C-loop_build.patch
@@ -0,0 +1,122 @@
+From 0000000000000000000000000000000000000000 Fri Sep 19 11:55:30 2025 
+From: amaxcz <amaxcz@gmail.com>
+Date: Fri, 19 Sep 2025 11:55:30 +0000
+Subject: [PATCH] JSC: fix op_instanceof handler for 32-bit C-loop build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+JSC: fix op_instanceof handler for 32-bit C-loop build
+
+Fixes missing 'op_instanceof' handler in LowLevelInterpreter32_64.asm
+which breaks 32‑bit builds.
+
+* No ChangeLog (raw external patch).
+
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=299166]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
+--- ./Source/JavaScriptCore/llint/LowLevelInterpreter32_64.asm	2025-08-08 11:17:51.552549400 +0200
++++ ./Source/JavaScriptCore/llint/LowLevelInterpreter32_64.asm	2025-09-19 12:34:26.253563496 +0200
+@@ -3445,4 +3445,97 @@
+ slowPathOp(mod)
+ 
+ llintSlowPathOp(has_structure_with_flags)
+-llintSlowPathOp(instanceof)
++
++llintOpWithMetadata(op_instanceof, OpInstanceof, macro (size, get, dispatch, metadata, return)
++
++    macro getAndLoadConstantOrVariable(fieldName, tagReg, payloadReg)
++        get(fieldName, t5)
++        loadConstantOrVariable(size, t5, tagReg, payloadReg)
++    end
++
++    macro isObject(field, falseLabel)
++        getAndLoadConstantOrVariable(field, t0, t1)
++        bineq t0, CellTag, falseLabel
++        bbneq JSCell::m_type[t1], ObjectType, falseLabel
++    end
++
++    macro overridesHasInstance(hasInstanceField, constructorField, trueLabel)
++        getAndLoadConstantOrVariable(hasInstanceField, t0, t1)
++        bineq t0, CellTag, trueLabel
++        loadp CodeBlock[cfr], t2
++        loadp CodeBlock::m_globalObject[t2], t2
++        loadp JSGlobalObject::m_functionProtoHasInstanceSymbolFunction[t2], t2
++        bpneq t1, t2, trueLabel
++
++        get(constructorField, t5)
++        loadConstantOrVariablePayload(size, t5, CellTag, t1, trueLabel)
++        btbz JSCell::m_flags[t1], ImplementsDefaultHasInstance, trueLabel
++    end
++
++    macro storeValue(tagReg, payloadReg, fieldName)
++        move tagReg, t0
++        move payloadReg, t1
++        get(fieldName, t5)
++        storei t0, TagOffset[cfr, t5, 8]
++        storei t1, PayloadOffset[cfr, t5, 8]
++    end
++
++.getHasInstance:
++    isObject(m_constructor, .throwStaticError)
++    get(m_constructor, t5)
++    metadata(t2, t6)
++    loadConstantOrVariablePayload(size, t5, CellTag, t3, .getHasInstanceSlow)
++    performGetByIDHelper(OpInstanceof, m_hasInstanceModeMetadata, m_hasInstanceValueProfile, .getHasInstanceSlow, size,
++        macro (resultTag, resultPayload)
++            storeValue(resultTag, resultPayload, m_hasInstanceOrPrototype)
++            jmp .getPrototype
++        end)
++    jmp .getPrototype
++
++.getHasInstanceSlow:
++    callSlowPath(_llint_slow_path_get_hasInstance_from_instanceof)
++    branchIfException(_llint_throw_from_slow_path_trampoline)
++    jmp .getPrototype
++
++.getHasInstanceInlinedGetterOSRReturnPoint:
++    # This path is taken when exiting to the LLInt from an inlined getter for Symbol.hasInstance.
++    getterSetterOSRExitReturnPoint(op_instanceof, size)
++    valueProfile(size, OpInstanceof, m_hasInstanceValueProfile, r1, r0, t2)
++    storeValue(r1, r0, m_hasInstanceOrPrototype)
++
++.getPrototype:
++    overridesHasInstance(m_hasInstanceOrPrototype, m_constructor, .instanceofCustom)
++    isObject(m_value, .false)
++    get(m_constructor, t5)
++    metadata(t2, t6)
++    loadConstantOrVariablePayload(size, t5, CellTag, t3, .getPrototypeSlow)
++    performGetByIDHelper(OpInstanceof, m_prototypeModeMetadata, m_prototypeValueProfile, .getPrototypeSlow, size,
++        macro (resultTag, resultPayload)
++            storeValue(resultTag, resultPayload, m_hasInstanceOrPrototype)
++            jmp .instanceof
++        end)
++    jmp .instanceof
++
++.getPrototypeSlow:
++    callSlowPath(_llint_slow_path_get_prototype_from_instanceof)
++    branchIfException(_llint_throw_from_slow_path_trampoline)
++    jmp .instanceof
++
++.instanceof:
++    callSlowPath(_llint_slow_path_instanceof_from_instanceof)
++    dispatch()
++
++.throwStaticError:
++    callSlowPath(_slow_path_throw_static_error_from_instanceof)
++    dispatch()
++
++.instanceofCustom:
++    callSlowPath(_slow_path_instanceof_custom_from_instanceof)
++    dispatch()
++
++.false:
++    get(m_dst, t5)
++    storei BooleanTag, TagOffset[cfr, t5, 8]
++    storei 0, PayloadOffset[cfr, t5, 8]
++    dispatch()
++end)
+
+-- 
+2.45.0
diff --git a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
deleted file mode 100644
index 367e6b8342..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4602261fa44d6bbb4c3698c79e08a6a40a6edc5a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 12 Jan 2024 09:21:39 -0800
-Subject: [PATCH] clang/arm: Do not use MUST_TAIL_CALL
-
-This causes clang-17 to crash see [1]
-this code is new in webkit 2.42[2] thats why we do not see the crash in older webkit
-
-[1] https://github.com/llvm/llvm-project/issues/67767
-[2] https://github.com/WebKit/WebKit/commit/4d816460b765acd8aef90ab474615850b91ecc35
-
-Upstream-Status: Inappropriate [work around to avoid clang compiler crash]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Update context for webkitgtk 2.48.0.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- Source/WTF/wtf/Compiler.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Source/WTF/wtf/Compiler.h b/Source/WTF/wtf/Compiler.h
-index 16e416d..68dd9a0 100644
---- a/Source/WTF/wtf/Compiler.h
-+++ b/Source/WTF/wtf/Compiler.h
-@@ -293,7 +293,7 @@
- #if COMPILER(CLANG)
- #if __SIZEOF_POINTER__ == 8
- #if !defined(MUST_TAIL_CALL) && defined(__cplusplus) && defined(__has_cpp_attribute)
--#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__) && !defined(_WIN32)
-+#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__) && !defined(_WIN32) && !defined(__arm__)
- #define MUST_TAIL_CALL [[clang::musttail]]
- #define HAVE_MUST_TAIL_CALL 1
- #endif
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
index 46031322b9..5389bf17db 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
@@ -13,14 +13,14 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
            file://reproducibility.patch \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
-           file://no-musttail-arm.patch \
            file://t6-not-declared.patch \
            file://sys_futex.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            file://fix-ftbfs-riscv64.patch \
-           file://fix-armv7-compilation.patch \
+           file://fix-musl-compilation.patch \
+           file://fix_op_instanceof_handler_for_32-bit_C-loop_build.patch \
            "
-SRC_URI[sha256sum] = "bb64ed9d1cfd58e8b5e89ccad71dd31adfed56336bad7695031ad0b668e1987c"
+SRC_URI[sha256sum] = "e564b8099f9a3ae32409539b290bbd2ad084e99b6d22d4aac5e51e4554df8bc2"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 

