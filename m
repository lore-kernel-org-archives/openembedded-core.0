Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342B0CA0ED4
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:56:03 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.12173.1752594939144685491
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BlxGjYsk;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=FWZm8IWO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101980eccb89b-4f99d9d2-7346-4d4e-99dc-de18d961116d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594954;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yLrTATU2CmrMXS8wZe80jyOu0wCzIbNofD6QLvaPRGc=;
	b=BlxGjYskXGVbZvXTyoRS2ZzsIm7nUBTZdILpLTYvZ0Y2f09YP4f/faeXxl23tPJs
	88KL17MqdkBpvewShplQlffo+h4Wd+OjYFo7ZFuwuz+K4VgE2he0xpBRkKGi8fkx+48
	Tu8xDseFdmzzow19yn70dK3f3bgSOTMpdcgOABzQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594954;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yLrTATU2CmrMXS8wZe80jyOu0wCzIbNofD6QLvaPRGc=;
	b=FWZm8IWOCt9Sb0DHQ7PfpTd8bgEsrm1TFQEpuKIy7jymuPzvYaQkwGJetAjTGjAb
	tahwora4JhdhFNU+aumkP143uqNRJ9uRiF+y0Yd8GAtaX2MgnkE4+7D0jWpWmLUgerv
	xZfBasP60TReWIhZNNy4F+Lufs+mlRO62/pVTsu0=
Content-Type: multipart/mixed; boundary="===============7619779754160985696=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] webkitgtk: upgrading to 2.48.3 FAILED
Message-ID: <010101980eccb89b-4f99d9d2-7346-4d4e-99dc-de18d961116d-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220391

--===============7619779754160985696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *webkitgtk* to *2.48.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-webkitgtk-upgrade-2.48.2-2.48.3.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 698d16381beb474b4b977e8a5c4a4527cd4a53a1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 14:43:51 +0000
Subject: [PATCH] webkitgtk: upgrade 2.48.2 -> 2.48.3

---
 ...able-to-control-macro-__PAS_ALWAYS_I.patch |  8 +++----
 ...spection.cmake-prefix-variables-obta.patch |  2 +-
 ...-on-RISCV-https-bugs.webkit.org-show.patch |  4 ++--
 .../webkit/webkitgtk/fix-ftbfs-riscv64.patch  | 22 ++++++++++++-------
 .../webkit/webkitgtk/no-musttail-arm.patch    |  4 ++--
 .../webkit/webkitgtk/reproducibility.patch    |  2 +-
 .../webkit/webkitgtk/sys_futex.patch          | 11 +++++++++-
 .../webkit/webkitgtk/t6-not-declared.patch    |  6 ++---
 ...ebkitgtk_2.48.2.bb => webkitgtk_2.48.3.bb} |  2 +-
 9 files changed, 38 insertions(+), 23 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.48.2.bb => webkitgtk_2.48.3.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
index 8376ee8472..a860535ba0 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
@@ -1,4 +1,4 @@
-From bbf661310448d430350eb2ad8c5869ace648dcf8 Mon Sep 17 00:00:00 2001
+From f694cb10f0c764ba882ae4ccaeb224c84dc605fb Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Fri, 11 Aug 2023 14:20:48 +0800
 Subject: [PATCH] Add a variable to control macro
@@ -44,7 +44,7 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  2 files changed, 8 insertions(+), 1 deletion(-)
 
 diff --git a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
-index 5d5fb38c..a554f700 100644
+index 245e2eef..64955fad 100644
 --- a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
 +++ b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
 @@ -44,7 +44,7 @@ __PAS_BEGIN_EXTERN_C;
@@ -57,10 +57,10 @@ index 5d5fb38c..a554f700 100644
  #else
  #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
 diff --git a/Source/cmake/WebKitCompilerFlags.cmake b/Source/cmake/WebKitCompilerFlags.cmake
-index f5ec0a55..dfd741e7 100644
+index de1cb6c4..b6ff0b78 100644
 --- a/Source/cmake/WebKitCompilerFlags.cmake
 +++ b/Source/cmake/WebKitCompilerFlags.cmake
-@@ -492,3 +492,10 @@ endif ()
+@@ -503,3 +503,10 @@ endif ()
  
  # FIXME: Enable pre-compiled headers for all ports <https://webkit.org/b/139438>
  set(CMAKE_DISABLE_PRECOMPILE_HEADERS ON)
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index b11a18ba22..c4c95c2d19 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From e0dfc113b016227da8a654d625e8f568b56761d0 Mon Sep 17 00:00:00 2001
+From 6dd385ed888bb37a3c1d59620866079ae15c07c2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch
index 40a7133052..8a4713ea97 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch
@@ -1,4 +1,4 @@
-From 984538dcce7b184269efc1e1b0fb78e1cb932b5d Mon Sep 17 00:00:00 2001
+From ed8992d8952e845b50b914249c99972b38804625 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 21 Mar 2025 01:21:22 -0700
 Subject: [PATCH] Fix build errors on RISCV
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/Source/WebCore/contentextensions/ContentExtensionActions.h b/Source/WebCore/contentextensions/ContentExtensionActions.h
-index 0b75d2e1df78..61cb33c94ce8 100644
+index 0b75d2e1..61cb33c9 100644
 --- a/Source/WebCore/contentextensions/ContentExtensionActions.h
 +++ b/Source/WebCore/contentextensions/ContentExtensionActions.h
 @@ -28,6 +28,7 @@
diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
index e436896098..4ae3eddd49 100644
--- a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
@@ -1,13 +1,17 @@
+From ed368e5bfde54d05f2516b853a76e76f8ef2cfd2 Mon Sep 17 00:00:00 2001
 From: Alberto Garcia <berto@igalia.com>
-Description: Use WTF_CPU_UNKNOWN when building for riscv64
- WebKitGTK doesn't build on riscv64 even with the JIT disabled.
- Treating the CPU as unknown is perhaps a bit severe, but it allows us
- to get the build done until someone steps up to maintain this
- properly.
-Bug: https://bugs.webkit.org/show_bug.cgi?id=271371
+Date: Tue, 15 Jul 2025 14:42:35 +0000
+Subject: [PATCH] Upstream-Status: Submitted
+ [https://bugs.webkit.org/show_bug.cgi?id=271371#c1] Signed-off-by: Khem Raj
+ <raj.khem@gmail.com>
 
-Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=271371#c1]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/WTF/wtf/PlatformCPU.h    | 8 --------
+ Source/cmake/WebKitCommon.cmake | 2 --
+ 2 files changed, 10 deletions(-)
+
+diff --git a/Source/WTF/wtf/PlatformCPU.h b/Source/WTF/wtf/PlatformCPU.h
+index 8aac1024..d9d69a40 100644
 --- a/Source/WTF/wtf/PlatformCPU.h
 +++ b/Source/WTF/wtf/PlatformCPU.h
 @@ -286,14 +286,6 @@
@@ -25,6 +29,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #if !CPU(KNOWN)
  #define WTF_CPU_UNKNOWN 1
  #endif
+diff --git a/Source/cmake/WebKitCommon.cmake b/Source/cmake/WebKitCommon.cmake
+index 38ac0c47..9d7873e2 100644
 --- a/Source/cmake/WebKitCommon.cmake
 +++ b/Source/cmake/WebKitCommon.cmake
 @@ -125,8 +125,6 @@ if (NOT HAS_RUN_WEBKIT_COMMON)
diff --git a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
index 367e6b8342..658ad7094c 100644
--- a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
@@ -1,4 +1,4 @@
-From 4602261fa44d6bbb4c3698c79e08a6a40a6edc5a Mon Sep 17 00:00:00 2001
+From caf49a64dc9d3a039f94e524746c3cf9e695696e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 12 Jan 2024 09:21:39 -0800
 Subject: [PATCH] clang/arm: Do not use MUST_TAIL_CALL
@@ -20,7 +20,7 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Source/WTF/wtf/Compiler.h b/Source/WTF/wtf/Compiler.h
-index 16e416d..68dd9a0 100644
+index 16e416d6..68dd9a00 100644
 --- a/Source/WTF/wtf/Compiler.h
 +++ b/Source/WTF/wtf/Compiler.h
 @@ -293,7 +293,7 @@
diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
index 436ad2f02c..89bb0e43b8 100644
--- a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
@@ -1,4 +1,4 @@
-From 65e9a68c9d05f4902c2fc34303b7f8233ffa98d5 Mon Sep 17 00:00:00 2001
+From dca05b39a0ad50bce44bf8940b08e9ac8ba09da2 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 3 Jan 2022 14:18:34 +0000
 Subject: [PATCH] webkitgtk: Add reproducibility fix
diff --git a/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch b/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
index 19d18dea88..901b8849f0 100644
--- a/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
@@ -1,7 +1,16 @@
-Fix build on newer 32bit architectures with only 64bit time_t
+From 034871592190de4af62ce276dc91e1f61a45324c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Dec 2024 20:24:22 -0800
+Subject: [PATCH] Fix build on newer 32bit architectures with only 64bit time_t
 
 Upstream-Status: Submitted [https://chromium-review.googlesource.com/c/angle/angle/+/6108397]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/ThirdParty/ANGLE/src/common/SimpleMutex.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/Source/ThirdParty/ANGLE/src/common/SimpleMutex.cpp b/Source/ThirdParty/ANGLE/src/common/SimpleMutex.cpp
+index 4ed0af51..11feda6c 100644
 --- a/Source/ThirdParty/ANGLE/src/common/SimpleMutex.cpp
 +++ b/Source/ThirdParty/ANGLE/src/common/SimpleMutex.cpp
 @@ -17,6 +17,9 @@
diff --git a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
index 82d20758c2..2b255d3b86 100644
--- a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
@@ -1,4 +1,4 @@
-From 29431aec88764072a032aa4411e26e566a3a6c0b Mon Sep 17 00:00:00 2001
+From 4325d5c34b60c3670ed15757b915b7392967c7dc Mon Sep 17 00:00:00 2001
 From: Michael Catanzaro <mcatanzaro@redhat.com>
 Date: Mon, 5 Feb 2024 11:00:49 -0600
 Subject: [PATCH] =?UTF-8?q?LowLevelInterpreter.cpp:339:21:=20error:=20?=
@@ -21,10 +21,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-index 76c46889..500be433 100644
+index 2f739d6b..6b49d28c 100644
 --- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
 +++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-@@ -334,8 +334,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
+@@ -336,8 +336,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
      UNUSED_VARIABLE(t2);
      UNUSED_VARIABLE(t3);
      UNUSED_VARIABLE(t5);
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.3.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.48.2.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.48.3.bb
index 75a39558db..ed2f9eb0ce 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.3.bb
@@ -19,7 +19,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            file://fix-ftbfs-riscv64.patch \
            "
-SRC_URI[sha256sum] = "ec58f6dfc25d3b360388e192f865068d69aab09b4d7df021f90e314d2fa54f37"
+SRC_URI[sha256sum] = "d4dc5970f0fc6a529ff7fd67bcbfab2bbb5e91be789b2e9279640b3217a782c3"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.47.1


--===============7619779754160985696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1928 entries from dependency cache.
Parsing recipes...done.
Parsing of 941 .bb files complete (940 cached, 1 parsed). 1928 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-a9ee981cdde048255ac4338c53c88d56ef3f37c2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a9ee981cdde048255ac4338c53c88d56ef3f37c2"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 607 Local 594 Mirrors 0 Missed 13 Current 942 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 1075 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1077 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1078 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1080 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1082 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1083 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1084 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1085 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb:do_create_spdx_setscene)
NOTE: recipe enchant2-2.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsecret-0.21.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnotify-0.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk4-4.18.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsoup-3.6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe enchant2-2.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxslt-1.1.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsoup-3.6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1095 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_create_spdx_setscene)
NOTE: recipe gtk4-4.18.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1103 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.2.bb:do_create_spdx_setscene)
NOTE: recipe libnotify-0.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1112 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1121 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1138 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_create_spdx_setscene)
NOTE: recipe libwpe-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.56.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwpe-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.56.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1191 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1197 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1200 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1214 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1220 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_257.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-11.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1246 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: recipe systemd-1_257.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_25.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1277 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1283 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1367 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1398 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1401 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1438 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1523 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1530 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1538 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1544 of 1549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3704 of 4225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.3.bb:do_recipe_qa)
NOTE: recipe webkitgtk-2.48.3-r0: task do_recipe_qa: Started
NOTE: recipe webkitgtk-2.48.3-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.3.bb:do_recipe_qa unihash changed to 8107fb1e95b7ee35075f2df6ed8974d2a1f94d8cf6afd7666da3e7c0ea07bc44
NOTE: Setscene tasks completed
NOTE: Running task 4067 of 4225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.3.bb:do_fetch)
NOTE: recipe webkitgtk-2.48.3-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.48.3-r0: task do_fetch: Succeeded
NOTE: Running task 4206 of 4225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.3.bb:do_unpack)
NOTE: Running task 4207 of 4225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.48.3-r0: task do_unpack: Started
NOTE: recipe webkitgtk-2.48.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.48.3-r0: task do_unpack: Succeeded
NOTE: Running task 4208 of 4225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.3.bb:do_patch)
NOTE: Running task 4209 of 4225 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.3.bb:do_collect_spdx_deps)
NOTE: recipe webkitgtk-2.48.3-r0: task do_patch: Started
NOTE: recipe webkitgtk-2.48.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe webkitgtk-2.48.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe webkitgtk-2.48.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe webkitgtk-2.48.3-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 4209 tasks of which 4203 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250715144331.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250715144331.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.3.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/webkitgtk/2.48.3/temp/log.do_patch.3613128
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: webkitgtk-2.48.3-r0 do_patch: QA Issue: Malformed Upstream-Status in patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
Please correct according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
Subject: [PATCH] Upstream-Status: Submitted [patch-status]
ERROR: webkitgtk-2.48.3-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/webkitgtk/2.48.3/temp/log.do_patch.3613128
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.3.bb:do_patch) failed with exit code '1'

--===============7619779754160985696==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-webkitgtk-upgrade-2.48.2-2.48.3.patch"

RnJvbSA2OThkMTYzODFiZWI0NzRiNGI5NzdlOGE1YzRhNDUyN2NkNGE1M2ExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTQ6NDM6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
ZWJraXRndGs6IHVwZ3JhZGUgMi40OC4yIC0+IDIuNDguMwoKLS0tCiAuLi5hYmxlLXRvLWNvbnRy
b2wtbWFjcm8tX19QQVNfQUxXQVlTX0kucGF0Y2ggfCAgOCArKystLS0tCiAuLi5zcGVjdGlvbi5j
bWFrZS1wcmVmaXgtdmFyaWFibGVzLW9idGEucGF0Y2ggfCAgMiArLQogLi4uLW9uLVJJU0NWLWh0
dHBzLWJ1Z3Mud2Via2l0Lm9yZy1zaG93LnBhdGNoIHwgIDQgKystLQogLi4uL3dlYmtpdC93ZWJr
aXRndGsvZml4LWZ0YmZzLXJpc2N2NjQucGF0Y2ggIHwgMjIgKysrKysrKysrKysrLS0tLS0tLQog
Li4uL3dlYmtpdC93ZWJraXRndGsvbm8tbXVzdHRhaWwtYXJtLnBhdGNoICAgIHwgIDQgKystLQog
Li4uL3dlYmtpdC93ZWJraXRndGsvcmVwcm9kdWNpYmlsaXR5LnBhdGNoICAgIHwgIDIgKy0KIC4u
Li93ZWJraXQvd2Via2l0Z3RrL3N5c19mdXRleC5wYXRjaCAgICAgICAgICB8IDExICsrKysrKysr
Ky0KIC4uLi93ZWJraXQvd2Via2l0Z3RrL3Q2LW5vdC1kZWNsYXJlZC5wYXRjaCAgICB8ICA2ICsr
LS0tCiAuLi5lYmtpdGd0a18yLjQ4LjIuYmIgPT4gd2Via2l0Z3RrXzIuNDguMy5iYn0gfCAgMiAr
LQogOSBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtc2F0by93ZWJraXQve3dlYmtpdGd0a18yLjQ4LjIuYmIgPT4gd2Vi
a2l0Z3RrXzIuNDguMy5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by93
ZWJraXQvd2Via2l0Z3RrLzAwMDEtQ01ha2UtQWRkLWEtdmFyaWFibGUtdG8tY29udHJvbC1tYWNy
by1fX1BBU19BTFdBWVNfSS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRn
dGsvMDAwMS1DTWFrZS1BZGQtYS12YXJpYWJsZS10by1jb250cm9sLW1hY3JvLV9fUEFTX0FMV0FZ
U19JLnBhdGNoCmluZGV4IDgzNzZlZTg0NzIuLmE4NjA1MzViYTAgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvMDAwMS1DTWFrZS1BZGQtYS12YXJpYWJsZS10
by1jb250cm9sLW1hY3JvLV9fUEFTX0FMV0FZU19JLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1z
YXRvL3dlYmtpdC93ZWJraXRndGsvMDAwMS1DTWFrZS1BZGQtYS12YXJpYWJsZS10by1jb250cm9s
LW1hY3JvLV9fUEFTX0FMV0FZU19JLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiYmY2NjEz
MTA0NDhkNDMwMzUwZWIyYWQ4YzU4NjlhY2U2NDhkY2Y4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBmNjk0Y2IxMGYwYzc2NGJhODgyYWU0Y2NhZWIyMjRjODRkYzYwNWZiIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+
CiBEYXRlOiBGcmksIDExIEF1ZyAyMDIzIDE0OjIwOjQ4ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hd
IEFkZCBhIHZhcmlhYmxlIHRvIGNvbnRyb2wgbWFjcm8KQEAgLTQ0LDcgKzQ0LDcgQEAgU2lnbmVk
LW9mZi1ieTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+CiAgMiBmaWxlcyBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL1NvdXJj
ZS9ibWFsbG9jL2xpYnBhcy9zcmMvbGlicGFzL3Bhc191dGlsc19wcmVmaXguaCBiL1NvdXJjZS9i
bWFsbG9jL2xpYnBhcy9zcmMvbGlicGFzL3Bhc191dGlsc19wcmVmaXguaAotaW5kZXggNWQ1ZmIz
OGMuLmE1NTRmNzAwIDEwMDY0NAoraW5kZXggMjQ1ZTJlZWYuLjY0OTU1ZmFkIDEwMDY0NAogLS0t
IGEvU291cmNlL2JtYWxsb2MvbGlicGFzL3NyYy9saWJwYXMvcGFzX3V0aWxzX3ByZWZpeC5oCiAr
KysgYi9Tb3VyY2UvYm1hbGxvYy9saWJwYXMvc3JjL2xpYnBhcy9wYXNfdXRpbHNfcHJlZml4LmgK
IEBAIC00NCw3ICs0NCw3IEBAIF9fUEFTX0JFR0lOX0VYVEVSTl9DOwpAQCAtNTcsMTAgKzU3LDEw
IEBAIGluZGV4IDVkNWZiMzhjLi5hNTU0ZjcwMCAxMDA2NDQKICAjZWxzZQogICNkZWZpbmUgX19Q
QVNfQUxXQVlTX0lOTElORV9CVVRfTk9UX0lOTElORQogZGlmZiAtLWdpdCBhL1NvdXJjZS9jbWFr
ZS9XZWJLaXRDb21waWxlckZsYWdzLmNtYWtlIGIvU291cmNlL2NtYWtlL1dlYktpdENvbXBpbGVy
RmxhZ3MuY21ha2UKLWluZGV4IGY1ZWMwYTU1Li5kZmQ3NDFlNyAxMDA2NDQKK2luZGV4IGRlMWNi
NmM0Li5iNmZmMGI3OCAxMDA2NDQKIC0tLSBhL1NvdXJjZS9jbWFrZS9XZWJLaXRDb21waWxlckZs
YWdzLmNtYWtlCiArKysgYi9Tb3VyY2UvY21ha2UvV2ViS2l0Q29tcGlsZXJGbGFncy5jbWFrZQot
QEAgLTQ5MiwzICs0OTIsMTAgQEAgZW5kaWYgKCkKK0BAIC01MDMsMyArNTAzLDEwIEBAIGVuZGlm
ICgpCiAgCiAgIyBGSVhNRTogRW5hYmxlIHByZS1jb21waWxlZCBoZWFkZXJzIGZvciBhbGwgcG9y
dHMgPGh0dHBzOi8vd2Via2l0Lm9yZy9iLzEzOTQzOD4KICBzZXQoQ01BS0VfRElTQUJMRV9QUkVD
T01QSUxFX0hFQURFUlMgT04pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQv
d2Via2l0Z3RrLzAwMDEtRmluZEdPYmplY3RJbnRyb3NwZWN0aW9uLmNtYWtlLXByZWZpeC12YXJp
YWJsZXMtb2J0YS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvMDAw
MS1GaW5kR09iamVjdEludHJvc3BlY3Rpb24uY21ha2UtcHJlZml4LXZhcmlhYmxlcy1vYnRhLnBh
dGNoCmluZGV4IGIxMWExOGJhMjIuLmM0Yzk1YzJkMTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1zYXRvL3dlYmtpdC93ZWJraXRndGsvMDAwMS1GaW5kR09iamVjdEludHJvc3BlY3Rpb24uY21h
a2UtcHJlZml4LXZhcmlhYmxlcy1vYnRhLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3dl
YmtpdC93ZWJraXRndGsvMDAwMS1GaW5kR09iamVjdEludHJvc3BlY3Rpb24uY21ha2UtcHJlZml4
LXZhcmlhYmxlcy1vYnRhLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlMGRmYzExM2IwMTYy
MjdkYThhNjU0ZDYyNWU4ZjU2OGI1Njc2MWQwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA2ZGQzODVlZDg4OGJiMzdhM2MxZDU5NjIwODY2MDc5YWUxNWMwN2MyIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+CiBEYXRlOiBUdWUsIDI3IE9jdCAyMDE1IDE2OjAyOjE5ICswMjAwCiBTdWJqZWN0OiBbUEFU
Q0hdIEZpbmRHT2JqZWN0SW50cm9zcGVjdGlvbi5jbWFrZTogcHJlZml4IHZhcmlhYmxlcyBvYnRh
aW5lZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay8wMDAx
LUZpeC1idWlsZC1lcnJvcnMtb24tUklTQ1YtaHR0cHMtYnVncy53ZWJraXQub3JnLXNob3cucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrLzAwMDEtRml4LWJ1aWxkLWVy
cm9ycy1vbi1SSVNDVi1odHRwcy1idWdzLndlYmtpdC5vcmctc2hvdy5wYXRjaAppbmRleCA0MGE3
MTMzMDUyLi44YTQ3MTNlYTk3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQv
d2Via2l0Z3RrLzAwMDEtRml4LWJ1aWxkLWVycm9ycy1vbi1SSVNDVi1odHRwcy1idWdzLndlYmtp
dC5vcmctc2hvdy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3Rr
LzAwMDEtRml4LWJ1aWxkLWVycm9ycy1vbi1SSVNDVi1odHRwcy1idWdzLndlYmtpdC5vcmctc2hv
dy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTg0NTM4ZGNjZTdiMTg0MjY5ZWZjMWUxYjBm
Yjc4ZTFjYjkzMmI1ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZWQ4OTkyZDg5NTJl
ODQ1YjUwYjkxNDI0OWM5OTk3MmIzODgwNDYyNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDIxIE1hciAyMDI1
IDAxOjIxOjIyIC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIEZpeCBidWlsZCBlcnJvcnMgb24gUklT
Q1YKQEAgLTE3LDcgKzE3LDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBh
L1NvdXJjZS9XZWJDb3JlL2NvbnRlbnRleHRlbnNpb25zL0NvbnRlbnRFeHRlbnNpb25BY3Rpb25z
LmggYi9Tb3VyY2UvV2ViQ29yZS9jb250ZW50ZXh0ZW5zaW9ucy9Db250ZW50RXh0ZW5zaW9uQWN0
aW9ucy5oCi1pbmRleCAwYjc1ZDJlMWRmNzguLjYxY2IzM2M5NGNlOCAxMDA2NDQKK2luZGV4IDBi
NzVkMmUxLi42MWNiMzNjOSAxMDA2NDQKIC0tLSBhL1NvdXJjZS9XZWJDb3JlL2NvbnRlbnRleHRl
bnNpb25zL0NvbnRlbnRFeHRlbnNpb25BY3Rpb25zLmgKICsrKyBiL1NvdXJjZS9XZWJDb3JlL2Nv
bnRlbnRleHRlbnNpb25zL0NvbnRlbnRFeHRlbnNpb25BY3Rpb25zLmgKIEBAIC0yOCw2ICsyOCw3
IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL2ZpeC1m
dGJmcy1yaXNjdjY0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay9m
aXgtZnRiZnMtcmlzY3Y2NC5wYXRjaAppbmRleCBlNDM2ODk2MDk4Li40YWUzZWRkZDQ5IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL2ZpeC1mdGJmcy1yaXNj
djY0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvZml4LWZ0
YmZzLXJpc2N2NjQucGF0Y2gKQEAgLTEsMTMgKzEsMTcgQEAKK0Zyb20gZWQzNjhlNWJmZGU1NGQw
NWYyNTE2Yjg1M2E3NmU3NmY4ZWYyY2ZkMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEFsYmVydG8gR2FyY2lhIDxiZXJ0b0BpZ2FsaWEuY29tPgotRGVzY3JpcHRpb246IFVzZSBXVEZf
Q1BVX1VOS05PV04gd2hlbiBidWlsZGluZyBmb3IgcmlzY3Y2NAotIFdlYktpdEdUSyBkb2Vzbid0
IGJ1aWxkIG9uIHJpc2N2NjQgZXZlbiB3aXRoIHRoZSBKSVQgZGlzYWJsZWQuCi0gVHJlYXRpbmcg
dGhlIENQVSBhcyB1bmtub3duIGlzIHBlcmhhcHMgYSBiaXQgc2V2ZXJlLCBidXQgaXQgYWxsb3dz
IHVzCi0gdG8gZ2V0IHRoZSBidWlsZCBkb25lIHVudGlsIHNvbWVvbmUgc3RlcHMgdXAgdG8gbWFp
bnRhaW4gdGhpcwotIHByb3Blcmx5LgotQnVnOiBodHRwczovL2J1Z3Mud2Via2l0Lm9yZy9zaG93
X2J1Zy5jZ2k/aWQ9MjcxMzcxCitEYXRlOiBUdWUsIDE1IEp1bCAyMDI1IDE0OjQyOjM1ICswMDAw
CitTdWJqZWN0OiBbUEFUQ0hdIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkCisgW2h0dHBzOi8v
YnVncy53ZWJraXQub3JnL3Nob3dfYnVnLmNnaT9pZD0yNzEzNzEjYzFdIFNpZ25lZC1vZmYtYnk6
IEtoZW0gUmFqCisgPHJhai5raGVtQGdtYWlsLmNvbT4KIAotVXBzdHJlYW0tU3RhdHVzOiBTdWJt
aXR0ZWQgW2h0dHBzOi8vYnVncy53ZWJraXQub3JnL3Nob3dfYnVnLmNnaT9pZD0yNzEzNzEjYzFd
Ci1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgorLS0tCisgU291
cmNlL1dURi93dGYvUGxhdGZvcm1DUFUuaCAgICB8IDggLS0tLS0tLS0KKyBTb3VyY2UvY21ha2Uv
V2ViS2l0Q29tbW9uLmNtYWtlIHwgMiAtLQorIDIgZmlsZXMgY2hhbmdlZCwgMTAgZGVsZXRpb25z
KC0pCisKK2RpZmYgLS1naXQgYS9Tb3VyY2UvV1RGL3d0Zi9QbGF0Zm9ybUNQVS5oIGIvU291cmNl
L1dURi93dGYvUGxhdGZvcm1DUFUuaAoraW5kZXggOGFhYzEwMjQuLmQ5ZDY5YTQwIDEwMDY0NAog
LS0tIGEvU291cmNlL1dURi93dGYvUGxhdGZvcm1DUFUuaAogKysrIGIvU291cmNlL1dURi93dGYv
UGxhdGZvcm1DUFUuaAogQEAgLTI4NiwxNCArMjg2LDYgQEAKQEAgLTI1LDYgKzI5LDggQEAgU2ln
bmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAjaWYgIUNQVShLTk9X
TikKICAjZGVmaW5lIFdURl9DUFVfVU5LTk9XTiAxCiAgI2VuZGlmCitkaWZmIC0tZ2l0IGEvU291
cmNlL2NtYWtlL1dlYktpdENvbW1vbi5jbWFrZSBiL1NvdXJjZS9jbWFrZS9XZWJLaXRDb21tb24u
Y21ha2UKK2luZGV4IDM4YWMwYzQ3Li45ZDc4NzNlMiAxMDA2NDQKIC0tLSBhL1NvdXJjZS9jbWFr
ZS9XZWJLaXRDb21tb24uY21ha2UKICsrKyBiL1NvdXJjZS9jbWFrZS9XZWJLaXRDb21tb24uY21h
a2UKIEBAIC0xMjUsOCArMTI1LDYgQEAgaWYgKE5PVCBIQVNfUlVOX1dFQktJVF9DT01NT04pCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL25vLW11c3R0YWls
LWFybS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvbm8tbXVzdHRh
aWwtYXJtLnBhdGNoCmluZGV4IDM2N2U2YjgzNDIuLjY1OGFkNzA5NGMgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvbm8tbXVzdHRhaWwtYXJtLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvbm8tbXVzdHRhaWwtYXJtLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0NjAyMjYxZmE0NGQ2YmJiNGMzNjk4Yzc5ZTA4YTZh
NDBhNmVkYzVhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjYWY0OWE2NGRjOWQzYTAz
OWY5NGU1MjQ3NDZjM2NmOWU2OTU2OTZlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMTIgSmFuIDIwMjQgMDk6
MjE6MzkgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gY2xhbmcvYXJtOiBEbyBub3QgdXNlIE1VU1Rf
VEFJTF9DQUxMCkBAIC0yMCw3ICsyMCw3IEBAIFNpZ25lZC1vZmYtYnk6IEthaSBLYW5nIDxrYWku
a2FuZ0B3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvU291cmNlL1dURi93dGYvQ29tcGlsZXIuaCBiL1Nv
dXJjZS9XVEYvd3RmL0NvbXBpbGVyLmgKLWluZGV4IDE2ZTQxNmQuLjY4ZGQ5YTAgMTAwNjQ0Citp
bmRleCAxNmU0MTZkNi4uNjhkZDlhMDAgMTAwNjQ0CiAtLS0gYS9Tb3VyY2UvV1RGL3d0Zi9Db21w
aWxlci5oCiArKysgYi9Tb3VyY2UvV1RGL3d0Zi9Db21waWxlci5oCiBAQCAtMjkzLDcgKzI5Myw3
IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL3JlcHJv
ZHVjaWJpbGl0eS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvcmVw
cm9kdWNpYmlsaXR5LnBhdGNoCmluZGV4IDQzNmFkMmYwMmMuLjg5YmIwZTQzYjggMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvcmVwcm9kdWNpYmlsaXR5LnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvcmVwcm9kdWNpYmls
aXR5LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2NWU5YTY4YzlkMDVmNDkwMmMyZmMzNDMw
M2I3ZjgyMzNmZmE5OGQ1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkY2EwNWIzOWEw
YWQ1MGJjZTQ0YmY4OTQwYjA4ZTlhYzhiYTA5ZGEyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+
CiBEYXRlOiBNb24sIDMgSmFuIDIwMjIgMTQ6MTg6MzQgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0g
d2Via2l0Z3RrOiBBZGQgcmVwcm9kdWNpYmlsaXR5IGZpeApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay9zeXNfZnV0ZXgucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
c2F0by93ZWJraXQvd2Via2l0Z3RrL3N5c19mdXRleC5wYXRjaAppbmRleCAxOWQxOGRlYTg4Li45
MDFiODg0OWYwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3Rr
L3N5c19mdXRleC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3Rr
L3N5c19mdXRleC5wYXRjaApAQCAtMSw3ICsxLDE2IEBACi1GaXggYnVpbGQgb24gbmV3ZXIgMzJi
aXQgYXJjaGl0ZWN0dXJlcyB3aXRoIG9ubHkgNjRiaXQgdGltZV90CitGcm9tIDAzNDg3MTU5MjE5
MGRlNGFmNjJjZTI3NmRjOTFlMWY2MWE0NTMyNGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgorRGF0ZTogV2VkLCAxOCBEZWMgMjAy
NCAyMDoyNDoyMiAtMDgwMAorU3ViamVjdDogW1BBVENIXSBGaXggYnVpbGQgb24gbmV3ZXIgMzJi
aXQgYXJjaGl0ZWN0dXJlcyB3aXRoIG9ubHkgNjRiaXQgdGltZV90CiAKIFVwc3RyZWFtLVN0YXR1
czogU3VibWl0dGVkIFtodHRwczovL2Nocm9taXVtLXJldmlldy5nb29nbGVzb3VyY2UuY29tL2Mv
YW5nbGUvYW5nbGUvKy82MTA4Mzk3XQogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4KKy0tLQorIFNvdXJjZS9UaGlyZFBhcnR5L0FOR0xFL3NyYy9jb21tb24vU2lt
cGxlTXV0ZXguY3BwIHwgMyArKysKKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCisK
K2RpZmYgLS1naXQgYS9Tb3VyY2UvVGhpcmRQYXJ0eS9BTkdMRS9zcmMvY29tbW9uL1NpbXBsZU11
dGV4LmNwcCBiL1NvdXJjZS9UaGlyZFBhcnR5L0FOR0xFL3NyYy9jb21tb24vU2ltcGxlTXV0ZXgu
Y3BwCitpbmRleCA0ZWQwYWY1MS4uMTFmZWRhNmMgMTAwNjQ0CiAtLS0gYS9Tb3VyY2UvVGhpcmRQ
YXJ0eS9BTkdMRS9zcmMvY29tbW9uL1NpbXBsZU11dGV4LmNwcAogKysrIGIvU291cmNlL1RoaXJk
UGFydHkvQU5HTEUvc3JjL2NvbW1vbi9TaW1wbGVNdXRleC5jcHAKIEBAIC0xNyw2ICsxNyw5IEBA
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL3Q2LW5vdC1k
ZWNsYXJlZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvdDYtbm90
LWRlY2xhcmVkLnBhdGNoCmluZGV4IDgyZDIwNzU4YzIuLjJiMjU1ZDNiODYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvdDYtbm90LWRlY2xhcmVkLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvdDYtbm90LWRlY2xhcmVk
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyOTQzMWFlYzg4NzY0MDcyYTAzMmFhNDQxMWUy
NmU1NjZhM2E2YzBiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0MzI1ZDVjMzRiNjBj
MzY3MGVkMTU3NTdiOTE1YjczOTI5NjdjN2RjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogTWljaGFlbCBDYXRhbnphcm8gPG1jYXRhbnphcm9AcmVkaGF0LmNvbT4KIERhdGU6IE1vbiwg
NSBGZWIgMjAyNCAxMTowMDo0OSAtMDYwMAogU3ViamVjdDogW1BBVENIXSA9P1VURi04P3E/TG93
TGV2ZWxJbnRlcnByZXRlci5jcHA6MzM5OjIxOj0yMGVycm9yOj0yMD89CkBAIC0yMSwxMCArMjEs
MTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFp
bC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9T
b3VyY2UvSmF2YVNjcmlwdENvcmUvbGxpbnQvTG93TGV2ZWxJbnRlcnByZXRlci5jcHAgYi9Tb3Vy
Y2UvSmF2YVNjcmlwdENvcmUvbGxpbnQvTG93TGV2ZWxJbnRlcnByZXRlci5jcHAKLWluZGV4IDc2
YzQ2ODg5Li41MDBiZTQzMyAxMDA2NDQKK2luZGV4IDJmNzM5ZDZiLi42YjQ5ZDI4YyAxMDA2NDQK
IC0tLSBhL1NvdXJjZS9KYXZhU2NyaXB0Q29yZS9sbGludC9Mb3dMZXZlbEludGVycHJldGVyLmNw
cAogKysrIGIvU291cmNlL0phdmFTY3JpcHRDb3JlL2xsaW50L0xvd0xldmVsSW50ZXJwcmV0ZXIu
Y3BwCi1AQCAtMzM0LDggKzMzNCw2IEBAIEpTVmFsdWUgQ0xvb3A6OmV4ZWN1dGUoT3Bjb2RlSUQg
ZW50cnlPcGNvZGVJRCwgdm9pZCogZXhlY3V0YWJsZUFkZHJlc3MsIFZNKiB2bSwKK0BAIC0zMzYs
OCArMzM2LDYgQEAgSlNWYWx1ZSBDTG9vcDo6ZXhlY3V0ZShPcGNvZGVJRCBlbnRyeU9wY29kZUlE
LCB2b2lkKiBleGVjdXRhYmxlQWRkcmVzcywgVk0qIHZtLAogICAgICBVTlVTRURfVkFSSUFCTEUo
dDIpOwogICAgICBVTlVTRURfVkFSSUFCTEUodDMpOwogICAgICBVTlVTRURfVkFSSUFCTEUodDUp
OwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0a18yLjQ4LjIu
YmIgYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrXzIuNDguMy5iYgpzaW1pbGFy
aXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0
Z3RrXzIuNDguMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0
a18yLjQ4LjMuYmIKaW5kZXggNzVhMzk1NThkYi4uZWQyZjllYjBjZSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0a18yLjQ4LjIuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0a18yLjQ4LjMuYmIKQEAgLTE5LDcgKzE5LDcgQEAgU1JD
X1VSSSA9ICJodHRwczovL3d3dy53ZWJraXRndGsub3JnL3JlbGVhc2VzLyR7QlBOfS0ke1BWfS50
YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1GaXgtYnVpbGQtZXJyb3JzLW9uLVJJU0NW
LWh0dHBzLWJ1Z3Mud2Via2l0Lm9yZy1zaG93LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL2Zp
eC1mdGJmcy1yaXNjdjY0LnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImVjNThmNmRmYzI1ZDNiMzYwMzg4ZTE5MmY4NjUwNjhkNjlhYWIwOWI0ZDdkZjAyMWY5MGUz
MTRkMmZhNTRmMzciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDRkYzU5NzBmMGZjNmE1MjlmZjdm
ZDY3YmNiZmFiMmJiYjVlOTFiZTc4OWIyZTkyNzk2NDBiMzIxN2E3ODJjMyIKIAogaW5oZXJpdCBj
bWFrZSBwa2djb25maWcgZ29iamVjdC1pbnRyb3NwZWN0aW9uIHBlcmxuYXRpdmUgZmVhdHVyZXNf
Y2hlY2sgdXBzdHJlYW0tdmVyc2lvbi1pcy1ldmVuIGdpLWRvY2dlbgogCi0tIAoyLjQ3LjEKCg==

--===============7619779754160985696==--

