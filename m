Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web12.817.1589820577335080173
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 09:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VB0cf72v;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.194, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f194.google.com with SMTP id t16so4460149plo.7
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 09:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=IACBYpglQwXFsi6SjrlxTEzFYqsiU3w5cgBrNI9TJf8=;
        b=VB0cf72vRh5WdO+kN4QeUgJVgYAv7XOhSQo5T8kHDrd+JPBtcgG8IPRuV3F59dfKDX
         wAD/ouuknzSdztWbGDEp8gukKpJWlDnGhILRG1nPNUOmtLMAn2TpSTMyjfCWJUvPeOux
         2275wMb+EktaO//X9LBk2Pm8vEY4Zxi7kFbcyDG8Y9FXoEY5TsI44S/K9O5ccmhKxnT3
         lwVmjIKaS7fZr3Bl/E6WudHMErTLMt0/X8IidRZ1kzTfMft25LuRwl7/W9dyuPxT4HZh
         1jDGbbByFg2iOLKLz/jKXPIf1JjoTnABUX2DsFvO+jc4QfYLEtlL1B4lXq6sIYJpDz1/
         Z5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=IACBYpglQwXFsi6SjrlxTEzFYqsiU3w5cgBrNI9TJf8=;
        b=LiVpIsytRxNsi/vOESGmV8Ceb3Ae0z/W4lHEtH3pTfHIZUzzJzW+kjPt29QjS4UAAU
         57KTs7YWl/OnqHpJAPQwoLpnwVmo+NpbRlpZvgs1AAldrla9G2wwJ1ohslMiLM8bFZFt
         gZyBqV0jNgf8cCEOVw53i+QybnjxQnk8gYEdiUrDGTucPWqToXauYH4es5KNOABm+mXR
         3ykq8OmXFeDZ6vUGzF7RUYSKxnaA28ZAK/I71pS4zFtVj1yYiAVKhPHIRMzts35W3uvD
         2c0a0+f8ID432V9e2iGWaLK5gZdiz+RJ7a326cakq8iu6etRu0r2EVJbmLN1wAkopwUW
         x+BA==
X-Gm-Message-State: AOAM532EPe0reqBtJC2fFLRAAXKaGNmRHGTfdCDLNz3QbrAJyliwIj/1
	7P7HfFs9gHKDqrQCBIQAxFvbLVOpyObYLQ==
X-Google-Smtp-Source: ABdhPJzpUaSEgTFgzof8L7vVqZlnrRWTGOmguymjITOFqhjHQ3YjVWswQ6/luaWHk5Dzp9AkPRjK9Q==
X-Received: by 2002:a17:90b:368c:: with SMTP id mj12mr352602pjb.10.1589820576213;
        Mon, 18 May 2020 09:49:36 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g6sm62869pjx.48.2020.05.18.09.49.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:49:35 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/19] webkitgtk: update to 2.28.2 to fix multiple CVE's
Date: Mon, 18 May 2020 06:48:32 -1000
Message-Id: <ea75624d2b36fc4c5fbbbb0b2f06ce8a5cadd214.1589820011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589820010.git.steve@sakoman.com>
References: <cover.1589820010.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

This latest stable release fixes: CVE-2020-10018, CVE-2020-11793,
CVE-2020-3885, CVE-2020-3894, CVE-2020-3895, CVE-2020-3897,
CVE-2020-3899, CVE-2020-3900, CVE-2020-3901, CVE-2020-3902

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webkitgtk/0001-Fix-build-with-musl.patch  | 30 +++++++++----------
 ...tings-so-that-gtkdoc-generation-work.patch |  8 ++---
 .../webkit/webkitgtk/x32_support.patch        | 30 -------------------
 ...ebkitgtk_2.26.4.bb => webkitgtk_2.28.2.bb} |  5 ++--
 4 files changed, 21 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/x32_support.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.26.4.bb => webkitgtk_2.28.2.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
index 0c145c7ebd..6dcb52956c 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
@@ -1,4 +1,4 @@
-From c4d4d9f1aa74addefdad40294cf16d9e0b3dd6ec Mon Sep 17 00:00:00 2001
+From 828a500d5be62ba6fc94bd4fac3fe4bf1b1d4f6d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 6 Oct 2017 17:00:08 +0300
 Subject: [PATCH] Fix build with musl
@@ -8,14 +8,14 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
  Source/JavaScriptCore/runtime/MachineContext.h | 10 +++++-----
- Source/WTF/wtf/Platform.h                      |  2 +-
+ Source/WTF/wtf/PlatformHave.h                  |  2 +-
  2 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/Source/JavaScriptCore/runtime/MachineContext.h b/Source/JavaScriptCore/runtime/MachineContext.h
-index 823964c2..00841146 100644
+index c5052527..95ef98b5 100644
 --- a/Source/JavaScriptCore/runtime/MachineContext.h
 +++ b/Source/JavaScriptCore/runtime/MachineContext.h
-@@ -188,7 +188,7 @@ static inline void*& stackPointerImpl(mcontext_t& machineContext)
+@@ -196,7 +196,7 @@ static inline void*& stackPointerImpl(mcontext_t& machineContext)
  #error Unknown Architecture
  #endif
  
@@ -24,7 +24,7 @@ index 823964c2..00841146 100644
  
  #if CPU(X86)
      return reinterpret_cast<void*&>((uintptr_t&) machineContext.gregs[REG_ESP]);
-@@ -335,7 +335,7 @@ static inline void*& framePointerImpl(mcontext_t& machineContext)
+@@ -347,7 +347,7 @@ static inline void*& framePointerImpl(mcontext_t& machineContext)
  #error Unknown Architecture
  #endif
  
@@ -33,7 +33,7 @@ index 823964c2..00841146 100644
  
  // The following sequence depends on glibc's sys/ucontext.h.
  #if CPU(X86)
-@@ -482,7 +482,7 @@ static inline void*& instructionPointerImpl(mcontext_t& machineContext)
+@@ -498,7 +498,7 @@ static inline void*& instructionPointerImpl(mcontext_t& machineContext)
  #error Unknown Architecture
  #endif
  
@@ -42,7 +42,7 @@ index 823964c2..00841146 100644
  
  // The following sequence depends on glibc's sys/ucontext.h.
  #if CPU(X86)
-@@ -639,7 +639,7 @@ inline void*& argumentPointer<1>(mcontext_t& machineContext)
+@@ -656,7 +656,7 @@ inline void*& argumentPointer<1>(mcontext_t& machineContext)
  #error Unknown Architecture
  #endif
  
@@ -51,7 +51,7 @@ index 823964c2..00841146 100644
  
  // The following sequence depends on glibc's sys/ucontext.h.
  #if CPU(X86)
-@@ -756,7 +756,7 @@ inline void*& llintInstructionPointer(mcontext_t& machineContext)
+@@ -773,7 +773,7 @@ inline void*& llintInstructionPointer(mcontext_t& machineContext)
  #error Unknown Architecture
  #endif
  
@@ -60,13 +60,13 @@ index 823964c2..00841146 100644
  
  // The following sequence depends on glibc's sys/ucontext.h.
  #if CPU(X86)
-diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
-index 34f7cb14..32ad9150 100644
---- a/Source/WTF/wtf/Platform.h
-+++ b/Source/WTF/wtf/Platform.h
-@@ -714,7 +714,7 @@
- 
- #endif /* OS(DARWIN) */
+diff --git a/Source/WTF/wtf/PlatformHave.h b/Source/WTF/wtf/PlatformHave.h
+index daca20fe..53eae6ba 100644
+--- a/Source/WTF/wtf/PlatformHave.h
++++ b/Source/WTF/wtf/PlatformHave.h
+@@ -222,7 +222,7 @@
+ #define HAVE_HOSTED_CORE_ANIMATION 1
+ #endif
  
 -#if OS(DARWIN) || OS(FUCHSIA) || ((OS(FREEBSD) || defined(__GLIBC__) || defined(__BIONIC__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
 +#if OS(DARWIN) || OS(FUCHSIA) || ((OS(FREEBSD) || defined(__linux__) || defined(__BIONIC__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
index e7c668c040..866e9d9d09 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch
@@ -1,4 +1,4 @@
-From 4b5e02212a31b82fc9b3becad90542274816fc29 Mon Sep 17 00:00:00 2001
+From 1c7e7a385387d7febf633bbb6d2b99ece523e719 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 11 Aug 2016 17:13:51 +0300
 Subject: [PATCH] Tweak gtkdoc settings so that gtkdoc generation works under
@@ -17,15 +17,15 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/Source/cmake/GtkDoc.cmake b/Source/cmake/GtkDoc.cmake
-index b0fb31ca..6cb6313d 100644
+index 18e86448..102c873a 100644
 --- a/Source/cmake/GtkDoc.cmake
 +++ b/Source/cmake/GtkDoc.cmake
 @@ -4,7 +4,7 @@ macro(ADD_GTKDOC_GENERATOR _stamp_name _extra_args)
      add_custom_command(
          OUTPUT "${CMAKE_BINARY_DIR}/${_stamp_name}"
          DEPENDS ${DocumentationDependencies}
--        COMMAND ${CMAKE_COMMAND} -E env "CC=${CMAKE_C_COMPILER}" "CFLAGS=${CMAKE_C_FLAGS} -Wno-unused-parameter" "LDFLAGS=${CMAKE_EXE_LINKER_FLAGS}" ${CMAKE_SOURCE_DIR}/Tools/gtkdoc/generate-gtkdoc ${_extra_args}
-+        COMMAND ${CMAKE_COMMAND} -E env "CC=${CMAKE_C_COMPILER}" "CFLAGS=${CMAKE_C_FLAGS} -Wno-unused-parameter" "LD=${CMAKE_C_COMPILER}" "LDFLAGS=${CMAKE_C_LINK_FLAGS}" "RUN=${CMAKE_BINARY_DIR}/gtkdoc-qemuwrapper" ${CMAKE_SOURCE_DIR}/Tools/gtkdoc/generate-gtkdoc ${_extra_args}
+-        COMMAND ${CMAKE_COMMAND} -E env "CC=${CMAKE_C_COMPILER}" "CFLAGS=${CMAKE_C_FLAGS} -Wno-unused-parameter" "LDFLAGS=${CMAKE_EXE_LINKER_FLAGS}" ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/Tools/gtkdoc/generate-gtkdoc ${_extra_args}
++        COMMAND ${CMAKE_COMMAND} -E env "CC=${CMAKE_C_COMPILER}" "CFLAGS=${CMAKE_C_FLAGS} -Wno-unused-parameter" "LD=${CMAKE_C_COMPILER}" "LDFLAGS=${CMAKE_C_LINK_FLAGS}" "RUN=${CMAKE_BINARY_DIR}/gtkdoc-qemuwrapper" ${PYTHON_EXECUTABLE} ${CMAKE_SOURCE_DIR}/Tools/gtkdoc/generate-gtkdoc ${_extra_args}
          COMMAND touch ${_stamp_name}
          WORKING_DIRECTORY "${CMAKE_BINARY_DIR}"
          VERBATIM
diff --git a/meta/recipes-sato/webkit/webkitgtk/x32_support.patch b/meta/recipes-sato/webkit/webkitgtk/x32_support.patch
deleted file mode 100644
index 85d281e7f4..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/x32_support.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Upstream-Status: Pending
-
-From 897563a0397266d8ceb058f172e16b06419b2593 Mon Sep 17 00:00:00 2001
-From: Daniel Schepler <dschepler@gmail.com>
-Date: Mon, 26 Mar 2018 17:48:34 +0300
-Subject: [PATCH] Fix FTBFS in x32
-
-===================================================================
-
----
- Source/WTF/wtf/Platform.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
-index 850e298..551c047 100644
---- a/Source/WTF/wtf/Platform.h
-+++ b/Source/WTF/wtf/Platform.h
-@@ -132,7 +132,11 @@
- /* CPU(X86_64) - AMD64 / Intel64 / x86_64 64-bit */
- #if   defined(__x86_64__) \
-     || defined(_M_X64)
-+#ifdef __ILP32__
-+#define WTF_CPU_X86_64_32 1
-+#else
- #define WTF_CPU_X86_64 1
-+#endif
- #define WTF_CPU_X86_SSE2 1
- #define WTF_CPU_KNOWN 1
- #endif
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
index e4197d1a00..288c715cc3 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
@@ -16,13 +16,12 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch \
            file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
            file://0001-Enable-THREADS_PREFER_PTHREAD_FLAG.patch \
-           file://x32_support.patch \
            file://cross-compile.patch \
            file://0001-Fix-build-with-musl.patch \
            file://include_array.patch \
            "
-SRC_URI[md5sum] = "60f881729f3b71244b7f6e58790073e0"
-SRC_URI[sha256sum] = "4386900713dfadf9741177210b32623cab22562a79ffd0d446b66569934b113f"
+SRC_URI[md5sum] = "ec0ef870ca37e3a5ebbead2f268a28ec"
+SRC_URI[sha256sum] = "b9d23525cfd8d22c37b5d964a9fe9a8ce7583042a2f8d3922e71e6bbc68c30bd"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.17.1

