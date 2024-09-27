Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E045CEBF7E
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 07:13:12 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.63630.1727421184894397088
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 00:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dWyCVQbB;
 spf=pass (domain: mvista.com, ip: 209.85.210.172, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71b0d1c74bbso1316625b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 00:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1727421184; x=1728025984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F/q2NeTfyczaxuryq5t5T9YSf1tkB9br4ttck0+HSbk=;
        b=dWyCVQbBix5sNfOHYKFM+FfaikR6bS78RId32RDRt2srhXKZ0siJgNDUA4k5vZTJm1
         1/gXhKBMJWb+rLuSYTdyxJmdT6IHcQVJCXEzGLW59LRuAZNBhEDiHM+4tCE4JxVxyQSK
         zgJ7jNe4wUuqiIw3W8tyTXufPmWiL2nT0CgaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727421184; x=1728025984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/q2NeTfyczaxuryq5t5T9YSf1tkB9br4ttck0+HSbk=;
        b=a4UmFdWCzibI+eg7I+xwZUJ5G8E8eTqjijCBg7ZMkcNM/trVazQN8fg87pPCCNJJVM
         qMpiSbTo47OpDxNWrBafxg72vyNrJhu78oMcGqokX5lmDGl9Ob//s+F29eH9ZbyiKx9c
         5yoBZhSFc5/RRkFfQNmDorm9G3wzN/ExCrSdlJU+Lc0ijlCsx1BsSm4nMsvHMII96bMm
         osaKWvpsZVnI8XwVapgxb8FiYrRBleeZk7Tt9cz0zPBdc06txGJ10g1RNuik+S+QY+d8
         9Jo3Mv/J+jm98RqowciSVMTu+63mlg6k5aj9Vg6gjPQ3Cg06a0pH0JMWaVq0MZkKVWHk
         31jg==
X-Gm-Message-State: AOJu0Yxi7nU2m51NCgaav9/fJcgTW/j1ec2k2VQPrUKvLlY+EZ4nA0W8
	FEOcFf820CnVHwexO9u5QQE+b01+/Kp6TL9az1ecJ5w6nuHdHbBH4FvRdp7kTa1fXdCIKveqWCa
	h
X-Google-Smtp-Source: AGHT+IHN4So/XynnLwVKZpx6V53xHm/my4iStOB4HjGto5FV2eRWNuYiA8bK1tY6W2ctg/0HczsH3A==
X-Received: by 2002:a05:6a00:3986:b0:714:2d05:60df with SMTP id d2e1a72fcca58-71b25f7746fmr2766509b3a.15.1727421183883;
        Fri, 27 Sep 2024 00:13:03 -0700 (PDT)
Received: from MVIN00016.mvista.com ([150.129.170.215])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26538812sm945293b3a.218.2024.09.27.00.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 00:13:03 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCHv3] webkitgtk: upgrade 2.44.1 -> 2.44.3
Date: Fri, 27 Sep 2024 12:42:56 +0530
Message-Id: <20240927071256.46145-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 07:13:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205008

Remove below patches which already fix in this upgraded version.

1. CVE-2024-40779.patch
2. 0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 ...able-to-control-macro-__PAS_ALWAYS_I.patch |  6 +-
 ...spection.cmake-prefix-variables-obta.patch |  2 +-
 ...fic-declarations-in-FELighting.h-unn.patch | 44 ---------
 ...d5e22213fdaca2a29ec3400c927d710a37a8.patch |  2 +-
 .../webkit/webkitgtk/CVE-2024-40779.patch     | 92 -------------------
 .../webkit/webkitgtk/no-musttail-arm.patch    |  6 +-
 .../webkit/webkitgtk/reproducibility.patch    |  2 +-
 .../webkit/webkitgtk/t6-not-declared.patch    | 12 +--
 ...ebkitgtk_2.44.1.bb => webkitgtk_2.44.3.bb} |  7 +-
 9 files changed, 16 insertions(+), 157 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2024-40779.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.44.1.bb => webkitgtk_2.44.3.bb} (95%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
index a819e22127..a19008a41f 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
@@ -1,4 +1,4 @@
-From 575b848a3b3c14280679db80d0d518922c83d62a Mon Sep 17 00:00:00 2001
+From 99a21305ae683a216e9299e5dbdd763190a8cfe3 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Fri, 11 Aug 2023 14:20:48 +0800
 Subject: [PATCH] Add a variable to control macro
@@ -57,10 +57,10 @@ index 5d5fb38c..a554f700 100644
  #else
  #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
 diff --git a/Source/cmake/WebKitCompilerFlags.cmake b/Source/cmake/WebKitCompilerFlags.cmake
-index 9b2fecf9..7cdc2b6a 100644
+index 0732785e..4879ec40 100644
 --- a/Source/cmake/WebKitCompilerFlags.cmake
 +++ b/Source/cmake/WebKitCompilerFlags.cmake
-@@ -453,3 +453,10 @@ endif ()
+@@ -452,3 +452,10 @@ endif ()
  
  # FIXME: Enable pre-compiled headers for all ports <https://webkit.org/b/139438>
  set(CMAKE_DISABLE_PRECOMPILE_HEADERS ON)
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index 8e29ce17ed..dda20a7b25 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From 6348f91c29e2350ad3fec5264aa57dd4994d4583 Mon Sep 17 00:00:00 2001
+From d1f6a1b6a1298f6ef2f1677e9996aa60a002134a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch
deleted file mode 100644
index 6ffe0a9454..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From dbd1a59b239b3902e717fdeb063883dbb0b06ee9 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Sun, 26 May 2024 14:24:35 -0700
-Subject: [PATCH 1/2] Remove ARM-specific declarations in FELighting.h unneeded
- after 272873@main
-
-Unreviewed build fix.
-
-* Source/WebCore/platform/graphics/filters/FELighting.h: Remove unneeded
-  declarations for the getPowerCoefficients() and platformApplyNeon()
-  functions, which are now defined elsewhere; and were causing a build
-  failure due to usage of the protected LightingData type.
-
-Canonical link: https://commits.webkit.org/279334@main
-
-Backport this patch for fixing following compile error:
-webkitgtk-2.44.1/Source/WebCore/platform/graphics/filters/FELighting.h:73:41: error: 'LightingData' does not name a type 
-   73 |     inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/36d1b5d7c0ef9a733ee8055b1f35b1d24435d538]
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- Source/WebCore/platform/graphics/filters/FELighting.h | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/Source/WebCore/platform/graphics/filters/FELighting.h b/Source/WebCore/platform/graphics/filters/FELighting.h
-index 4efab920..dcd80b6f 100644
---- a/Source/WebCore/platform/graphics/filters/FELighting.h
-+++ b/Source/WebCore/platform/graphics/filters/FELighting.h
-@@ -68,11 +68,6 @@ protected:
- 
-     std::unique_ptr<FilterEffectApplier> createSoftwareApplier() const override;
- 
--#if CPU(ARM_NEON) && CPU(ARM_TRADITIONAL) && COMPILER(GCC_COMPATIBLE)
--    static int getPowerCoefficients(float exponent);
--    inline void platformApplyNeon(const LightingData&, const LightSource::PaintingData&);
--#endif
--
-     Color m_lightingColor;
-     float m_surfaceScale;
-     float m_diffuseConstant;
--- 
-2.25.1
-
diff --git a/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch b/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch
index 76bcb3df99..0d8976c502 100644
--- a/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch
@@ -1,4 +1,4 @@
-From 1523e00a2a76e285262c8aa3721b5d99f3f2d612 Mon Sep 17 00:00:00 2001
+From 2ee948191de1c561b72ebf462605376cfb3ce7af Mon Sep 17 00:00:00 2001
 From: Thomas Devoogdt <thomas.devoogdt@barco.com>
 Date: Mon, 16 Jan 2023 17:03:30 +0100
 Subject: [PATCH] REGRESSION(257865@main): B3Validate.cpp: fix
diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2024-40779.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2024-40779.patch
deleted file mode 100644
index 1a7e27dcb6..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/CVE-2024-40779.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 2fe5ae29a5f6434ef456afe9673a4f400ec63848 Mon Sep 17 00:00:00 2001
-From: Jean-Yves Avenard <jya@apple.com>
-Date: Fri, 14 Jun 2024 16:08:19 -0700
-Subject: [PATCH] Cherry-pick 272448.1085@safari-7618.3.10-branch
- (ff52ff7cb64e). https://bugs.webkit.org/show_bug.cgi?id=275431
-
-HeapBufferOverflow in computeSampleUsingLinearInterpolation
-https://bugs.webkit.org/show_bug.cgi?id=275431
-rdar://125617812
-
-Reviewed by Youenn Fablet.
-
-Add boundary check.
-This is a copy of blink code for that same function.
-https://source.chromium.org/chromium/chromium/src//main:third_party/blink/renderer/modules/webaudio/audio_buffer_source_handler.cc;l=336-341
-
-* LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash-expected.txt: Added.
-* LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash.html: Added.
-* Source/WebCore/Modules/webaudio/AudioBufferSourceNode.cpp:
-(WebCore::AudioBufferSourceNode::renderFromBuffer):
-
-Canonical link: https://commits.webkit.org/274313.347@webkitglib/2.44
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/2fe5ae29a5f6434ef456afe9673a4f400ec63848]
-CVE: CVE-2024-40779
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- ...er-sourcenode-resampler-crash-expected.txt |  1 +
- ...udiobuffer-sourcenode-resampler-crash.html | 25 +++++++++++++++++++
- .../webaudio/AudioBufferSourceNode.cpp        |  6 +++++
- 3 files changed, 32 insertions(+)
- create mode 100644 LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash-expected.txt
- create mode 100644 LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash.html
-
-diff --git a/LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash-expected.txt b/LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash-expected.txt
-new file mode 100644
-index 00000000..654ddf7f
---- /dev/null
-+++ b/LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash-expected.txt
-@@ -0,0 +1 @@
-+This test passes if it does not crash.
-diff --git a/LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash.html b/LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash.html
-new file mode 100644
-index 00000000..5fb2dd8c
---- /dev/null
-+++ b/LayoutTests/webaudio/crashtest/audiobuffer-sourcenode-resampler-crash.html
-@@ -0,0 +1,25 @@
-+<html>
-+<head>
-+    <script>
-+        async function main() {
-+            var ctx = new AudioContext();
-+            var src = new AudioBufferSourceNode(ctx);
-+            src.buffer = ctx.createBuffer(1, 8192, 44100);
-+            src.start(undefined, 0.5);
-+            src.playbackRate.value = -1;
-+            src.connect(ctx.destination, 0, 0);
-+            if (window.testRunner)
-+                testRunner.notifyDone();
-+        }
-+    </script>
-+</head>
-+<body onload="main()">
-+    <p>This test passes if it does not crash.</p>
-+    <script>
-+    if (window.testRunner) {
-+        testRunner.waitUntilDone();
-+        testRunner.dumpAsText();
-+    }
-+    </script>
-+</body>
-+</html>
-diff --git a/Source/WebCore/Modules/webaudio/AudioBufferSourceNode.cpp b/Source/WebCore/Modules/webaudio/AudioBufferSourceNode.cpp
-index 42f2779e..7963fb9f 100644
---- a/Source/WebCore/Modules/webaudio/AudioBufferSourceNode.cpp
-+++ b/Source/WebCore/Modules/webaudio/AudioBufferSourceNode.cpp
-@@ -343,6 +343,12 @@ bool AudioBufferSourceNode::renderFromBuffer(AudioBus* bus, unsigned destination
-             if (readIndex2 >= maxFrame)
-                 readIndex2 = m_isLooping ? minFrame : readIndex;
- 
-+            // Final sanity check on buffer access.
-+            // FIXME: as an optimization, try to get rid of this inner-loop check and
-+            // put assertions and guards before the loop.
-+            if (readIndex >= bufferLength || readIndex2 >= bufferLength)
-+                break;
-+
-             // Linear interpolation.
-             for (unsigned i = 0; i < numberOfChannels; ++i) {
-                 float* destination = destinationChannels[i];
--- 
-2.25.1
-
diff --git a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
index 8ce37a01cc..793be48df2 100644
--- a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
@@ -1,4 +1,4 @@
-From a9c874f7418cefbe78f7cd26505ae495cb59bbcf Mon Sep 17 00:00:00 2001
+From 31dca9601888f2a539dfb22693ffd62c22ee8912 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 12 Jan 2024 09:21:39 -0800
 Subject: [PATCH] clang/arm: Do not use MUST_TAIL_CALL
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Source/WTF/wtf/Compiler.h b/Source/WTF/wtf/Compiler.h
-index 0ea5cb76..c5480dbc 100644
+index 449ca502..daac29d7 100644
 --- a/Source/WTF/wtf/Compiler.h
 +++ b/Source/WTF/wtf/Compiler.h
-@@ -284,7 +284,7 @@
+@@ -321,7 +321,7 @@
  /* MUST_TAIL_CALL */
  
  #if !defined(MUST_TAIL_CALL) && defined(__cplusplus) && defined(__has_cpp_attribute)
diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
index 93a431a0b1..d614a1ee4f 100644
--- a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
@@ -1,4 +1,4 @@
-From d096b945113ddecaf33062296e20b6d5a007cab3 Mon Sep 17 00:00:00 2001
+From cb5458b5d15aafa3543a47a33975609026d45d32 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 3 Jan 2022 14:18:34 +0000
 Subject: [PATCH] webkitgtk: Add reproducibility fix
diff --git a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
index d4720e4f28..064925dace 100644
--- a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
@@ -1,10 +1,9 @@
-From 3d5373575695b293b8559155431d0079a6153aff Mon Sep 17 00:00:00 2001
+From 36c092723ec6d4908039341c9d157db8ab1c0a59 Mon Sep 17 00:00:00 2001
 From: Michael Catanzaro <mcatanzaro@redhat.com>
 Date: Mon, 5 Feb 2024 11:00:49 -0600
-Subject: [PATCH] =?UTF-8?q?[GTK]=20[2.42.5]=20LowLevelInterpreter.cpp:339:?=
- =?UTF-8?q?21:=20error:=20=E2=80=98t6=E2=80=99=20was=20not=20declared=20in?=
- =?UTF-8?q?=20this=20scope=20https://bugs.webkit.org/show=5Fbug.cgi=3Fid?=
- =?UTF-8?q?=3D268739?=
+Subject: [PATCH] =?UTF-8?q?LowLevelInterpreter.cpp:339:21:=20error:=20?=
+ =?UTF-8?q?=E2=80=98t6=E2=80=99=20was=20not=20declared=20in=20this=20scope?=
+ =?UTF-8?q?=20https://bugs.webkit.org/show=5Fbug.cgi=3Fid=3D268739?=
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -22,7 +21,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-index 5064ead6cd2e7..9a2e2653b1219 100644
+index 75cecbbd..b1020ea4 100644
 --- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
 +++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
 @@ -336,8 +336,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
@@ -34,4 +33,3 @@ index 5064ead6cd2e7..9a2e2653b1219 100644
  
      struct StackPointerScope {
          StackPointerScope(CLoopStack& stack)
-
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
similarity index 95%
rename from meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
index 29f834ee9b..90fb7a1d42 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
@@ -16,11 +16,8 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://no-musttail-arm.patch \
            file://t6-not-declared.patch \
            file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
-           file://0001-Remove-ARM-specific-declarations-in-FELighting.h-unn.patch \
-           file://0002-More-dynamicDowncast-adoption-in-platform-code.patch \
-           file://CVE-2024-40779.patch \
            "
-SRC_URI[sha256sum] = "425b1459b0f04d0600c78d1abb5e7edfa3c060a420f8b231e9a6a2d5d29c5561"
+SRC_URI[sha256sum] = "dc82d042ecaca981a4852357c06e5235743319cf10a94cd36ad41b97883a0b54"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
@@ -96,7 +93,7 @@ EXTRA_OECMAKE = " \
 
 # Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of the
 # debug symbols (4.3GB to 700M at time of writing)
-DEBUG_FLAGS:append = "${@oe.utils.vartrue('DEBUG_BUILD', '', ' -g1', d)}"
+DEBUG_LEVELFLAG = "-g1"
 
 # Javascript JIT is not supported on ARC
 EXTRA_OECMAKE:append:arc = " -DENABLE_JIT=OFF "
-- 
2.25.1


