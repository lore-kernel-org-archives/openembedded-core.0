Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57158C3DA5E
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:16 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.13464.1713248049454445094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QFkZ6VBc;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=bX1gIPvo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018ee58aa23b-312277d2-dcc9-48a8-9bec-6bc7d0041f87-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248052;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2EHOOu9DTz77Wdfm/WywLtqNTVPHx15YtMkQbJ2XyKE=;
	b=QFkZ6VBcahB2pj9K+N1m2yXjhPvDzaLaF6tm8YeseBn46xvBQ3TEs0KjNHPOzSeB
	Qy+pHnAjoVQwR8x5lutOPn3YfUhKM8dmpdcHTqUMtNDkPKRG38QaLwALFR56OnrAuca
	0lk4VPZnSGMGbpIn1n8f2jJoIisPgLqW6BOxFnQ0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248052;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2EHOOu9DTz77Wdfm/WywLtqNTVPHx15YtMkQbJ2XyKE=;
	b=bX1gIPvogJc7bAfDme2QjKJjgEtE49IW0nG3hlwfl7X29A2rOUAW9PI8Zv/bfQIp
	tnIKmOf2/0g1rUiLiwJRW3DduG6pWG2h1BuVFlhrrzp9naSvTg7kLi+PAWxbfp6XbNJ
	n3tx1UlytRXBbe3gq59rcL88ZQ3Aqq0k7R7mTEfU=
Content-Type: multipart/mixed; boundary="===============8081898252296089477=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] webkitgtk: upgrading to 2.44.1 SUCCEEDED
Message-ID: <0101018ee58aa23b-312277d2-dcc9-48a8-9bec-6bc7d0041f87-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198411

--===============8081898252296089477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *webkitgtk* to *2.44.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-webkitgtk-upgrade-2.44.0-2.44.1.patch
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
From 9fab79fb19a2d1d038b6014dea3f2a09d53e9091 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 03:53:35 +0000
Subject: [PATCH] webkitgtk: upgrade 2.44.0 -> 2.44.1

---
 ...able-to-control-macro-__PAS_ALWAYS_I.patch |  6 +--
 ...spection.cmake-prefix-variables-obta.patch |  2 +-
 ...af379dc70b4b1a63b01d67179eb431f03ac4.patch | 38 -------------------
 ...d5e22213fdaca2a29ec3400c927d710a37a8.patch |  2 +-
 .../webkit/webkitgtk/no-musttail-arm.patch    |  6 +--
 .../webkit/webkitgtk/reproducibility.patch    |  2 +-
 .../webkit/webkitgtk/t6-not-declared.patch    | 12 +++---
 ...ebkitgtk_2.44.0.bb => webkitgtk_2.44.1.bb} |  3 +-
 8 files changed, 15 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/2922af379dc70b4b1a63b01d67179eb431f03ac4.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.44.0.bb => webkitgtk_2.44.1.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
index a819e22127..0a2e9a87fa 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
@@ -1,4 +1,4 @@
-From 575b848a3b3c14280679db80d0d518922c83d62a Mon Sep 17 00:00:00 2001
+From 57b6571ee985c6f2446c50dac9f01a352e2b3b5d Mon Sep 17 00:00:00 2001
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
index 8e29ce17ed..88c4941caa 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From 6348f91c29e2350ad3fec5264aa57dd4994d4583 Mon Sep 17 00:00:00 2001
+From 8eeb1819867cb063e229d6fd0283c170790c4d8e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
diff --git a/meta/recipes-sato/webkit/webkitgtk/2922af379dc70b4b1a63b01d67179eb431f03ac4.patch b/meta/recipes-sato/webkit/webkitgtk/2922af379dc70b4b1a63b01d67179eb431f03ac4.patch
deleted file mode 100644
index 3067500447..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/2922af379dc70b4b1a63b01d67179eb431f03ac4.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 2922af379dc70b4b1a63b01d67179eb431f03ac4 Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@redhat.com>
-Date: Mon, 18 Mar 2024 11:14:54 -0700
-Subject: [PATCH] REGRESSION(274077@main): failure to build on i586 (and likely
- other 32bit arches): static assertion failed: Timer should stay small
- https://bugs.webkit.org/show_bug.cgi?id=271108
-
-Unreviewed build fix. This changes SameSizeOfTimer to ensure it matches
-the size of Timer on 32-bit platforms.
-
-* Source/WebCore/platform/Timer.cpp:
-
-Canonical link: https://commits.webkit.org/276282@main
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/2922af379dc70b4b1a63b01d67179eb431f03ac4]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- Source/WebCore/platform/Timer.cpp | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/Source/WebCore/platform/Timer.cpp b/Source/WebCore/platform/Timer.cpp
-index 4f7c0f5c39ca9..0f3734cca2474 100644
---- a/Source/WebCore/platform/Timer.cpp
-+++ b/Source/WebCore/platform/Timer.cpp
-@@ -263,7 +263,11 @@ struct SameSizeAsTimer {
- 
-     WeakPtr<TimerAlignment> timerAlignment;
-     double times[2];
--    void* pointers[3];
-+    void* pointers[2];
-+#if CPU(ADDRESS32)
-+    uint8_t bitfields;
-+#endif
-+    void* pointer;
- };
- 
- static_assert(sizeof(Timer) == sizeof(SameSizeAsTimer), "Timer should stay small");
diff --git a/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch b/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch
index 76bcb3df99..41b9aefc0f 100644
--- a/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch
@@ -1,4 +1,4 @@
-From 1523e00a2a76e285262c8aa3721b5d99f3f2d612 Mon Sep 17 00:00:00 2001
+From 95b182030cc13c2dc59341401774fadfa8b55f4e Mon Sep 17 00:00:00 2001
 From: Thomas Devoogdt <thomas.devoogdt@barco.com>
 Date: Mon, 16 Jan 2023 17:03:30 +0100
 Subject: [PATCH] REGRESSION(257865@main): B3Validate.cpp: fix
diff --git a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
index 8ce37a01cc..880e842044 100644
--- a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
@@ -1,4 +1,4 @@
-From a9c874f7418cefbe78f7cd26505ae495cb59bbcf Mon Sep 17 00:00:00 2001
+From b62a53e532bd68a2931d186ba9c8a623ec607a98 Mon Sep 17 00:00:00 2001
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
index 93a431a0b1..feb9bf9caa 100644
--- a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
@@ -1,4 +1,4 @@
-From d096b945113ddecaf33062296e20b6d5a007cab3 Mon Sep 17 00:00:00 2001
+From 32ce32fde613af86e7832758634064339a2ec8d6 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 3 Jan 2022 14:18:34 +0000
 Subject: [PATCH] webkitgtk: Add reproducibility fix
diff --git a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
index d4720e4f28..4ccf178c44 100644
--- a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
@@ -1,10 +1,9 @@
-From 3d5373575695b293b8559155431d0079a6153aff Mon Sep 17 00:00:00 2001
+From 6222ad41a12ebf3b48c74bf17eb1337fbffc9a4a Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.44.0.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
index 0819f6de0d..29e12bb8c5 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.44.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
@@ -16,9 +16,8 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://no-musttail-arm.patch \
            file://t6-not-declared.patch \
            file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
-           file://2922af379dc70b4b1a63b01d67179eb431f03ac4.patch \
            "
-SRC_URI[sha256sum] = "c66530e41ba59b1edba4ee89ef20b2188e273bed0497e95084729e3cfbe30c87"
+SRC_URI[sha256sum] = "425b1459b0f04d0600c78d1abb5e7edfa3c060a420f8b231e9a6a2d5d29c5561"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.42.0


--===============8081898252296089477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/webkitgtk (sysroot):
  /usr/lib/libjavascriptcoregtk-6.0.so.1 changed symlink target from libjavascriptcoregtk-6.0.so.1.2.4 to libjavascriptcoregtk-6.0.so.1.2.5
  /usr/lib/libwebkitgtk-6.0.so.4 changed symlink target from libwebkitgtk-6.0.so.4.5.4 to libwebkitgtk-6.0.so.4.5.5
  /usr/lib/libjavascriptcoregtk-6.0.so.1.2.4 moved to /usr/lib/libjavascriptcoregtk-6.0.so.1.2.5
  /usr/lib/libwebkitgtk-6.0.so.4.5.4 moved to /usr/lib/libwebkitgtk-6.0.so.4.5.5
packages/core2-64-poky-linux/webkitgtk/webkitgtk: FILELIST: removed "/usr/lib/libwebkitgtk-6.0.so.4.5.4 /usr/lib/libjavascriptcoregtk-6.0.so.1.2.4", added "/usr/lib/libwebkitgtk-6.0.so.4.5.5 /usr/lib/libjavascriptcoregtk-6.0.so.1.2.5"

--===============8081898252296089477==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-webkitgtk-upgrade-2.44.0-2.44.1.patch"

RnJvbSA5ZmFiNzlmYjE5YTJkMWQwMzhiNjAxNGRlYTNmMmEwOWQ1M2U5MDkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDM6NTM6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
ZWJraXRndGs6IHVwZ3JhZGUgMi40NC4wIC0+IDIuNDQuMQoKLS0tCiAuLi5hYmxlLXRvLWNvbnRy
b2wtbWFjcm8tX19QQVNfQUxXQVlTX0kucGF0Y2ggfCAgNiArLS0KIC4uLnNwZWN0aW9uLmNtYWtl
LXByZWZpeC12YXJpYWJsZXMtb2J0YS5wYXRjaCB8ICAyICstCiAuLi5hZjM3OWRjNzBiNGIxYTYz
YjAxZDY3MTc5ZWI0MzFmMDNhYzQucGF0Y2ggfCAzOCAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi5k
NWUyMjIxM2ZkYWNhMmEyOWVjMzQwMGM5MjdkNzEwYTM3YTgucGF0Y2ggfCAgMiArLQogLi4uL3dl
YmtpdC93ZWJraXRndGsvbm8tbXVzdHRhaWwtYXJtLnBhdGNoICAgIHwgIDYgKy0tCiAuLi4vd2Vi
a2l0L3dlYmtpdGd0ay9yZXByb2R1Y2liaWxpdHkucGF0Y2ggICAgfCAgMiArLQogLi4uL3dlYmtp
dC93ZWJraXRndGsvdDYtbm90LWRlY2xhcmVkLnBhdGNoICAgIHwgMTIgKysrLS0tCiAuLi5lYmtp
dGd0a18yLjQ0LjAuYmIgPT4gd2Via2l0Z3RrXzIuNDQuMS5iYn0gfCAgMyArLQogOCBmaWxlcyBj
aGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA1NiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBtZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrLzI5MjJhZjM3OWRjNzBiNGIx
YTYzYjAxZDY3MTc5ZWI0MzFmMDNhYzQucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc2F0by93
ZWJraXQve3dlYmtpdGd0a18yLjQ0LjAuYmIgPT4gd2Via2l0Z3RrXzIuNDQuMS5iYn0gKDk4JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrLzAwMDEtQ01h
a2UtQWRkLWEtdmFyaWFibGUtdG8tY29udHJvbC1tYWNyby1fX1BBU19BTFdBWVNfSS5wYXRjaCBi
L21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvMDAwMS1DTWFrZS1BZGQtYS12YXJp
YWJsZS10by1jb250cm9sLW1hY3JvLV9fUEFTX0FMV0FZU19JLnBhdGNoCmluZGV4IGE4MTllMjIx
MjcuLjBhMmU5YTg3ZmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJr
aXRndGsvMDAwMS1DTWFrZS1BZGQtYS12YXJpYWJsZS10by1jb250cm9sLW1hY3JvLV9fUEFTX0FM
V0FZU19JLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvMDAw
MS1DTWFrZS1BZGQtYS12YXJpYWJsZS10by1jb250cm9sLW1hY3JvLV9fUEFTX0FMV0FZU19JLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1NzViODQ4YTNiM2MxNDI4MDY3OWRiODBkMGQ1MTg5
MjJjODNkNjJhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1N2I2NTcxZWU5ODVjNmYy
NDQ2YzUwZGFjOWYwMWEzNTJlMmIzYjVkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
S2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+CiBEYXRlOiBGcmksIDExIEF1ZyAyMDIz
IDE0OjIwOjQ4ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBhIHZhcmlhYmxlIHRvIGNvbnRy
b2wgbWFjcm8KQEAgLTU3LDEwICs1NywxMCBAQCBpbmRleCA1ZDVmYjM4Yy4uYTU1NGY3MDAgMTAw
NjQ0CiAgI2Vsc2UKICAjZGVmaW5lIF9fUEFTX0FMV0FZU19JTkxJTkVfQlVUX05PVF9JTkxJTkUK
IGRpZmYgLS1naXQgYS9Tb3VyY2UvY21ha2UvV2ViS2l0Q29tcGlsZXJGbGFncy5jbWFrZSBiL1Nv
dXJjZS9jbWFrZS9XZWJLaXRDb21waWxlckZsYWdzLmNtYWtlCi1pbmRleCA5YjJmZWNmOS4uN2Nk
YzJiNmEgMTAwNjQ0CitpbmRleCAwNzMyNzg1ZS4uNDg3OWVjNDAgMTAwNjQ0CiAtLS0gYS9Tb3Vy
Y2UvY21ha2UvV2ViS2l0Q29tcGlsZXJGbGFncy5jbWFrZQogKysrIGIvU291cmNlL2NtYWtlL1dl
YktpdENvbXBpbGVyRmxhZ3MuY21ha2UKLUBAIC00NTMsMyArNDUzLDEwIEBAIGVuZGlmICgpCitA
QCAtNDUyLDMgKzQ1MiwxMCBAQCBlbmRpZiAoKQogIAogICMgRklYTUU6IEVuYWJsZSBwcmUtY29t
cGlsZWQgaGVhZGVycyBmb3IgYWxsIHBvcnRzIDxodHRwczovL3dlYmtpdC5vcmcvYi8xMzk0Mzg+
CiAgc2V0KENNQUtFX0RJU0FCTEVfUFJFQ09NUElMRV9IRUFERVJTIE9OKQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay8wMDAxLUZpbmRHT2JqZWN0SW50cm9z
cGVjdGlvbi5jbWFrZS1wcmVmaXgtdmFyaWFibGVzLW9idGEucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
c2F0by93ZWJraXQvd2Via2l0Z3RrLzAwMDEtRmluZEdPYmplY3RJbnRyb3NwZWN0aW9uLmNtYWtl
LXByZWZpeC12YXJpYWJsZXMtb2J0YS5wYXRjaAppbmRleCA4ZTI5Y2UxN2VkLi44OGM0OTQxY2Fh
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrLzAwMDEtRmlu
ZEdPYmplY3RJbnRyb3NwZWN0aW9uLmNtYWtlLXByZWZpeC12YXJpYWJsZXMtb2J0YS5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrLzAwMDEtRmluZEdPYmplY3RJ
bnRyb3NwZWN0aW9uLmNtYWtlLXByZWZpeC12YXJpYWJsZXMtb2J0YS5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gNjM0OGY5MWMyOWUyMzUwYWQzZmVjNTI2NGFhNTdkZDQ5OTRkNDU4MyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOGVlYjE4MTk4NjdjYjA2M2UyMjlkNmZkMDI4M2Mx
NzA3OTBjNGQ4ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5h
dmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVHVlLCAyNyBPY3QgMjAxNSAxNjow
MjoxOSArMDIwMAogU3ViamVjdDogW1BBVENIXSBGaW5kR09iamVjdEludHJvc3BlY3Rpb24uY21h
a2U6IHByZWZpeCB2YXJpYWJsZXMgb2J0YWluZWQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1z
YXRvL3dlYmtpdC93ZWJraXRndGsvMjkyMmFmMzc5ZGM3MGI0YjFhNjNiMDFkNjcxNzllYjQzMWYw
M2FjNC5wYXRjaCBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvMjkyMmFmMzc5
ZGM3MGI0YjFhNjNiMDFkNjcxNzllYjQzMWYwM2FjNC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMzA2NzUwMDQ0Ny4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtc2F0
by93ZWJraXQvd2Via2l0Z3RrLzI5MjJhZjM3OWRjNzBiNGIxYTYzYjAxZDY3MTc5ZWI0MzFmMDNh
YzQucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzOCArMCwwIEBACi1Gcm9tIDI5MjJhZjM3OWRj
NzBiNGIxYTYzYjAxZDY3MTc5ZWI0MzFmMDNhYzQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1G
cm9tOiBNaWNoYWVsIENhdGFuemFybyA8bWNhdGFuemFyb0ByZWRoYXQuY29tPgotRGF0ZTogTW9u
LCAxOCBNYXIgMjAyNCAxMToxNDo1NCAtMDcwMAotU3ViamVjdDogW1BBVENIXSBSRUdSRVNTSU9O
KDI3NDA3N0BtYWluKTogZmFpbHVyZSB0byBidWlsZCBvbiBpNTg2IChhbmQgbGlrZWx5Ci0gb3Ro
ZXIgMzJiaXQgYXJjaGVzKTogc3RhdGljIGFzc2VydGlvbiBmYWlsZWQ6IFRpbWVyIHNob3VsZCBz
dGF5IHNtYWxsCi0gaHR0cHM6Ly9idWdzLndlYmtpdC5vcmcvc2hvd19idWcuY2dpP2lkPTI3MTEw
OAotCi1VbnJldmlld2VkIGJ1aWxkIGZpeC4gVGhpcyBjaGFuZ2VzIFNhbWVTaXplT2ZUaW1lciB0
byBlbnN1cmUgaXQgbWF0Y2hlcwotdGhlIHNpemUgb2YgVGltZXIgb24gMzItYml0IHBsYXRmb3Jt
cy4KLQotKiBTb3VyY2UvV2ViQ29yZS9wbGF0Zm9ybS9UaW1lci5jcHA6Ci0KLUNhbm9uaWNhbCBs
aW5rOiBodHRwczovL2NvbW1pdHMud2Via2l0Lm9yZy8yNzYyODJAbWFpbgotCi1VcHN0cmVhbS1T
dGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGh1Yi5jb20vV2ViS2l0L1dlYktpdC9jb21taXQv
MjkyMmFmMzc5ZGM3MGI0YjFhNjNiMDFkNjcxNzllYjQzMWYwM2FjNF0KLQotU2lnbmVkLW9mZi1i
eTogTWFya3VzIFZvbGsgPGZfbF9rQHQtb25saW5lLmRlPgotLS0tCi0gU291cmNlL1dlYkNvcmUv
cGxhdGZvcm0vVGltZXIuY3BwIHwgNiArKysrKy0KLSAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1naXQgYS9Tb3VyY2UvV2ViQ29yZS9wbGF0
Zm9ybS9UaW1lci5jcHAgYi9Tb3VyY2UvV2ViQ29yZS9wbGF0Zm9ybS9UaW1lci5jcHAKLWluZGV4
IDRmN2MwZjVjMzljYTkuLjBmMzczNGNjYTI0NzQgMTAwNjQ0Ci0tLS0gYS9Tb3VyY2UvV2ViQ29y
ZS9wbGF0Zm9ybS9UaW1lci5jcHAKLSsrKyBiL1NvdXJjZS9XZWJDb3JlL3BsYXRmb3JtL1RpbWVy
LmNwcAotQEAgLTI2Myw3ICsyNjMsMTEgQEAgc3RydWN0IFNhbWVTaXplQXNUaW1lciB7Ci0gCi0g
ICAgIFdlYWtQdHI8VGltZXJBbGlnbm1lbnQ+IHRpbWVyQWxpZ25tZW50OwotICAgICBkb3VibGUg
dGltZXNbMl07Ci0tICAgIHZvaWQqIHBvaW50ZXJzWzNdOwotKyAgICB2b2lkKiBwb2ludGVyc1sy
XTsKLSsjaWYgQ1BVKEFERFJFU1MzMikKLSsgICAgdWludDhfdCBiaXRmaWVsZHM7Ci0rI2VuZGlm
Ci0rICAgIHZvaWQqIHBvaW50ZXI7Ci0gfTsKLSAKLSBzdGF0aWNfYXNzZXJ0KHNpemVvZihUaW1l
cikgPT0gc2l6ZW9mKFNhbWVTaXplQXNUaW1lciksICJUaW1lciBzaG91bGQgc3RheSBzbWFsbCIp
OwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay8zMGUxZDVl
MjIyMTNmZGFjYTJhMjllYzM0MDBjOTI3ZDcxMGEzN2E4LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXNh
dG8vd2Via2l0L3dlYmtpdGd0ay8zMGUxZDVlMjIyMTNmZGFjYTJhMjllYzM0MDBjOTI3ZDcxMGEz
N2E4LnBhdGNoCmluZGV4IDc2YmNiM2RmOTkuLjQxYjlhZWZjMGYgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvMzBlMWQ1ZTIyMjEzZmRhY2EyYTI5ZWMzNDAw
YzkyN2Q3MTBhMzdhOC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0
Z3RrLzMwZTFkNWUyMjIxM2ZkYWNhMmEyOWVjMzQwMGM5MjdkNzEwYTM3YTgucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDE1MjNlMDBhMmE3NmUyODUyNjJjOGFhMzcyMWI1ZDk5ZjNmMmQ2MTIg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDk1YjE4MjAzMGNjMTNjMmRjNTkzNDE0MDE3
NzRmYWRmYThiNTVmNGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBUaG9tYXMgRGV2
b29nZHQgPHRob21hcy5kZXZvb2dkdEBiYXJjby5jb20+CiBEYXRlOiBNb24sIDE2IEphbiAyMDIz
IDE3OjAzOjMwICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJFR1JFU1NJT04oMjU3ODY1QG1haW4p
OiBCM1ZhbGlkYXRlLmNwcDogZml4CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJr
aXQvd2Via2l0Z3RrL25vLW11c3R0YWlsLWFybS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zYXRvL3dl
YmtpdC93ZWJraXRndGsvbm8tbXVzdHRhaWwtYXJtLnBhdGNoCmluZGV4IDhjZTM3YTAxY2MuLjg4
MGU4NDIwNDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsv
bm8tbXVzdHRhaWwtYXJtLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJr
aXRndGsvbm8tbXVzdHRhaWwtYXJtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhOWM4NzRm
NzQxOGNlZmJlNzhmN2NkMjY1MDVhZTQ5NWNiNTliYmNmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBiNjJhNTNlNTMyYmQ2OGEyOTMxZDE4NmJhOWM4YTYyM2VjNjA3YTk4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERh
dGU6IEZyaSwgMTIgSmFuIDIwMjQgMDk6MjE6MzkgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gY2xh
bmcvYXJtOiBEbyBub3QgdXNlIE1VU1RfVEFJTF9DQUxMCkBAIC0xNiwxMCArMTYsMTAgQEAgU2ln
bmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL1NvdXJjZS9X
VEYvd3RmL0NvbXBpbGVyLmggYi9Tb3VyY2UvV1RGL3d0Zi9Db21waWxlci5oCi1pbmRleCAwZWE1
Y2I3Ni4uYzU0ODBkYmMgMTAwNjQ0CitpbmRleCA0NDljYTUwMi4uZGFhYzI5ZDcgMTAwNjQ0CiAt
LS0gYS9Tb3VyY2UvV1RGL3d0Zi9Db21waWxlci5oCiArKysgYi9Tb3VyY2UvV1RGL3d0Zi9Db21w
aWxlci5oCi1AQCAtMjg0LDcgKzI4NCw3IEBACitAQCAtMzIxLDcgKzMyMSw3IEBACiAgLyogTVVT
VF9UQUlMX0NBTEwgKi8KICAKICAjaWYgIWRlZmluZWQoTVVTVF9UQUlMX0NBTEwpICYmIGRlZmlu
ZWQoX19jcGx1c3BsdXMpICYmIGRlZmluZWQoX19oYXNfY3BwX2F0dHJpYnV0ZSkKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvcmVwcm9kdWNpYmlsaXR5LnBh
dGNoIGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay9yZXByb2R1Y2liaWxpdHku
cGF0Y2gKaW5kZXggOTNhNDMxYTBiMS4uZmViOWJmOWNhYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay9yZXByb2R1Y2liaWxpdHkucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay9yZXByb2R1Y2liaWxpdHkucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGQwOTZiOTQ1MTEzZGRlY2FmMzMwNjIyOTZlMjBiNmQ1YTAwN2Nh
YjMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDMyY2UzMmZkZTYxM2FmODZlNzgzMjc1
ODYzNDA2NDMzOWEyZWM4ZDYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJk
IFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IE1vbiwg
MyBKYW4gMjAyMiAxNDoxODozNCArMDAwMAogU3ViamVjdDogW1BBVENIXSB3ZWJraXRndGs6IEFk
ZCByZXByb2R1Y2liaWxpdHkgZml4CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJr
aXQvd2Via2l0Z3RrL3Q2LW5vdC1kZWNsYXJlZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1zYXRvL3dl
YmtpdC93ZWJraXRndGsvdDYtbm90LWRlY2xhcmVkLnBhdGNoCmluZGV4IGQ0NzIwZTRmMjguLjRj
Y2YxNzhjNDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsv
dDYtbm90LWRlY2xhcmVkLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJr
aXRndGsvdDYtbm90LWRlY2xhcmVkLnBhdGNoCkBAIC0xLDEwICsxLDkgQEAKLUZyb20gM2Q1Mzcz
NTc1Njk1YjI5M2I4NTU5MTU1NDMxZDAwNzlhNjE1M2FmZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gNjIyMmFkNDFhMTJlYmYzYjQ4Yzc0YmYxN2ViMTMzN2ZiZmZjOWE0YSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1pY2hhZWwgQ2F0YW56YXJvIDxtY2F0YW56YXJvQHJl
ZGhhdC5jb20+CiBEYXRlOiBNb24sIDUgRmViIDIwMjQgMTE6MDA6NDkgLTA2MDAKLVN1YmplY3Q6
IFtQQVRDSF0gPT9VVEYtOD9xP1tHVEtdPTIwWzIuNDIuNV09MjBMb3dMZXZlbEludGVycHJldGVy
LmNwcDozMzk6Pz0KLSA9P1VURi04P3E/MjE6PTIwZXJyb3I6PTIwPUUyPTgwPTk4dDY9RTI9ODA9
OTk9MjB3YXM9MjBub3Q9MjBkZWNsYXJlZD0yMGluPz0KLSA9P1VURi04P3E/PTIwdGhpcz0yMHNj
b3BlPTIwaHR0cHM6Ly9idWdzLndlYmtpdC5vcmcvc2hvdz01RmJ1Zy5jZ2k9M0ZpZD89Ci0gPT9V
VEYtOD9xPz0zRDI2ODczOT89CitTdWJqZWN0OiBbUEFUQ0hdID0/VVRGLTg/cT9Mb3dMZXZlbElu
dGVycHJldGVyLmNwcDozMzk6MjE6PTIwZXJyb3I6PTIwPz0KKyA9P1VURi04P3E/PUUyPTgwPTk4
dDY9RTI9ODA9OTk9MjB3YXM9MjBub3Q9MjBkZWNsYXJlZD0yMGluPTIwdGhpcz0yMHNjb3BlPz0K
KyA9P1VURi04P3E/PTIwaHR0cHM6Ly9idWdzLndlYmtpdC5vcmcvc2hvdz01RmJ1Zy5jZ2k9M0Zp
ZD0zRDI2ODczOT89CiBNSU1FLVZlcnNpb246IDEuMAogQ29udGVudC1UeXBlOiB0ZXh0L3BsYWlu
OyBjaGFyc2V0PVVURi04CiBDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CkBAIC0yMiw3
ICsyMSw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0
IGEvU291cmNlL0phdmFTY3JpcHRDb3JlL2xsaW50L0xvd0xldmVsSW50ZXJwcmV0ZXIuY3BwIGIv
U291cmNlL0phdmFTY3JpcHRDb3JlL2xsaW50L0xvd0xldmVsSW50ZXJwcmV0ZXIuY3BwCi1pbmRl
eCA1MDY0ZWFkNmNkMmU3Li45YTJlMjY1M2IxMjE5IDEwMDY0NAoraW5kZXggNzVjZWNiYmQuLmIx
MDIwZWE0IDEwMDY0NAogLS0tIGEvU291cmNlL0phdmFTY3JpcHRDb3JlL2xsaW50L0xvd0xldmVs
SW50ZXJwcmV0ZXIuY3BwCiArKysgYi9Tb3VyY2UvSmF2YVNjcmlwdENvcmUvbGxpbnQvTG93TGV2
ZWxJbnRlcnByZXRlci5jcHAKIEBAIC0zMzYsOCArMzM2LDYgQEAgSlNWYWx1ZSBDTG9vcDo6ZXhl
Y3V0ZShPcGNvZGVJRCBlbnRyeU9wY29kZUlELCB2b2lkKiBleGVjdXRhYmxlQWRkcmVzcywgVk0q
IHZtLApAQCAtMzQsNCArMzMsMyBAQCBpbmRleCA1MDY0ZWFkNmNkMmU3Li45YTJlMjY1M2IxMjE5
IDEwMDY0NAogIAogICAgICBzdHJ1Y3QgU3RhY2tQb2ludGVyU2NvcGUgewogICAgICAgICAgU3Rh
Y2tQb2ludGVyU2NvcGUoQ0xvb3BTdGFjayYgc3RhY2spCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGtfMi40NC4wLmJiIGIvbWV0YS9yZWNpcGVzLXNhdG8v
d2Via2l0L3dlYmtpdGd0a18yLjQ0LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0a18yLjQ0LjAuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGtfMi40NC4xLmJiCmluZGV4IDA4MTlm
NmRlMGQuLjI5ZTEyYmI4YzUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93
ZWJraXRndGtfMi40NC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRn
dGtfMi40NC4xLmJiCkBAIC0xNiw5ICsxNiw4IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cud2Vi
a2l0Z3RrLm9yZy9yZWxlYXNlcy8ke0JQTn0tJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmls
ZTovL25vLW11c3R0YWlsLWFybS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly90Ni1ub3QtZGVj
bGFyZWQucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMzBlMWQ1ZTIyMjEzZmRhY2EyYTI5ZWMz
NDAwYzkyN2Q3MTBhMzdhOC5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8yOTIyYWYzNzlkYzcw
YjRiMWE2M2IwMWQ2NzE3OWViNDMxZjAzYWM0LnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VS
SVtzaGEyNTZzdW1dID0gImM2NjUzMGU0MWJhNTliMWVkYmE0ZWU4OWVmMjBiMjE4OGUyNzNiZWQw
NDk3ZTk1MDg0NzI5ZTNjZmJlMzBjODciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDI1YjE0NTli
MGYwNGQwNjAwYzc4ZDFhYmI1ZTdlZGZhM2MwNjBhNDIwZjhiMjMxZTlhNmEyZDVkMjljNTU2MSIK
IAogaW5oZXJpdCBjbWFrZSBwa2djb25maWcgZ29iamVjdC1pbnRyb3NwZWN0aW9uIHBlcmxuYXRp
dmUgZmVhdHVyZXNfY2hlY2sgdXBzdHJlYW0tdmVyc2lvbi1pcy1ldmVuIGdpLWRvY2dlbgogCi0t
IAoyLjQyLjAKCg==

--===============8081898252296089477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/webkitgtk: SRC_URI changed from "https://www.webkitgtk.org/releases/webkitgtk-2.44.0.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://reproducibility.patch file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch file://no-musttail-arm.patch file://t6-not-declared.patch file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch file://2922af379dc70b4b1a63b01d67179eb431f03ac4.patch" to "https://www.webkitgtk.org/releases/webkitgtk-2.44.1.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://reproducibility.patch file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch file://no-musttail-arm.patch file://t6-not-declared.patch file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch"
packages/core2-64-poky-linux/webkitgtk: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk: PV changed from "2.44.0" to "2.44.1"
Changes to packages/core2-64-poky-linux/webkitgtk (sysroot):
  /usr/lib/libjavascriptcoregtk-6.0.so.1 changed symlink target from libjavascriptcoregtk-6.0.so.1.2.4 to libjavascriptcoregtk-6.0.so.1.2.5
  /usr/lib/libwebkitgtk-6.0.so.4 changed symlink target from libwebkitgtk-6.0.so.4.5.4 to libwebkitgtk-6.0.so.4.5.5
  /usr/lib/libjavascriptcoregtk-6.0.so.1.2.4 moved to /usr/lib/libjavascriptcoregtk-6.0.so.1.2.5
  /usr/lib/libwebkitgtk-6.0.so.4.5.4 moved to /usr/lib/libwebkitgtk-6.0.so.4.5.5
packages/core2-64-poky-linux/webkitgtk/webkitgtk-dbg: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-dbg: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-dbg: PKGSIZE changed from 788516680 to 788551768 (+0%)
packages/core2-64-poky-linux/webkitgtk/webkitgtk-dbg: FILELIST: removed "/usr/lib/.debug/libwebkitgtk-6.0.so.4.5.4 /usr/lib/.debug/libjavascriptcoregtk-6.0.so.1.2.4", added "/usr/lib/.debug/libjavascriptcoregtk-6.0.so.1.2.5 /usr/lib/.debug/libwebkitgtk-6.0.so.4.5.5"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-dev: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-dev: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-doc: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-doc: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ar: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ar: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-as: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-as: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-bg: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-bg: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ca: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ca: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-cs: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-cs: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-da: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-da: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-de: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-de: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-el: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-el: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-en-ca: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-en-ca: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-en-gb: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-en-gb: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-eo: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-eo: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-es: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-es: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-et: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-et: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-eu: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-eu: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-fi: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-fi: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-fr: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-fr: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-gl: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-gl: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-gu: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-gu: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-he: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-he: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-hi: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-hi: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-hr: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-hr: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-hu: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-hu: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-id: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-id: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-it: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-it: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ja: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ja: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ka: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ka: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-kn: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-kn: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ko: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ko: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-lt: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-lt: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-lv: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-lv: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ml: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ml: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-mr: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-mr: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-nb: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-nb: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-nl: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-nl: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-or: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-or: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pa: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pa: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pl: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pl: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pt-br: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pt-br: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pt: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-pt: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ro: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ro: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ru: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ru: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sl: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sl: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sr+latin: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sr+latin: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sr: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sr: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sv: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-sv: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ta: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-ta: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-te: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-te: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-tr: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-tr: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-uk: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-uk: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-vi: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-vi: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-zh-cn: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-locale-zh-cn: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-src: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-src: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk-src: PKGSIZE changed from 216869718 to 216880389 (+0%)
packages/core2-64-poky-linux/webkitgtk/webkitgtk-staticdev: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk-staticdev: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk: PKGV changed from 2.44.0 [default] to 2.44.1 [default]
packages/core2-64-poky-linux/webkitgtk/webkitgtk: PV changed from "2.44.0" to "2.44.1"
packages/core2-64-poky-linux/webkitgtk/webkitgtk: PKGSIZE changed from 104950714 to 104959034 (+0%)
packages/core2-64-poky-linux/webkitgtk/webkitgtk: FILELIST: removed "/usr/lib/libwebkitgtk-6.0.so.4.5.4 /usr/lib/libjavascriptcoregtk-6.0.so.1.2.4", added "/usr/lib/libwebkitgtk-6.0.so.4.5.5 /usr/lib/libjavascriptcoregtk-6.0.so.1.2.5"

--===============8081898252296089477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1879 targets, 46 skipped, 0 masked, 0 errors.
Removing 133 recipes from the core2-64 sysroot...done.
Removing 132 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-de6718a88831ab61c43a7ffdb3f574df1a0ce0d6"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:de6718a88831ab61c43a7ffdb3f574df1a0ce0d6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 996 Local 957 Mirrors 0 Missed 39 Current 381 (96% match, 97% complete)
Removing 7 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
Removing 2 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 390 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 393 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 406 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 410 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 411 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 422 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 423 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 424 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_create_spdx_setscene)
NOTE: Running setscene task 426 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 430 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 432 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 433 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 434 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_create_spdx_setscene)
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwpe-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk4-4.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk4-4.14.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsecret-0.21.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe enchant2-2.6.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 435 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libnotify-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 436 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe libsecret-0.21.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 437 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 438 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 439 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe enchant2-2.6.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 440 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe libwpe-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 441 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 442 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_packagedata_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 444 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 446 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe gtk4-4.14.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 448 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 450 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwpe-1.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe enchant2-2.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsecret-0.21.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 451 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 460 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: recipe libwpe-1.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 461 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libsecret-0.21.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk4-4.14.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 462 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 467 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 468 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_create_spdx_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe enchant2-2.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 476 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.15.bb:do_create_spdx_setscene)
NOTE: Running setscene task 477 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe gtk4-4.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 484 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 487 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 489 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.50.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 490 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 491 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 493 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 495 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 496 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 504 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_create_spdx_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 505 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 506 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.50.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 515 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 517 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 519 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 527 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 533 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 539 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-8.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 540 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.22.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_24.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 542 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe nghttp2-1.61.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 543 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 544 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_deb_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 547 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 548 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_rpm_setscene)
NOTE: recipe harfbuzz-8.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.61.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 549 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 553 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.22.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 554 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 556 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_24.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 561 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 564 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.61.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 568 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.61.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.61.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxslt-1.1.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 707 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.61.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 708 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 713 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 717 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 720 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.61.0.bb:do_recipe_qa_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/gtk4/4.14.1/temp/log.do_packagedata_setscene.2208714
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 721 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb:do_package_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.61.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nghttp2-1.61.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.12.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 729 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 743 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 752 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 754 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 1102 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1140 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_fetch)
NOTE: recipe gtk4-4.14.1-r0: task do_package_setscene: Started
NOTE: Running task 1142 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_fetch)
NOTE: Running task 1143 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_fetch)
NOTE: Running task 1145 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_fetch)
NOTE: Running task 1146 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_fetch)
NOTE: Running task 1157 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_fetch)
NOTE: Running task 1172 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_write_config)
NOTE: Running task 1173 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_write_config)
NOTE: Running task 1175 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_write_config)
NOTE: Running task 1176 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_write_config)
NOTE: recipe libwpe-1.14.2-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 756 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe enchant2-2.6.7-r0: task do_fetch: Started
NOTE: recipe libwpe-1.14.2-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_fetch: Started
NOTE: recipe libsecret-0.21.4-r0: task do_fetch: Started
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Started
NOTE: Running task 1261 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_unpack)
NOTE: recipe libnotify-0.8.3-r0: task do_fetch: Started
NOTE: recipe enchant2-2.6.7-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_fetch: Started
NOTE: Running task 1262 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_unpack)
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Started
NOTE: recipe libsecret-0.21.4-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.3-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_fetch: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1263 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_unpack)
NOTE: Running task 1264 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_unpack)
NOTE: Running task 1265 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_unpack)
NOTE: Running task 1266 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_unpack)
NOTE: recipe webkitgtk-2.44.1-r0: task do_fetch: Succeeded
NOTE: Running task 1267 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_unpack)
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_write_config: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_write_config: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_write_config: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe enchant2-2.6.7-r0: task do_unpack: Started
NOTE: recipe libwpe-1.14.2-r0: task do_unpack: Started
NOTE: recipe libnotify-0.8.3-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_unpack: Started
NOTE: recipe libsecret-0.21.4-r0: task do_unpack: Started
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_unpack: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 760 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libwpe-1.14.2-r0: task do_unpack: Succeeded
NOTE: Running task 1268 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_patch)
NOTE: recipe enchant2-2.6.7-r0: task do_unpack: Succeeded
NOTE: Running task 1269 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_unpack: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 1270 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_patch)
NOTE: recipe libsecret-0.21.4-r0: task do_unpack: Succeeded
NOTE: Running task 1271 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_patch)
NOTE: Running task 1272 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwpe-1.14.2-r0: task do_patch: Started
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe enchant2-2.6.7-r0: task do_patch: Started
NOTE: Running task 1273 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_patch: Started
NOTE: recipe libwpe-1.14.2-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_patch: Started
NOTE: Running task 1274 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_generate_toolchain_file)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_patch: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Started
NOTE: recipe libwpe-1.14.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe enchant2-2.6.7-r0: task do_patch: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.14.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gtk4-4.14.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 764 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 768 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 769 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 770 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 771 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 772 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 774 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 776 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.11.bb:do_populate_sysroot_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.11-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 780 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_packagedata_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 787 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 793 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 795 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_recipe_qa_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 801 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.50.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.50.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gi-docgen-2023.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.50.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe at-spi2-core-2.50.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 807 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 809 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 811 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_packagedata_setscene)
NOTE: Running setscene task 812 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 813 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: Running setscene task 814 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 815 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 816 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 817 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 818 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 820 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 821 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 822 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 823 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.50.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.72-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.72-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.50.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 824 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.11-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 826 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.57.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.57.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 830 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 833 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 834 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 838 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.72-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 842 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.57.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 843 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 844 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 845 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 847 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 848 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.72-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 851 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 853 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 855 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe webkitgtk-2.44.1-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 856 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 861 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 862 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.72-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 863 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libwebp/1.3.2/temp/log.do_packagedata_setscene.2211214
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 864 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_package_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 866 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 868 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 869 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_package_setscene: Started
NOTE: Running setscene task 871 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 873 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 874 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 875 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 876 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 877 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 880 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 881 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.57.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 882 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 883 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 884 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.52.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 886 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.57.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 888 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.75.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 889 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 891 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 894 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.52.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 896 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 898 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 900 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 902 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 904 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.57.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 905 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.52.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_package_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 907 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-8.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.57.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 908 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 911 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 913 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 914 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 915 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 916 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 918 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 922 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 923 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_packagedata_setscene)
NOTE: recipe pango-1.52.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 924 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 925 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 926 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 928 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.0.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.22.11-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 930 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_packagedata_setscene)
NOTE: Running setscene task 931 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 933 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 934 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb:do_packagedata_setscene)
NOTE: Running setscene task 935 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 937 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 939 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 940 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.52.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.33-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 942 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 945 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 947 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 948 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe pango-1.52.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 949 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-protocols-1.33-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 952 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 954 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_24.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 955 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-8.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libstd-rs-1.75.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 956 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 958 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 960 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 962 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 964 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 965 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 967 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.22.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 968 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 970 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 972 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_24.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 973 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 975 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 976 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 978 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 981 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 982 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_24.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 985 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 988 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 990 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 992 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 993 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 995 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 996 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.22.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 997 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 999 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.275.0.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1001 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1004 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1006 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1008 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1010 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1011 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1012 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1014 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1016 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1017 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.275.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1019 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1021 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1023 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1024 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1026 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.42.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1028 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1029 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1031 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1033 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1034 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1036 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.275.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1038 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.42-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1040 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1041 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1043 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1044 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1046 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1048 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1049 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1050 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1053 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1055 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.275.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1057 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1058 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1060 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 1061 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1063 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1065 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1066 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1067 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.7.1.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1068 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1070 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1071 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1073 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1075 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1076 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-1.22.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.7.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1077 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1078 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1080 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1081 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1084 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1086 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1088 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1090 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1091 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1092 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1093 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1095 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.42.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1098 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1099 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1101 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1102 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1104 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1106 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1108 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1109 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1110 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1112 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1115 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.15.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1116 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1119 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1120 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1121 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1123 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1124 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1125 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1126 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1128 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1129 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1132 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1133 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1135 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1137 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1138 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1139 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1141 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1142 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1143 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1144 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1148 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1149 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1151 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1153 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1154 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1157 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1159 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1161 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1162 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1164 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1166 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1168 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1169 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1170 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1175 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1176 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1178 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1180 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1183 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1185 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1194 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1195 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1196 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1198 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1200 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1821 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.12.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1202 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1203 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1204 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1206 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1208 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1210 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1211 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1212 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1214 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1215 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1931 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1936 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.12.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1217 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.12.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1219 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1220 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 2146 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2226 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_patch)
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1225 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.12.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1227 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 2241 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxml2-2.12.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_patch: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 2265 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1230 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1231 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1232 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1233 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 1234 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1236 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1237 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1238 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1239 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1240 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1241 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 1242 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1243 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2267 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1244 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1245 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libpcre2-10.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1246 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1248 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1249 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1252 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1253 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1255 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1257 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1259 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1260 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1263 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.43.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1266 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1269 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running task 2273 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1271 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1273 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2279 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_generate_toolchain_file)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2280 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_populate_lic)
NOTE: recipe libpcre2-10.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1277 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1278 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1280 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1282 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1284 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1286 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running task 2286 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe webkitgtk-2.44.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_populate_lic: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1288 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe webkitgtk-2.44.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe webkitgtk-2.44.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_deploy_source_date_epoch unihash changed to 96926f49de16efc13cdcf0bcb3b64197056dd025c0433d322ca6cc68d5f2cf3c
NOTE: recipe webkitgtk-2.44.1-r0: task do_populate_lic: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb:do_populate_lic unihash changed to 082fccd0025ddbeeb939740b8731b1ec7abf91d0ca2767da16036c90378e9d97
NOTE: Running setscene task 1282 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1283 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1284 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1285 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1287 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1289 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1290 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1291 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1300 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1301 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1302 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1303 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 2333 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1308 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1310 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1312 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1315 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1316 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1317 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1320 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3827d1886d21fc285ddcf2fcb9cb1cc58679b8245b5b8a3c52f01f2714d587ae
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash bff991256c90764c81a608a279def700bf5908501959058d57877ac3d86c6658 to hashserv.yocto.io:8686 ({'taskhash': 'db4ceed05eff0dcb4bbbf8d18d9bd8c21cdd4069d9ef40b2b9dc079404b2b6bf', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'bff991256c90764c81a608a279def700bf5908501959058d57877ac3d86c6658'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed db4ceed05eff0dcb4bbbf8d18d9bd8c21cdd4069d9ef40b2b9dc079404b2b6bf -> bff991256c90764c81a608a279def700bf5908501959058d57877ac3d86c6658 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1322 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1323 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1325 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1327 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1328 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1329 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1331 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1333 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1335 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1336 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1338 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1340 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1342 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1343 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1345 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1346 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1348 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1350 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1351 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1352 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1356 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1357 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1359 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1364 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1366 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1367 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1370 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1372 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1373 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1375 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1377 of 1377 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2828 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 3299 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3392 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_packagedata)
NOTE: Running task 3415 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3417 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3418 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3420 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwpe-1.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3567 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.6.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3608 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_collect_spdx_deps)
NOTE: recipe libsecret-0.21.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3610 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_collect_spdx_deps)
NOTE: recipe libnotify-0.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-3.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3611 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_collect_spdx_deps)
NOTE: Running task 3613 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_collect_spdx_deps)
NOTE: recipe libwpe-1.14.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe enchant2-2.6.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsecret-0.21.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnotify-0.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwpe-1.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwpe-1.14.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3624 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_configure)
NOTE: recipe enchant2-2.6.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe enchant2-2.6.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3625 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_configure)
NOTE: recipe libwpe-1.14.2-r0: task do_configure: Started
NOTE: recipe enchant2-2.6.7-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3626 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_configure)
NOTE: recipe libnotify-0.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3627 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_configure)
NOTE: recipe libsoup-3.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3628 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_configure)
NOTE: recipe libnotify-0.8.3-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.4-r0: task do_configure: Started
NOTE: recipe libsoup-3.4.4-r0: task do_configure: Started
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5009bfdce64be5968dd9927eeb08146bbc59582b45f2dbfd597d0d6515f565bd
NOTE: Running task 3669 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb:do_packagedata)
NOTE: recipe gtk4-4.14.1-r0: task do_packagedata: Started
NOTE: recipe libwpe-1.14.2-r0: task do_configure: Succeeded
NOTE: Running task 3679 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_compile)
NOTE: recipe libwpe-1.14.2-r0: task do_compile: Started
NOTE: recipe gtk4-4.14.1-r0: task do_packagedata: Succeeded
NOTE: recipe libwpe-1.14.2-r0: task do_compile: Succeeded
NOTE: Running task 3681 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_install)
NOTE: recipe libwpe-1.14.2-r0: task do_install: Started
NOTE: recipe libwpe-1.14.2-r0: task do_install: Succeeded
NOTE: Running task 3682 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_populate_sysroot)
NOTE: Running task 3683 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_package)
NOTE: recipe libwpe-1.14.2-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.14.2-r0: task do_package: Started
NOTE: recipe libwpe-1.14.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3684 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnotify-0.8.3-r0: task do_configure: Succeeded
NOTE: Running task 3685 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3686 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_configure)
NOTE: recipe libnotify-0.8.3-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_configure: Started
NOTE: recipe libsoup-3.4.4-r0: task do_configure: Succeeded
NOTE: Running task 3687 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_compile)
NOTE: recipe libsecret-0.21.4-r0: task do_configure: Succeeded
NOTE: Running task 3688 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_compile)
NOTE: recipe libsoup-3.4.4-r0: task do_compile: Started
NOTE: recipe libwpe-1.14.2-r0: task do_package: Succeeded
NOTE: Running task 3689 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_packagedata)
NOTE: recipe libsecret-0.21.4-r0: task do_compile: Started
NOTE: recipe libwpe-1.14.2-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_configure: Succeeded
NOTE: Running task 3690 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_compile: Succeeded
NOTE: Running task 3691 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_install)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_install: Started
NOTE: recipe libnotify-0.8.3-r0: task do_compile: Succeeded
NOTE: Running task 3692 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_install)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_install: Succeeded
NOTE: Running task 3693 of 3733 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_populate_sysroot)
NOTE: recipe libnotify-0.8.3-r0: task do_install: Started
NOTE: recipe libwpe-1.14.2-r0: task do_packagedata: Failed
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_install: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_compile: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_compile: Succeeded
NOTE: recipe enchant2-2.6.7-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 3693 tasks of which 3623 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240416035218.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240416035218.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_packagedata
Summary: There were 144 ERROR messages, returning a non-zero exit code.
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-src went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-dbg went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-staticdev went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-dev went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-doc went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ab went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-af went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-am went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-an went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ang went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ar went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-as went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ast went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-az went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-az-ir went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-be went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-be+latin went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-bg went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-bn went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-bn-in went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-br went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-bs went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ca went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ca+valencia went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-crh went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-cs went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-cy went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-da went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-de went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-dz went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-el went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-en went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-en+shaw went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-en-ca went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-en-gb went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-eo went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-es went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-et went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-eu went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-fa went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-fi went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-fr went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-fur went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ga went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-gd went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-gl went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-gu went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-he went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-hi went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-hr went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-hu went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-hy went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ia went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-id went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ie went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-io went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-is went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-it went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ja went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ka went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-kg went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-kk went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-km went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-kn went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ko went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ku went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ky went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-lg went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-li went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-lt went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-lv went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-mai went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-mi went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-mjw went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-mk went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ml went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-mn went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-mr went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ms went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-my went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-nb went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-nds went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ne went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-nl went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-nn went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-nso went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-oc went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-or went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-pa went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-pl went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ps went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-pt went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-pt-br went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ro went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ru went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-rw went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-si went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-sk went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-sl went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-sq went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-sr went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-sr+ije went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-sr+latin went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-sv went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ta went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-te went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-tg went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-th went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-tk went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-tr went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-tt went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ug went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-uk went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-ur went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-uz went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-uz+cyrillic went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-vi went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-wa went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-xh went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-yi went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-zh-cn went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-zh-hk went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-locale-zh-tw went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4 went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: QA Issue: Package version for package gtk4-printbackend-file went backwards which would break package feeds (from 0:4.14.2-r0 to 0:4.14.1-r0) [version-going-backwards]
ERROR: gtk4-4.14.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libwebp-1.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-src went backwards which would break package feeds (from 0:1.4.0-r0 to 0:1.3.2-r0) [version-going-backwards]
ERROR: libwebp-1.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-dbg went backwards which would break package feeds (from 0:1.4.0-r0 to 0:1.3.2-r0) [version-going-backwards]
ERROR: libwebp-1.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-gif2webp went backwards which would break package feeds (from 0:1.4.0-r0 to 0:1.3.2-r0) [version-going-backwards]
ERROR: libwebp-1.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-staticdev went backwards which would break package feeds (from 0:1.4.0-r0 to 0:1.3.2-r0) [version-going-backwards]
ERROR: libwebp-1.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-dev went backwards which would break package feeds (from 0:1.4.0-r0 to 0:1.3.2-r0) [version-going-backwards]
ERROR: libwebp-1.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-doc went backwards which would break package feeds (from 0:1.4.0-r0 to 0:1.3.2-r0) [version-going-backwards]
ERROR: libwebp-1.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-locale went backwards which would break package feeds (from 0:1.4.0-r0 to 0:1.3.2-r0) [version-going-backwards]
ERROR: libwebp-1.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp-bin went backwards which would break package feeds (from 0:1.4.0-r0 to 0:1.3.2-r0) [version-going-backwards]
ERROR: libwebp-1.3.2-r0 do_packagedata_setscene: QA Issue: Package version for package libwebp went backwards which would break package feeds (from 0:1.4.0-r0 to 0:1.3.2-r0) [version-going-backwards]
ERROR: libwebp-1.3.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: libwpe-1.14.2-r0 do_packagedata: QA Issue: Package version for package libwpe-src went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.14.2-r0) [version-going-backwards]
ERROR: libwpe-1.14.2-r0 do_packagedata: QA Issue: Package version for package libwpe-dbg went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.14.2-r0) [version-going-backwards]
ERROR: libwpe-1.14.2-r0 do_packagedata: QA Issue: Package version for package libwpe-staticdev went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.14.2-r0) [version-going-backwards]
ERROR: libwpe-1.14.2-r0 do_packagedata: QA Issue: Package version for package libwpe-dev went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.14.2-r0) [version-going-backwards]
ERROR: libwpe-1.14.2-r0 do_packagedata: QA Issue: Package version for package libwpe-doc went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.14.2-r0) [version-going-backwards]
ERROR: libwpe-1.14.2-r0 do_packagedata: QA Issue: Package version for package libwpe-locale went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.14.2-r0) [version-going-backwards]
ERROR: libwpe-1.14.2-r0 do_packagedata: QA Issue: Package version for package libwpe went backwards which would break package feeds (from 0:1.16.0-r0 to 0:1.14.2-r0) [version-going-backwards]
ERROR: libwpe-1.14.2-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libwpe/1.14.2/temp/log.do_packagedata.2220866
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_packagedata) failed with exit code '1'

--===============8081898252296089477==--

