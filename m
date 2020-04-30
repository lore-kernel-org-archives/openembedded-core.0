Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.3984.1588240721007876039
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 02:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b0KePlAd;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id j2so6106095wrs.9
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 02:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XRND/yHxumEd3OUAvNTjBjrLM1An1bQpzBvImOyfUkY=;
        b=b0KePlAdFlvzbZOuWdru+8/WW8SaAOS1QzppNg+gwpbgmg0KgSajHD1hp14tiSLexG
         PROfqoJyx0FJadVS2T+1toCu9InmlnTZWyTDm6CLTEjG8jV5iAKLnnoX2n2wKkxSetyo
         diCbMF14P8yTHxaB6BgehtG4V8KxSjDMyFP3bvt7hK6Rkv2JhLieZfwXWhuH8BFSqFRs
         I9Y3jdNhWm8xl8JTRdjnsLJ8EOJnWvB3fICMyk7ApgiPgSfJgmOcTE5A1pGiG3Uq16ge
         3IjCcU3Bm2GkpxkTSqeotf5kl9RtWx/8ima4ySiueXhHnBg+h5ngLKV96n7fvzjvbdxJ
         PyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XRND/yHxumEd3OUAvNTjBjrLM1An1bQpzBvImOyfUkY=;
        b=cUriPIwIc1HuS7oWXdFJW9wQ4rdxtgDy6cyGDNIlVNvXHzC+zUr7o1ogsuL9IThAS0
         FDtCJYs20NvcNEKBsQYWJB70kdhA4YuvFH/vwClNvYpQiGoVGmIXnLbag7abefR5esWi
         DzQWxoQO4O9PMgKud31NXyjByOC/2vSEA29iUhLi8lS6DUHRhQ6QonLj8vbvDGYmCPow
         JjaARziGtRSD/Z3on6n/9e37mBX35xqqm62aG1S6t8tVy5h2qqCueWnyj0pdD/9RUTTH
         yBgJKwM9kZ4E4Qqhih92BO/1sdMe5gXSg3IlHmtVocRfmsYdjPpBPXXm7w5EdtK7GXw4
         +5ug==
X-Gm-Message-State: AGi0PuaaRiAQGd2+uk59XBDXWKx40SjJkNTKki/kFSvAECla614XHbds
	mouFxd1wq3OvfB62UdKd3PvINUB6
X-Google-Smtp-Source: APiQypJaYoneDh60lBEyvtCkDmdM8WH5UiFCcv/gjpwPYccTRHV5iqrynFaX3+fw87qFS4Fvh5rPOw==
X-Received: by 2002:adf:e58d:: with SMTP id l13mr3083949wrm.187.1588240719261;
        Thu, 30 Apr 2020 02:58:39 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id b82sm12380682wmh.1.2020.04.30.02.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 02:58:38 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/17] webkitgtk: update to 2.28.2
Date: Thu, 30 Apr 2020 11:58:09 +0200
Message-Id: <20200430095815.2824-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200430095815.2824-1-alex.kanavin@gmail.com>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
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
2.26.1

