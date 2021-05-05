Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.9787.1620227957083129000
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=djiHp5E7;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id d14so2481745edc.12
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NazQlxcg421kxpzAEV10zvHDo1411KZZEWEtS6Y9IFo=;
        b=djiHp5E7g86LVVRAly54kGEYH7qID6ttLCUIA3q5CfLjYhJ60VXnwMo9EEPZnVD+tj
         HpPWWkJTlFK2wM2WpDKokNjAq3bOoyqJwejI5jMb4M0zjf630FktANN6P2DoVWGiklRA
         NpLxmh4F0r61iLzPtpY9WISxmQ48x/apfDX8xmGIvzRUFO449zvPJEzTwWGXAuBkskWr
         en/uwqZciN8HGsav0blqRMDn6a1IVTf8liq1LBrsH9Zfjn2JmJWcDxTbt4CpWX9kG50w
         T6dbdu501c3NRjLQaA/Iknp947F/BRceC+Eq6UGquJm8rxmGfAfmL+UQIiZbq+Ay5v28
         O2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NazQlxcg421kxpzAEV10zvHDo1411KZZEWEtS6Y9IFo=;
        b=oj6G9eheQyYSCTr+IpVwkjJAnp5zt52/kY1jBXEmseRu3sN3DFvtH0dkU6bsndXE+R
         /27aEKGm9FToSS9o7raUo0f+L7kysc53K2PnFzms7iAha9/eX4lwxMFVfRc6x7vJQoJ5
         kz2Az8chGm61iUoh8hz1UyK1eyNCSCoci6pCUhmz35N5pN7FACMHJxono5sV6h8brSXV
         qJxffJYL5duFojG7hbxYexeZ2UxaktDLMjcbebH2YaLOre7gzbckB6OUiqHrZZvZ42J3
         nLztwEbCPPVPi8TaklAbPK9gjdkLFXVGhnoEZkT9koyrQT5JESHR/UVCPWo5CGPOWRE5
         EDiA==
X-Gm-Message-State: AOAM531MIEgsfUYTu3uEXJJYMppYgSdvBI12f+gk4ZUUCrZrypFaR1Q2
	gRE9Z+LtvsC5cNy0k8+UcK+rA9JeLrubyw==
X-Google-Smtp-Source: ABdhPJxgkf37gLeqr2ZxVln1BXl7fKNRbQ9qJJ0J8ozKqD1O3NiRHH/QtMW6tO+T73Pao2+3XqY06A==
X-Received: by 2002:a05:6402:4314:: with SMTP id m20mr16809572edc.387.1620227955554;
        Wed, 05 May 2021 08:19:15 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:15 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 24/61] webkitgtk: update 2.30.6 -> 2.32.0
Date: Wed,  5 May 2021 17:18:13 +0200
Message-Id: <20210505151850.660512-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop 0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch
(merged upstream).

Rebase other patches.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...1-Enable-THREADS_PREFER_PTHREAD_FLAG.patch |  14 +-
 ...ics-check-to-include-1-byte-CAS-test.patch |  77 ---------
 ...9c49c6de8af74e521f36cb43e6c1ec2e391c.patch | 155 ++++++++++++++++++
 .../webkit/webkitgtk/include_xutil.patch      |  18 +-
 .../webkitgtk/musl-lower-stack-usage.patch    |  24 ++-
 .../webkitgtk/reduce-memory-overheads.patch   |  20 ++-
 ...ebkitgtk_2.30.6.bb => webkitgtk_2.32.0.bb} |   5 +-
 7 files changed, 210 insertions(+), 103 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/49a19c49c6de8af74e521f36cb43e6c1ec2e391c.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.30.6.bb => webkitgtk_2.32.0.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
index ca7b1bca48..fd062e0f74 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch
@@ -1,4 +1,4 @@
-From b145ab4273c59f4f908cdaff9e267241bd970e93 Mon Sep 17 00:00:00 2001
+From 3ab2b8aa49c92a68610eef14be1fbf535109b0fb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 3 Feb 2020 17:06:27 -0800
 Subject: [PATCH] Enable THREADS_PREFER_PTHREAD_FLAG
@@ -20,19 +20,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+)
 
 diff --git a/Source/cmake/OptionsGTK.cmake b/Source/cmake/OptionsGTK.cmake
-index 8732e935..9b4fbae7 100644
+index 9eb44f1c..a24fdd0d 100644
 --- a/Source/cmake/OptionsGTK.cmake
 +++ b/Source/cmake/OptionsGTK.cmake
-@@ -32,6 +32,7 @@ set(USER_AGENT_BRANDING "" CACHE STRING "Branding to add to user agent string")
- if (USER_AGENT_BRANDING)
-     add_definitions(-DUSER_AGENT_BRANDING="${USER_AGENT_BRANDING}")
- endif ()
+@@ -6,6 +6,7 @@ WEBKIT_OPTION_BEGIN()
+ SET_PROJECT_VERSION(2 32 0)
+ 
+ set(USER_AGENT_BRANDING "" CACHE STRING "Branding to add to user agent string")
 +set(THREADS_PREFER_PTHREAD_FLAG ON)
  
  find_package(Cairo 1.14.0 REQUIRED)
  find_package(Fontconfig 2.8.0 REQUIRED)
 diff --git a/Source/cmake/OptionsJSCOnly.cmake b/Source/cmake/OptionsJSCOnly.cmake
-index 316c6240..2f712602 100644
+index 10664400..d9aca95a 100644
 --- a/Source/cmake/OptionsJSCOnly.cmake
 +++ b/Source/cmake/OptionsJSCOnly.cmake
 @@ -1,3 +1,4 @@
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch
deleted file mode 100644
index 68195f8464..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 40520b0de69d8ca8e659248f5ffe641f33cc6dee Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 Mar 2021 14:16:58 -0800
-Subject: [PATCH] Extend atomics check to include 1-byte CAS test
-
-Rename ATOMIC_INT64_REQUIRES_LIBATOMIC to ATOMICS_REQUIRE_LIBATOMIC so
-it can reflect broader range which is now checked
-
-Rename ATOMIC_INT64_IS_BUILTIN to ATOMICS_ARE_BUILTIN
-
-Upstream-Status: Accepted [https://bugs.webkit.org/attachment.cgi?bugid=222959]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/JavaScriptCore/CMakeLists.txt   |  2 +-
- Source/WebKit/CMakeLists.txt           |  2 +-
- Source/cmake/WebKitCompilerFlags.cmake | 15 ++++++++++-----
- 3 files changed, 12 insertions(+), 7 deletions(-)
-
---- a/Source/JavaScriptCore/CMakeLists.txt
-+++ b/Source/JavaScriptCore/CMakeLists.txt
-@@ -129,7 +129,7 @@ if (USE_CAPSTONE)
-     list(APPEND JavaScriptCore_LIBRARIES capstone)
- endif ()
- 
--if (ATOMIC_INT64_REQUIRES_LIBATOMIC)
-+if (ATOMICS_REQUIRE_LIBATOMIC)
-     list(APPEND JavaScriptCore_LIBRARIES atomic)
- endif ()
- 
---- a/Source/WebKit/CMakeLists.txt
-+++ b/Source/WebKit/CMakeLists.txt
-@@ -337,7 +337,7 @@ if (USE_LIBWEBRTC)
-     list(APPEND WebKit_LIBRARIES webrtc)
- endif ()
- 
--if (ATOMIC_INT64_REQUIRES_LIBATOMIC)
-+if (ATOMICS_REQUIRE_LIBATOMIC)
-     list(APPEND WebKit_PRIVATE_LIBRARIES atomic)
- endif ()
- 
---- a/Source/cmake/WebKitCompilerFlags.cmake
-+++ b/Source/cmake/WebKitCompilerFlags.cmake
-@@ -280,12 +280,17 @@ endif ()
- if (COMPILER_IS_GCC_OR_CLANG)
-     set(ATOMIC_TEST_SOURCE "
-         #include <atomic>
--        int main() { std::atomic<int64_t> i(0); i++; return 0; }
-+        int main() {
-+          std::atomic<int64_t> i(0);
-+          std::atomic<int8_t> j(0);
-+          i++; j++;
-+          return 0;
-+        }
-     ")
--    check_cxx_source_compiles("${ATOMIC_TEST_SOURCE}" ATOMIC_INT64_IS_BUILTIN)
--    if (NOT ATOMIC_INT64_IS_BUILTIN)
-+    check_cxx_source_compiles("${ATOMIC_TEST_SOURCE}" ATOMICS_ARE_BUILTIN)
-+    if (NOT ATOMICS_ARE_BUILTIN)
-         set(CMAKE_REQUIRED_LIBRARIES atomic)
--        check_cxx_source_compiles("${ATOMIC_TEST_SOURCE}" ATOMIC_INT64_REQUIRES_LIBATOMIC)
-+        check_cxx_source_compiles("${ATOMIC_TEST_SOURCE}" ATOMICS_REQUIRE_LIBATOMIC)
-         unset(CMAKE_REQUIRED_LIBRARIES)
-     endif ()
- endif ()
---- a/Source/WTF/wtf/CMakeLists.txt
-+++ b/Source/WTF/wtf/CMakeLists.txt
-@@ -529,6 +529,10 @@ list(APPEND WTF_LIBRARIES
-     ICU::uc
- )
- 
-+if (ATOMICS_REQUIRE_LIBATOMIC)
-+    list(APPEND WTF_LIBRARIES atomic)
-+endif ()
-+
- set(WTF_INTERFACE_LIBRARIES WTF)
- set(WTF_INTERFACE_INCLUDE_DIRECTORIES ${WTF_FRAMEWORK_HEADERS_DIR})
- set(WTF_INTERFACE_DEPENDENCIES WTF_CopyHeaders)
diff --git a/meta/recipes-sato/webkit/webkitgtk/49a19c49c6de8af74e521f36cb43e6c1ec2e391c.patch b/meta/recipes-sato/webkit/webkitgtk/49a19c49c6de8af74e521f36cb43e6c1ec2e391c.patch
new file mode 100644
index 0000000000..ef70361c55
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/49a19c49c6de8af74e521f36cb43e6c1ec2e391c.patch
@@ -0,0 +1,155 @@
+From 49a19c49c6de8af74e521f36cb43e6c1ec2e391c Mon Sep 17 00:00:00 2001
+From: Ross Kirsling <ross.kirsling@sony.com>
+Date: Tue, 13 Apr 2021 02:04:15 +0000
+Subject: [PATCH] ICU 69 deprecates ubrk_safeClone in favor of ubrk_clone
+ https://bugs.webkit.org/show_bug.cgi?id=224093
+
+Reviewed by Yusuke Suzuki.
+
+In a shining example of "disappointing library practices", ICU 69 deprecates ubrk_safeClone in favor of
+a new *draft* API ubrk_clone, meaning that no function with this functionality is exposed by default.
+
+This patch introduces a function cloneUBreakIterator to abstract over this change; however, since we need to:
+
+  1. confine the effects of disabling U_HIDE_DRAFT_API to a non-unified implementation file
+  2. still be able to include ubrk.h from IntlSegmenter.h to instantiate ICUDeleter<ubrk_close> (*not* `clone`!)
+
+...the new helper function is introduced in a *headerless* implementation file, IntlWorkaround.cpp.
+
+* JavaScriptCore.xcodeproj/project.pbxproj:
+* Sources.txt:
+* runtime/IntlSegmenter.cpp:
+(JSC::IntlSegmenter::segment const):
+* runtime/IntlSegmenter.h:
+* runtime/IntlSegments.cpp:
+(JSC::IntlSegments::createSegmentIterator):
+* runtime/IntlWorkaround.cpp: Added.
+(JSC::cloneUBreakIterator):
+
+
+Canonical link: https://commits.webkit.org/236421@main
+git-svn-id: https://svn.webkit.org/repository/webkit/trunk@275856 268f45cc-cd09-0410-ab3c-d52691b4dbfc
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Source/JavaScriptCore/ChangeLog               | 27 ++++++++++
+ .../JavaScriptCore.xcodeproj/project.pbxproj  | 16 +++---
+ Source/JavaScriptCore/Sources.txt             |  1 +
+ .../JavaScriptCore/runtime/IntlSegmenter.cpp  |  2 +-
+ Source/JavaScriptCore/runtime/IntlSegmenter.h |  4 ++
+ .../JavaScriptCore/runtime/IntlSegments.cpp   |  2 +-
+ .../JavaScriptCore/runtime/IntlWorkaround.cpp | 53 +++++++++++++++++++
+ 7 files changed, 97 insertions(+), 8 deletions(-)
+ create mode 100644 Source/JavaScriptCore/runtime/IntlWorkaround.cpp
+
+diff --git a/Source/JavaScriptCore/Sources.txt b/Source/JavaScriptCore/Sources.txt
+index 28b5b83632b9..b6492dfdcb75 100644
+--- a/Source/JavaScriptCore/Sources.txt
++++ b/Source/JavaScriptCore/Sources.txt
+@@ -849,6 +849,7 @@ runtime/IntlSegmenterConstructor.cpp
+ runtime/IntlSegmenterPrototype.cpp
+ runtime/IntlSegments.cpp
+ runtime/IntlSegmentsPrototype.cpp
++runtime/IntlWorkaround.cpp @no-unify // Confine U_HIDE_DRAFT_API's effect to this file.
+ runtime/IteratorOperations.cpp
+ runtime/IteratorPrototype.cpp
+ runtime/JSArray.cpp
+diff --git a/Source/JavaScriptCore/runtime/IntlSegmenter.cpp b/Source/JavaScriptCore/runtime/IntlSegmenter.cpp
+index 2ad74f94bbe8..93c9b2032847 100644
+--- a/Source/JavaScriptCore/runtime/IntlSegmenter.cpp
++++ b/Source/JavaScriptCore/runtime/IntlSegmenter.cpp
+@@ -125,7 +125,7 @@ JSValue IntlSegmenter::segment(JSGlobalObject* globalObject, JSValue stringValue
+     auto upconvertedCharacters = Box<Vector<UChar>>::create(string.charactersWithoutNullTermination());
+ 
+     UErrorCode status = U_ZERO_ERROR;
+-    auto segmenter = std::unique_ptr<UBreakIterator, UBreakIteratorDeleter>(ubrk_safeClone(m_segmenter.get(), nullptr, nullptr, &status));
++    auto segmenter = std::unique_ptr<UBreakIterator, UBreakIteratorDeleter>(cloneUBreakIterator(m_segmenter.get(), &status));
+     if (U_FAILURE(status)) {
+         throwTypeError(globalObject, scope, "failed to initialize Segments"_s);
+         return { };
+diff --git a/Source/JavaScriptCore/runtime/IntlSegmenter.h b/Source/JavaScriptCore/runtime/IntlSegmenter.h
+index cd0f426c4897..a5239575a9f3 100644
+--- a/Source/JavaScriptCore/runtime/IntlSegmenter.h
++++ b/Source/JavaScriptCore/runtime/IntlSegmenter.h
+@@ -75,4 +75,8 @@ class IntlSegmenter final : public JSNonFinalObject {
+     Granularity m_granularity { Granularity::Grapheme };
+ };
+ 
++// Abstraction to call ubrk_safeClone or ubrk_clone depending on ICU version.
++// This is implemented in IntlWorkaround.cpp in order to confine draft API visibility.
++UBreakIterator* cloneUBreakIterator(const UBreakIterator*, UErrorCode*);
++
+ } // namespace JSC
+diff --git a/Source/JavaScriptCore/runtime/IntlSegments.cpp b/Source/JavaScriptCore/runtime/IntlSegments.cpp
+index b6aba32fb822..8b81791e4133 100644
+--- a/Source/JavaScriptCore/runtime/IntlSegments.cpp
++++ b/Source/JavaScriptCore/runtime/IntlSegments.cpp
+@@ -100,7 +100,7 @@ JSObject* IntlSegments::createSegmentIterator(JSGlobalObject* globalObject)
+     auto scope = DECLARE_THROW_SCOPE(vm);
+ 
+     UErrorCode status = U_ZERO_ERROR;
+-    auto segmenter = std::unique_ptr<UBreakIterator, UBreakIteratorDeleter>(ubrk_safeClone(m_segmenter.get(), nullptr, nullptr, &status));
++    auto segmenter = std::unique_ptr<UBreakIterator, UBreakIteratorDeleter>(cloneUBreakIterator(m_segmenter.get(), &status));
+     if (U_FAILURE(status)) {
+         throwTypeError(globalObject, scope, "failed to initialize SegmentIterator"_s);
+         return nullptr;
+diff --git a/Source/JavaScriptCore/runtime/IntlWorkaround.cpp b/Source/JavaScriptCore/runtime/IntlWorkaround.cpp
+new file mode 100644
+index 000000000000..8d820857ec22
+--- /dev/null
++++ b/Source/JavaScriptCore/runtime/IntlWorkaround.cpp
+@@ -0,0 +1,53 @@
++/*
++ * Copyright (C) 2021 Sony Interactive Entertainment Inc.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ *
++ * THIS SOFTWARE IS PROVIDED BY APPLE INC. AND ITS CONTRIBUTORS ``AS IS''
++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
++ * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
++ * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL APPLE INC. OR ITS CONTRIBUTORS
++ * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
++ * THE POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#include "config.h"
++
++#include <unicode/uvernum.h>
++
++// ICU 69 introduces draft API ubrk_clone and deprecates ubrk_safeClone.
++#if U_ICU_VERSION_MAJOR_NUM >= 69
++#define HAVE_ICU_UBRK_CLONE 1
++#endif
++
++#if defined(U_HIDE_DRAFT_API)
++#undef U_HIDE_DRAFT_API
++#endif
++#include <unicode/ubrk.h>
++
++namespace JSC {
++
++UBreakIterator* cloneUBreakIterator(const UBreakIterator*, UErrorCode*);
++
++UBreakIterator* cloneUBreakIterator(const UBreakIterator* iterator, UErrorCode* status)
++{
++#if HAVE(ICU_UBRK_CLONE)
++    return ubrk_clone(iterator, status);
++#else
++    return ubrk_safeClone(iterator, nullptr, nullptr, status);
++#endif
++}
++
++} // namespace JSC
diff --git a/meta/recipes-sato/webkit/webkitgtk/include_xutil.patch b/meta/recipes-sato/webkit/webkitgtk/include_xutil.patch
index f770b381ce..ffe1b74be3 100644
--- a/meta/recipes-sato/webkit/webkitgtk/include_xutil.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/include_xutil.patch
@@ -1,3 +1,8 @@
+From d95f46e149226f634830e76cc1f4f8e3ee04ff5a Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 6 Nov 2020 04:38:13 +0100
+Subject: [PATCH] webkitgtk: fix build with x11 enabled
+
 Since
 https://github.com/WebKit/webkit/commit/acd3f32cd43c363be032f93ede3aa10c4ee97fa4
 it uses XVisualInfo which is defined in Xutil.h
@@ -11,9 +16,14 @@ webkitgtk-2.30.2/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp:132
 Upstream-Status: Pending
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
-diff -uNr webkitgtk-2.30.2.orig/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp webkitgtk-2.30.2/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp
---- webkitgtk-2.30.2.orig/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp	2020-08-12 09:17:55.000000000 +0000
-+++ webkitgtk-2.30.2/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp	2020-11-06 03:11:40.379913528 +0000
+---
+ Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp b/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp
+index 2d66b9cd..424fb5a1 100644
+--- a/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp
++++ b/Source/WebCore/platform/graphics/x11/PlatformDisplayX11.cpp
 @@ -30,6 +30,7 @@
  
  #if PLATFORM(X11)
@@ -21,4 +31,4 @@ diff -uNr webkitgtk-2.30.2.orig/Source/WebCore/platform/graphics/x11/PlatformDis
 +#include <X11/Xutil.h>
  #include <X11/extensions/Xcomposite.h>
  #if PLATFORM(GTK)
- #include <X11/extensions/Xdamage.h>
+ #include <X11/Xutil.h>
diff --git a/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
index 5033de4196..e4b5818358 100644
--- a/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
@@ -1,4 +1,7 @@
-reduce thread stack and heap usage for javascriptcore on musl
+From 5c82d20a00749e9106db78cdd23a09609dd3511c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 17 Mar 2021 13:24:57 -0700
+Subject: [PATCH] reduce thread stack and heap usage for javascriptcore on musl
 
 default sizes for musl are smaller compared to glibc, this matches
 to musl defaults, avoid stack overflow crashes in jscore
@@ -16,9 +19,16 @@ glibc in OE remains same
 Upstream-Status: Accepted
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
+---
+ Source/JavaScriptCore/runtime/OptionsList.h | 20 ++++++++++++++++----
+ Source/WTF/wtf/Threading.h                  |  4 ++++
+ 2 files changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/Source/JavaScriptCore/runtime/OptionsList.h b/Source/JavaScriptCore/runtime/OptionsList.h
+index bc1cedb9..a6209742 100644
 --- a/Source/JavaScriptCore/runtime/OptionsList.h
 +++ b/Source/JavaScriptCore/runtime/OptionsList.h
-@@ -75,6 +75,18 @@ constexpr bool enableWebAssemblyStreamin
+@@ -71,6 +71,18 @@ JS_EXPORT_PRIVATE bool canUseJITCage();
  // On instantiation of the first VM instance, the Options will be write protected
  // and cannot be modified thereafter.
  
@@ -37,7 +47,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #define FOR_EACH_JSC_OPTION(v)                                          \
      v(Bool, useKernTCSM, defaultTCSMValue(), Normal, "Note: this needs to go before other options since they depend on this value.") \
      v(Bool, validateOptions, false, Normal, "crashes if mis-typed JSC options were passed to the VM") \
-@@ -90,9 +102,9 @@ constexpr bool enableWebAssemblyStreamin
+@@ -86,9 +98,9 @@ JS_EXPORT_PRIVATE bool canUseJITCage();
      \
      v(Bool, reportMustSucceedExecutableAllocations, false, Normal, nullptr) \
      \
@@ -50,7 +60,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      \
      v(Bool, crashOnDisallowedVMEntry, ASSERT_ENABLED, Normal, "Forces a crash if we attempt to enter the VM when disallowed") \
      v(Bool, crashIfCantAllocateJITMemory, false, Normal, nullptr) \
-@@ -601,7 +613,7 @@ public:
+@@ -608,7 +620,7 @@ public:
      bool init(const char*);
      bool isInRange(unsigned);
      const char* rangeString() const { return (m_state > InitError) ? m_rangeString : s_nullRangeStr; }
@@ -59,10 +69,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
      void dump(PrintStream& out) const;
  
  private:
+diff --git a/Source/WTF/wtf/Threading.h b/Source/WTF/wtf/Threading.h
+index 9495d6c1..190b3811 100644
 --- a/Source/WTF/wtf/Threading.h
 +++ b/Source/WTF/wtf/Threading.h
-@@ -56,6 +56,10 @@
- #include <array>
+@@ -60,6 +60,10 @@
+ #include <dispatch/dispatch.h>
  #endif
  
 +#if OS(LINUX) && !defined(__GLIBC__)
diff --git a/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch b/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch
index 0493150a91..aa11c131d2 100644
--- a/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch
@@ -1,22 +1,28 @@
+From ec6045fcf5a46123b54029a675d08d89a5e30f21 Mon Sep 17 00:00:00 2001
 From: Alberto Garcia <berto@igalia.com>
-Subject: Reduce memory usage when not using the Gold linker
-Bug-Debian: https://bugs.debian.org/949621
-Forwarded: no
+Date: Sun, 25 Apr 2021 18:45:13 +0000
+Subject: [PATCH] Reduce memory usage when not using the Gold linker
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ Source/cmake/OptionsCommon.cmake | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/Source/cmake/OptionsCommon.cmake b/Source/cmake/OptionsCommon.cmake
+index dd4da682..71ad6106 100644
 --- a/Source/cmake/OptionsCommon.cmake
 +++ b/Source/cmake/OptionsCommon.cmake
-@@ -95,6 +95,12 @@ option(GCC_OFFLINEASM_SOURCE_MAP
-   "Produce debug line information for offlineasm-generated code"
+@@ -101,6 +101,11 @@ option(GCC_OFFLINEASM_SOURCE_MAP
    ${GCC_OFFLINEASM_SOURCE_MAP_DEFAULT})
  
+ option(USE_APPLE_ICU "Use Apple's internal ICU" ${APPLE})
 +# Pass --reduce-memory-overheads to the bfd linker in order to save memory
 +if (NOT USE_LD_GOLD)
 +    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--reduce-memory-overheads")
 +    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--reduce-memory-overheads")
 +endif ()
-+
+ 
  # Enable the usage of OpenMP.
  #  - At this moment, OpenMP is only used as an alternative implementation
- #    to native threads for the parallelization of the SVG filters.
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.32.0.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.30.6.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.32.0.bb
index 7d0d0fc16f..8a07fadd9b 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.32.0.bb
@@ -18,12 +18,12 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-with-musl.patch \
            file://include_xutil.patch \
            file://reduce-memory-overheads.patch \
-           file://0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch \
            file://musl-lower-stack-usage.patch \
            file://0001-MiniBrowser-Fix-reproduciblity.patch \
+           file://49a19c49c6de8af74e521f36cb43e6c1ec2e391c.patch \
            "
 
-SRC_URI[sha256sum] = "50736ec7a91770b5939d715196e5fe7209b93efcdeef425b24dc51fb8e9d7c1e"
+SRC_URI[sha256sum] = "9d7df4dae9ada2394257565acc2a68ace9308c4c61c3fcc00111dc1f11076bf0"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
@@ -76,6 +76,7 @@ EXTRA_OECMAKE = " \
 		-DENABLE_MINIBROWSER=ON \
                 -DPYTHON_EXECUTABLE=`which python3` \
                 -DENABLE_BUBBLEWRAP_SANDBOX=OFF \
+                -DENABLE_GAMEPAD=OFF \
 		"
 
 # Javascript JIT is not supported on ARC
-- 
2.31.1

