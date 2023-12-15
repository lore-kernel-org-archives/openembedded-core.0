Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02447C46CCD
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:50 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.63627.1702649868926861375
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MZUXuEzH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mRuMwcmR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018c6dd72f98-aabfa19f-af52-4e2d-9bcd-e1216ee28652-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SMqUmnV0Dg4A7Es0O33dKnrqlchGwKXjIxuD4Tdwxa8=;
	b=MZUXuEzHTIYQL6t2ee/CcI73XArzj2iAbKaxnG5UJng+3NyBVT+D0BsKf0YB6ct6
	ZXW5vCpuABrGl7bOsdlEXYy9jN2IYIsfBEUnAkmO3oR68BaQ2qFLmaRFGp1/+hvwSjZ
	7ZkZuqE661rQaG+q9suU3OJmVZpOgVKGe0TU1kro=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649868;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SMqUmnV0Dg4A7Es0O33dKnrqlchGwKXjIxuD4Tdwxa8=;
	b=mRuMwcmRUCMWmeruFIoXHbnpWcmOrWRLSTjyqcceeJCbLgwxHWNNfEz4e4UnyAml
	hQDmxUQ9o8HotUiV3MHMVwyny2YlEM/T6CN05wI4stspmaV8pEii1Xk9lqjA0xvIpSG
	e0ZMjOaxlaAySGsW2I4UYQVE/ayjjMMTBC2JaH2Y=
Content-Type: multipart/mixed; boundary="===============1161588711360771908=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] webkitgtk: upgrading to 2.42.3 SUCCEEDED
Message-ID: <0101018c6dd72f98-aabfa19f-af52-4e2d-9bcd-e1216ee28652-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192522

--===============1161588711360771908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *webkitgtk* to *2.42.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-webkitgtk-upgrade-2.42.2-2.42.3.patch
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
From c41c4015f62a70751903aa33bffb5d99a5f24d04 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Dec 2023 12:45:25 +0000
Subject: [PATCH] webkitgtk: upgrade 2.42.2 -> 2.42.3

---
 ...riable-to-control-macro-__PAS_ALWAYS_I.patch | 12 +++++-------
 ...rospection.cmake-prefix-variables-obta.patch |  5 +++--
 ...3344e17d258106617b0e6d783d073b188a2548.patch |  2 +-
 .../webkit/webkitgtk/reproducibility.patch      | 17 +++++++++++++----
 ...{webkitgtk_2.42.2.bb => webkitgtk_2.42.3.bb} |  2 +-
 5 files changed, 23 insertions(+), 15 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.42.2.bb => webkitgtk_2.42.3.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
index 4266d11e9e..4ba969e162 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
@@ -1,7 +1,7 @@
-From 73efe0ea75c3ac4cb088f300acc3de44d5dd3344 Mon Sep 17 00:00:00 2001
+From 0dc611b65bb13f01a5f96c5c82838dd27c9fa997 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Fri, 11 Aug 2023 14:20:48 +0800
-Subject: [PATCH] [CMake] Add a variable to control macro
+Subject: [PATCH] Add a variable to control macro
  __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
  https://bugs.webkit.org/show_bug.cgi?id=260065
 
@@ -38,13 +38,14 @@ gcc option `-Og` is used.
 Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/16601]
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
 ---
  Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h | 2 +-
  Source/cmake/WebKitCompilerFlags.cmake              | 7 +++++++
  2 files changed, 8 insertions(+), 1 deletion(-)
 
 diff --git a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
-index 5d5fb38cddbd..a554f70064eb 100644
+index 5d5fb38c..a554f700 100644
 --- a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
 +++ b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
 @@ -44,7 +44,7 @@ __PAS_BEGIN_EXTERN_C;
@@ -57,7 +58,7 @@ index 5d5fb38cddbd..a554f70064eb 100644
  #else
  #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
 diff --git a/Source/cmake/WebKitCompilerFlags.cmake b/Source/cmake/WebKitCompilerFlags.cmake
-index 9b2fecf9a0d3..7cdc2b6afbe0 100644
+index 9b2fecf9..7cdc2b6a 100644
 --- a/Source/cmake/WebKitCompilerFlags.cmake
 +++ b/Source/cmake/WebKitCompilerFlags.cmake
 @@ -453,3 +453,10 @@ endif ()
@@ -71,6 +72,3 @@ index 9b2fecf9a0d3..7cdc2b6afbe0 100644
 +if (WEBKIT_NO_INLINE_HINTS)
 +    add_definitions(-DWEBKIT_NO_INLINE_HINTS)
 +endif ()
--- 
-2.34.1
-
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index 8ae39f14e1..66846bc24d 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From 10cfdcc905915d8814c609008a069102f2bc7e39 Mon Sep 17 00:00:00 2001
+From d99925da9f365d04f56f1cdeac79bebd090e195c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
@@ -9,12 +9,13 @@ reasons why this is not approproiate for upstream submission.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  Source/cmake/FindGI.cmake | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/Source/cmake/FindGI.cmake b/Source/cmake/FindGI.cmake
-index af039cbb..b3e810cd 100644
+index fdc56b21..d42eca52 100644
 --- a/Source/cmake/FindGI.cmake
 +++ b/Source/cmake/FindGI.cmake
 @@ -72,6 +72,9 @@ if (PKG_CONFIG_FOUND)
diff --git a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
index e5ece82ed3..1597a0f56b 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
@@ -1,4 +1,4 @@
-From 95398982f4a120147a98a27e176facf6d95b2bf7 Mon Sep 17 00:00:00 2001
+From c568f1496cf847f6c023b62813aab0b6dc47f817 Mon Sep 17 00:00:00 2001
 From: Adrian Perez de Castro <aperez@igalia.com>
 Date: Thu, 2 Jun 2022 11:19:06 +0300
 Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path seems
diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
index e866a1a193..9e7f40654c 100644
--- a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
@@ -1,3 +1,8 @@
+From 194af6136120dfbc8c623e789a3392055e232fd1 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Mon, 3 Jan 2022 14:18:34 +0000
+Subject: [PATCH] webkitgtk: Add reproducibility fix
+
 Injection a year based on the current date isn't reproducible. Hack this
 to a specific year for now for reproducibilty and to avoid autobuilder failures.
 
@@ -7,10 +12,14 @@ then this could be submitted upstream, sadly my ruby isn't up to that.
 Upstream-Status: Pending [could be reworked]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Index: webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
-===================================================================
---- webkitgtk-2.34.2.orig/Source/JavaScriptCore/generator/GeneratedFile.rb
-+++ webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
+---
+ Source/JavaScriptCore/generator/GeneratedFile.rb | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/JavaScriptCore/generator/GeneratedFile.rb b/Source/JavaScriptCore/generator/GeneratedFile.rb
+index 6ed2b6e4..86a28286 100644
+--- a/Source/JavaScriptCore/generator/GeneratedFile.rb
++++ b/Source/JavaScriptCore/generator/GeneratedFile.rb
 @@ -25,7 +25,7 @@ require 'date'
  require 'digest'
  
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.42.3.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.42.2.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.42.3.bb
index 2ba60eb65b..f35647414a 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.42.3.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
            "
-SRC_URI[sha256sum] = "5720aa3e8627f1b9f63252187d4df0f8233ae71d697b1796ebfbe5ca750bd118"
+SRC_URI[sha256sum] = "0a1a4630045628b3a6fe95da72dc47852cff20d66be1ac6fd0d669c88c13d8e2"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.42.0


--===============1161588711360771908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1843 targets, 49 skipped, 0 masked, 0 errors.
Removing 133 recipes from the core2-64 sysroot...done.
Removing 132 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-0ca631f6e6b2167b93c761ea7bd9ca6690bf95c5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0ca631f6e6b2167b93c761ea7bd9ca6690bf95c5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 971 Local 907 Mirrors 0 Missed 64 Current 398 (93% match, 95% complete)
Removing 7 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 408 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 411 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 412 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 413 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 414 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 418 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 419 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx_setscene)
NOTE: Running setscene task 421 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.71.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 422 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 424 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx_setscene)
NOTE: Running setscene task 425 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 426 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 427 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 428 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 429 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 430 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_create_spdx_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.71.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 431 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 432 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 441 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.71.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 448 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 454 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.71.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 462 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe pango-1.51.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 464 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 465 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 466 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.71.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 467 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 469 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_packagedata_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 471 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bluez5-5.70-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 487 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_package_setscene)
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.71.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.12.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 489 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_recipe_qa_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gi-docgen-2023.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 491 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 494 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 496 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 497 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 499 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 501 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 503 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 507 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 508 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_create_spdx_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk4-4.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsecret-0.21.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 511 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-8.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 512 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk4-4.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 514 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.71.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsecret-0.21.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 515 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 516 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 517 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 518 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 519 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 523 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 525 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 527 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 529 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 531 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsecret-0.21.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 534 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsecret-0.21.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 536 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot_setscene)
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 538 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 539 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 540 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 541 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 543 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 544 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 548 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 549 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 551 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 553 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 556 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.70-r0: task do_package_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 557 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 558 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 559 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 561 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 563 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 565 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 567 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 568 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 573 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.71.1.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 574 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 576 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 579 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 580 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 583 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 585 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 589 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.71.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 591 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 597 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 600 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 601 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.71.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 603 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 607 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 608 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 610 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_create_spdx_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 614 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 615 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 618 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 621 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 623 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 626 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 628 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libwpe-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 631 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 637 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-8.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 638 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 639 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 643 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 644 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwpe-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 645 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 647 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 650 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 653 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.118-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 656 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 657 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 658 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 660 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.118-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 662 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 665 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 667 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.70-r0: task do_package_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 669 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 670 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 671 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 673 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 675 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 677 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 682 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 683 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 684 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 685 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 688 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 690 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 691 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 692 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.118-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 697 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 699 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 700 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 702 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 705 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 709 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.118-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 713 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 715 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 717 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.118-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 718 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 724 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 726 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 727 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 729 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.118-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 734 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 736 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 738 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 740 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 743 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 745 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwpe-1.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 755 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.118-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 756 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwpe-1.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 757 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 760 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.118-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 762 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_create_spdx_setscene)
NOTE: Running setscene task 763 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_create_spdx_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 766 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 768 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 770 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 775 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 777 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 780 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 782 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 783 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 786 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 787 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe aspell-0.60.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 788 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe enchant2-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 789 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 791 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 792 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx_setscene)
NOTE: recipe enchant2-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 794 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 795 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 796 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 797 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_create_spdx_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 798 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 799 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe enchant2-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 802 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe aspell-0.60.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 805 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 806 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_create_spdx_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe enchant2-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 818 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 819 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 821 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 822 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 824 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 828 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 830 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 831 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_create_spdx_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 832 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 834 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.21.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 835 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 836 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 837 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe aspell-0.60.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 838 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.21.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 841 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 843 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 846 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 849 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 850 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 851 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 853 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe aspell-0.60.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 854 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 856 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 858 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 861 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe aspell-0.60.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 862 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 863 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 867 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 868 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 869 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 871 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 872 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 874 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 875 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: recipe libpsl-0.21.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 877 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 878 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 879 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 880 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 883 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 885 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 889 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 890 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 892 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 893 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 894 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 895 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 897 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 899 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 901 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 902 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 904 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 908 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 910 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 912 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 914 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 916 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 917 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 922 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 924 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 926 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 927 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 929 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 930 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 932 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 933 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 935 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 936 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 938 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 940 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 941 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 942 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 943 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 945 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 947 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 949 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 950 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 952 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 953 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 955 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_create_spdx_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 956 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 958 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 959 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 961 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 963 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 965 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 966 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe nghttp2-1.57.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 967 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: recipe nghttp2-1.57.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 969 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 971 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 972 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 974 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 975 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 977 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe nghttp2-1.57.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 978 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_packagedata_setscene)
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 979 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 983 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1035 of 1369 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.71.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1044 of 1369 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/groff/groff_1.23.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1046 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1047 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1048 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_create_spdx_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1049 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1050 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1051 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1052 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe groff-native-1.23.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1053 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1055 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1057 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxslt-1.1.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cargo-native-1.71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1058 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1059 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1061 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe groff-native-1.23.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1062 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1063 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1068 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1070 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1071 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1072 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_create_spdx_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1075 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1077 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1080 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1085 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1090 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1092 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1095 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.57.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1096 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1098 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1100 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1102 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1104 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1105 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1107 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cargo-native-1.71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1112 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: recipe nghttp2-1.57.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1113 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1115 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1116 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1117 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1118 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1119 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1120 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nghttp2-1.57.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1123 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1125 of 1369 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.71.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rust-native-1.71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1182 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1184 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1186 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1189 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1192 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1193 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1194 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1196 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe rust-native-1.71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1201 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 1072 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1272 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1273 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1357 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running task 1430 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: Running task 1488 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_fetch)
NOTE: Running task 1493 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.70-r0: task do_fetch: Started
NOTE: Running task 1563 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1574 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe bluez5-5.70-r0: task do_fetch: Succeeded
NOTE: Running task 1593 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_unpack)
NOTE: Running task 1600 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_write_config)
NOTE: Running task 1619 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_fetch)
NOTE: Running task 1622 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_fetch)
NOTE: Running task 1623 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_fetch)
NOTE: Running task 1624 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.2.bb:do_fetch)
NOTE: Running task 1625 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_fetch)
NOTE: Running task 1626 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_fetch)
NOTE: Running task 1627 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_fetch)
NOTE: recipe libwpe-1.14.1-r0: task do_fetch: Started
NOTE: Running task 1648 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.3.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_fetch: Started
NOTE: recipe libwpe-1.14.1-r0: task do_fetch: Succeeded
NOTE: Running task 1649 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_unpack)
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_fetch: Succeeded
NOTE: Running task 1650 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Started
NOTE: recipe bluez5-5.70-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_write_config: Started
NOTE: recipe enchant2-2.6.2-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_setscene: Succeeded
NOTE: Running task 1651 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_unpack)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running setscene task 1207 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_packagedata_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Started
NOTE: recipe gtk4-4.12.4-r0: task do_fetch: Started
NOTE: recipe libnotify-0.8.3-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.21.1-r0: task do_fetch: Started
NOTE: recipe enchant2-2.6.2-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.42.3-r0: task do_recipe_qa: Started
NOTE: Running setscene task 1208 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1209 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1210 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1211 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_fetch: Succeeded
NOTE: recipe libwpe-1.14.1-r0: task do_unpack: Started
NOTE: recipe libsecret-0.21.1-r0: task do_fetch: Succeeded
NOTE: Running task 1653 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1655 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_unpack)
NOTE: Running task 1656 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_unpack)
NOTE: Running task 1657 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_write_config: Succeeded
NOTE: Running task 1658 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.2.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_unpack: Started
NOTE: recipe libwpe-1.14.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1659 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_patch)
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_unpack: Started
NOTE: recipe enchant2-2.6.2-r0: task do_unpack: Started
NOTE: recipe gtk4-4.12.4-r0: task do_unpack: Started
NOTE: recipe webkitgtk-2.42.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1660 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1661 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running setscene task 1212 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libwpe-1.14.1-r0: task do_patch: Started
NOTE: recipe enchant2-2.6.2-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_unpack: Succeeded
NOTE: Running task 1662 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_unpack)
NOTE: Running task 1663 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_unpack)
NOTE: recipe bluez5-5.70-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.14.1-r0: task do_patch: Succeeded
NOTE: Running task 1666 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_patch)
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1667 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_generate_toolchain_file)
NOTE: Running setscene task 1214 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1669 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_patch)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1216 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running setscene task 1217 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running task 1670 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_patch)
NOTE: Running task 1671 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libnotify-0.8.3-r0: task do_unpack: Started
NOTE: recipe libsecret-0.21.1-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_patch: Started
NOTE: recipe libwpe-1.14.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1677 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.2.bb:do_patch)
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwpe-1.14.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1678 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.3.bb:do_fetch)
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1679 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_write_config)
NOTE: recipe libnotify-0.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 1680 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_patch)
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_patch: Started
NOTE: recipe libsecret-0.21.1-r0: task do_unpack: Succeeded
NOTE: Running task 1681 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_patch)
NOTE: Running task 1682 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_patch)
NOTE: recipe enchant2-2.6.2-r0: task do_patch: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Succeeded
NOTE: recipe webkitgtk-2.42.3-r0: task do_fetch: Started
NOTE: Running task 1708 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_write_config)
NOTE: Running task 1710 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.3-r0: task do_patch: Started
NOTE: recipe webkitgtk-2.42.3-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Started
NOTE: Running task 1711 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.3.bb:do_unpack)
NOTE: recipe libsecret-0.21.1-r0: task do_patch: Started
NOTE: recipe enchant2-2.6.2-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_patch: Succeeded
NOTE: Running task 1713 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_patch)
NOTE: Running task 1714 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_write_config)
NOTE: Running task 1715 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_write_config)
NOTE: Running task 1717 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_write_config)
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.21.1-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_patch: Succeeded
NOTE: recipe webkitgtk-2.42.3-r0: task do_unpack: Started
NOTE: recipe gtk4-4.12.4-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Started
NOTE: recipe libsecret-0.21.1-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.3-r0: task do_write_config: Started
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_write_config: Succeeded
NOTE: Running task 1814 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1220 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1221 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1222 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1223 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 1224 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.21.1-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_write_config: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running setscene task 1226 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1227 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1228 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1229 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1230 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1231 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_patch: Succeeded
NOTE: Running setscene task 1232 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1233 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1234 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1236 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1237 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1239 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1241 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1243 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1244 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1246 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1249 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1250 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1252 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1254 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1256 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1257 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1260 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1262 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1265 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1267 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1269 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1271 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1272 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1277 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.44.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1280 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1282 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1284 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1285 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1286 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1287 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1289 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1290 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1291 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1292 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1293 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1294 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1295 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk4-4.12.4-r0: task do_unpack: Succeeded
NOTE: Running task 2239 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2258 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe gtk4-4.12.4-r0: task do_patch: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1300 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1302 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1304 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1306 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1308 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1309 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1312 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1314 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1315 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1317 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1319 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1320 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1321 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1323 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1325 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1327 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1328 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1330 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1332 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2354 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe webkitgtk-2.42.3-r0: task do_unpack: Succeeded
NOTE: Running task 2355 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.3.bb:do_patch)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1334 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1335 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe webkitgtk-2.42.3-r0: task do_patch: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1337 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash ffecb3072592674b7af158e187193af03b3dfc5d5873ddad03efe22abadf58d1 to hashserv.yocto.io:8686 ({'taskhash': 'c63d070ae883dc3942d6210412537a3036fd97ce0ca4155353ab3120cb2a3fc8', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'ffecb3072592674b7af158e187193af03b3dfc5d5873ddad03efe22abadf58d1'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed c63d070ae883dc3942d6210412537a3036fd97ce0ca4155353ab3120cb2a3fc8 -> ffecb3072592674b7af158e187193af03b3dfc5d5873ddad03efe22abadf58d1 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1338 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1340 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1342 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1343 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1344 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe webkitgtk-2.42.3-r0: task do_patch: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2361 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2362 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.3.bb:do_generate_toolchain_file)
NOTE: Running task 2363 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.3.bb:do_populate_lic)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1348 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1349 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1351 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe webkitgtk-2.42.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.42.3-r0: task do_populate_lic: Started
NOTE: recipe webkitgtk-2.42.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe webkitgtk-2.42.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe webkitgtk-2.42.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.3.bb:do_populate_lic unihash changed to 2413793bde2c5b368a01ec2693384e5ecf99d9ec8ca22048c70bc13bcb81eeba
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1356 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1358 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1359 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe webkitgtk-2.42.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1362 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1364 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1365 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1367 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1369 of 1369 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 2413 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: Running task 2857 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 3151 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3236 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: Running task 3238 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: Running task 3268 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3392 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3395 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3396 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3397 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwpe-1.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3398 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 3503 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_collect_spdx_deps)
NOTE: recipe enchant2-2.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3513 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_collect_spdx_deps)
NOTE: recipe libnotify-0.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.21.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5009bfdce64be5968dd9927eeb08146bbc59582b45f2dbfd597d0d6515f565bd
NOTE: Running task 3547 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_collect_spdx_deps)
NOTE: Running task 3560 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3589 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3592 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.2.bb:do_collect_spdx_deps)
NOTE: Running task 3593 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_collect_spdx_deps)
NOTE: recipe libwpe-1.14.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3594 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_collect_spdx_deps)
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3595 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_configure)
NOTE: recipe bluez5-5.70-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwpe-1.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe enchant2-2.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe enchant2-2.6.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3596 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_configure)
NOTE: Running task 3597 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.2.bb:do_configure)
NOTE: recipe libsoup-3.4.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnotify-0.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe enchant2-2.6.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3598 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_collect_spdx_deps)
NOTE: recipe libwpe-1.14.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwpe-1.14.1-r0: task do_configure: Started
NOTE: recipe enchant2-2.6.2-r0: task do_configure: Started
NOTE: Running task 3601 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_ipk)
NOTE: recipe bluez5-5.70-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3602 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_configure)
NOTE: Running task 3603 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_create_spdx)
NOTE: recipe libnotify-0.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsecret-0.21.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3604 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_configure)
NOTE: Running task 3605 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_configure)
NOTE: Running task 3606 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_configure)
NOTE: recipe libsecret-0.21.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3607 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_deb)
NOTE: Running task 3608 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk: Started
NOTE: recipe libsoup-3.4.4-r0: task do_configure: Started
NOTE: recipe bluez5-5.70-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_configure: Started
NOTE: recipe libnotify-0.8.3-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.1-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3612 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3613 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: recipe libwpe-1.14.1-r0: task do_configure: Succeeded
NOTE: Running task 3614 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_compile)
NOTE: recipe libwpe-1.14.1-r0: task do_compile: Started
NOTE: recipe libwpe-1.14.1-r0: task do_compile: Succeeded
NOTE: Running task 3615 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_install)
NOTE: recipe libwpe-1.14.1-r0: task do_install: Started
NOTE: recipe bluez5-5.70-r0: task do_create_spdx: Succeeded
NOTE: recipe libwpe-1.14.1-r0: task do_install: Succeeded
NOTE: Running task 3616 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_populate_sysroot)
NOTE: Running task 3617 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_package)
NOTE: recipe libwpe-1.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.14.1-r0: task do_package: Started
NOTE: recipe libnotify-0.8.3-r0: task do_configure: Succeeded
NOTE: Running task 3618 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_compile)
NOTE: recipe libwpe-1.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_compile: Started
NOTE: Running task 3619 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-3.4.4-r0: task do_configure: Succeeded
NOTE: Running task 3620 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_compile)
NOTE: recipe libsecret-0.21.1-r0: task do_configure: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_compile: Started
NOTE: Running task 3621 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_compile)
NOTE: recipe libsecret-0.21.1-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_ipk unihash changed to d9966b707368119d296fc41d310a5b0a238294ab4eb1d1f64a89ab591a86ed31
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3622 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_configure: Started
NOTE: recipe libwpe-1.14.1-r0: task do_package: Succeeded
NOTE: Running task 3623 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_packagedata)
NOTE: recipe libwpe-1.14.1-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_deb unihash changed to 3248f18abd3353d2c81fdb08a67558bbaefe61ecb540242aed2c8daf22dcb26b
NOTE: recipe libwpe-1.14.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_packagedata unihash changed to 1747f975d6299cf1578ad1a1b1ec047f5d941326de6aaf0a366c3b50c8dc6ab0
NOTE: Setscene tasks completed
NOTE: Running task 3624 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.1.bb:do_create_spdx)
NOTE: recipe libwpe-1.14.1-r0: task do_create_spdx: Started
NOTE: recipe libwpe-1.14.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3625 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_collect_spdx_deps)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3626 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_rpm unihash changed to 31213a3329527cabf0c51cc387aed344f7379f335f6face26d070b93e617e6a4
NOTE: recipe libnotify-0.8.3-r0: task do_compile: Succeeded
NOTE: Running task 3627 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_install)
NOTE: recipe libnotify-0.8.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_configure: Succeeded
NOTE: Running task 3628 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_compile: Succeeded
NOTE: Running task 3629 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_install: Started
NOTE: recipe libnotify-0.8.3-r0: task do_install: Succeeded
NOTE: Running task 3630 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_package)
NOTE: Running task 3631 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_populate_sysroot)
NOTE: recipe libnotify-0.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe libnotify-0.8.3-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_install: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3632 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_package)
NOTE: Running task 3633 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_populate_sysroot)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: Running task 3634 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_compile)
NOTE: recipe libsecret-0.21.1-r0: task do_compile: Succeeded
NOTE: Running task 3635 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_install)
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Started
NOTE: recipe libsecret-0.21.1-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Succeeded
NOTE: Running task 3636 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_compile)
NOTE: recipe libxt-1_1.3.0-r0: task do_compile: Started
NOTE: recipe libsecret-0.21.1-r0: task do_install: Succeeded
NOTE: Running task 3637 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_package)
NOTE: Running task 3638 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_populate_sysroot)
NOTE: recipe libsecret-0.21.1-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.21.1-r0: task do_package: Started
NOTE: recipe libnotify-0.8.3-r0: task do_package: Succeeded
NOTE: Running task 3639 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_packagedata)
NOTE: recipe libnotify-0.8.3-r0: task do_packagedata: Started
NOTE: recipe libsecret-0.21.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_compile: Succeeded
NOTE: Running task 3640 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_install)
NOTE: recipe libnotify-0.8.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_packagedata unihash changed to bf465f54254f700d00604b5efbe09ebd007fb0fd624b51e9cf8cadd721c1a7e4
NOTE: Setscene tasks completed
NOTE: Running task 3641 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_create_spdx)
NOTE: recipe libsoup-3.4.4-r0: task do_install: Started
NOTE: recipe libnotify-0.8.3-r0: task do_create_spdx: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_package: Succeeded
NOTE: Running task 3642 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_packagedata)
NOTE: recipe libnotify-0.8.3-r0: task do_create_spdx: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.4-r0: task do_install: Succeeded
NOTE: Running task 3643 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_package)
NOTE: Running task 3644 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_populate_sysroot)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_packagedata unihash changed to 5fff2beb4d754125b93be87477ba28235b03b7477c7eac285fef3c3ad8002933
NOTE: Setscene tasks completed
NOTE: Running task 3645 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_create_spdx)
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-3.4.4-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_create_spdx: Started
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_compile: Succeeded
NOTE: Running task 3646 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_install)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_install: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 3647 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_package)
NOTE: Running task 3648 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_package: Started
NOTE: recipe libsecret-0.21.1-r0: task do_package: Succeeded
NOTE: Running task 3649 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsecret-0.21.1-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.4-r0: task do_package: Succeeded
NOTE: Running task 3650 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_packagedata)
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 3651 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_packagedata)
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_packagedata unihash changed to c56a8ffe279b6a1a0863b019f447e39ae751c90821e1d39c667ffae111c448b7
NOTE: Running task 3652 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_create_spdx)
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_packagedata unihash changed to aa0b5e1224c5372d4bde3fd1f8b88cbb95386262e91141b17bc36c2bd7933044
NOTE: Running task 3653 of 3703 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_create_spdx)
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libsecret-0.21.1-r0: task do_packagedata: Failed
NOTE: recipe enchant2-2.6.2-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_compile: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3653 tasks of which 3522 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231215124328.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231215124328.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_packagedata
Summary: There were 66 ERROR messages, returning a non-zero exit code.
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-src went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-dbg went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-staticdev went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-dev went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-doc went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ab went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-an went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ar went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-as went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-be went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-bg went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-bs went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ca went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ca+valencia went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ckb went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-cs went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-da went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-de went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-el went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-en-gb went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-eo went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-es went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-eu went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-fa went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-fi went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-fr went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-fur went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-gl went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-he went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-hr went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-hu went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-id went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ie went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-it went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ja went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ka went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-kk went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ko went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-lt went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-lv went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ml went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ms went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-nb went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ne went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-nl went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-oc went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pa went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pl went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pt went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-pt-br went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ro went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-ru went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sk went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sl went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sr went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sr+latin went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-sv went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-tg went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-tr went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-uk went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-vi went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-zh-cn went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-zh-hk went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: QA Issue: Package version for package libsecret-locale-zh-tw went backwards which would break package feeds (from 0:0.21.2-r0 to 0:0.21.1-r0) [version-going-backwards]
ERROR: libsecret-0.21.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libsecret/0.21.1/temp/log.do_packagedata.3743970
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.1.bb:do_packagedata) failed with exit code '1'

--===============1161588711360771908==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-webkitgtk-upgrade-2.42.2-2.42.3.patch"

RnJvbSBjNDFjNDAxNWY2MmE3MDc1MTkwM2FhMzNiZmZiNWQ5OWE1ZjI0ZDA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgRGVjIDIwMjMgMTI6NDU6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
ZWJraXRndGs6IHVwZ3JhZGUgMi40Mi4yIC0+IDIuNDIuMwoKLS0tCiAuLi5yaWFibGUtdG8tY29u
dHJvbC1tYWNyby1fX1BBU19BTFdBWVNfSS5wYXRjaCB8IDEyICsrKysrLS0tLS0tLQogLi4ucm9z
cGVjdGlvbi5jbWFrZS1wcmVmaXgtdmFyaWFibGVzLW9idGEucGF0Y2ggfCAgNSArKystLQogLi4u
MzM0NGUxN2QyNTgxMDY2MTdiMGU2ZDc4M2QwNzNiMTg4YTI1NDgucGF0Y2ggfCAgMiArLQogLi4u
L3dlYmtpdC93ZWJraXRndGsvcmVwcm9kdWNpYmlsaXR5LnBhdGNoICAgICAgfCAxNyArKysrKysr
KysrKysrLS0tLQogLi4ue3dlYmtpdGd0a18yLjQyLjIuYmIgPT4gd2Via2l0Z3RrXzIuNDIuMy5i
Yn0gfCAgMiArLQogNSBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc2F0by93ZWJraXQve3dlYmtpdGd0a18yLjQyLjIu
YmIgPT4gd2Via2l0Z3RrXzIuNDIuMy5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrLzAwMDEtQ01ha2UtQWRkLWEtdmFyaWFibGUtdG8tY29u
dHJvbC1tYWNyby1fX1BBU19BTFdBWVNfSS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtp
dC93ZWJraXRndGsvMDAwMS1DTWFrZS1BZGQtYS12YXJpYWJsZS10by1jb250cm9sLW1hY3JvLV9f
UEFTX0FMV0FZU19JLnBhdGNoCmluZGV4IDQyNjZkMTFlOWUuLjRiYTk2OWUxNjIgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvMDAwMS1DTWFrZS1BZGQtYS12
YXJpYWJsZS10by1jb250cm9sLW1hY3JvLV9fUEFTX0FMV0FZU19JLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvMDAwMS1DTWFrZS1BZGQtYS12YXJpYWJsZS10
by1jb250cm9sLW1hY3JvLV9fUEFTX0FMV0FZU19JLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJv
bSA3M2VmZTBlYTc1YzNhYzRjYjA4OGYzMDBhY2MzZGU0NGQ1ZGQzMzQ0IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSAwZGM2MTFiNjViYjEzZjAxYTVmOTZjNWM4MjgzOGRkMjdjOWZhOTk3
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRy
aXZlci5jb20+CiBEYXRlOiBGcmksIDExIEF1ZyAyMDIzIDE0OjIwOjQ4ICswODAwCi1TdWJqZWN0
OiBbUEFUQ0hdIFtDTWFrZV0gQWRkIGEgdmFyaWFibGUgdG8gY29udHJvbCBtYWNybworU3ViamVj
dDogW1BBVENIXSBBZGQgYSB2YXJpYWJsZSB0byBjb250cm9sIG1hY3JvCiAgX19QQVNfQUxXQVlT
X0lOTElORV9CVVRfTk9UX0lOTElORQogIGh0dHBzOi8vYnVncy53ZWJraXQub3JnL3Nob3dfYnVn
LmNnaT9pZD0yNjAwNjUKIApAQCAtMzgsMTMgKzM4LDE0IEBAIGdjYyBvcHRpb24gYC1PZ2AgaXMg
dXNlZC4KIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20vV2Vi
S2l0L1dlYktpdC9wdWxsLzE2NjAxXQogCiBTaWduZWQtb2ZmLWJ5OiBLYWkgS2FuZyA8a2FpLmth
bmdAd2luZHJpdmVyLmNvbT4KKwogLS0tCiAgU291cmNlL2JtYWxsb2MvbGlicGFzL3NyYy9saWJw
YXMvcGFzX3V0aWxzX3ByZWZpeC5oIHwgMiArLQogIFNvdXJjZS9jbWFrZS9XZWJLaXRDb21waWxl
ckZsYWdzLmNtYWtlICAgICAgICAgICAgICB8IDcgKysrKysrKwogIDIgZmlsZXMgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9Tb3VyY2UvYm1h
bGxvYy9saWJwYXMvc3JjL2xpYnBhcy9wYXNfdXRpbHNfcHJlZml4LmggYi9Tb3VyY2UvYm1hbGxv
Yy9saWJwYXMvc3JjL2xpYnBhcy9wYXNfdXRpbHNfcHJlZml4LmgKLWluZGV4IDVkNWZiMzhjZGRi
ZC4uYTU1NGY3MDA2NGViIDEwMDY0NAoraW5kZXggNWQ1ZmIzOGMuLmE1NTRmNzAwIDEwMDY0NAog
LS0tIGEvU291cmNlL2JtYWxsb2MvbGlicGFzL3NyYy9saWJwYXMvcGFzX3V0aWxzX3ByZWZpeC5o
CiArKysgYi9Tb3VyY2UvYm1hbGxvYy9saWJwYXMvc3JjL2xpYnBhcy9wYXNfdXRpbHNfcHJlZml4
LmgKIEBAIC00NCw3ICs0NCw3IEBAIF9fUEFTX0JFR0lOX0VYVEVSTl9DOwpAQCAtNTcsNyArNTgs
NyBAQCBpbmRleCA1ZDVmYjM4Y2RkYmQuLmE1NTRmNzAwNjRlYiAxMDA2NDQKICAjZWxzZQogICNk
ZWZpbmUgX19QQVNfQUxXQVlTX0lOTElORV9CVVRfTk9UX0lOTElORQogZGlmZiAtLWdpdCBhL1Nv
dXJjZS9jbWFrZS9XZWJLaXRDb21waWxlckZsYWdzLmNtYWtlIGIvU291cmNlL2NtYWtlL1dlYktp
dENvbXBpbGVyRmxhZ3MuY21ha2UKLWluZGV4IDliMmZlY2Y5YTBkMy4uN2NkYzJiNmFmYmUwIDEw
MDY0NAoraW5kZXggOWIyZmVjZjkuLjdjZGMyYjZhIDEwMDY0NAogLS0tIGEvU291cmNlL2NtYWtl
L1dlYktpdENvbXBpbGVyRmxhZ3MuY21ha2UKICsrKyBiL1NvdXJjZS9jbWFrZS9XZWJLaXRDb21w
aWxlckZsYWdzLmNtYWtlCiBAQCAtNDUzLDMgKzQ1MywxMCBAQCBlbmRpZiAoKQpAQCAtNzEsNiAr
NzIsMyBAQCBpbmRleCA5YjJmZWNmOWEwZDMuLjdjZGMyYjZhZmJlMCAxMDA2NDQKICtpZiAoV0VC
S0lUX05PX0lOTElORV9ISU5UUykKICsgICAgYWRkX2RlZmluaXRpb25zKC1EV0VCS0lUX05PX0lO
TElORV9ISU5UUykKICtlbmRpZiAoKQotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay8wMDAxLUZpbmRHT2JqZWN0SW50cm9zcGVjdGlv
bi5jbWFrZS1wcmVmaXgtdmFyaWFibGVzLW9idGEucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc2F0by93
ZWJraXQvd2Via2l0Z3RrLzAwMDEtRmluZEdPYmplY3RJbnRyb3NwZWN0aW9uLmNtYWtlLXByZWZp
eC12YXJpYWJsZXMtb2J0YS5wYXRjaAppbmRleCA4YWUzOWYxNGUxLi42Njg0NmJjMjRkIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrLzAwMDEtRmluZEdPYmpl
Y3RJbnRyb3NwZWN0aW9uLmNtYWtlLXByZWZpeC12YXJpYWJsZXMtb2J0YS5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrLzAwMDEtRmluZEdPYmplY3RJbnRyb3Nw
ZWN0aW9uLmNtYWtlLXByZWZpeC12YXJpYWJsZXMtb2J0YS5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gMTBjZmRjYzkwNTkxNWQ4ODE0YzYwOTAwOGEwNjkxMDJmMmJjN2UzOSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDk5OTI1ZGE5ZjM2NWQwNGY1NmYxY2RlYWM3OWJlYmQwOTBl
MTk1YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVHVlLCAyNyBPY3QgMjAxNSAxNjowMjoxOSAr
MDIwMAogU3ViamVjdDogW1BBVENIXSBGaW5kR09iamVjdEludHJvc3BlY3Rpb24uY21ha2U6IHBy
ZWZpeCB2YXJpYWJsZXMgb2J0YWluZWQKQEAgLTksMTIgKzksMTMgQEAgcmVhc29ucyB3aHkgdGhp
cyBpcyBub3QgYXBwcm9wcm9pYXRlIGZvciB1cHN0cmVhbSBzdWJtaXNzaW9uLgogCiBVcHN0cmVh
bS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLWNvcmUgc3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KKwogLS0tCiAgU291
cmNlL2NtYWtlL0ZpbmRHSS5jbWFrZSB8IDMgKysrCiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvU291cmNlL2NtYWtlL0ZpbmRHSS5jbWFrZSBiL1NvdXJj
ZS9jbWFrZS9GaW5kR0kuY21ha2UKLWluZGV4IGFmMDM5Y2JiLi5iM2U4MTBjZCAxMDA2NDQKK2lu
ZGV4IGZkYzU2YjIxLi5kNDJlY2E1MiAxMDA2NDQKIC0tLSBhL1NvdXJjZS9jbWFrZS9GaW5kR0ku
Y21ha2UKICsrKyBiL1NvdXJjZS9jbWFrZS9GaW5kR0kuY21ha2UKIEBAIC03Miw2ICs3Miw5IEBA
IGlmIChQS0dfQ09ORklHX0ZPVU5EKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vd2Vi
a2l0L3dlYmtpdGd0ay8wZDMzNDRlMTdkMjU4MTA2NjE3YjBlNmQ3ODNkMDczYjE4OGEyNTQ4LnBh
dGNoIGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay8wZDMzNDRlMTdkMjU4MTA2
NjE3YjBlNmQ3ODNkMDczYjE4OGEyNTQ4LnBhdGNoCmluZGV4IGU1ZWNlODJlZDMuLjE1OTdhMGY1
NmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvMGQzMzQ0
ZTE3ZDI1ODEwNjYxN2IwZTZkNzgzZDA3M2IxODhhMjU0OC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrLzBkMzM0NGUxN2QyNTgxMDY2MTdiMGU2ZDc4M2QwNzNi
MTg4YTI1NDgucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDk1Mzk4OTgyZjRhMTIwMTQ3YTk4
YTI3ZTE3NmZhY2Y2ZDk1YjJiZjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGM1Njhm
MTQ5NmNmODQ3ZjZjMDIzYjYyODEzYWFiMGI2ZGM0N2Y4MTcgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4KIERh
dGU6IFRodSwgMiBKdW4gMjAyMiAxMToxOTowNiArMDMwMAogU3ViamVjdDogW1BBVENIXSBGRUxp
Z2h0bmluZ05FT04uY3BwIGZhaWxzIHRvIGJ1aWxkLCBORU9OIGZhc3QgcGF0aCBzZWVtcwpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay9yZXByb2R1Y2liaWxp
dHkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL3JlcHJvZHVjaWJp
bGl0eS5wYXRjaAppbmRleCBlODY2YTFhMTkzLi45ZTdmNDA2NTRjIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL3JlcHJvZHVjaWJpbGl0eS5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL3JlcHJvZHVjaWJpbGl0eS5wYXRj
aApAQCAtMSwzICsxLDggQEAKK0Zyb20gMTk0YWY2MTM2MTIwZGZiYzhjNjIzZTc4OWEzMzkyMDU1
ZTIzMmZkMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IFJpY2hhcmQgUHVyZGllIDxy
aWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgorRGF0ZTogTW9uLCAzIEphbiAyMDIy
IDE0OjE4OjM0ICswMDAwCitTdWJqZWN0OiBbUEFUQ0hdIHdlYmtpdGd0azogQWRkIHJlcHJvZHVj
aWJpbGl0eSBmaXgKKwogSW5qZWN0aW9uIGEgeWVhciBiYXNlZCBvbiB0aGUgY3VycmVudCBkYXRl
IGlzbid0IHJlcHJvZHVjaWJsZS4gSGFjayB0aGlzCiB0byBhIHNwZWNpZmljIHllYXIgZm9yIG5v
dyBmb3IgcmVwcm9kdWNpYmlsdHkgYW5kIHRvIGF2b2lkIGF1dG9idWlsZGVyIGZhaWx1cmVzLgog
CkBAIC03LDEwICsxMiwxNCBAQCB0aGVuIHRoaXMgY291bGQgYmUgc3VibWl0dGVkIHVwc3RyZWFt
LCBzYWRseSBteSBydWJ5IGlzbid0IHVwIHRvIHRoYXQuCiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRp
bmcgW2NvdWxkIGJlIHJld29ya2VkXQogU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJp
Y2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiAKLUluZGV4OiB3ZWJraXRndGstMi4z
NC4yL1NvdXJjZS9KYXZhU2NyaXB0Q29yZS9nZW5lcmF0b3IvR2VuZXJhdGVkRmlsZS5yYgotPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQotLS0tIHdlYmtpdGd0ay0yLjM0LjIub3JpZy9Tb3VyY2UvSmF2YVNjcmlwdENvcmUv
Z2VuZXJhdG9yL0dlbmVyYXRlZEZpbGUucmIKLSsrKyB3ZWJraXRndGstMi4zNC4yL1NvdXJjZS9K
YXZhU2NyaXB0Q29yZS9nZW5lcmF0b3IvR2VuZXJhdGVkRmlsZS5yYgorLS0tCisgU291cmNlL0ph
dmFTY3JpcHRDb3JlL2dlbmVyYXRvci9HZW5lcmF0ZWRGaWxlLnJiIHwgMiArLQorIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQorCitkaWZmIC0tZ2l0IGEvU291
cmNlL0phdmFTY3JpcHRDb3JlL2dlbmVyYXRvci9HZW5lcmF0ZWRGaWxlLnJiIGIvU291cmNlL0ph
dmFTY3JpcHRDb3JlL2dlbmVyYXRvci9HZW5lcmF0ZWRGaWxlLnJiCitpbmRleCA2ZWQyYjZlNC4u
ODZhMjgyODYgMTAwNjQ0CistLS0gYS9Tb3VyY2UvSmF2YVNjcmlwdENvcmUvZ2VuZXJhdG9yL0dl
bmVyYXRlZEZpbGUucmIKKysrKyBiL1NvdXJjZS9KYXZhU2NyaXB0Q29yZS9nZW5lcmF0b3IvR2Vu
ZXJhdGVkRmlsZS5yYgogQEAgLTI1LDcgKzI1LDcgQEAgcmVxdWlyZSAnZGF0ZScKICByZXF1aXJl
ICdkaWdlc3QnCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0
Z3RrXzIuNDIuMi5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGtfMi40Mi4z
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zYXRvL3dl
YmtpdC93ZWJraXRndGtfMi40Mi4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc2F0by93ZWJr
aXQvd2Via2l0Z3RrXzIuNDIuMy5iYgppbmRleCAyYmE2MGViNjViLi5mMzU2NDc0MTRhIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrXzIuNDIuMi5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrXzIuNDIuMy5iYgpAQCAtMTUsNyAr
MTUsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vd3d3LndlYmtpdGd0ay5vcmcvcmVsZWFzZXMvJHtC
UE59LSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wZDMzNDRlMTdkMjU4MTA2NjE3
YjBlNmQ3ODNkMDczYjE4OGEyNTQ4LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtQ01h
a2UtQWRkLWEtdmFyaWFibGUtdG8tY29udHJvbC1tYWNyby1fX1BBU19BTFdBWVNfSS5wYXRjaCBc
CiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1NzIwYWEzZTg2MjdmMWI5ZjYz
MjUyMTg3ZDRkZjBmODIzM2FlNzFkNjk3YjE3OTZlYmZiZTVjYTc1MGJkMTE4IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjBhMWE0NjMwMDQ1NjI4YjNhNmZlOTVkYTcyZGM0Nzg1MmNmZjIwZDY2YmUx
YWM2ZmQwZDY2OWM4OGMxM2Q4ZTIiCiAKIGluaGVyaXQgY21ha2UgcGtnY29uZmlnIGdvYmplY3Qt
aW50cm9zcGVjdGlvbiBwZXJsbmF0aXZlIGZlYXR1cmVzX2NoZWNrIHVwc3RyZWFtLXZlcnNpb24t
aXMtZXZlbiBnaS1kb2NnZW4KIAotLSAKMi40Mi4wCgo=

--===============1161588711360771908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/webkitgtk: SRC_URI changed from "https://www.webkitgtk.org/releases/webkitgtk-2.42.2.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://reproducibility.patch file://0d3344e17d258106617b0e6d783d073b188a2548.patch file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch" to "https://www.webkitgtk.org/releases/webkitgtk-2.42.3.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://reproducibility.patch file://0d3344e17d258106617b0e6d783d073b188a2548.patch file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch"
packages/core2-64-poky-linux/webkitgtk: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
Changes to packages/core2-64-poky-linux/webkitgtk (sysroot):
  /usr/lib/libjavascriptcoregtk-6.0.so.1 changed symlink target from libjavascriptcoregtk-6.0.so.1.1.11 to libjavascriptcoregtk-6.0.so.1.1.12
  /usr/lib/libwebkitgtk-6.0.so.4 changed symlink target from libwebkitgtk-6.0.so.4.4.5 to libwebkitgtk-6.0.so.4.4.6
  /usr/lib/libjavascriptcoregtk-6.0.so.1.1.11 moved to /usr/lib/libjavascriptcoregtk-6.0.so.1.1.12
  /usr/lib/libwebkitgtk-6.0.so.4.4.5 moved to /usr/lib/libwebkitgtk-6.0.so.4.4.6
packages/core2-64-poky-linux/webkitgtk/webkitgtk-dbg: PKGSIZE changed from 707130240 to 707166912 (+0%)
packages/core2-64-poky-linux/webkitgtk/webkitgtk-dbg: FILELIST: removed "/usr/lib/.debug/libjavascriptcoregtk-6.0.so.1.1.11 /usr/lib/.debug/libwebkitgtk-6.0.so.4.4.5", added "/usr/lib/.debug/libjavascriptcoregtk-6.0.so.1.1.12 /usr/lib/.debug/libwebkitgtk-6.0.so.4.4.6"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-dbg: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-dbg: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-dev: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-dev: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-doc: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-doc: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ar: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ar: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-as: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-as: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-bg: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-bg: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ca: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ca: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-cs: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-cs: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-da: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-da: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-de: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-de: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-el: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-el: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-en-ca: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-en-ca: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-en-gb: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-en-gb: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-eo: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-eo: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-es: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-es: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-et: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-et: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-eu: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-eu: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-fi: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-fi: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-fr: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-fr: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-gl: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-gl: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-gu: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-gu: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-he: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-he: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-hi: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-hi: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-hr: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-hr: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-hu: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-hu: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-id: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-id: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-it: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-it: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ja: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ja: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ka: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ka: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-kn: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-kn: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ko: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ko: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-lt: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-lt: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-lv: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-lv: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ml: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ml: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-mr: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-mr: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-nb: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-nb: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-nl: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-nl: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-or: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-or: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pa: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pa: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pl: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pl: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pt-br: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pt-br: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pt: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pt: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ro: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ro: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ru: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ru: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sl: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sl: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sr+latin: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sr+latin: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sr: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sr: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sv: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sv: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ta: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ta: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-te: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-te: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-tr: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-tr: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-uk: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-uk: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-vi: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-vi: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-zh-cn: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-zh-cn: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-src: PKGSIZE changed from 210540712 to 210545148 (+0%)
packages/core2-64-poky-linux/webkitgtk/webkitgtk-src: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-src: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-staticdev: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-staticdev: PKGV changed from 2.42.2 [default] to 2.42.3 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk: PKGSIZE changed from 101594339 to 101598435 (+0%)
packages/core2-64-poky-linux/webkitgtk/webkitgtk: FILELIST: removed "/usr/lib/libwebkitgtk-6.0.so.4.4.5 /usr/lib/libjavascriptcoregtk-6.0.so.1.1.11", added "/usr/lib/libjavascriptcoregtk-6.0.so.1.1.12 /usr/lib/libwebkitgtk-6.0.so.4.4.6"
packages/core2-64-poky-linux/webkitgtk/webkitgtk: PV changed from "2.42.2" to "2.42.3"
packages/core2-64-poky-linux/webkitgtk/webkitgtk: PKGV changed from 2.42.2 [default] to 2.42.3 [default]

--===============1161588711360771908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/webkitgtk (sysroot):
  /usr/lib/libjavascriptcoregtk-6.0.so.1 changed symlink target from libjavascriptcoregtk-6.0.so.1.1.11 to libjavascriptcoregtk-6.0.so.1.1.12
  /usr/lib/libwebkitgtk-6.0.so.4 changed symlink target from libwebkitgtk-6.0.so.4.4.5 to libwebkitgtk-6.0.so.4.4.6
  /usr/lib/libjavascriptcoregtk-6.0.so.1.1.11 moved to /usr/lib/libjavascriptcoregtk-6.0.so.1.1.12
  /usr/lib/libwebkitgtk-6.0.so.4.4.5 moved to /usr/lib/libwebkitgtk-6.0.so.4.4.6
packages/core2-64-poky-linux/webkitgtk/webkitgtk: FILELIST: removed "/usr/lib/libwebkitgtk-6.0.so.4.4.5 /usr/lib/libjavascriptcoregtk-6.0.so.1.1.11", added "/usr/lib/libjavascriptcoregtk-6.0.so.1.1.12 /usr/lib/libwebkitgtk-6.0.so.4.4.6"

--===============1161588711360771908==--

