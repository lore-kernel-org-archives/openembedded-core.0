Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356E5C83F16
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:35 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1423.1751386820096998693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DXChWIkN;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=oIvtzvhh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010197c6ca3d3b-527c6b24-d94e-46c5-8934-1626e8550d55-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386832;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IWk9EbWEFguVO9QCQdINWGe/t8Nrb9vy2FDdbS/kWZw=;
	b=DXChWIkNd0C/ivNJzp+mc86dyWv4iPZeVXoAacBgRs0ToE8C9N2egYyw3gtPvUUD
	GCwYFvGYSNGYKuyHTOiOAL5yBW6gFpiQ2r8C774VmCbCdzXWXHv6IPJFGKKV0lugrgq
	/EzGInGMdKaKZvTpo7w5sAxHzonz2U2pHVtxz2EM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386832;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IWk9EbWEFguVO9QCQdINWGe/t8Nrb9vy2FDdbS/kWZw=;
	b=oIvtzvhhnIFBUiWwTFrRFTImWaSPf7TshKzD0MDfAHW/c3nphgUZXy4Da+RpKPOs
	b9k7/bMldWVsFPs9bxKKw3O1+JW3CsONZmye8UD5QbVGzYsYgr3rCdAauYytIoF8dsz
	gXlZFSYqNIpQGTQd3sVLOlcKS7IzcGYdC2SKyrbU=
Content-Type: multipart/mixed; boundary="===============2067029491094916713=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] webkitgtk: upgrading to 2.48.3 FAILED
Message-ID: <01010197c6ca3d3b-527c6b24-d94e-46c5-8934-1626e8550d55-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219697

--===============2067029491094916713==
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
From e875a5f9099f38542891ad0902e693be3bca4be0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 15:36:17 +0000
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
index 8376ee8472..58feb6253c 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
@@ -1,4 +1,4 @@
-From bbf661310448d430350eb2ad8c5869ace648dcf8 Mon Sep 17 00:00:00 2001
+From 4d6dafeb97ee149989c07c0b6ba0be7168cdf1a3 Mon Sep 17 00:00:00 2001
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
index b11a18ba22..21a7432d06 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From e0dfc113b016227da8a654d625e8f568b56761d0 Mon Sep 17 00:00:00 2001
+From ba2db7d75eee1736667a72aa6fd2d5841e54a30b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch
index 40a7133052..052c7c0908 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch
@@ -1,4 +1,4 @@
-From 984538dcce7b184269efc1e1b0fb78e1cb932b5d Mon Sep 17 00:00:00 2001
+From 14e10b510cda7f48ad7e8d9546f03f355be95676 Mon Sep 17 00:00:00 2001
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
index e436896098..bfa225516e 100644
--- a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
@@ -1,13 +1,17 @@
+From 80269272d562d32c175f3810c85940206fc753c2 Mon Sep 17 00:00:00 2001
 From: Alberto Garcia <berto@igalia.com>
-Description: Use WTF_CPU_UNKNOWN when building for riscv64
- WebKitGTK doesn't build on riscv64 even with the JIT disabled.
- Treating the CPU as unknown is perhaps a bit severe, but it allows us
- to get the build done until someone steps up to maintain this
- properly.
-Bug: https://bugs.webkit.org/show_bug.cgi?id=271371
+Date: Tue, 1 Jul 2025 15:35:07 +0000
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
index 367e6b8342..a387fc5779 100644
--- a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
@@ -1,4 +1,4 @@
-From 4602261fa44d6bbb4c3698c79e08a6a40a6edc5a Mon Sep 17 00:00:00 2001
+From de32e767342c7531043c55b16a46b5783e087788 Mon Sep 17 00:00:00 2001
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
index 436ad2f02c..91b7a477a1 100644
--- a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
@@ -1,4 +1,4 @@
-From 65e9a68c9d05f4902c2fc34303b7f8233ffa98d5 Mon Sep 17 00:00:00 2001
+From ad30a99a4ffef9be81028df2d1bc0d0892dce13b Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 3 Jan 2022 14:18:34 +0000
 Subject: [PATCH] webkitgtk: Add reproducibility fix
diff --git a/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch b/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
index 19d18dea88..25b84332b1 100644
--- a/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
@@ -1,7 +1,16 @@
-Fix build on newer 32bit architectures with only 64bit time_t
+From b41e6362c839251d19e05af3f546594e4d053806 Mon Sep 17 00:00:00 2001
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
index 82d20758c2..5f3ccfc762 100644
--- a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
@@ -1,4 +1,4 @@
-From 29431aec88764072a032aa4411e26e566a3a6c0b Mon Sep 17 00:00:00 2001
+From d0fbad5eee811812608dbed542ee26e2f69b9eec Mon Sep 17 00:00:00 2001
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


--===============2067029491094916713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1917 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (936 cached, 1 parsed). 1917 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-02ec1cf9c0e2816ea13fd9ccba4ef2033809f42d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:02ec1cf9c0e2816ea13fd9ccba4ef2033809f42d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 646 Local 633 Mirrors 0 Missed 13 Current 899 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 1034 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1038 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1043 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1046 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1048 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1049 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1051 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1052 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe enchant2-2.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsecret-0.21.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk4-4.18.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsoup-3.6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnotify-0.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe enchant2-2.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1064 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_create_spdx_setscene)
NOTE: recipe libsecret-0.21.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsoup-3.6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnotify-0.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk4-4.18.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1082 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1083 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1101 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1105 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_create_spdx_setscene)
NOTE: recipe libwpe-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.56.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwpe-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.56.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1168 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1181 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1185 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1187 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1197 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.6.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_25.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_257.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-11.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1223 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_25.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1245 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe systemd-1_257.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1314 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1349 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1393 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1399 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1431 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1512 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1522 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1530 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1536 of 1545 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2613 of 4214 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.3.bb:do_recipe_qa)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe webkitgtk-2.48.3-r0: task do_recipe_qa: Started
NOTE: Setscene tasks completed
NOTE: recipe webkitgtk-2.48.3-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.3.bb:do_recipe_qa unihash changed to 8107fb1e95b7ee35075f2df6ed8974d2a1f94d8cf6afd7666da3e7c0ea07bc44
NOTE: Setscene tasks completed
NOTE: Running task 3794 of 4214 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.3.bb:do_fetch)
NOTE: recipe webkitgtk-2.48.3-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.48.3-r0: task do_fetch: Succeeded
NOTE: Running task 3952 of 4214 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.3.bb:do_unpack)
NOTE: Running task 4029 of 4214 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.48.3-r0: task do_unpack: Started
NOTE: recipe webkitgtk-2.48.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.48.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe webkitgtk-2.48.3-r0: task do_unpack: Succeeded
NOTE: Running task 4197 of 4214 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.3.bb:do_patch)
NOTE: Running task 4198 of 4214 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.3.bb:do_collect_spdx_deps)
NOTE: recipe webkitgtk-2.48.3-r0: task do_patch: Started
NOTE: recipe webkitgtk-2.48.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe webkitgtk-2.48.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe webkitgtk-2.48.3-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 4198 tasks of which 4192 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701153559.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701153559.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.3.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/webkitgtk/2.48.3/temp/log.do_patch.3520389
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: webkitgtk-2.48.3-r0 do_patch: QA Issue: Malformed Upstream-Status in patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
Please correct according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
Subject: [PATCH] Upstream-Status: Submitted [patch-status]
ERROR: webkitgtk-2.48.3-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/webkitgtk/2.48.3/temp/log.do_patch.3520389
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.3.bb:do_patch) failed with exit code '1'

--===============2067029491094916713==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-webkitgtk-upgrade-2.48.2-2.48.3.patch"

RnJvbSBlODc1YTVmOTA5OWYzODU0Mjg5MWFkMDkwMmU2OTNiZTNiY2E0YmUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxNTozNjoxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdl
YmtpdGd0azogdXBncmFkZSAyLjQ4LjIgLT4gMi40OC4zCgotLS0KIC4uLmFibGUtdG8tY29udHJv
bC1tYWNyby1fX1BBU19BTFdBWVNfSS5wYXRjaCB8ICA4ICsrKy0tLS0KIC4uLnNwZWN0aW9uLmNt
YWtlLXByZWZpeC12YXJpYWJsZXMtb2J0YS5wYXRjaCB8ICAyICstCiAuLi4tb24tUklTQ1YtaHR0
cHMtYnVncy53ZWJraXQub3JnLXNob3cucGF0Y2ggfCAgNCArKy0tCiAuLi4vd2Via2l0L3dlYmtp
dGd0ay9maXgtZnRiZnMtcmlzY3Y2NC5wYXRjaCAgfCAyMiArKysrKysrKysrKystLS0tLS0tCiAu
Li4vd2Via2l0L3dlYmtpdGd0ay9uby1tdXN0dGFpbC1hcm0ucGF0Y2ggICAgfCAgNCArKy0tCiAu
Li4vd2Via2l0L3dlYmtpdGd0ay9yZXByb2R1Y2liaWxpdHkucGF0Y2ggICAgfCAgMiArLQogLi4u
L3dlYmtpdC93ZWJraXRndGsvc3lzX2Z1dGV4LnBhdGNoICAgICAgICAgIHwgMTEgKysrKysrKysr
LQogLi4uL3dlYmtpdC93ZWJraXRndGsvdDYtbm90LWRlY2xhcmVkLnBhdGNoICAgIHwgIDYgKyst
LS0KIC4uLmVia2l0Z3RrXzIuNDguMi5iYiA9PiB3ZWJraXRndGtfMi40OC4zLmJifSB8ICAyICst
CiA5IGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC97d2Via2l0Z3RrXzIuNDguMi5iYiA9PiB3ZWJr
aXRndGtfMi40OC4zLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zYXRvL3dl
YmtpdC93ZWJraXRndGsvMDAwMS1DTWFrZS1BZGQtYS12YXJpYWJsZS10by1jb250cm9sLW1hY3Jv
LV9fUEFTX0FMV0FZU19JLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0
ay8wMDAxLUNNYWtlLUFkZC1hLXZhcmlhYmxlLXRvLWNvbnRyb2wtbWFjcm8tX19QQVNfQUxXQVlT
X0kucGF0Y2gKaW5kZXggODM3NmVlODQ3Mi4uNThmZWI2MjUzYyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay8wMDAxLUNNYWtlLUFkZC1hLXZhcmlhYmxlLXRv
LWNvbnRyb2wtbWFjcm8tX19QQVNfQUxXQVlTX0kucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXNh
dG8vd2Via2l0L3dlYmtpdGd0ay8wMDAxLUNNYWtlLUFkZC1hLXZhcmlhYmxlLXRvLWNvbnRyb2wt
bWFjcm8tX19QQVNfQUxXQVlTX0kucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGJiZjY2MTMx
MDQ0OGQ0MzAzNTBlYjJhZDhjNTg2OWFjZTY0OGRjZjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDRkNmRhZmViOTdlZTE0OTk4OWMwN2MwYjZiYTBiZTcxNjhjZGYxYTMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBLYWkgS2FuZyA8a2FpLmthbmdAd2luZHJpdmVyLmNvbT4K
IERhdGU6IEZyaSwgMTEgQXVnIDIwMjMgMTQ6MjA6NDggKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0g
QWRkIGEgdmFyaWFibGUgdG8gY29udHJvbCBtYWNybwpAQCAtNDQsNyArNDQsNyBAQCBTaWduZWQt
b2ZmLWJ5OiBLYWkgS2FuZyA8a2FpLmthbmdAd2luZHJpdmVyLmNvbT4KICAyIGZpbGVzIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvU291cmNl
L2JtYWxsb2MvbGlicGFzL3NyYy9saWJwYXMvcGFzX3V0aWxzX3ByZWZpeC5oIGIvU291cmNlL2Jt
YWxsb2MvbGlicGFzL3NyYy9saWJwYXMvcGFzX3V0aWxzX3ByZWZpeC5oCi1pbmRleCA1ZDVmYjM4
Yy4uYTU1NGY3MDAgMTAwNjQ0CitpbmRleCAyNDVlMmVlZi4uNjQ5NTVmYWQgMTAwNjQ0CiAtLS0g
YS9Tb3VyY2UvYm1hbGxvYy9saWJwYXMvc3JjL2xpYnBhcy9wYXNfdXRpbHNfcHJlZml4LmgKICsr
KyBiL1NvdXJjZS9ibWFsbG9jL2xpYnBhcy9zcmMvbGlicGFzL3Bhc191dGlsc19wcmVmaXguaAog
QEAgLTQ0LDcgKzQ0LDcgQEAgX19QQVNfQkVHSU5fRVhURVJOX0M7CkBAIC01NywxMCArNTcsMTAg
QEAgaW5kZXggNWQ1ZmIzOGMuLmE1NTRmNzAwIDEwMDY0NAogICNlbHNlCiAgI2RlZmluZSBfX1BB
U19BTFdBWVNfSU5MSU5FX0JVVF9OT1RfSU5MSU5FCiBkaWZmIC0tZ2l0IGEvU291cmNlL2NtYWtl
L1dlYktpdENvbXBpbGVyRmxhZ3MuY21ha2UgYi9Tb3VyY2UvY21ha2UvV2ViS2l0Q29tcGlsZXJG
bGFncy5jbWFrZQotaW5kZXggZjVlYzBhNTUuLmRmZDc0MWU3IDEwMDY0NAoraW5kZXggZGUxY2I2
YzQuLmI2ZmYwYjc4IDEwMDY0NAogLS0tIGEvU291cmNlL2NtYWtlL1dlYktpdENvbXBpbGVyRmxh
Z3MuY21ha2UKICsrKyBiL1NvdXJjZS9jbWFrZS9XZWJLaXRDb21waWxlckZsYWdzLmNtYWtlCi1A
QCAtNDkyLDMgKzQ5MiwxMCBAQCBlbmRpZiAoKQorQEAgLTUwMywzICs1MDMsMTAgQEAgZW5kaWYg
KCkKICAKICAjIEZJWE1FOiBFbmFibGUgcHJlLWNvbXBpbGVkIGhlYWRlcnMgZm9yIGFsbCBwb3J0
cyA8aHR0cHM6Ly93ZWJraXQub3JnL2IvMTM5NDM4PgogIHNldChDTUFLRV9ESVNBQkxFX1BSRUNP
TVBJTEVfSEVBREVSUyBPTikKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93
ZWJraXRndGsvMDAwMS1GaW5kR09iamVjdEludHJvc3BlY3Rpb24uY21ha2UtcHJlZml4LXZhcmlh
Ymxlcy1vYnRhLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay8wMDAx
LUZpbmRHT2JqZWN0SW50cm9zcGVjdGlvbi5jbWFrZS1wcmVmaXgtdmFyaWFibGVzLW9idGEucGF0
Y2gKaW5kZXggYjExYTE4YmEyMi4uMjFhNzQzMmQwNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LXNhdG8vd2Via2l0L3dlYmtpdGd0ay8wMDAxLUZpbmRHT2JqZWN0SW50cm9zcGVjdGlvbi5jbWFr
ZS1wcmVmaXgtdmFyaWFibGVzLW9idGEucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Vi
a2l0L3dlYmtpdGd0ay8wMDAxLUZpbmRHT2JqZWN0SW50cm9zcGVjdGlvbi5jbWFrZS1wcmVmaXgt
dmFyaWFibGVzLW9idGEucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGUwZGZjMTEzYjAxNjIy
N2RhOGE2NTRkNjI1ZThmNTY4YjU2NzYxZDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGJhMmRiN2Q3NWVlZTE3MzY2NjdhNzJhYTZmZDJkNTg0MWU1NGEzMGIgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4KIERhdGU6IFR1ZSwgMjcgT2N0IDIwMTUgMTY6MDI6MTkgKzAyMDAKIFN1YmplY3Q6IFtQQVRD
SF0gRmluZEdPYmplY3RJbnRyb3NwZWN0aW9uLmNtYWtlOiBwcmVmaXggdmFyaWFibGVzIG9idGFp
bmVkCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrLzAwMDEt
Rml4LWJ1aWxkLWVycm9ycy1vbi1SSVNDVi1odHRwcy1idWdzLndlYmtpdC5vcmctc2hvdy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvMDAwMS1GaXgtYnVpbGQtZXJy
b3JzLW9uLVJJU0NWLWh0dHBzLWJ1Z3Mud2Via2l0Lm9yZy1zaG93LnBhdGNoCmluZGV4IDQwYTcx
MzMwNTIuLjA1MmM3YzA5MDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93
ZWJraXRndGsvMDAwMS1GaXgtYnVpbGQtZXJyb3JzLW9uLVJJU0NWLWh0dHBzLWJ1Z3Mud2Via2l0
Lm9yZy1zaG93LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsv
MDAwMS1GaXgtYnVpbGQtZXJyb3JzLW9uLVJJU0NWLWh0dHBzLWJ1Z3Mud2Via2l0Lm9yZy1zaG93
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5ODQ1MzhkY2NlN2IxODQyNjllZmMxZTFiMGZi
NzhlMWNiOTMyYjVkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxNGUxMGI1MTBjZGE3
ZjQ4YWQ3ZThkOTU0NmYwM2YzNTViZTk1Njc2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMjEgTWFyIDIwMjUg
MDE6MjE6MjIgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4IGJ1aWxkIGVycm9ycyBvbiBSSVND
VgpAQCAtMTcsNyArMTcsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEv
U291cmNlL1dlYkNvcmUvY29udGVudGV4dGVuc2lvbnMvQ29udGVudEV4dGVuc2lvbkFjdGlvbnMu
aCBiL1NvdXJjZS9XZWJDb3JlL2NvbnRlbnRleHRlbnNpb25zL0NvbnRlbnRFeHRlbnNpb25BY3Rp
b25zLmgKLWluZGV4IDBiNzVkMmUxZGY3OC4uNjFjYjMzYzk0Y2U4IDEwMDY0NAoraW5kZXggMGI3
NWQyZTEuLjYxY2IzM2M5IDEwMDY0NAogLS0tIGEvU291cmNlL1dlYkNvcmUvY29udGVudGV4dGVu
c2lvbnMvQ29udGVudEV4dGVuc2lvbkFjdGlvbnMuaAogKysrIGIvU291cmNlL1dlYkNvcmUvY29u
dGVudGV4dGVuc2lvbnMvQ29udGVudEV4dGVuc2lvbkFjdGlvbnMuaAogQEAgLTI4LDYgKzI4LDcg
QEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvZml4LWZ0
YmZzLXJpc2N2NjQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL2Zp
eC1mdGJmcy1yaXNjdjY0LnBhdGNoCmluZGV4IGU0MzY4OTYwOTguLmJmYTIyNTUxNmUgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvZml4LWZ0YmZzLXJpc2N2
NjQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay9maXgtZnRi
ZnMtcmlzY3Y2NC5wYXRjaApAQCAtMSwxMyArMSwxNyBAQAorRnJvbSA4MDI2OTI3MmQ1NjJkMzJj
MTc1ZjM4MTBjODU5NDAyMDZmYzc1M2MyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
QWxiZXJ0byBHYXJjaWEgPGJlcnRvQGlnYWxpYS5jb20+Ci1EZXNjcmlwdGlvbjogVXNlIFdURl9D
UFVfVU5LTk9XTiB3aGVuIGJ1aWxkaW5nIGZvciByaXNjdjY0Ci0gV2ViS2l0R1RLIGRvZXNuJ3Qg
YnVpbGQgb24gcmlzY3Y2NCBldmVuIHdpdGggdGhlIEpJVCBkaXNhYmxlZC4KLSBUcmVhdGluZyB0
aGUgQ1BVIGFzIHVua25vd24gaXMgcGVyaGFwcyBhIGJpdCBzZXZlcmUsIGJ1dCBpdCBhbGxvd3Mg
dXMKLSB0byBnZXQgdGhlIGJ1aWxkIGRvbmUgdW50aWwgc29tZW9uZSBzdGVwcyB1cCB0byBtYWlu
dGFpbiB0aGlzCi0gcHJvcGVybHkuCi1CdWc6IGh0dHBzOi8vYnVncy53ZWJraXQub3JnL3Nob3df
YnVnLmNnaT9pZD0yNzEzNzEKK0RhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxNTozNTowNyArMDAwMAor
U3ViamVjdDogW1BBVENIXSBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZAorIFtodHRwczovL2J1
Z3Mud2Via2l0Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjcxMzcxI2MxXSBTaWduZWQtb2ZmLWJ5OiBL
aGVtIFJhagorIDxyYWoua2hlbUBnbWFpbC5jb20+CiAKLVVwc3RyZWFtLVN0YXR1czogU3VibWl0
dGVkIFtodHRwczovL2J1Z3Mud2Via2l0Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjcxMzcxI2MxXQot
U2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KKy0tLQorIFNvdXJj
ZS9XVEYvd3RmL1BsYXRmb3JtQ1BVLmggICAgfCA4IC0tLS0tLS0tCisgU291cmNlL2NtYWtlL1dl
YktpdENvbW1vbi5jbWFrZSB8IDIgLS0KKyAyIGZpbGVzIGNoYW5nZWQsIDEwIGRlbGV0aW9ucygt
KQorCitkaWZmIC0tZ2l0IGEvU291cmNlL1dURi93dGYvUGxhdGZvcm1DUFUuaCBiL1NvdXJjZS9X
VEYvd3RmL1BsYXRmb3JtQ1BVLmgKK2luZGV4IDhhYWMxMDI0Li5kOWQ2OWE0MCAxMDA2NDQKIC0t
LSBhL1NvdXJjZS9XVEYvd3RmL1BsYXRmb3JtQ1BVLmgKICsrKyBiL1NvdXJjZS9XVEYvd3RmL1Bs
YXRmb3JtQ1BVLmgKIEBAIC0yODYsMTQgKzI4Niw2IEBACkBAIC0yNSw2ICsyOSw4IEBAIFNpZ25l
ZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgI2lmICFDUFUoS05PV04p
CiAgI2RlZmluZSBXVEZfQ1BVX1VOS05PV04gMQogICNlbmRpZgorZGlmZiAtLWdpdCBhL1NvdXJj
ZS9jbWFrZS9XZWJLaXRDb21tb24uY21ha2UgYi9Tb3VyY2UvY21ha2UvV2ViS2l0Q29tbW9uLmNt
YWtlCitpbmRleCAzOGFjMGM0Ny4uOWQ3ODczZTIgMTAwNjQ0CiAtLS0gYS9Tb3VyY2UvY21ha2Uv
V2ViS2l0Q29tbW9uLmNtYWtlCiArKysgYi9Tb3VyY2UvY21ha2UvV2ViS2l0Q29tbW9uLmNtYWtl
CiBAQCAtMTI1LDggKzEyNSw2IEBAIGlmIChOT1QgSEFTX1JVTl9XRUJLSVRfQ09NTU9OKQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay9uby1tdXN0dGFpbC1h
cm0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL25vLW11c3R0YWls
LWFybS5wYXRjaAppbmRleCAzNjdlNmI4MzQyLi5hMzg3ZmM1Nzc5IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL25vLW11c3R0YWlsLWFybS5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL25vLW11c3R0YWlsLWFybS5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDYwMjI2MWZhNDRkNmJiYjRjMzY5OGM3OWUwOGE2YTQw
YTZlZGM1YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZGUzMmU3NjczNDJjNzUzMTA0
M2M1NWIxNmE0NmI1NzgzZTA4Nzc4OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDEyIEphbiAyMDI0IDA5OjIx
OjM5IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNsYW5nL2FybTogRG8gbm90IHVzZSBNVVNUX1RB
SUxfQ0FMTApAQCAtMjAsNyArMjAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLYWkgS2FuZyA8a2FpLmth
bmdAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL1NvdXJjZS9XVEYvd3RmL0NvbXBpbGVyLmggYi9Tb3Vy
Y2UvV1RGL3d0Zi9Db21waWxlci5oCi1pbmRleCAxNmU0MTZkLi42OGRkOWEwIDEwMDY0NAoraW5k
ZXggMTZlNDE2ZDYuLjY4ZGQ5YTAwIDEwMDY0NAogLS0tIGEvU291cmNlL1dURi93dGYvQ29tcGls
ZXIuaAogKysrIGIvU291cmNlL1dURi93dGYvQ29tcGlsZXIuaAogQEAgLTI5Myw3ICsyOTMsNyBA
QApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay9yZXByb2R1
Y2liaWxpdHkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL3JlcHJv
ZHVjaWJpbGl0eS5wYXRjaAppbmRleCA0MzZhZDJmMDJjLi45MWI3YTQ3N2ExIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL3JlcHJvZHVjaWJpbGl0eS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL3JlcHJvZHVjaWJpbGl0
eS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNjVlOWE2OGM5ZDA1ZjQ5MDJjMmZjMzQzMDNi
N2Y4MjMzZmZhOThkNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWQzMGE5OWE0ZmZl
ZjliZTgxMDI4ZGYyZDFiYzBkMDg5MmRjZTEzYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgog
RGF0ZTogTW9uLCAzIEphbiAyMDIyIDE0OjE4OjM0ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHdl
YmtpdGd0azogQWRkIHJlcHJvZHVjaWJpbGl0eSBmaXgKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1zYXRvL3dlYmtpdC93ZWJraXRndGsvc3lzX2Z1dGV4LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXNh
dG8vd2Via2l0L3dlYmtpdGd0ay9zeXNfZnV0ZXgucGF0Y2gKaW5kZXggMTlkMThkZWE4OC4uMjVi
ODQzMzJiMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay9z
eXNfZnV0ZXgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay9z
eXNfZnV0ZXgucGF0Y2gKQEAgLTEsNyArMSwxNiBAQAotRml4IGJ1aWxkIG9uIG5ld2VyIDMyYml0
IGFyY2hpdGVjdHVyZXMgd2l0aCBvbmx5IDY0Yml0IHRpbWVfdAorRnJvbSBiNDFlNjM2MmM4Mzky
NTFkMTllMDVhZjNmNTQ2NTk0ZTRkMDUzODA2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KK0RhdGU6IFdlZCwgMTggRGVjIDIwMjQg
MjA6MjQ6MjIgLTA4MDAKK1N1YmplY3Q6IFtQQVRDSF0gRml4IGJ1aWxkIG9uIG5ld2VyIDMyYml0
IGFyY2hpdGVjdHVyZXMgd2l0aCBvbmx5IDY0Yml0IHRpbWVfdAogCiBVcHN0cmVhbS1TdGF0dXM6
IFN1Ym1pdHRlZCBbaHR0cHM6Ly9jaHJvbWl1bS1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2Fu
Z2xlL2FuZ2xlLysvNjEwODM5N10KIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+CistLS0KKyBTb3VyY2UvVGhpcmRQYXJ0eS9BTkdMRS9zcmMvY29tbW9uL1NpbXBs
ZU11dGV4LmNwcCB8IDMgKysrCisgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQorCitk
aWZmIC0tZ2l0IGEvU291cmNlL1RoaXJkUGFydHkvQU5HTEUvc3JjL2NvbW1vbi9TaW1wbGVNdXRl
eC5jcHAgYi9Tb3VyY2UvVGhpcmRQYXJ0eS9BTkdMRS9zcmMvY29tbW9uL1NpbXBsZU11dGV4LmNw
cAoraW5kZXggNGVkMGFmNTEuLjExZmVkYTZjIDEwMDY0NAogLS0tIGEvU291cmNlL1RoaXJkUGFy
dHkvQU5HTEUvc3JjL2NvbW1vbi9TaW1wbGVNdXRleC5jcHAKICsrKyBiL1NvdXJjZS9UaGlyZFBh
cnR5L0FOR0xFL3NyYy9jb21tb24vU2ltcGxlTXV0ZXguY3BwCiBAQCAtMTcsNiArMTcsOSBAQApk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay90Ni1ub3QtZGVj
bGFyZWQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL3Q2LW5vdC1k
ZWNsYXJlZC5wYXRjaAppbmRleCA4MmQyMDc1OGMyLi41ZjNjY2ZjNzYyIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL3Q2LW5vdC1kZWNsYXJlZC5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL3Q2LW5vdC1kZWNsYXJlZC5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjk0MzFhZWM4ODc2NDA3MmEwMzJhYTQ0MTFlMjZl
NTY2YTNhNmMwYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDBmYmFkNWVlZTgxMTgx
MjYwOGRiZWQ1NDJlZTI2ZTJmNjliOWVlYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IE1pY2hhZWwgQ2F0YW56YXJvIDxtY2F0YW56YXJvQHJlZGhhdC5jb20+CiBEYXRlOiBNb24sIDUg
RmViIDIwMjQgMTE6MDA6NDkgLTA2MDAKIFN1YmplY3Q6IFtQQVRDSF0gPT9VVEYtOD9xP0xvd0xl
dmVsSW50ZXJwcmV0ZXIuY3BwOjMzOToyMTo9MjBlcnJvcjo9MjA/PQpAQCAtMjEsMTAgKzIxLDEw
IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvU291
cmNlL0phdmFTY3JpcHRDb3JlL2xsaW50L0xvd0xldmVsSW50ZXJwcmV0ZXIuY3BwIGIvU291cmNl
L0phdmFTY3JpcHRDb3JlL2xsaW50L0xvd0xldmVsSW50ZXJwcmV0ZXIuY3BwCi1pbmRleCA3NmM0
Njg4OS4uNTAwYmU0MzMgMTAwNjQ0CitpbmRleCAyZjczOWQ2Yi4uNmI0OWQyOGMgMTAwNjQ0CiAt
LS0gYS9Tb3VyY2UvSmF2YVNjcmlwdENvcmUvbGxpbnQvTG93TGV2ZWxJbnRlcnByZXRlci5jcHAK
ICsrKyBiL1NvdXJjZS9KYXZhU2NyaXB0Q29yZS9sbGludC9Mb3dMZXZlbEludGVycHJldGVyLmNw
cAotQEAgLTMzNCw4ICszMzQsNiBAQCBKU1ZhbHVlIENMb29wOjpleGVjdXRlKE9wY29kZUlEIGVu
dHJ5T3Bjb2RlSUQsIHZvaWQqIGV4ZWN1dGFibGVBZGRyZXNzLCBWTSogdm0sCitAQCAtMzM2LDgg
KzMzNiw2IEBAIEpTVmFsdWUgQ0xvb3A6OmV4ZWN1dGUoT3Bjb2RlSUQgZW50cnlPcGNvZGVJRCwg
dm9pZCogZXhlY3V0YWJsZUFkZHJlc3MsIFZNKiB2bSwKICAgICAgVU5VU0VEX1ZBUklBQkxFKHQy
KTsKICAgICAgVU5VU0VEX1ZBUklBQkxFKHQzKTsKICAgICAgVU5VU0VEX1ZBUklBQkxFKHQ1KTsK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGtfMi40OC4yLmJi
IGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0a18yLjQ4LjMuYmIKc2ltaWxhcml0
eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0
a18yLjQ4LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGtf
Mi40OC4zLmJiCmluZGV4IDc1YTM5NTU4ZGIuLmVkMmY5ZWIwY2UgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGtfMi40OC4yLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zYXRvL3dlYmtpdC93ZWJraXRndGtfMi40OC4zLmJiCkBAIC0xOSw3ICsxOSw3IEBAIFNSQ19V
UkkgPSAiaHR0cHM6Ly93d3cud2Via2l0Z3RrLm9yZy9yZWxlYXNlcy8ke0JQTn0tJHtQVn0udGFy
Lnh6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtRml4LWJ1aWxkLWVycm9ycy1vbi1SSVNDVi1o
dHRwcy1idWdzLndlYmtpdC5vcmctc2hvdy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9maXgt
ZnRiZnMtcmlzY3Y2NC5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJlYzU4ZjZkZmMyNWQzYjM2MDM4OGUxOTJmODY1MDY4ZDY5YWFiMDliNGQ3ZGYwMjFmOTBlMzE0
ZDJmYTU0ZjM3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ0ZGM1OTcwZjBmYzZhNTI5ZmY3ZmQ2
N2JjYmZhYjJiYmI1ZTkxYmU3ODliMmU5Mjc5NjQwYjMyMTdhNzgyYzMiCiAKIGluaGVyaXQgY21h
a2UgcGtnY29uZmlnIGdvYmplY3QtaW50cm9zcGVjdGlvbiBwZXJsbmF0aXZlIGZlYXR1cmVzX2No
ZWNrIHVwc3RyZWFtLXZlcnNpb24taXMtZXZlbiBnaS1kb2NnZW4KIAotLSAKMi40Ny4xCgo=

--===============2067029491094916713==--

