Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 01F396BF35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 17:03:05 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id s11so6520605wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 09:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WU1zLjdzKa9mR21g/q7EtGLZ9yxwyMzSdvOHJ7BRzx8=;
	b=EK7GRZ25Ap+sowDRXXFgiq+Mv20QEw0DV1PfJ4uBM8blNStLm8DIO6qDJNZwiNiQZI
	a7GU53Wx0Mtdfo5Hf43d4x2SJF0/uvmM7n8i+P/AaIrkcpGesKFxwBJqpRcy53fmkYLI
	B9ZqAJ/0KvsuKD+zY5UQ9djGXas5QROO2LnaPKhZA1ES8XEK9YZlwCys0TsiTK+G8f8R
	5q8PvlnluS3uzc8oeb+MUeCFeJi0AQu1AJQexSUsjOVeJM3pvYZLBjF2hSW37rP8MJe3
	5RvgK/KboH0uNPW8fUkV9UNmvV1YeIt7WjvhmPWpexpIhkkgB5tNy808CjuXtgy1aFnB
	1f6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WU1zLjdzKa9mR21g/q7EtGLZ9yxwyMzSdvOHJ7BRzx8=;
	b=jRFtjQwN7A62hWpJ1VoW9wHvk4Ym6zyIjvbY5toNR9d5oGDjXdvV5mnga2y7J7o7ru
	sI20MldfH4RTseJ3qPn+L2d/QdDJ0DbMgIPF7OVujTg+xE4TvFaJh7Rm8ITkRwPnKNt5
	fk0Vo5a7KmH6OpLUgtGORZ2D8L2hcF8nAoHNjzkgUnpqwJiYCnuMISXQzZbg32yopK2i
	5hpx1b/64LeazPyHwNz0hHZfLPhEr+t92qaEFTeQO8g7cZ8cr1odHvokHR73BvNUbi/Y
	4rS26cOentKHJWZV/5ZIjLvg40CsBosy6OU3lwTRN3OrGYSDem7NvaOLg+7NHojTDScf
	IfMw==
X-Gm-Message-State: AGRZ1gL/S1Nc4X5kQ+GfxDewevmVsfTlvBmM55lFmlfj0dN4qpCsDzd4
	r0au3dmdbth8TNZpIU/YlOVLeTNe
X-Google-Smtp-Source: AFSGD/VwkAo2L8hM1cvINkzUu2cUpk3ToPWOkuv0h8FnP4YHG0TLNduJJKIstSlUPIIEg3Riz42/4Q==
X-Received: by 2002:a1c:9183:: with SMTP id t125mr6444616wmd.79.1542819786059; 
	Wed, 21 Nov 2018 09:03:06 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	x12sm24076122wrt.20.2018.11.21.09.03.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 09:03:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Nov 2018 18:02:56 +0100
Message-Id: <20181121170259.10557-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/4] webkitgtk: update to 2.22.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2018 17:03:06 -0000

Remove upstreamed patches.
Add a tweak to 0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
for Javascriptcore gir file (previously it was pre-compiled in tarballs).

Rebase 0001-Fix-build-with-musl.patch

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-has-no-member-named-lightVector-on-.patch | 37 ----------------
 .../webkitgtk/0001-Fix-build-with-musl.patch  | 36 +++++++--------
 ...trospection-files-add-CMAKE_C_FLAGS-.patch | 26 ++++++++---
 .../0001-webkitgtk-fix-CVE-2017-17821.patch   | 44 -------------------
 .../0012-soup-Forward-declare-URL-class.patch | 31 -------------
 ...ebkitgtk_2.20.5.bb => webkitgtk_2.22.3.bb} |  7 +--
 6 files changed, 40 insertions(+), 141 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-PaintingData-has-no-member-named-lightVector-on-.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-webkitgtk-fix-CVE-2017-17821.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-declare-URL-class.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.20.5.bb => webkitgtk_2.22.3.bb} (94%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-PaintingData-has-no-member-named-lightVector-on-.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-PaintingData-has-no-member-named-lightVector-on-.patch
deleted file mode 100644
index 25f4846592a..00000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-PaintingData-has-no-member-named-lightVector-on-.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a5d4e038268ae23486fecc1966fd2e16a7f40ce8 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 25 Jul 2018 00:23:48 -0700
-Subject: [PATCH] Fix PaintingData' has no member named 'lightVector' on
- ARM_NEON
-
-* platform/graphics/cpu/arm/filters/FELightingNEON.h:
-(WebCore::FELighting::platformApplyNeon):
-
-Upstream-Status: Submitted
-https://bugs.webkit.org/show_bug.cgi?id=187991
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
-index 42af922..b542a4c 100644
---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
-+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FELightingNEON.h
-@@ -144,9 +144,9 @@ inline void FELighting::platformApplyNeon(const LightingData& data, const LightS
-             neonData.flags |= FLAG_CONE_EXPONENT_IS_1;
-     } else {
-         ASSERT(m_lightSource->type() == LS_DISTANT);
--        floatArguments.lightX = paintingData.lightVector.x();
--        floatArguments.lightY = paintingData.lightVector.y();
--        floatArguments.lightZ = paintingData.lightVector.z();
-+        floatArguments.lightX = paintingData.initialLightingData.lightVector.x();
-+        floatArguments.lightY = paintingData.initialLightingData.lightVector.y();
-+        floatArguments.lightZ = paintingData.initialLightingData.lightVector.z();
-         floatArguments.padding2 = 1;
-     }
- 
--- 
-2.10.2
-
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
index 041ec4675f1..d9a18e0ce93 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-with-musl.patch
@@ -1,4 +1,4 @@
-From 4f9d736e0458ed33cd161cd164ad0acdac939f44 Mon Sep 17 00:00:00 2001
+From 322966273a8e085829261a397af37de0fbf51aad Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 6 Oct 2017 17:00:08 +0300
 Subject: [PATCH] Fix build with musl
@@ -7,69 +7,69 @@ Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- Source/JavaScriptCore/runtime/MachineContext.h | 18 +++++++++++++++++-
+ Source/JavaScriptCore/runtime/MachineContext.h | 10 +++++-----
  Source/WTF/wtf/Platform.h                      |  2 +-
- 2 files changed, 18 insertions(+), 2 deletions(-)
+ 2 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/Source/JavaScriptCore/runtime/MachineContext.h b/Source/JavaScriptCore/runtime/MachineContext.h
-index bf0bdc7..84b8a8a 100644
+index 836d755..7665d25 100644
 --- a/Source/JavaScriptCore/runtime/MachineContext.h
 +++ b/Source/JavaScriptCore/runtime/MachineContext.h
-@@ -146,7 +146,7 @@ inline void*& stackPointer(mcontext_t& machineContext)
+@@ -188,7 +188,7 @@ static inline void*& stackPointerImpl(mcontext_t& machineContext)
  #error Unknown Architecture
  #endif
  
--#elif defined(__GLIBC__) || defined(__BIONIC__)
+-#elif OS(FUCHSIA) || defined(__GLIBC__) || defined(__BIONIC__)
 +#elif defined(__linux__)
  
  #if CPU(X86)
      return reinterpret_cast<void*&>((uintptr_t&) machineContext.gregs[REG_ESP]);
-@@ -251,7 +251,7 @@ inline void*& framePointer(mcontext_t& machineContext)
+@@ -335,7 +335,7 @@ static inline void*& framePointerImpl(mcontext_t& machineContext)
  #error Unknown Architecture
  #endif
  
--#elif defined(__GLIBC__) || defined(__BIONIC__)
+-#elif OS(FUCHSIA) || defined(__GLIBC__) || defined(__BIONIC__)
 +#elif defined(__linux__)
  
  // The following sequence depends on glibc's sys/ucontext.h.
  #if CPU(X86)
-@@ -354,7 +354,7 @@ inline void*& instructionPointer(mcontext_t& machineContext)
+@@ -482,7 +482,7 @@ static inline void*& instructionPointerImpl(mcontext_t& machineContext)
  #error Unknown Architecture
  #endif
  
--#elif defined(__GLIBC__) || defined(__BIONIC__)
+-#elif OS(FUCHSIA) || defined(__GLIBC__) || defined(__BIONIC__)
 +#elif defined(__linux__)
  
  // The following sequence depends on glibc's sys/ucontext.h.
  #if CPU(X86)
-@@ -466,7 +466,7 @@ inline void*& argumentPointer<1>(mcontext_t& machineContext)
+@@ -639,7 +639,7 @@ inline void*& argumentPointer<1>(mcontext_t& machineContext)
  #error Unknown Architecture
  #endif
  
--#elif defined(__GLIBC__) || defined(__BIONIC__)
+-#elif OS(FUCHSIA) || defined(__GLIBC__) || defined(__BIONIC__)
 +#elif defined(__linux__)
  
  // The following sequence depends on glibc's sys/ucontext.h.
  #if CPU(X86)
-@@ -583,7 +583,7 @@ inline void*& llintInstructionPointer(mcontext_t& machineContext)
+@@ -756,7 +756,7 @@ inline void*& llintInstructionPointer(mcontext_t& machineContext)
  #error Unknown Architecture
  #endif
  
--#elif defined(__GLIBC__) || defined(__BIONIC__)
+-#elif OS(FUCHSIA) || defined(__GLIBC__) || defined(__BIONIC__)
 +#elif defined(__linux__)
  
  // The following sequence depends on glibc's sys/ucontext.h.
  #if CPU(X86)
 diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
-index 551c047..e50b05a 100644
+index a841946..1e5c7dd 100644
 --- a/Source/WTF/wtf/Platform.h
 +++ b/Source/WTF/wtf/Platform.h
-@@ -683,7 +683,7 @@
+@@ -701,7 +701,7 @@
  #define HAVE_CFNETWORK_STORAGE_PARTITIONING 1
  #endif
  
--#if OS(DARWIN) || ((OS(FREEBSD) || defined(__GLIBC__) || defined(__BIONIC__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
-+#if OS(DARWIN) || ((OS(FREEBSD) || defined(__linux__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
+-#if OS(DARWIN) || OS(FUCHSIA) || ((OS(FREEBSD) || defined(__GLIBC__) || defined(__BIONIC__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
++#if OS(DARWIN) || OS(FUCHSIA) || ((OS(FREEBSD) || defined(__linux__) || defined(__BIONIC__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
  #define HAVE_MACHINE_CONTEXT 1
  #endif
  
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch b/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
index 923d00c4bae..3e03aa968ca 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch
@@ -1,4 +1,4 @@
-From f9767a479111f9c6f280c43176c33de50aee7f66 Mon Sep 17 00:00:00 2001
+From 8f1e170a6de8036ab50eb35834a77f2c79412ee3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 28 Oct 2015 14:18:57 +0200
 Subject: [PATCH] When building introspection files, add CMAKE_C_FLAGS to the
@@ -11,14 +11,28 @@ Upstream-Status: Pending [review on oe-core list]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- Source/WebKit/PlatformGTK.cmake | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ Source/JavaScriptCore/PlatformGTK.cmake | 2 +-
+ Source/WebKit/PlatformGTK.cmake         | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
 
+diff --git a/Source/JavaScriptCore/PlatformGTK.cmake b/Source/JavaScriptCore/PlatformGTK.cmake
+index 0b2968d2..2742ad80 100644
+--- a/Source/JavaScriptCore/PlatformGTK.cmake
++++ b/Source/JavaScriptCore/PlatformGTK.cmake
+@@ -71,7 +71,7 @@ if (ENABLE_INTROSPECTION)
+     add_custom_command(
+         OUTPUT ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
+         DEPENDS JavaScriptCore
+-        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations LDFLAGS=
++        COMMAND CC=${CMAKE_C_COMPILER} CFLAGS=-Wno-deprecated-declarations\ ${CMAKE_C_FLAGS} LDFLAGS=
+             ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
+             ${INTROSPECTION_SCANNER}
+             --quiet
 diff --git a/Source/WebKit/PlatformGTK.cmake b/Source/WebKit/PlatformGTK.cmake
-index dc6b306..a074a80 100644
+index e36e4c35..943f9794 100644
 --- a/Source/WebKit/PlatformGTK.cmake
 +++ b/Source/WebKit/PlatformGTK.cmake
-@@ -732,7 +732,7 @@ if (ENABLE_INTROSPECTION)
+@@ -742,7 +742,7 @@ if (ENABLE_INTROSPECTION)
          OUTPUT ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
          DEPENDS WebKit
          DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
@@ -27,7 +41,7 @@ index dc6b306..a074a80 100644
              ${LOADER_LIBRARY_PATH_VAR}="${INTROSPECTION_ADDITIONAL_LIBRARY_PATH}"
              ${INTROSPECTION_SCANNER}
              --quiet
-@@ -774,7 +774,7 @@ if (ENABLE_INTROSPECTION)
+@@ -786,7 +786,7 @@ if (ENABLE_INTROSPECTION)
          OUTPUT ${CMAKE_BINARY_DIR}/WebKit2WebExtension-${WEBKITGTK_API_VERSION}.gir
          DEPENDS ${CMAKE_BINARY_DIR}/JavaScriptCore-${WEBKITGTK_API_VERSION}.gir
          DEPENDS ${CMAKE_BINARY_DIR}/WebKit2-${WEBKITGTK_API_VERSION}.gir
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-webkitgtk-fix-CVE-2017-17821.patch b/meta/recipes-sato/webkit/webkitgtk/0001-webkitgtk-fix-CVE-2017-17821.patch
deleted file mode 100644
index a3f75992767..00000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-webkitgtk-fix-CVE-2017-17821.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Backport patch to fix CVE-2017-17821. Refer to
-https://security-tracker.debian.org/tracker/CVE-2017-17821.
-
-Upstream-Status: Backport [https://trac.webkit.org/changeset/232119/webkit]
-CVE: CVE-2017-17821
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From 2a17b15297eb886b0bfb7d098ef607cfad6c3da0 Mon Sep 17 00:00:00 2001
-From: "mcatanzaro@igalia.com"
- <mcatanzaro@igalia.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
-Date: Wed, 23 May 2018 17:54:01 +0000
-Subject: [PATCH] Prohibit shrinking the FastBitVector
- https://bugs.webkit.org/show_bug.cgi?id=181020
-
-Reviewed by Oliver Hunt.
-
-Prohibit shrinking the FastBitVector. It's not prepared for this and the current usage does
-not require it.
-
-* wtf/FastBitVector.cpp:
-(WTF::FastBitVectorWordOwner::resizeSlow):
-
-git-svn-id: http://svn.webkit.org/repository/webkit/trunk@232119 268f45cc-cd09-0410-ab3c-d52691b4dbfc
----
- Source/WTF/wtf/FastBitVector.cpp |  2 ++
- 2 files changed, 15 insertions(+)
-
-diff --git a/Source/WTF/wtf/FastBitVector.cpp b/Source/WTF/wtf/FastBitVector.cpp
-index eed316975f4..8b019aaa3ed 100644
---- a/Source/WTF/wtf/FastBitVector.cpp
-+++ b/Source/WTF/wtf/FastBitVector.cpp
-@@ -42,6 +42,8 @@ void FastBitVectorWordOwner::setEqualsSlow(const FastBitVectorWordOwner& other)
- void FastBitVectorWordOwner::resizeSlow(size_t numBits)
- {
-     size_t newLength = fastBitVectorArrayLength(numBits);
-+
-+    RELEASE_ASSERT(newLength >= arrayLength());
-     
-     // Use fastCalloc instead of fastRealloc because we expect the common
-     // use case for this method to be initializing the size of the bitvector.
--- 
-2.17.0
-
diff --git a/meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-declare-URL-class.patch b/meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-declare-URL-class.patch
deleted file mode 100644
index 78fd4dc79bb..00000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0012-soup-Forward-declare-URL-class.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 59f6903ad96f3213f248b672d5fd526cc0d666ce Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 20 May 2018 14:28:27 -0700
-Subject: [PATCH] soup: Forward declare URL class
-
-This helps getting away with compiler errors seen with clang
-
-/mnt/a/oe/workspace/sources/webkitgtk/Source/WebCore/platform/network/soup/SoupNetworkSession.h:68:62:
-error: unknown type name 'URL'
-    static std::optional<ResourceError> checkTLSErrors(const URL&,
-GTlsCertificate*, GTlsCertificateFlags);
-                                                             ^
-Upstream-Status: Backport [https://trac.webkit.org/changeset/231876/webkit]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/WebCore/platform/network/soup/SoupNetworkSession.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Source/WebCore/platform/network/soup/SoupNetworkSession.h b/Source/WebCore/platform/network/soup/SoupNetworkSession.h
-index 03bd72ba..7ca8792d 100644
---- a/Source/WebCore/platform/network/soup/SoupNetworkSession.h
-+++ b/Source/WebCore/platform/network/soup/SoupNetworkSession.h
-@@ -43,6 +43,7 @@ namespace WebCore {
- 
- class CertificateInfo;
- class ResourceError;
-+class URL;
- struct SoupNetworkProxySettings;
- 
- class SoupNetworkSession {
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.22.3.bb
similarity index 94%
rename from meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.22.3.bb
index 7f1ffcea454..d06d2a1a69a 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.20.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.22.3.bb
@@ -20,13 +20,10 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
            file://0001-Fix-build-with-musl.patch \
            file://detect-gstreamer-gl.patch \
-           file://0012-soup-Forward-declare-URL-class.patch \
-           file://0001-Fix-PaintingData-has-no-member-named-lightVector-on-.patch \
-           file://0001-webkitgtk-fix-CVE-2017-17821.patch \
            "
 
-SRC_URI[md5sum] = "72a05f6a4dc1c78b079590a8fd280401"
-SRC_URI[sha256sum] = "15c0f8d26e9605afe0948d161ba5fd82efee8eda2debd409fd40a440ac3af990"
+SRC_URI[md5sum] = "6dae6837c884a25413fb1d4527c9894a"
+SRC_URI[sha256sum] = "9dfd542902953be9af8ff32bd37fe662ca3d75f7348514ebac15c6252a6ccd72"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-- 
2.17.1


