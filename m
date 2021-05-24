Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.20565.1621847654627502900
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 02:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=queuh1hS;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id et19so33642445ejc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 02:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a1ut0xo1YZ2LRO4FjIuY9j+eiek0kRLJ9Ss8EppGILM=;
        b=queuh1hSdQsi94dsPYI+y+0H4jB2EDqpxE7Zl0gURAJ9x+g1A4Pm64kF/VdXsxKYR+
         Kjl1pFiSbhNqu/MzkhfUPsje/DeopVRFyTeqhxW7GReXkr3N2UgA/ZMdy1MWmnn1/1mi
         +jk5wc8hEgTOrxUHsCHmpED12Pru4CB9tm+iHRC0IRTbwTPHslOgqihI5wAIqZDfvJfo
         9G4lASzoE5lkRECntq/kh/aEs37xv3aHSjnyD05jiE7oqcIDoiPSfn08ZpdXGWKryxhD
         zXIDfjBD8ia1Ztr0Sxjl9zHvdVRchtZeewzZLM74/vZtmMmOoWxHOxE778cRtwQrDhGH
         pSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a1ut0xo1YZ2LRO4FjIuY9j+eiek0kRLJ9Ss8EppGILM=;
        b=gUlriryGB3TAA3gx1UGeQf2YV51ZjfIQ8M+5PxQ14VW5FgYWqlWy1FpBkOXRYaC8Pb
         hMEaWDePEa8vTPm+9hXUnCHP185mt30E+dWIcvtM99/lhOONAFAkSYkY22SS09ZRXYiE
         Jf9OOgtAnkF0Ir36u9JZHNrrqAXnAqnOrCNugCjoGlsGgA7bZOOrK9/yulWTK+/PAmj6
         2BqRSduBRhTirP3W7Nk3Nd5d6IVPzJIF1XwoHcgZQMRb4D+KZfEEUVIntS3lhojUzN52
         knI4rh0jxUD5PGS2tQxK2z/qLZnhwHCSOokGNYPl7iZhgRtJmwXgDZcLKZpu+CITiQAf
         unCw==
X-Gm-Message-State: AOAM532/VANE/c/EYu6/HJBYRYiV4qvI8yTf70Hx68nUrCdLvHBm/Wy9
	YwnYx4WRzyqGo2wvz7BpkHLxm8w6DN0=
X-Google-Smtp-Source: ABdhPJzxkhPR9FcAlw89RCVwUMjMqx5utcthftLIgf3BhfknDNHQgAR3R/QlaDgBL+39rg/VPcPgNQ==
X-Received: by 2002:a17:906:2c19:: with SMTP id e25mr22349138ejh.53.1621847653160;
        Mon, 24 May 2021 02:14:13 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id h9sm8673490ede.93.2021.05.24.02.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:14:12 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/21] webkitgtk: update 2.32.0 -> 2.32.1
Date: Mon, 24 May 2021 11:13:40 +0200
Message-Id: <20210524091347.419253-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524091347.419253-1-alex.kanavin@gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop 49a19c49c6de8af74e521f36cb43e6c1ec2e391c.patch
(backport)
0001-Fix-build-with-musl.patch
(problem fixed upstream).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...1-Enable-THREADS_PREFER_PTHREAD_FLAG.patch |   6 +-
 .../webkitgtk/0001-Fix-build-with-musl.patch  |  91 ----------
 ...9c49c6de8af74e521f36cb43e6c1ec2e391c.patch | 155 ------------------
 .../webkitgtk/musl-lower-stack-usage.patch    |  17 +-
 ...ebkitgtk_2.32.0.bb => webkitgtk_2.32.1.bb} |   4 +-
 5 files changed, 8 insertions(+), 265 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/49a19c49c6de8af74e521f36cb43e6c1ec2e391c.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.32.0.bb => webkitgtk_2.32.1.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
index fd062e0f74..efe286ed6b 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
@@ -1,4 +1,4 @@
-From 3ab2b8aa49c92a68610eef14be1fbf535109b0fb Mon Sep 17 00:00:00 2001
+From af90ae1f128626e8d57a8bcbc432596bfc2987af Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 3 Feb 2020 17:06:27 -0800
 Subject: [PATCH] Enable THREADS_PREFER_PTHREAD_FLAG
@@ -20,11 +20,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+)
 
 diff --git a/Source/cmake/OptionsGTK.cmake b/Source/cmake/OptionsGTK.cmake
-index 9eb44f1c..a24fdd0d 100644
+index af6c0fac..f393d741 100644
 --- a/Source/cmake/OptionsGTK.cmake
 +++ b/Source/cmake/OptionsGTK.cmake
 @@ -6,6 +6,7 @@ WEBKIT_OPTION_BEGIN()
- SET_PROJECT_VERSION(2 32 0)
+ SET_PROJECT_VERSION(2 32 1)
  
  set(USER_AGENT_BRANDING "" CACHE STRING "Branding to add to user agent string")
 +set(THREADS_PREFER_PTHREAD_FLAG ON)
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
deleted file mode 100644
index 1ccef1fdc8..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 828a500d5be62ba6fc94bd4fac3fe4bf1b1d4f6d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 6 Oct 2017 17:00:08 +0300
-Subject: [PATCH] Fix build with musl
-
-Upstream-Status: Accepted
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- Source/JavaScriptCore/runtime/MachineContext.h | 10 +++++-----
- Source/WTF/wtf/PlatformHave.h                  |  2 +-
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
---- a/Source/JavaScriptCore/runtime/MachineContext.h
-+++ b/Source/JavaScriptCore/runtime/MachineContext.h
-@@ -196,7 +196,7 @@ static inline void*& stackPointerImpl(mc
- #error Unknown Architecture
- #endif
- 
--#elif OS(FUCHSIA) || defined(__GLIBC__) || defined(__BIONIC__)
-+#elif defined(__linux__)
- 
- #if CPU(X86)
-     return reinterpret_cast<void*&>((uintptr_t&) machineContext.gregs[REG_ESP]);
-@@ -347,7 +347,7 @@ static inline void*& framePointerImpl(mc
- #error Unknown Architecture
- #endif
- 
--#elif OS(FUCHSIA) || defined(__GLIBC__) || defined(__BIONIC__)
-+#elif defined(__linux__)
- 
- // The following sequence depends on glibc's sys/ucontext.h.
- #if CPU(X86)
-@@ -498,7 +498,7 @@ static inline void*& instructionPointerI
- #error Unknown Architecture
- #endif
- 
--#elif OS(FUCHSIA) || defined(__GLIBC__) || defined(__BIONIC__)
-+#elif defined(__linux__)
- 
- // The following sequence depends on glibc's sys/ucontext.h.
- #if CPU(X86)
-@@ -656,7 +656,7 @@ inline void*& argumentPointer<1>(mcontex
- #error Unknown Architecture
- #endif
- 
--#elif OS(FUCHSIA) || defined(__GLIBC__) || defined(__BIONIC__)
-+#elif defined(__linux__)
- 
- // The following sequence depends on glibc's sys/ucontext.h.
- #if CPU(X86)
-@@ -773,7 +773,7 @@ inline void*& llintInstructionPointer(mc
- #error Unknown Architecture
- #endif
- 
--#elif OS(FUCHSIA) || defined(__GLIBC__) || defined(__BIONIC__)
-+#elif defined(__linux__)
- 
- // The following sequence depends on glibc's sys/ucontext.h.
- #if CPU(X86)
---- a/Source/WTF/wtf/PlatformHave.h
-+++ b/Source/WTF/wtf/PlatformHave.h
-@@ -202,7 +202,7 @@
- #define HAVE_HOSTED_CORE_ANIMATION 1
- #endif
- 
--#if OS(DARWIN) || OS(FUCHSIA) || ((OS(FREEBSD) || defined(__GLIBC__) || defined(__BIONIC__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
-+#if OS(DARWIN) || OS(FUCHSIA) || ((OS(FREEBSD) || defined(__linux__) || defined(__BIONIC__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
- #define HAVE_MACHINE_CONTEXT 1
- #endif
- 
---- a/Source/WebCore/xml/XPathGrammar.cpp
-+++ b/Source/WebCore/xml/XPathGrammar.cpp
-@@ -966,7 +966,7 @@ int yydebug;
- #if YYERROR_VERBOSE
- 
- # ifndef yystrlen
--#  if defined __GLIBC__ && defined _STRING_H
-+#  if defined __linux__ && defined _STRING_H
- #   define yystrlen strlen
- #  else
- /* Return the length of YYSTR.  */
-@@ -989,7 +989,7 @@ yystrlen (yystr)
- # endif
- 
- # ifndef yystpcpy
--#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
-+#  if defined __linux__ && defined _STRING_H && defined _GNU_SOURCE
- #   define yystpcpy stpcpy
- #  else
- /* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
diff --git a/meta/recipes-sato/webkit/webkitgtk/49a19c49c6de8af74e521f36cb43e6c1ec2e391c.patch b/meta/recipes-sato/webkit/webkitgtk/49a19c49c6de8af74e521f36cb43e6c1ec2e391c.patch
deleted file mode 100644
index ef70361c55..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/49a19c49c6de8af74e521f36cb43e6c1ec2e391c.patch
+++ /dev/null
@@ -1,155 +0,0 @@
-From 49a19c49c6de8af74e521f36cb43e6c1ec2e391c Mon Sep 17 00:00:00 2001
-From: Ross Kirsling <ross.kirsling@sony.com>
-Date: Tue, 13 Apr 2021 02:04:15 +0000
-Subject: [PATCH] ICU 69 deprecates ubrk_safeClone in favor of ubrk_clone
- https://bugs.webkit.org/show_bug.cgi?id=224093
-
-Reviewed by Yusuke Suzuki.
-
-In a shining example of "disappointing library practices", ICU 69 deprecates ubrk_safeClone in favor of
-a new *draft* API ubrk_clone, meaning that no function with this functionality is exposed by default.
-
-This patch introduces a function cloneUBreakIterator to abstract over this change; however, since we need to:
-
-  1. confine the effects of disabling U_HIDE_DRAFT_API to a non-unified implementation file
-  2. still be able to include ubrk.h from IntlSegmenter.h to instantiate ICUDeleter<ubrk_close> (*not* `clone`!)
-
-...the new helper function is introduced in a *headerless* implementation file, IntlWorkaround.cpp.
-
-* JavaScriptCore.xcodeproj/project.pbxproj:
-* Sources.txt:
-* runtime/IntlSegmenter.cpp:
-(JSC::IntlSegmenter::segment const):
-* runtime/IntlSegmenter.h:
-* runtime/IntlSegments.cpp:
-(JSC::IntlSegments::createSegmentIterator):
-* runtime/IntlWorkaround.cpp: Added.
-(JSC::cloneUBreakIterator):
-
-
-Canonical link: https://commits.webkit.org/236421@main
-git-svn-id: https://svn.webkit.org/repository/webkit/trunk@275856 268f45cc-cd09-0410-ab3c-d52691b4dbfc
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Source/JavaScriptCore/ChangeLog               | 27 ++++++++++
- .../JavaScriptCore.xcodeproj/project.pbxproj  | 16 +++---
- Source/JavaScriptCore/Sources.txt             |  1 +
- .../JavaScriptCore/runtime/IntlSegmenter.cpp  |  2 +-
- Source/JavaScriptCore/runtime/IntlSegmenter.h |  4 ++
- .../JavaScriptCore/runtime/IntlSegments.cpp   |  2 +-
- .../JavaScriptCore/runtime/IntlWorkaround.cpp | 53 +++++++++++++++++++
- 7 files changed, 97 insertions(+), 8 deletions(-)
- create mode 100644 Source/JavaScriptCore/runtime/IntlWorkaround.cpp
-
-diff --git a/Source/JavaScriptCore/Sources.txt b/Source/JavaScriptCore/Sources.txt
-index 28b5b83632b9..b6492dfdcb75 100644
---- a/Source/JavaScriptCore/Sources.txt
-+++ b/Source/JavaScriptCore/Sources.txt
-@@ -849,6 +849,7 @@ runtime/IntlSegmenterConstructor.cpp
- runtime/IntlSegmenterPrototype.cpp
- runtime/IntlSegments.cpp
- runtime/IntlSegmentsPrototype.cpp
-+runtime/IntlWorkaround.cpp @no-unify // Confine U_HIDE_DRAFT_API's effect to this file.
- runtime/IteratorOperations.cpp
- runtime/IteratorPrototype.cpp
- runtime/JSArray.cpp
-diff --git a/Source/JavaScriptCore/runtime/IntlSegmenter.cpp b/Source/JavaScriptCore/runtime/IntlSegmenter.cpp
-index 2ad74f94bbe8..93c9b2032847 100644
---- a/Source/JavaScriptCore/runtime/IntlSegmenter.cpp
-+++ b/Source/JavaScriptCore/runtime/IntlSegmenter.cpp
-@@ -125,7 +125,7 @@ JSValue IntlSegmenter::segment(JSGlobalObject* globalObject, JSValue stringValue
-     auto upconvertedCharacters = Box<Vector<UChar>>::create(string.charactersWithoutNullTermination());
- 
-     UErrorCode status = U_ZERO_ERROR;
--    auto segmenter = std::unique_ptr<UBreakIterator, UBreakIteratorDeleter>(ubrk_safeClone(m_segmenter.get(), nullptr, nullptr, &status));
-+    auto segmenter = std::unique_ptr<UBreakIterator, UBreakIteratorDeleter>(cloneUBreakIterator(m_segmenter.get(), &status));
-     if (U_FAILURE(status)) {
-         throwTypeError(globalObject, scope, "failed to initialize Segments"_s);
-         return { };
-diff --git a/Source/JavaScriptCore/runtime/IntlSegmenter.h b/Source/JavaScriptCore/runtime/IntlSegmenter.h
-index cd0f426c4897..a5239575a9f3 100644
---- a/Source/JavaScriptCore/runtime/IntlSegmenter.h
-+++ b/Source/JavaScriptCore/runtime/IntlSegmenter.h
-@@ -75,4 +75,8 @@ class IntlSegmenter final : public JSNonFinalObject {
-     Granularity m_granularity { Granularity::Grapheme };
- };
- 
-+// Abstraction to call ubrk_safeClone or ubrk_clone depending on ICU version.
-+// This is implemented in IntlWorkaround.cpp in order to confine draft API visibility.
-+UBreakIterator* cloneUBreakIterator(const UBreakIterator*, UErrorCode*);
-+
- } // namespace JSC
-diff --git a/Source/JavaScriptCore/runtime/IntlSegments.cpp b/Source/JavaScriptCore/runtime/IntlSegments.cpp
-index b6aba32fb822..8b81791e4133 100644
---- a/Source/JavaScriptCore/runtime/IntlSegments.cpp
-+++ b/Source/JavaScriptCore/runtime/IntlSegments.cpp
-@@ -100,7 +100,7 @@ JSObject* IntlSegments::createSegmentIterator(JSGlobalObject* globalObject)
-     auto scope = DECLARE_THROW_SCOPE(vm);
- 
-     UErrorCode status = U_ZERO_ERROR;
--    auto segmenter = std::unique_ptr<UBreakIterator, UBreakIteratorDeleter>(ubrk_safeClone(m_segmenter.get(), nullptr, nullptr, &status));
-+    auto segmenter = std::unique_ptr<UBreakIterator, UBreakIteratorDeleter>(cloneUBreakIterator(m_segmenter.get(), &status));
-     if (U_FAILURE(status)) {
-         throwTypeError(globalObject, scope, "failed to initialize SegmentIterator"_s);
-         return nullptr;
-diff --git a/Source/JavaScriptCore/runtime/IntlWorkaround.cpp b/Source/JavaScriptCore/runtime/IntlWorkaround.cpp
-new file mode 100644
-index 000000000000..8d820857ec22
---- /dev/null
-+++ b/Source/JavaScriptCore/runtime/IntlWorkaround.cpp
-@@ -0,0 +1,53 @@
-+/*
-+ * Copyright (C) 2021 Sony Interactive Entertainment Inc.
-+ *
-+ * Redistribution and use in source and binary forms, with or without
-+ * modification, are permitted provided that the following conditions
-+ * are met:
-+ * 1. Redistributions of source code must retain the above copyright
-+ *    notice, this list of conditions and the following disclaimer.
-+ * 2. Redistributions in binary form must reproduce the above copyright
-+ *    notice, this list of conditions and the following disclaimer in the
-+ *    documentation and/or other materials provided with the distribution.
-+ *
-+ * THIS SOFTWARE IS PROVIDED BY APPLE INC. AND ITS CONTRIBUTORS ``AS IS''
-+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-+ * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-+ * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL APPLE INC. OR ITS CONTRIBUTORS
-+ * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
-+ * THE POSSIBILITY OF SUCH DAMAGE.
-+ */
-+
-+#include "config.h"
-+
-+#include <unicode/uvernum.h>
-+
-+// ICU 69 introduces draft API ubrk_clone and deprecates ubrk_safeClone.
-+#if U_ICU_VERSION_MAJOR_NUM >= 69
-+#define HAVE_ICU_UBRK_CLONE 1
-+#endif
-+
-+#if defined(U_HIDE_DRAFT_API)
-+#undef U_HIDE_DRAFT_API
-+#endif
-+#include <unicode/ubrk.h>
-+
-+namespace JSC {
-+
-+UBreakIterator* cloneUBreakIterator(const UBreakIterator*, UErrorCode*);
-+
-+UBreakIterator* cloneUBreakIterator(const UBreakIterator* iterator, UErrorCode* status)
-+{
-+#if HAVE(ICU_UBRK_CLONE)
-+    return ubrk_clone(iterator, status);
-+#else
-+    return ubrk_safeClone(iterator, nullptr, nullptr, status);
-+#endif
-+}
-+
-+} // namespace JSC
diff --git a/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
index e4b5818358..f71f8452fd 100644
--- a/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
@@ -1,4 +1,4 @@
-From 5c82d20a00749e9106db78cdd23a09609dd3511c Mon Sep 17 00:00:00 2001
+From 04e4999c6fa2e9810634745a07f1e380f27b8e61 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 17 Mar 2021 13:24:57 -0700
 Subject: [PATCH] reduce thread stack and heap usage for javascriptcore on musl
@@ -20,12 +20,12 @@ Upstream-Status: Accepted
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
- Source/JavaScriptCore/runtime/OptionsList.h | 20 ++++++++++++++++----
+ Source/JavaScriptCore/runtime/OptionsList.h | 18 +++++++++++++++---
  Source/WTF/wtf/Threading.h                  |  4 ++++
- 2 files changed, 20 insertions(+), 4 deletions(-)
+ 2 files changed, 19 insertions(+), 3 deletions(-)
 
 diff --git a/Source/JavaScriptCore/runtime/OptionsList.h b/Source/JavaScriptCore/runtime/OptionsList.h
-index bc1cedb9..a6209742 100644
+index bb6d2f1d..a6209742 100644
 --- a/Source/JavaScriptCore/runtime/OptionsList.h
 +++ b/Source/JavaScriptCore/runtime/OptionsList.h
 @@ -71,6 +71,18 @@ JS_EXPORT_PRIVATE bool canUseJITCage();
@@ -60,15 +60,6 @@ index bc1cedb9..a6209742 100644
      \
      v(Bool, crashOnDisallowedVMEntry, ASSERT_ENABLED, Normal, "Forces a crash if we attempt to enter the VM when disallowed") \
      v(Bool, crashIfCantAllocateJITMemory, false, Normal, nullptr) \
-@@ -608,7 +620,7 @@ public:
-     bool init(const char*);
-     bool isInRange(unsigned);
-     const char* rangeString() const { return (m_state > InitError) ? m_rangeString : s_nullRangeStr; }
--    
-+
-     void dump(PrintStream& out) const;
- 
- private:
 diff --git a/Source/WTF/wtf/Threading.h b/Source/WTF/wtf/Threading.h
 index 9495d6c1..190b3811 100644
 --- a/Source/WTF/wtf/Threading.h
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.32.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.32.1.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.32.0.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.32.1.bb
index 31a6c97a32..7abf96c252 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.32.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.32.1.bb
@@ -15,16 +15,14 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch \
            file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
            file://0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch \
-           file://0001-Fix-build-with-musl.patch \
            file://include_xutil.patch \
            file://reduce-memory-overheads.patch \
            file://musl-lower-stack-usage.patch \
            file://0001-MiniBrowser-Fix-reproduciblity.patch \
-           file://49a19c49c6de8af74e521f36cb43e6c1ec2e391c.patch \
            file://0001-Properly-use-CompletionHandler-when-USE_OPENGL_OR_ES.patch \
            "
 
-SRC_URI[sha256sum] = "9d7df4dae9ada2394257565acc2a68ace9308c4c61c3fcc00111dc1f11076bf0"
+SRC_URI[sha256sum] = "136117317f70f66486f71b8edf5e46f8776403c5d8a296e914b11a36ef836917"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.31.1

