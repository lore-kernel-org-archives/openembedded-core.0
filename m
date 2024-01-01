Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E6FC4707C
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:05 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.4581.1704114719239508894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KSnoDmGH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XYkH1NTR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018cc52710c7-312bd3e8-2d3a-41a7-847f-d0d748a92305-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114721;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Jz1KhZbQ4bXoLIxrZlpLpJUYaVEEl/r7Z4l9YYCqS2I=;
	b=KSnoDmGHo68ICoN/k3bR21f+ThMIr1Jb5Mwfw9LUyd1RYLkm6CTCZ1gwwY4L8wWg
	VcRABh6CpDWMLrnYFPJfqW+LYNE5d6G1Mi0afankmzQJv16oAtiRp7aNUL0w59nUpsx
	qG4eGacMuWAghIWPpVPu4dwqHAFRBkE6muhqJNas=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114721;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Jz1KhZbQ4bXoLIxrZlpLpJUYaVEEl/r7Z4l9YYCqS2I=;
	b=XYkH1NTRF81KlE4xVGrsxMtuKiM6xgMIHWWPTh+ZWTROZOR5uo04XqckNdL+sjk+
	OaJAZM0tdKtjjNQvXASl/xd2QecdQHYSUk/Ts3nZdM4YwR2wOa0QWId/xlh3JWWDADL
	e9Zi5eHTW1rmhMcLaEu9TDaWCxFN4MtteuOHLyA8=
Content-Type: multipart/mixed; boundary="===============6445711069782094557=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] webkitgtk: upgrading to 2.42.4 SUCCEEDED
Message-ID: <0101018cc52710c7-312bd3e8-2d3a-41a7-847f-d0d748a92305-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:12:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193184

--===============6445711069782094557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *webkitgtk* to *2.42.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-webkitgtk-upgrade-2.42.2-2.42.4.patch
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
From b812feffaa5ea21f74623da55494a7edc1a11975 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 12:11:40 +0000
Subject: [PATCH] webkitgtk: upgrade 2.42.2 -> 2.42.4

---
 ...riable-to-control-macro-__PAS_ALWAYS_I.patch | 12 +++++-------
 ...rospection.cmake-prefix-variables-obta.patch |  5 +++--
 ...3344e17d258106617b0e6d783d073b188a2548.patch |  2 +-
 .../webkit/webkitgtk/reproducibility.patch      | 17 +++++++++++++----
 ...{webkitgtk_2.42.2.bb => webkitgtk_2.42.4.bb} |  2 +-
 5 files changed, 23 insertions(+), 15 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.42.2.bb => webkitgtk_2.42.4.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
index 4266d11e9e..2c8fcfb640 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
@@ -1,7 +1,7 @@
-From 73efe0ea75c3ac4cb088f300acc3de44d5dd3344 Mon Sep 17 00:00:00 2001
+From c59ecae6342325477d70aec73518ae3f77fe570c Mon Sep 17 00:00:00 2001
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
index 8ae39f14e1..1fb19ce826 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From 10cfdcc905915d8814c609008a069102f2bc7e39 Mon Sep 17 00:00:00 2001
+From 50c974bc851e84e7fbeaaec02232514e81a030f0 Mon Sep 17 00:00:00 2001
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
index e5ece82ed3..2617ed9bab 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0d3344e17d258106617b0e6d783d073b188a2548.patch
@@ -1,4 +1,4 @@
-From 95398982f4a120147a98a27e176facf6d95b2bf7 Mon Sep 17 00:00:00 2001
+From 66d1d969f8dfaf0f7f70e01f7e3ca6313a0a7a75 Mon Sep 17 00:00:00 2001
 From: Adrian Perez de Castro <aperez@igalia.com>
 Date: Thu, 2 Jun 2022 11:19:06 +0300
 Subject: [PATCH] FELightningNEON.cpp fails to build, NEON fast path seems
diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
index e866a1a193..d10260c185 100644
--- a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
@@ -1,3 +1,8 @@
+From 5fc454fe1d3b04db329479cd8490b8658e25f990 Mon Sep 17 00:00:00 2001
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
  
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.42.4.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.42.2.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.42.4.bb
index 2ba60eb65b..1f9465b1a3 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.42.4.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
            "
-SRC_URI[sha256sum] = "5720aa3e8627f1b9f63252187d4df0f8233ae71d697b1796ebfbe5ca750bd118"
+SRC_URI[sha256sum] = "52288b30bda22373442cecb86f9c9a569ad8d4769a1f97b352290ed92a67ed86"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.42.0


--===============6445711069782094557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/webkitgtk (sysroot):
  /usr/lib/libjavascriptcoregtk-6.0.so.1 changed symlink target from libjavascriptcoregtk-6.0.so.1.1.11 to libjavascriptcoregtk-6.0.so.1.1.13
  /usr/lib/libwebkitgtk-6.0.so.4 changed symlink target from libwebkitgtk-6.0.so.4.4.5 to libwebkitgtk-6.0.so.4.4.7
  /usr/lib/libjavascriptcoregtk-6.0.so.1.1.11 moved to /usr/lib/libjavascriptcoregtk-6.0.so.1.1.13
  /usr/lib/libwebkitgtk-6.0.so.4.4.5 moved to /usr/lib/libwebkitgtk-6.0.so.4.4.7
packages/core2-64-poky-linux/webkitgtk/webkitgtk: FILELIST: removed "/usr/lib/libjavascriptcoregtk-6.0.so.1.1.11 /usr/lib/libwebkitgtk-6.0.so.4.4.5", added "/usr/lib/libwebkitgtk-6.0.so.4.4.7 /usr/lib/libjavascriptcoregtk-6.0.so.1.1.13"

--===============6445711069782094557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/webkitgtk: SRC_URI changed from "https://www.webkitgtk.org/releases/webkitgtk-2.42.2.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://reproducibility.patch file://0d3344e17d258106617b0e6d783d073b188a2548.patch file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch" to "https://www.webkitgtk.org/releases/webkitgtk-2.42.4.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://reproducibility.patch file://0d3344e17d258106617b0e6d783d073b188a2548.patch file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch"
packages/core2-64-poky-linux/webkitgtk: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
Changes to packages/core2-64-poky-linux/webkitgtk (sysroot):
  /usr/lib/libjavascriptcoregtk-6.0.so.1 changed symlink target from libjavascriptcoregtk-6.0.so.1.1.11 to libjavascriptcoregtk-6.0.so.1.1.13
  /usr/lib/libwebkitgtk-6.0.so.4 changed symlink target from libwebkitgtk-6.0.so.4.4.5 to libwebkitgtk-6.0.so.4.4.7
  /usr/lib/libjavascriptcoregtk-6.0.so.1.1.11 moved to /usr/lib/libjavascriptcoregtk-6.0.so.1.1.13
  /usr/lib/libwebkitgtk-6.0.so.4.4.5 moved to /usr/lib/libwebkitgtk-6.0.so.4.4.7
packages/core2-64-poky-linux/webkitgtk/webkitgtk-dbg: FILELIST: removed "/usr/lib/.debug/libjavascriptcoregtk-6.0.so.1.1.11 /usr/lib/.debug/libwebkitgtk-6.0.so.4.4.5", added "/usr/lib/.debug/libjavascriptcoregtk-6.0.so.1.1.13 /usr/lib/.debug/libwebkitgtk-6.0.so.4.4.7"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-dbg: PKGSIZE changed from 707130240 to 707344936 (+0%)
packages/core2-64-poky-linux/webkitgtk/webkitgtk-dbg: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-dbg: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-dev: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-dev: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-doc: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-doc: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ar: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ar: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-as: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-as: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-bg: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-bg: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ca: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ca: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-cs: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-cs: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-da: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-da: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-de: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-de: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-el: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-el: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-en-ca: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-en-ca: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-en-gb: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-en-gb: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-eo: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-eo: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-es: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-es: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-et: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-et: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-eu: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-eu: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-fi: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-fi: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-fr: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-fr: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-gl: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-gl: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-gu: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-gu: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-he: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-he: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-hi: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-hi: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-hr: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-hr: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-hu: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-hu: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-id: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-id: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-it: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-it: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ja: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ja: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ka: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ka: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-kn: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-kn: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ko: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ko: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-lt: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-lt: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-lv: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-lv: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ml: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ml: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-mr: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-mr: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-nb: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-nb: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-nl: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-nl: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-or: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-or: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pa: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pa: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pl: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pl: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pt-br: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pt-br: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pt: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pt: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ro: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ro: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ru: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ru: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sl: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sl: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sr+latin: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sr+latin: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sr: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sr: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sv: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sv: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ta: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ta: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-te: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-te: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-tr: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-tr: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-uk: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-uk: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-vi: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-vi: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-zh-cn: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-zh-cn: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-src: PKGSIZE changed from 210540712 to 210574835 (+0%)
packages/core2-64-poky-linux/webkitgtk/webkitgtk-src: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-src: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-staticdev: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-staticdev: PKGV changed from 2.42.2 [default] to 2.42.4 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk: FILELIST: removed "/usr/lib/libjavascriptcoregtk-6.0.so.1.1.11 /usr/lib/libwebkitgtk-6.0.so.4.4.5", added "/usr/lib/libjavascriptcoregtk-6.0.so.1.1.13 /usr/lib/libwebkitgtk-6.0.so.4.4.7"
packages/core2-64-poky-linux/webkitgtk/webkitgtk: PKGSIZE changed from 101594339 to 101610723 (+0%)
packages/core2-64-poky-linux/webkitgtk/webkitgtk: PV changed from "2.42.2" to "2.42.4"
packages/core2-64-poky-linux/webkitgtk/webkitgtk: PKGV changed from 2.42.2 [default] to 2.42.4 [default]

--===============6445711069782094557==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-webkitgtk-upgrade-2.42.2-2.42.4.patch"

RnJvbSBiODEyZmVmZmFhNWVhMjFmNzQ2MjNkYTU1NDk0YTdlZGMxYTExOTc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAxMjoxMTo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdl
YmtpdGd0azogdXBncmFkZSAyLjQyLjIgLT4gMi40Mi40CgotLS0KIC4uLnJpYWJsZS10by1jb250
cm9sLW1hY3JvLV9fUEFTX0FMV0FZU19JLnBhdGNoIHwgMTIgKysrKystLS0tLS0tCiAuLi5yb3Nw
ZWN0aW9uLmNtYWtlLXByZWZpeC12YXJpYWJsZXMtb2J0YS5wYXRjaCB8ICA1ICsrKy0tCiAuLi4z
MzQ0ZTE3ZDI1ODEwNjYxN2IwZTZkNzgzZDA3M2IxODhhMjU0OC5wYXRjaCB8ICAyICstCiAuLi4v
d2Via2l0L3dlYmtpdGd0ay9yZXByb2R1Y2liaWxpdHkucGF0Y2ggICAgICB8IDE3ICsrKysrKysr
KysrKystLS0tCiAuLi57d2Via2l0Z3RrXzIuNDIuMi5iYiA9PiB3ZWJraXRndGtfMi40Mi40LmJi
fSB8ICAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9u
cygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC97d2Via2l0Z3RrXzIuNDIuMi5i
YiA9PiB3ZWJraXRndGtfMi40Mi40LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1zYXRvL3dlYmtpdC93ZWJraXRndGsvMDAwMS1DTWFrZS1BZGQtYS12YXJpYWJsZS10by1jb250
cm9sLW1hY3JvLV9fUEFTX0FMV0FZU19JLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0
L3dlYmtpdGd0ay8wMDAxLUNNYWtlLUFkZC1hLXZhcmlhYmxlLXRvLWNvbnRyb2wtbWFjcm8tX19Q
QVNfQUxXQVlTX0kucGF0Y2gKaW5kZXggNDI2NmQxMWU5ZS4uMmM4ZmNmYjY0MCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay8wMDAxLUNNYWtlLUFkZC1hLXZh
cmlhYmxlLXRvLWNvbnRyb2wtbWFjcm8tX19QQVNfQUxXQVlTX0kucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay8wMDAxLUNNYWtlLUFkZC1hLXZhcmlhYmxlLXRv
LWNvbnRyb2wtbWFjcm8tX19QQVNfQUxXQVlTX0kucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9t
IDczZWZlMGVhNzVjM2FjNGNiMDg4ZjMwMGFjYzNkZTQ0ZDVkZDMzNDQgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIGM1OWVjYWU2MzQyMzI1NDc3ZDcwYWVjNzM1MThhZTNmNzdmZTU3MGMg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLYWkgS2FuZyA8a2FpLmthbmdAd2luZHJp
dmVyLmNvbT4KIERhdGU6IEZyaSwgMTEgQXVnIDIwMjMgMTQ6MjA6NDggKzA4MDAKLVN1YmplY3Q6
IFtQQVRDSF0gW0NNYWtlXSBBZGQgYSB2YXJpYWJsZSB0byBjb250cm9sIG1hY3JvCitTdWJqZWN0
OiBbUEFUQ0hdIEFkZCBhIHZhcmlhYmxlIHRvIGNvbnRyb2wgbWFjcm8KICBfX1BBU19BTFdBWVNf
SU5MSU5FX0JVVF9OT1RfSU5MSU5FCiAgaHR0cHM6Ly9idWdzLndlYmtpdC5vcmcvc2hvd19idWcu
Y2dpP2lkPTI2MDA2NQogCkBAIC0zOCwxMyArMzgsMTQgQEAgZ2NjIG9wdGlvbiBgLU9nYCBpcyB1
c2VkLgogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0aHViLmNvbS9XZWJL
aXQvV2ViS2l0L3B1bGwvMTY2MDFdCiAKIFNpZ25lZC1vZmYtYnk6IEthaSBLYW5nIDxrYWkua2Fu
Z0B3aW5kcml2ZXIuY29tPgorCiAtLS0KICBTb3VyY2UvYm1hbGxvYy9saWJwYXMvc3JjL2xpYnBh
cy9wYXNfdXRpbHNfcHJlZml4LmggfCAyICstCiAgU291cmNlL2NtYWtlL1dlYktpdENvbXBpbGVy
RmxhZ3MuY21ha2UgICAgICAgICAgICAgIHwgNyArKysrKysrCiAgMiBmaWxlcyBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL1NvdXJjZS9ibWFs
bG9jL2xpYnBhcy9zcmMvbGlicGFzL3Bhc191dGlsc19wcmVmaXguaCBiL1NvdXJjZS9ibWFsbG9j
L2xpYnBhcy9zcmMvbGlicGFzL3Bhc191dGlsc19wcmVmaXguaAotaW5kZXggNWQ1ZmIzOGNkZGJk
Li5hNTU0ZjcwMDY0ZWIgMTAwNjQ0CitpbmRleCA1ZDVmYjM4Yy4uYTU1NGY3MDAgMTAwNjQ0CiAt
LS0gYS9Tb3VyY2UvYm1hbGxvYy9saWJwYXMvc3JjL2xpYnBhcy9wYXNfdXRpbHNfcHJlZml4LmgK
ICsrKyBiL1NvdXJjZS9ibWFsbG9jL2xpYnBhcy9zcmMvbGlicGFzL3Bhc191dGlsc19wcmVmaXgu
aAogQEAgLTQ0LDcgKzQ0LDcgQEAgX19QQVNfQkVHSU5fRVhURVJOX0M7CkBAIC01Nyw3ICs1OCw3
IEBAIGluZGV4IDVkNWZiMzhjZGRiZC4uYTU1NGY3MDA2NGViIDEwMDY0NAogICNlbHNlCiAgI2Rl
ZmluZSBfX1BBU19BTFdBWVNfSU5MSU5FX0JVVF9OT1RfSU5MSU5FCiBkaWZmIC0tZ2l0IGEvU291
cmNlL2NtYWtlL1dlYktpdENvbXBpbGVyRmxhZ3MuY21ha2UgYi9Tb3VyY2UvY21ha2UvV2ViS2l0
Q29tcGlsZXJGbGFncy5jbWFrZQotaW5kZXggOWIyZmVjZjlhMGQzLi43Y2RjMmI2YWZiZTAgMTAw
NjQ0CitpbmRleCA5YjJmZWNmOS4uN2NkYzJiNmEgMTAwNjQ0CiAtLS0gYS9Tb3VyY2UvY21ha2Uv
V2ViS2l0Q29tcGlsZXJGbGFncy5jbWFrZQogKysrIGIvU291cmNlL2NtYWtlL1dlYktpdENvbXBp
bGVyRmxhZ3MuY21ha2UKIEBAIC00NTMsMyArNDUzLDEwIEBAIGVuZGlmICgpCkBAIC03MSw2ICs3
MiwzIEBAIGluZGV4IDliMmZlY2Y5YTBkMy4uN2NkYzJiNmFmYmUwIDEwMDY0NAogK2lmIChXRUJL
SVRfTk9fSU5MSU5FX0hJTlRTKQogKyAgICBhZGRfZGVmaW5pdGlvbnMoLURXRUJLSVRfTk9fSU5M
SU5FX0hJTlRTKQogK2VuZGlmICgpCi0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrLzAwMDEtRmluZEdPYmplY3RJbnRyb3NwZWN0aW9u
LmNtYWtlLXByZWZpeC12YXJpYWJsZXMtb2J0YS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zYXRvL3dl
YmtpdC93ZWJraXRndGsvMDAwMS1GaW5kR09iamVjdEludHJvc3BlY3Rpb24uY21ha2UtcHJlZml4
LXZhcmlhYmxlcy1vYnRhLnBhdGNoCmluZGV4IDhhZTM5ZjE0ZTEuLjFmYjE5Y2U4MjYgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvMDAwMS1GaW5kR09iamVj
dEludHJvc3BlY3Rpb24uY21ha2UtcHJlZml4LXZhcmlhYmxlcy1vYnRhLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvMDAwMS1GaW5kR09iamVjdEludHJvc3Bl
Y3Rpb24uY21ha2UtcHJlZml4LXZhcmlhYmxlcy1vYnRhLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSAxMGNmZGNjOTA1OTE1ZDg4MTRjNjA5MDA4YTA2OTEwMmYyYmM3ZTM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSA1MGM5NzRiYzg1MWU4NGU3ZmJlYWFlYzAyMjMyNTE0ZTgxYTAz
MGYwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDI3IE9jdCAyMDE1IDE2OjAyOjE5ICsw
MjAwCiBTdWJqZWN0OiBbUEFUQ0hdIEZpbmRHT2JqZWN0SW50cm9zcGVjdGlvbi5jbWFrZTogcHJl
Zml4IHZhcmlhYmxlcyBvYnRhaW5lZApAQCAtOSwxMiArOSwxMyBAQCByZWFzb25zIHdoeSB0aGlz
IGlzIG5vdCBhcHByb3Byb2lhdGUgZm9yIHVwc3RyZWFtIHN1Ym1pc3Npb24uCiAKIFVwc3RyZWFt
LVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgorCiAtLS0KICBTb3Vy
Y2UvY21ha2UvRmluZEdJLmNtYWtlIHwgMyArKysKICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCiAKIGRpZmYgLS1naXQgYS9Tb3VyY2UvY21ha2UvRmluZEdJLmNtYWtlIGIvU291cmNl
L2NtYWtlL0ZpbmRHSS5jbWFrZQotaW5kZXggYWYwMzljYmIuLmIzZTgxMGNkIDEwMDY0NAoraW5k
ZXggZmRjNTZiMjEuLmQ0MmVjYTUyIDEwMDY0NAogLS0tIGEvU291cmNlL2NtYWtlL0ZpbmRHSS5j
bWFrZQogKysrIGIvU291cmNlL2NtYWtlL0ZpbmRHSS5jbWFrZQogQEAgLTcyLDYgKzcyLDkgQEAg
aWYgKFBLR19DT05GSUdfRk9VTkQpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJr
aXQvd2Via2l0Z3RrLzBkMzM0NGUxN2QyNTgxMDY2MTdiMGU2ZDc4M2QwNzNiMTg4YTI1NDgucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrLzBkMzM0NGUxN2QyNTgxMDY2
MTdiMGU2ZDc4M2QwNzNiMTg4YTI1NDgucGF0Y2gKaW5kZXggZTVlY2U4MmVkMy4uMjYxN2VkOWJh
YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay8wZDMzNDRl
MTdkMjU4MTA2NjE3YjBlNmQ3ODNkMDczYjE4OGEyNTQ4LnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1zYXRvL3dlYmtpdC93ZWJraXRndGsvMGQzMzQ0ZTE3ZDI1ODEwNjYxN2IwZTZkNzgzZDA3M2Ix
ODhhMjU0OC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTUzOTg5ODJmNGExMjAxNDdhOThh
MjdlMTc2ZmFjZjZkOTViMmJmNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjZkMWQ5
NjlmOGRmYWYwZjdmNzBlMDFmN2UzY2E2MzEzYTBhN2E3NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPgogRGF0
ZTogVGh1LCAyIEp1biAyMDIyIDExOjE5OjA2ICswMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIEZFTGln
aHRuaW5nTkVPTi5jcHAgZmFpbHMgdG8gYnVpbGQsIE5FT04gZmFzdCBwYXRoIHNlZW1zCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL3JlcHJvZHVjaWJpbGl0
eS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvcmVwcm9kdWNpYmls
aXR5LnBhdGNoCmluZGV4IGU4NjZhMWExOTMuLmQxMDI2MGMxODUgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvcmVwcm9kdWNpYmlsaXR5LnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvcmVwcm9kdWNpYmlsaXR5LnBhdGNo
CkBAIC0xLDMgKzEsOCBAQAorRnJvbSA1ZmM0NTRmZTFkM2IwNGRiMzI5NDc5Y2Q4NDkwYjg2NThl
MjVmOTkwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUmljaGFyZCBQdXJkaWUgPHJp
Y2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CitEYXRlOiBNb24sIDMgSmFuIDIwMjIg
MTQ6MTg6MzQgKzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0gd2Via2l0Z3RrOiBBZGQgcmVwcm9kdWNp
YmlsaXR5IGZpeAorCiBJbmplY3Rpb24gYSB5ZWFyIGJhc2VkIG9uIHRoZSBjdXJyZW50IGRhdGUg
aXNuJ3QgcmVwcm9kdWNpYmxlLiBIYWNrIHRoaXMKIHRvIGEgc3BlY2lmaWMgeWVhciBmb3Igbm93
IGZvciByZXByb2R1Y2liaWx0eSBhbmQgdG8gYXZvaWQgYXV0b2J1aWxkZXIgZmFpbHVyZXMuCiAK
QEAgLTcsMTAgKzEyLDE0IEBAIHRoZW4gdGhpcyBjb3VsZCBiZSBzdWJtaXR0ZWQgdXBzdHJlYW0s
IHNhZGx5IG15IHJ1YnkgaXNuJ3QgdXAgdG8gdGhhdC4KIFVwc3RyZWFtLVN0YXR1czogUGVuZGlu
ZyBbY291bGQgYmUgcmV3b3JrZWRdCiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIAotSW5kZXg6IHdlYmtpdGd0ay0yLjM0
LjIvU291cmNlL0phdmFTY3JpcHRDb3JlL2dlbmVyYXRvci9HZW5lcmF0ZWRGaWxlLnJiCi09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09Ci0tLS0gd2Via2l0Z3RrLTIuMzQuMi5vcmlnL1NvdXJjZS9KYXZhU2NyaXB0Q29yZS9n
ZW5lcmF0b3IvR2VuZXJhdGVkRmlsZS5yYgotKysrIHdlYmtpdGd0ay0yLjM0LjIvU291cmNlL0ph
dmFTY3JpcHRDb3JlL2dlbmVyYXRvci9HZW5lcmF0ZWRGaWxlLnJiCistLS0KKyBTb3VyY2UvSmF2
YVNjcmlwdENvcmUvZ2VuZXJhdG9yL0dlbmVyYXRlZEZpbGUucmIgfCAyICstCisgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9Tb3Vy
Y2UvSmF2YVNjcmlwdENvcmUvZ2VuZXJhdG9yL0dlbmVyYXRlZEZpbGUucmIgYi9Tb3VyY2UvSmF2
YVNjcmlwdENvcmUvZ2VuZXJhdG9yL0dlbmVyYXRlZEZpbGUucmIKK2luZGV4IDZlZDJiNmU0Li44
NmEyODI4NiAxMDA2NDQKKy0tLSBhL1NvdXJjZS9KYXZhU2NyaXB0Q29yZS9nZW5lcmF0b3IvR2Vu
ZXJhdGVkRmlsZS5yYgorKysrIGIvU291cmNlL0phdmFTY3JpcHRDb3JlL2dlbmVyYXRvci9HZW5l
cmF0ZWRGaWxlLnJiCiBAQCAtMjUsNyArMjUsNyBAQCByZXF1aXJlICdkYXRlJwogIHJlcXVpcmUg
J2RpZ2VzdCcKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRn
dGtfMi40Mi4yLmJiIGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0a18yLjQyLjQu
YmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXNhdG8vd2Vi
a2l0L3dlYmtpdGd0a18yLjQyLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zYXRvL3dlYmtp
dC93ZWJraXRndGtfMi40Mi40LmJiCmluZGV4IDJiYTYwZWI2NWIuLjFmOTQ2NWIxYTMgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGtfMi40Mi4yLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGtfMi40Mi40LmJiCkBAIC0xNSw3ICsx
NSw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cud2Via2l0Z3RrLm9yZy9yZWxlYXNlcy8ke0JQ
Tn0tJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzBkMzM0NGUxN2QyNTgxMDY2MTdi
MGU2ZDc4M2QwNzNiMTg4YTI1NDgucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1DTWFr
ZS1BZGQtYS12YXJpYWJsZS10by1jb250cm9sLW1hY3JvLV9fUEFTX0FMV0FZU19JLnBhdGNoIFwK
ICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU3MjBhYTNlODYyN2YxYjlmNjMy
NTIxODdkNGRmMGY4MjMzYWU3MWQ2OTdiMTc5NmViZmJlNWNhNzUwYmQxMTgiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiNTIyODhiMzBiZGEyMjM3MzQ0MmNlY2I4NmY5YzlhNTY5YWQ4ZDQ3NjlhMWY5
N2IzNTIyOTBlZDkyYTY3ZWQ4NiIKIAogaW5oZXJpdCBjbWFrZSBwa2djb25maWcgZ29iamVjdC1p
bnRyb3NwZWN0aW9uIHBlcmxuYXRpdmUgZmVhdHVyZXNfY2hlY2sgdXBzdHJlYW0tdmVyc2lvbi1p
cy1ldmVuIGdpLWRvY2dlbgogCi0tIAoyLjQyLjAKCg==

--===============6445711069782094557==--

