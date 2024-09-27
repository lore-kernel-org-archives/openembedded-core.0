Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92635CEBF7B
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 07:08:22 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.63583.1727420898403113012
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 00:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dI/qVVKo;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2053a0bd0a6so18305215ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 00:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1727420898; x=1728025698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NzcIcK+jY0x640IC5JwVfdyYeL7jsM23udBtflC0S4g=;
        b=dI/qVVKowsQA5kn2AQkWQNQmOdus13K+Rjo5DfG4K6zYnAocwt7Q5r2yVQIxZ/c45u
         L0AYXhg7jlqSKwz/jxlEeXP7/mXvx2OKEXkhPaIgsz1nSRw7rnbx8aZREGOhrJ+Xl3U2
         wtp0uwetZTquLAd0v+EJDDiwaeL50+110R3JY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727420898; x=1728025698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzcIcK+jY0x640IC5JwVfdyYeL7jsM23udBtflC0S4g=;
        b=tulaEhDCfPe26vBLhyYHGHiJ1aqjjv2X6aQsAP7LxbGPHcGv3vm0ytCIRbNKqTpFc5
         8yu3Mmrfr+uVeoq0R5cCiKgPJOdjLZWVX5Rte0LajyPFFYFWGHRa/4Y3U8yk4j0P+2kD
         G+e9RL6bIlAg34W7sxhVGejhJPko3wqaO16C9sKPzCWngq7fuGbHxntzfHlONpyn3b4d
         XRS0dpysoAWNz/bdVw1atuBA0o8s1rUfotFcYGO6a0IE1KcH/6ohx1/X2Q7oTQffZOjk
         aIGdbCNrydxsCe/x3h0fF57EKkAyukIN4fSVbFCcluoCHIDYmMJMG+wTOnku2eeVNp0M
         76YA==
X-Gm-Message-State: AOJu0Yxu0Vf1YXIPmK9LKSpu+27p084zRwytwk0Gf5+ooKMNjkxrTdpy
	A6POpbVjX/N3LS+ExNmREnsh4Cu+zl9qrB4MOkHUUODWiINTO4lQfmjakbxgBdgCVjAR5AqmIgR
	t
X-Google-Smtp-Source: AGHT+IFZT9ic79qXqi14dUf0XJKzlji/dBCxsMi26+Q0muWTLEKHD93xybIrHPI4YaH6AP+PkNUfpA==
X-Received: by 2002:a17:903:22d2:b0:206:d66d:a30d with SMTP id d9443c01a7336-20b36be583emr34843895ad.6.1727420897483;
        Fri, 27 Sep 2024 00:08:17 -0700 (PDT)
Received: from MVIN00016.mvista.com ([150.129.170.215])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37db314asm8071435ad.117.2024.09.27.00.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 00:08:17 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCHv2] webkitgtk: upgrade 2.44.1 -> 2.44.3
Date: Fri, 27 Sep 2024 12:38:09 +0530
Message-Id: <20240927070809.45823-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 07:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205007

Remove CVE-2024-40779.patch which already fix in this upgraded version.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 ...able-to-control-macro-__PAS_ALWAYS_I.patch |  6 +-
 ...spection.cmake-prefix-variables-obta.patch |  2 +-
 ...d5e22213fdaca2a29ec3400c927d710a37a8.patch |  2 +-
 .../webkit/webkitgtk/CVE-2024-40779.patch     | 92 -------------------
 .../webkit/webkitgtk/no-musttail-arm.patch    |  6 +-
 .../webkit/webkitgtk/reproducibility.patch    |  2 +-
 .../webkit/webkitgtk/t6-not-declared.patch    | 12 +--
 ...ebkitgtk_2.44.1.bb => webkitgtk_2.44.3.bb} |  7 +-
 8 files changed, 16 insertions(+), 113 deletions(-)
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


