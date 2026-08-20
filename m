Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767CCC5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 07:23:06 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1703.1787210582510553241
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 00:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GpuPRnCs;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=OPRHjPq0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a01e0d46b4-961f87bf-c946-40fa-80d5-c4662b6c8e72-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787210581;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=iplVOth/EOvX8+7nvmwDFTu0SAUd6LI9CGeChdF2HHk=;
	b=GpuPRnCs6DsbfFBWMukeUOyuFlv5AO2/00e2V9jvy3VGM+BnKj2uGvom19Lxpnme
	mthklgH37aOf5uIL+JqOnG/nMs4DKTioyuVFISqjM7+qlgsQhPR0jLOff7VRTR7oKIg
	cbTnlWANVxmJBWp+XK3GZXWgIo4wsQsZrvXyZK/M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787210581;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=iplVOth/EOvX8+7nvmwDFTu0SAUd6LI9CGeChdF2HHk=;
	b=OPRHjPq0YYi36mmm3J4C0+HPcniInLBL3VQZavlzOjWSqKLBDouB8IufiaEVYtw2
	/872/wRI3RwavygPDgbLuyKkAg5YU0UreQ/MdgS5hu8Ke7TPwLD5v4uQnNolVn+VLqQ
	Ux+6gY7HSespKQlBdCGUKu0kI0GThao3IT76IvJI=
Content-Type: multipart/mixed; boundary="===============8710570521830453440=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] webkitgtk: upgrading to 2.52.6 SUCCEEDED
Message-ID: <010101a01e0d46b4-961f87bf-c946-40fa-80d5-c4662b6c8e72-000000@us-west-2.amazonses.com>
Date: Thu, 20 Aug 2026 07:23:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.20-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 07:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243816

--===============8710570521830453440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *webkitgtk* to *2.52.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-webkitgtk-upgrade-2.52.5-2.52.6.patch
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
From d41039add7d1dc41d0c92f7dd8687cb9b4622dde Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 20 Aug 2026 07:22:54 +0000
Subject: [PATCH] webkitgtk: upgrade 2.52.5 -> 2.52.6

Source: Documentation/webkitgtk-6.0/migrating-to-webkitgtk-6.0.html, Documentation/webkitgtk-6.0/signal.BackForwardList.changed.html, Documentation/webkitgtk-6.0/signal.CookieManager.changed.html, Documentation/webkitgtk-6.0/signal.EditorState.changed.html, Documentation/webkitgtk-6.0/signal.FaviconDatabase.favicon-changed.html, Documentation/webkitgtk-6.0/signal.InputMethodContext.preedit-changed.html, Documentation/webkitgtk-6.0/signal.WebView.load-changed.html, Documentation/webkitgtk-6.0/signal.WebView.mouse-target-changed.html, Documentation/webkitgtk-6.0/vfunc.InputMethodContext.preedit_changed.html, Documentation/webkitgtk-6.0/vfunc.WebView.load_changed.html, Documentation/webkitgtk-6.0/vfunc.WebView.mouse_target_changed.html, Documentation/webkitgtk-web-process-extension-6.0/signal.WebEditor.selection-changed.html

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit &ndash; 6.0: Migrating WebKitGTK Applications to GTK 4</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />

  <meta property="og:type" content="website"/>

  <meta property="og:title" content="WebKit: Migrating WebKitGTK Applications to GTK 4"/>
  <meta property="og:description" content="Reference for WebKit-6.0: Migrating WebKitGTK Applications to GTK 4"/>
  <meta name="twitter:title" content="WebKit: Migrating WebKitGTK Applications to GTK 4"/>
  <meta name="twitter:description" content="Reference for WebKit-6.0: Migrating WebKitGTK Applications to GTK 4"/>

  <meta name="twitter:card" content="summary"/>

  <link rel="stylesheet" href="style.css" type="text/css" />

  <script src="gtk4-urlmap.js"></script>

  <script src="fzy.js"></script>
  <script src="search.js"></script>

  <script src="main.js"></script>

</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">

      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete" placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>

      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>

        <p>Library Version: 2.52.6</p>

      </div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-docgen</a> 2026.1</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-arrow"></span></button>

<section id="main" class="content">

  <h4 id="title" style="display:flex;">
    Migrating WebKitGTK Applications to GTK 4
    <a href="#title" class="anchor"></a>

  </h4>

  <section>
    <div class="docblock">
    <h1 id="migrating-webkitgtk-ap

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...1-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch | 2 +-
 ...1-FindGObjectIntrospection.cmake-prefix-variables-obta.patch | 2 +-
 ...1-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch | 2 +-
 meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch      | 2 +-
 meta/recipes-sato/webkit/webkitgtk/reproducibility.patch        | 2 +-
 meta/recipes-sato/webkit/webkitgtk/sys_futex.patch              | 2 +-
 meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch        | 2 +-
 .../webkit/{webkitgtk_2.52.5.bb => webkitgtk_2.52.6.bb}         | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.52.5.bb => webkitgtk_2.52.6.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
index 4680f7122a..3d8ef579a0 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
@@ -1,4 +1,4 @@
-From 7fb043d96ff7439ce6449a6579d6fe3f1309c04d Mon Sep 17 00:00:00 2001
+From 891c2de3ea6a3399d0144824c35b2dae0b7a246d Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Fri, 11 Aug 2023 14:20:48 +0800
 Subject: [PATCH] Add a variable to control macro
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index 7af5416733..f6449c29b0 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From 01b76242ff5a63c267faa58fbe64bb71038f6d6e Mon Sep 17 00:00:00 2001
+From 3cec4a230abbe5c2f78f8966c06b009be7504354 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch
index b9fc7253e5..334bf33fc1 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch
@@ -1,4 +1,4 @@
-From 0c8334d3b9b69f097546f5fb08310acced202e24 Mon Sep 17 00:00:00 2001
+From a6e91e04651dbd2d003dbaef0919284a8944184e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 21 Jun 2026 22:57:24 +0200
 Subject: [PATCH] Source/cmake/FindGLib.cmake: do not set include dirs from
diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
index c8c4c55f65..9d10603e0c 100644
--- a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
@@ -1,4 +1,4 @@
-From cbfb155a4a5682d350aac6a1b8ff924ccfde7604 Mon Sep 17 00:00:00 2001
+From a7e4c23c7f6faf76307ecad5f879e47b96ca66c9 Mon Sep 17 00:00:00 2001
 From: Alberto Garcia <berto@igalia.com>
 Date: Fri, 19 Dec 2025 10:10:41 +0000
 Subject: [PATCH] Use WTF_CPU_UNKNOWN when building for riscv64
diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
index 01682e277c..4a04b1393d 100644
--- a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
@@ -1,4 +1,4 @@
-From 8f8fda07abd3ecf03584caf1364d25ef0df06d27 Mon Sep 17 00:00:00 2001
+From 07ff0c87a0f584c7c6cc1cf723641707a16255f3 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 3 Jan 2022 14:18:34 +0000
 Subject: [PATCH] webkitgtk: Add reproducibility fix
diff --git a/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch b/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
index f1b76e5169..e9161ef037 100644
--- a/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
@@ -1,4 +1,4 @@
-From 01add097b3e79f84778f83f676e4d4cffdbde0e9 Mon Sep 17 00:00:00 2001
+From 4ca8868a69eaf046db523a0fde869bfd46d9878c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Dec 2024 20:24:22 -0800
 Subject: [PATCH] Fix build on newer 32bit architectures with only 64bit time_t
diff --git a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
index 9333b640a6..46431d78f8 100644
--- a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
@@ -1,4 +1,4 @@
-From d94e29f2f184b2d2a3503e248b2876deb0170281 Mon Sep 17 00:00:00 2001
+From c480a5dc8491d1422994007b149ee08f8d2cc9c5 Mon Sep 17 00:00:00 2001
 From: Michael Catanzaro <mcatanzaro@redhat.com>
 Date: Mon, 5 Feb 2024 11:00:49 -0600
 Subject: [PATCH] =?UTF-8?q?LowLevelInterpreter.cpp:339:21:=20error:=20?=
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.52.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.52.6.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.52.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.52.6.bb
index 945d7b77cb..cc7ccd55e8 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.52.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.52.6.bb
@@ -18,7 +18,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://fix-ftbfs-riscv64.patch \
            file://0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch \
            "
-SRC_URI[sha256sum] = "8a531a9abd2215936e8a8a914c077b586c0228b31d652f205286a8ec90f3364b"
+SRC_URI[sha256sum] = "179a2ea3f8f6edd4be7f31fdc55afc57bd0729f1fba648c61d4181539ac116fc"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.47.1


--===============8710570521830453440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/webkitgtk (sysroot):
  /usr/lib/libjavascriptcoregtk-6.0.so.1 changed symlink target from libjavascriptcoregtk-6.0.so.1.7.13 to libjavascriptcoregtk-6.0.so.1.7.14
  /usr/lib/libwebkitgtk-6.0.so.4 changed symlink target from libwebkitgtk-6.0.so.4.16.9 to libwebkitgtk-6.0.so.4.16.10
  /usr/lib/libjavascriptcoregtk-6.0.so.1.7.13 moved to /usr/lib/libjavascriptcoregtk-6.0.so.1.7.14
  /usr/lib/libwebkitgtk-6.0.so.4.16.10 was added
  /usr/lib/libwebkitgtk-6.0.so.4.16.9 was removed
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk: FILELIST: removed "/usr/lib/libwebkitgtk-6.0.so.4.16.9 /usr/lib/libjavascriptcoregtk-6.0.so.1.7.13", added "/usr/lib/libjavascriptcoregtk-6.0.so.1.7.14 /usr/lib/libwebkitgtk-6.0.so.4.16.10"

--===============8710570521830453440==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-webkitgtk-upgrade-2.52.5-2.52.6.patch"

RnJvbSBkNDEwMzlhZGQ3ZDFkYzQxZDBjOTJmN2RkODY4N2NiOWI0NjIyZGRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjAgQXVnIDIwMjYgMDc6MjI6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
ZWJraXRndGs6IHVwZ3JhZGUgMi41Mi41IC0+IDIuNTIuNgoKU291cmNlOiBEb2N1bWVudGF0aW9u
L3dlYmtpdGd0ay02LjAvbWlncmF0aW5nLXRvLXdlYmtpdGd0ay02LjAuaHRtbCwgRG9jdW1lbnRh
dGlvbi93ZWJraXRndGstNi4wL3NpZ25hbC5CYWNrRm9yd2FyZExpc3QuY2hhbmdlZC5odG1sLCBE
b2N1bWVudGF0aW9uL3dlYmtpdGd0ay02LjAvc2lnbmFsLkNvb2tpZU1hbmFnZXIuY2hhbmdlZC5o
dG1sLCBEb2N1bWVudGF0aW9uL3dlYmtpdGd0ay02LjAvc2lnbmFsLkVkaXRvclN0YXRlLmNoYW5n
ZWQuaHRtbCwgRG9jdW1lbnRhdGlvbi93ZWJraXRndGstNi4wL3NpZ25hbC5GYXZpY29uRGF0YWJh
c2UuZmF2aWNvbi1jaGFuZ2VkLmh0bWwsIERvY3VtZW50YXRpb24vd2Via2l0Z3RrLTYuMC9zaWdu
YWwuSW5wdXRNZXRob2RDb250ZXh0LnByZWVkaXQtY2hhbmdlZC5odG1sLCBEb2N1bWVudGF0aW9u
L3dlYmtpdGd0ay02LjAvc2lnbmFsLldlYlZpZXcubG9hZC1jaGFuZ2VkLmh0bWwsIERvY3VtZW50
YXRpb24vd2Via2l0Z3RrLTYuMC9zaWduYWwuV2ViVmlldy5tb3VzZS10YXJnZXQtY2hhbmdlZC5o
dG1sLCBEb2N1bWVudGF0aW9uL3dlYmtpdGd0ay02LjAvdmZ1bmMuSW5wdXRNZXRob2RDb250ZXh0
LnByZWVkaXRfY2hhbmdlZC5odG1sLCBEb2N1bWVudGF0aW9uL3dlYmtpdGd0ay02LjAvdmZ1bmMu
V2ViVmlldy5sb2FkX2NoYW5nZWQuaHRtbCwgRG9jdW1lbnRhdGlvbi93ZWJraXRndGstNi4wL3Zm
dW5jLldlYlZpZXcubW91c2VfdGFyZ2V0X2NoYW5nZWQuaHRtbCwgRG9jdW1lbnRhdGlvbi93ZWJr
aXRndGstd2ViLXByb2Nlc3MtZXh0ZW5zaW9uLTYuMC9zaWduYWwuV2ViRWRpdG9yLnNlbGVjdGlv
bi1jaGFuZ2VkLmh0bWwKCjwhLS0KU1BEWC1GaWxlQ29weXJpZ2h0VGV4dDogVGhlIFdlYktpdCBH
VEsgYW5kIFdQRSB0ZWFtcwoKU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRCwgTEdQTC0yLjEK
LS0+Cgo8IURPQ1RZUEUgaHRtbD4KPGh0bWwgbGFuZz0iZW4iPgo8aGVhZD4KICA8dGl0bGU+V2Vi
S2l0ICZuZGFzaDsgNi4wOiBNaWdyYXRpbmcgV2ViS2l0R1RLIEFwcGxpY2F0aW9ucyB0byBHVEsg
NDwvdGl0bGU+CiAgPG1ldGEgbmFtZT0idmlld3BvcnQiIGNvbnRlbnQ9IndpZHRoPWRldmljZS13
aWR0aCwgaW5pdGlhbC1zY2FsZT0xIj4KCiAgPG1ldGEgY2hhcnNldD0idXRmLTgiIC8+CgogIDxt
ZXRhIHByb3BlcnR5PSJvZzp0eXBlIiBjb250ZW50PSJ3ZWJzaXRlIi8+CgogIDxtZXRhIHByb3Bl
cnR5PSJvZzp0aXRsZSIgY29udGVudD0iV2ViS2l0OiBNaWdyYXRpbmcgV2ViS2l0R1RLIEFwcGxp
Y2F0aW9ucyB0byBHVEsgNCIvPgogIDxtZXRhIHByb3BlcnR5PSJvZzpkZXNjcmlwdGlvbiIgY29u
dGVudD0iUmVmZXJlbmNlIGZvciBXZWJLaXQtNi4wOiBNaWdyYXRpbmcgV2ViS2l0R1RLIEFwcGxp
Y2F0aW9ucyB0byBHVEsgNCIvPgogIDxtZXRhIG5hbWU9InR3aXR0ZXI6dGl0bGUiIGNvbnRlbnQ9
IldlYktpdDogTWlncmF0aW5nIFdlYktpdEdUSyBBcHBsaWNhdGlvbnMgdG8gR1RLIDQiLz4KICA8
bWV0YSBuYW1lPSJ0d2l0dGVyOmRlc2NyaXB0aW9uIiBjb250ZW50PSJSZWZlcmVuY2UgZm9yIFdl
YktpdC02LjA6IE1pZ3JhdGluZyBXZWJLaXRHVEsgQXBwbGljYXRpb25zIHRvIEdUSyA0Ii8+Cgog
IDxtZXRhIG5hbWU9InR3aXR0ZXI6Y2FyZCIgY29udGVudD0ic3VtbWFyeSIvPgoKICA8bGluayBy
ZWw9InN0eWxlc2hlZXQiIGhyZWY9InN0eWxlLmNzcyIgdHlwZT0idGV4dC9jc3MiIC8+CgogIDxz
Y3JpcHQgc3JjPSJndGs0LXVybG1hcC5qcyI+PC9zY3JpcHQ+CgogIDxzY3JpcHQgc3JjPSJmenku
anMiPjwvc2NyaXB0PgogIDxzY3JpcHQgc3JjPSJzZWFyY2guanMiPjwvc2NyaXB0PgoKICA8c2Ny
aXB0IHNyYz0ibWFpbi5qcyI+PC9zY3JpcHQ+Cgo8L2hlYWQ+Cgo8Ym9keT4KICA8ZGl2IGlkPSJi
b2R5LXdyYXBwZXIiIHRhYmluZGV4PSItMSI+CgogICAgPG5hdiBjbGFzcz0ic2lkZWJhciBkZXZo
ZWxwLWhpZGRlbiI+CgogICAgICA8ZGl2IGNsYXNzPSJzZWFyY2ggc2VjdGlvbiI+CiAgICAgICAg
PGZvcm0gaWQ9InNlYXJjaC1mb3JtIiBhdXRvY29tcGxldGU9Im9mZiI+CiAgICAgICAgICA8aW5w
dXQgaWQ9InNlYXJjaC1pbnB1dCIgdHlwZT0idGV4dCIgbmFtZT0iZG8tbm90LWF1dG9jb21wbGV0
ZSIgcGxhY2Vob2xkZXI9IkNsaWNrLCBvciBwcmVzcyAncycgdG8gc2VhcmNoIiBhdXRvY29tcGxl
dGU9Im9mZiIvPgogICAgICAgIDwvZm9ybT4KICAgICAgPC9kaXY+CgogICAgICA8ZGl2IGNsYXNz
PSJzZWN0aW9uIG5hbWVzcGFjZSI+CiAgICAgICAgPGgzPjxhIGhyZWY9ImluZGV4Lmh0bWwiPldl
YktpdDwvYT48L2gzPgogICAgICAgIDxwPkFQSSBWZXJzaW9uOiA2LjA8L3A+CgogICAgICAgIDxw
PkxpYnJhcnkgVmVyc2lvbjogMi41Mi42PC9wPgoKICAgICAgPC9kaXY+CgogICAgICA8ZGl2IGNs
YXNzPSJzZWN0aW9uIGdlbmVyYXRvciI+CiAgICAgICAgPHA+R2VuZXJhdGVkIGJ5IDxhIGhyZWY9
Imh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9naS1kb2NnZW4iPmdpLWRvY2dlbjwvYT4g
MjAyNi4xPC9wPgogICAgICA8L2Rpdj4KICAgIDwvbmF2PgoKICAgIDxidXR0b24gaWQ9ImJ0bi10
by10b3AiIGNsYXNzPSJoaWRkZW4iPjxzcGFuIGNsYXNzPSJ1cC1hcnJvdyI+PC9zcGFuPjwvYnV0
dG9uPgoKPHNlY3Rpb24gaWQ9Im1haW4iIGNsYXNzPSJjb250ZW50Ij4KCiAgPGg0IGlkPSJ0aXRs
ZSIgc3R5bGU9ImRpc3BsYXk6ZmxleDsiPgogICAgTWlncmF0aW5nIFdlYktpdEdUSyBBcHBsaWNh
dGlvbnMgdG8gR1RLIDQKICAgIDxhIGhyZWY9IiN0aXRsZSIgY2xhc3M9ImFuY2hvciI+PC9hPgoK
ICA8L2g0PgoKICA8c2VjdGlvbj4KICAgIDxkaXYgY2xhc3M9ImRvY2Jsb2NrIj4KICAgIDxoMSBp
ZD0ibWlncmF0aW5nLXdlYmtpdGd0ay1hcAoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhj
ZWVkcyAzMDAwIGNoYXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4g
YW4gYXR0YWNobWVudCB0byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLjEtQ01ha2UtQWRkLWEtdmFy
aWFibGUtdG8tY29udHJvbC1tYWNyby1fX1BBU19BTFdBWVNfSS5wYXRjaCB8IDIgKy0KIC4uLjEt
RmluZEdPYmplY3RJbnRyb3NwZWN0aW9uLmNtYWtlLXByZWZpeC12YXJpYWJsZXMtb2J0YS5wYXRj
aCB8IDIgKy0KIC4uLjEtU291cmNlLWNtYWtlLUZpbmRHTGliLmNtYWtlLWRvLW5vdC1zZXQtaW5j
bHVkZS1kaXJzLS5wYXRjaCB8IDIgKy0KIG1ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRn
dGsvZml4LWZ0YmZzLXJpc2N2NjQucGF0Y2ggICAgICB8IDIgKy0KIG1ldGEvcmVjaXBlcy1zYXRv
L3dlYmtpdC93ZWJraXRndGsvcmVwcm9kdWNpYmlsaXR5LnBhdGNoICAgICAgICB8IDIgKy0KIG1l
dGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvc3lzX2Z1dGV4LnBhdGNoICAgICAgICAg
ICAgICB8IDIgKy0KIG1ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvdDYtbm90LWRl
Y2xhcmVkLnBhdGNoICAgICAgICB8IDIgKy0KIC4uLi93ZWJraXQve3dlYmtpdGd0a18yLjUyLjUu
YmIgPT4gd2Via2l0Z3RrXzIuNTIuNi5iYn0gICAgICAgICB8IDIgKy0KIDggZmlsZXMgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1z
YXRvL3dlYmtpdC97d2Via2l0Z3RrXzIuNTIuNS5iYiA9PiB3ZWJraXRndGtfMi41Mi42LmJifSAo
OTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvMDAw
MS1DTWFrZS1BZGQtYS12YXJpYWJsZS10by1jb250cm9sLW1hY3JvLV9fUEFTX0FMV0FZU19JLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay8wMDAxLUNNYWtlLUFkZC1h
LXZhcmlhYmxlLXRvLWNvbnRyb2wtbWFjcm8tX19QQVNfQUxXQVlTX0kucGF0Y2gKaW5kZXggNDY4
MGY3MTIyYS4uM2Q4ZWY1NzlhMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0
L3dlYmtpdGd0ay8wMDAxLUNNYWtlLUFkZC1hLXZhcmlhYmxlLXRvLWNvbnRyb2wtbWFjcm8tX19Q
QVNfQUxXQVlTX0kucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0
ay8wMDAxLUNNYWtlLUFkZC1hLXZhcmlhYmxlLXRvLWNvbnRyb2wtbWFjcm8tX19QQVNfQUxXQVlT
X0kucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDdmYjA0M2Q5NmZmNzQzOWNlNjQ0OWE2NTc5
ZDZmZTNmMTMwOWMwNGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDg5MWMyZGUzZWE2
YTMzOTlkMDE0NDgyNGMzNWIyZGFlMGI3YTI0NmQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBLYWkgS2FuZyA8a2FpLmthbmdAd2luZHJpdmVyLmNvbT4KIERhdGU6IEZyaSwgMTEgQXVn
IDIwMjMgMTQ6MjA6NDggKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gQWRkIGEgdmFyaWFibGUgdG8g
Y29udHJvbCBtYWNybwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtp
dGd0ay8wMDAxLUZpbmRHT2JqZWN0SW50cm9zcGVjdGlvbi5jbWFrZS1wcmVmaXgtdmFyaWFibGVz
LW9idGEucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrLzAwMDEtRmlu
ZEdPYmplY3RJbnRyb3NwZWN0aW9uLmNtYWtlLXByZWZpeC12YXJpYWJsZXMtb2J0YS5wYXRjaApp
bmRleCA3YWY1NDE2NzMzLi5mNjQ0OWMyOWIwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc2F0
by93ZWJraXQvd2Via2l0Z3RrLzAwMDEtRmluZEdPYmplY3RJbnRyb3NwZWN0aW9uLmNtYWtlLXBy
ZWZpeC12YXJpYWJsZXMtb2J0YS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQv
d2Via2l0Z3RrLzAwMDEtRmluZEdPYmplY3RJbnRyb3NwZWN0aW9uLmNtYWtlLXByZWZpeC12YXJp
YWJsZXMtb2J0YS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDFiNzYyNDJmZjVhNjNjMjY3
ZmFhNThmYmU2NGJiNzEwMzhmNmQ2ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gM2Nl
YzRhMjMwYWJiZTVjMmY3OGY4OTY2YzA2YjAwOWJlNzUwNDM1NCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgog
RGF0ZTogVHVlLCAyNyBPY3QgMjAxNSAxNjowMjoxOSArMDIwMAogU3ViamVjdDogW1BBVENIXSBG
aW5kR09iamVjdEludHJvc3BlY3Rpb24uY21ha2U6IHByZWZpeCB2YXJpYWJsZXMgb2J0YWluZWQK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvMDAwMS1Tb3Vy
Y2UtY21ha2UtRmluZEdMaWIuY21ha2UtZG8tbm90LXNldC1pbmNsdWRlLWRpcnMtLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay8wMDAxLVNvdXJjZS1jbWFrZS1GaW5k
R0xpYi5jbWFrZS1kby1ub3Qtc2V0LWluY2x1ZGUtZGlycy0ucGF0Y2gKaW5kZXggYjlmYzcyNTNl
NS4uMzM0YmYzM2ZjMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtp
dGd0ay8wMDAxLVNvdXJjZS1jbWFrZS1GaW5kR0xpYi5jbWFrZS1kby1ub3Qtc2V0LWluY2x1ZGUt
ZGlycy0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay8wMDAx
LVNvdXJjZS1jbWFrZS1GaW5kR0xpYi5jbWFrZS1kby1ub3Qtc2V0LWluY2x1ZGUtZGlycy0ucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDBjODMzNGQzYjliNjlmMDk3NTQ2ZjVmYjA4MzEwYWNj
ZWQyMDJlMjQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGE2ZTkxZTA0NjUxZGJkMmQw
MDNkYmFlZjA5MTkyODRhODk0NDE4NGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogU3VuLCAyMSBKdW4g
MjAyNiAyMjo1NzoyNCArMDIwMAogU3ViamVjdDogW1BBVENIXSBTb3VyY2UvY21ha2UvRmluZEdM
aWIuY21ha2U6IGRvIG5vdCBzZXQgaW5jbHVkZSBkaXJzIGZyb20KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvZml4LWZ0YmZzLXJpc2N2NjQucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL2ZpeC1mdGJmcy1yaXNjdjY0LnBhdGNo
CmluZGV4IGM4YzRjNTVmNjUuLjlkMTA2MDNlMGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1z
YXRvL3dlYmtpdC93ZWJraXRndGsvZml4LWZ0YmZzLXJpc2N2NjQucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay9maXgtZnRiZnMtcmlzY3Y2NC5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gY2JmYjE1NWE0YTU2ODJkMzUwYWFjNmExYjhmZjkyNGNjZmRlNzYw
NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTdlNGMyM2M3ZjZmYWY3NjMwN2VjYWQ1
Zjg3OWU0N2I5NmNhNjZjOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsYmVydG8g
R2FyY2lhIDxiZXJ0b0BpZ2FsaWEuY29tPgogRGF0ZTogRnJpLCAxOSBEZWMgMjAyNSAxMDoxMDo0
MSArMDAwMAogU3ViamVjdDogW1BBVENIXSBVc2UgV1RGX0NQVV9VTktOT1dOIHdoZW4gYnVpbGRp
bmcgZm9yIHJpc2N2NjQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJr
aXRndGsvcmVwcm9kdWNpYmlsaXR5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dl
YmtpdGd0ay9yZXByb2R1Y2liaWxpdHkucGF0Y2gKaW5kZXggMDE2ODJlMjc3Yy4uNGEwNGIxMzkz
ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay9yZXByb2R1
Y2liaWxpdHkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay9y
ZXByb2R1Y2liaWxpdHkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDhmOGZkYTA3YWJkM2Vj
ZjAzNTg0Y2FmMTM2NGQyNWVmMGRmMDZkMjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDA3ZmYwYzg3YTBmNTg0YzdjNmNjMWNmNzIzNjQxNzA3YTE2MjU1ZjMgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3Vu
ZGF0aW9uLm9yZz4KIERhdGU6IE1vbiwgMyBKYW4gMjAyMiAxNDoxODozNCArMDAwMAogU3ViamVj
dDogW1BBVENIXSB3ZWJraXRndGs6IEFkZCByZXByb2R1Y2liaWxpdHkgZml4CmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL3N5c19mdXRleC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvc3lzX2Z1dGV4LnBhdGNoCmluZGV4IGYx
Yjc2ZTUxNjkuLmU5MTYxZWYwMzcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtp
dC93ZWJraXRndGsvc3lzX2Z1dGV4LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtp
dC93ZWJraXRndGsvc3lzX2Z1dGV4LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMWFkZDA5
N2IzZTc5Zjg0Nzc4ZjgzZjY3NmU0ZDRjZmZkYmRlMGU5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA0Y2E4ODY4YTY5ZWFmMDQ2ZGI1MjNhMGZkZTg2OWJmZDQ2ZDk4NzhjIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERh
dGU6IFdlZCwgMTggRGVjIDIwMjQgMjA6MjQ6MjIgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4
IGJ1aWxkIG9uIG5ld2VyIDMyYml0IGFyY2hpdGVjdHVyZXMgd2l0aCBvbmx5IDY0Yml0IHRpbWVf
dApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay90Ni1ub3Qt
ZGVjbGFyZWQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL3Q2LW5v
dC1kZWNsYXJlZC5wYXRjaAppbmRleCA5MzMzYjY0MGE2Li40NjQzMWQ3OGY4IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL3Q2LW5vdC1kZWNsYXJlZC5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL3Q2LW5vdC1kZWNsYXJl
ZC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDk0ZTI5ZjJmMTg0YjJkMmEzNTAzZTI0OGIy
ODc2ZGViMDE3MDI4MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzQ4MGE1ZGM4NDkx
ZDE0MjI5OTQwMDdiMTQ5ZWUwOGY4ZDJjYzljNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IE1pY2hhZWwgQ2F0YW56YXJvIDxtY2F0YW56YXJvQHJlZGhhdC5jb20+CiBEYXRlOiBNb24s
IDUgRmViIDIwMjQgMTE6MDA6NDkgLTA2MDAKIFN1YmplY3Q6IFtQQVRDSF0gPT9VVEYtOD9xP0xv
d0xldmVsSW50ZXJwcmV0ZXIuY3BwOjMzOToyMTo9MjBlcnJvcjo9MjA/PQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0a18yLjUyLjUuYmIgYi9tZXRhL3JlY2lw
ZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrXzIuNTIuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrXzIuNTIuNS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0a18yLjUyLjYuYmIKaW5k
ZXggOTQ1ZDdiNzdjYi4uY2M3Y2NkNTVlOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXNhdG8v
d2Via2l0L3dlYmtpdGd0a18yLjUyLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0
L3dlYmtpdGd0a18yLjUyLjYuYmIKQEAgLTE4LDcgKzE4LDcgQEAgU1JDX1VSSSA9ICJodHRwczov
L3d3dy53ZWJraXRndGsub3JnL3JlbGVhc2VzLyR7QlBOfS0ke1BWfS50YXIueHogXAogICAgICAg
ICAgICBmaWxlOi8vZml4LWZ0YmZzLXJpc2N2NjQucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8v
MDAwMS1Tb3VyY2UtY21ha2UtRmluZEdMaWIuY21ha2UtZG8tbm90LXNldC1pbmNsdWRlLWRpcnMt
LnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhhNTMxYTlhYmQy
MjE1OTM2ZThhOGE5MTRjMDc3YjU4NmMwMjI4YjMxZDY1MmYyMDUyODZhOGVjOTBmMzM2NGIiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiMTc5YTJlYTNmOGY2ZWRkNGJlN2YzMWZkYzU1YWZjNTdiZDA3
MjlmMWZiYTY0OGM2MWQ0MTgxNTM5YWMxMTZmYyIKIAogaW5oZXJpdCBjbWFrZSBwa2djb25maWcg
Z29iamVjdC1pbnRyb3NwZWN0aW9uIHBlcmxuYXRpdmUgZmVhdHVyZXNfY2hlY2sgdXBzdHJlYW0t
dmVyc2lvbi1pcy1ldmVuIGdpLWRvY2dlbgogCi0tIAoyLjQ3LjEKCg==

--===============8710570521830453440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/webkitgtk: SRC_URI changed from "https://www.webkitgtk.org/releases/webkitgtk-2.52.5.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://reproducibility.patch file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch file://t6-not-declared.patch file://sys_futex.patch file://fix-ftbfs-riscv64.patch file://0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch" to "https://www.webkitgtk.org/releases/webkitgtk-2.52.6.tar.xz file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch file://reproducibility.patch file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch file://t6-not-declared.patch file://sys_futex.patch file://fix-ftbfs-riscv64.patch file://0001-Source-cmake-FindGLib.cmake-do-not-set-include-dirs-.patch"
packages/x86-64-v3-poky-linux/webkitgtk: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
Changes to packages/x86-64-v3-poky-linux/webkitgtk (sysroot):
  /usr/lib/libjavascriptcoregtk-6.0.so.1 changed symlink target from libjavascriptcoregtk-6.0.so.1.7.13 to libjavascriptcoregtk-6.0.so.1.7.14
  /usr/lib/libwebkitgtk-6.0.so.4 changed symlink target from libwebkitgtk-6.0.so.4.16.9 to libwebkitgtk-6.0.so.4.16.10
  /usr/lib/libjavascriptcoregtk-6.0.so.1.7.13 moved to /usr/lib/libjavascriptcoregtk-6.0.so.1.7.14
  /usr/lib/libwebkitgtk-6.0.so.4.16.10 was added
  /usr/lib/libwebkitgtk-6.0.so.4.16.9 was removed
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-dbg: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-dbg: PKGSIZE changed from 1414940816 to 1415270192 (+0%)
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-dbg: FILELIST: removed "/usr/lib/.debug/libjavascriptcoregtk-6.0.so.1.7.13 /usr/lib/.debug/libwebkitgtk-6.0.so.4.16.9", added "/usr/lib/.debug/libwebkitgtk-6.0.so.4.16.10 /usr/lib/.debug/libjavascriptcoregtk-6.0.so.1.7.14"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-dbg: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-dev: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-dev: PKGSIZE changed from 2500153 to 2500272 (+0%)
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-dev: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-doc: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-doc: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-ar: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-ar: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-as: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-as: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-bg: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-bg: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-ca: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-ca: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-cs: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-cs: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-da: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-da: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-de: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-de: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-el: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-el: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-en-ca: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-en-ca: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-en-gb: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-en-gb: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-eo: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-eo: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-es: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-es: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-et: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-et: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-eu: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-eu: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-fi: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-fi: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-fr: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-fr: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-gl: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-gl: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-gu: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-gu: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-he: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-he: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-hi: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-hi: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-hr: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-hr: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-hu: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-hu: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-id: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-id: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-it: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-it: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-ja: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-ja: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-ka: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-ka: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-kk: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-kk: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-kn: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-kn: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-ko: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-ko: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-lt: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-lt: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-lv: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-lv: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-ml: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-ml: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-mr: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-mr: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-nb: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-nb: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-nl: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-nl: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-or: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-or: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-pa: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-pa: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-pl: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-pl: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-pt-br: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-pt-br: PKGSIZE changed from 37839 to 38865 (+3%)
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-pt-br: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-pt: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-pt: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-ro: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-ro: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-ru: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-ru: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-sl: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-sl: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-sr+latin: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-sr+latin: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-sr: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-sr: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-sv: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-sv: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-ta: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-ta: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-te: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-te: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-tr: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-tr: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-uk: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-uk: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-vi: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-vi: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-zh-cn: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-locale-zh-cn: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-src: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-src: PKGSIZE changed from 274370976 to 274416437 (+0%)
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-src: FILELIST: directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Shared/WebsiteData -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Shared/WebsiteData, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/wasm -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/wasm, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/css/typedom/transform -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/css/typedom/transform, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics/gstreamer/mse -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics/gstreamer/mse, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/MediaStream -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/MediaStream, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/compiler/translator/tree_ops/glsl/apple -> /usr/src/debug/webki
 tgtk/2.52.6/Source/ThirdParty/ANGLE/src/compiler/translator/tree_ops/glsl/apple, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/libANGLE/renderer/gl -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/libANGLE/renderer/gl, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/layout/integration/grid -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/layout/integration/grid, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/gpu_info_util -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/gpu_info_util, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/gtk -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/gtk, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/pdf -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/pdf, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Platform/IPC/unix -> /usr/src/debug/webkitgt
 k/2.52.6/Source/WebKit/Platform/IPC/unix, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/loader/soup -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/loader/soup, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/crypto/keys -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/crypto/keys, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/fileapi -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/fileapi, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics/texmap/coordinated -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics/texmap/coordinated, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/libANGLE/renderer/gl/egl -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/libANGLE/renderer/gl/egl, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/heap -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/heap, directory renamed /us
 r/src/debug/webkitgtk/2.52.5/Source/WebKit/Shared/unix -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Shared/unix, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/NetworkProcess/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/NetworkProcess/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/effects/colorfilters -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/effects/colorfilters, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/effects/imagefilters -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/effects/imagefilters, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Shared/soup -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Shared/soup, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/include/sksl -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/include/sksl, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdPart
 y/skia/include/gpu/ganesh/mock -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/include/gpu/ganesh/mock, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/NetworkProcess/soup -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/NetworkProcess/soup, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Shared/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Shared/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Shared/skia -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Shared/skia, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/NetworkProcess/Classifier -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/NetworkProcess/Classifier, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/webcodecs -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/webcodecs, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/disassembler/zydis -> /usr/src/debug/webkitgtk/2.52.6/Source/Ja
 vaScriptCore/disassembler/zydis, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/crypto/gcrypt -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/crypto/gcrypt, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/NetworkProcess/Cookies -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/NetworkProcess/Cookies, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics/egl -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics/egl, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/libsysprof-capture -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/libsysprof-capture, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/websockets -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/websockets, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/llint -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/llint, directory renamed /usr/src/debug/webkitgtk/2
 .52.5/Source/WebCore/layout/formattingContexts/inline/display -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/layout/formattingContexts/inline/display, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/Geolocation -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/Geolocation, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/Speech -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/Speech, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/skia -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/skia, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/text -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/text, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/css/values/color-adjust -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/css/values/color-adjust, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/sr
 c/shaders/gradients -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/shaders/gradients, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/ui -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/ui, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/svg/graphics -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/svg/graphics, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/NetworkProcess/EntryPoint/unix -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/NetworkProcess/EntryPoint/unix, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/include/gpu/ganesh -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/include/gpu/ganesh, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/API/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/API/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore -> /usr/src/debug/webkitgtk/2.52.6/S
 ource/JavaScriptCore, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Platform/IPC -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Platform/IPC, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/css/values/images -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/css/values/images, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/PAL/pal -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/PAL/pal, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/rendering/svg/legacy -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/rendering/svg/legacy, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebDriver/gtk -> /usr/src/debug/webkitgtk/2.52.6/Source/WebDriver/gtk, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/effects -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/effects, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/loader/cache -> /usr/src/debug/webkitgtk/2.5
 2.6/Source/WebCore/loader/cache, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WTF/wtf/text/unix -> /usr/src/debug/webkitgtk/2.52.6/Source/WTF/wtf/text/unix, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/layout/formattingContexts/inline/text -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/layout/formattingContexts/inline/text, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/bytecompiler -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/bytecompiler, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/include/private/base -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/include/private/base, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/API/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/API/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebDriver -> /usr/src/debug/webkitgtk/2.52.6/Source/WebDriver, directory renamed /usr/src/debug/webki
 tgtk/2.52.5/Source/ThirdParty/ANGLE/src/common/linux -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/common/linux, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/borders -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/borders, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics/angle -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics/angle, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/include/ports -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/include/ports, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/align -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/align, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/break -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/break, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/ima
 ge-decoders/png -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/image-decoders/png, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/include/codec -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/include/codec, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/page/scrolling -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/page/scrolling, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/color -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/color, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/page/skia -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/page/skia, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/pathops -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/pathops, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/fonts -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/fon
 ts, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/lists -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/lists, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/css/typedom -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/css/typedom, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/video-codecs -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/video-codecs, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Shared/Databases/IndexedDB -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Shared/Databases/IndexedDB, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/WebCoreSupport/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/WebCoreSupport/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/css -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/css, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ski
 a/include/effects -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/include/effects, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/css/values/primitives -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/css/values/primitives, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/mediastream -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/mediastream, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/css/values/color -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/css/values/color, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/layout/layouttree -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/layout/layouttree, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/scroll-snap -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/scroll-snap, directory renamed /usr/src/debug/webkitgtk/2.52.5/PAL/Headers/pal/system -> /usr/src/debug/webkitgtk/2.52.6/PAL/Headers/
 pal/system, directory renamed /usr/src/debug/webkitgtk/2.52.5/PAL/Headers/pal/text -> /usr/src/debug/webkitgtk/2.52.6/PAL/Headers/pal/text, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/Notifications -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/Notifications, directory renamed /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/threads -> /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/threads, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/GPU/graphics -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/GPU/graphics, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/PAL/pal/system/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/PAL/pal/system/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/WebStorage -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/WebStorage, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/API/cpp -> 
 /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/API/cpp, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/page/linux -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/page/linux, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/dom/messageports -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/dom/messageports, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/FileAPI -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/FileAPI, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics/texmap -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics/texmap, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/text -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/text, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/xml -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/xml, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/T
 hirdParty/skia/modules/skresources/include -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/modules/skresources/include, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/credentialmanagement -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/credentialmanagement, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/generic -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/generic, directory renamed /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/linux -> /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/linux, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/GPU/media -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/GPU/media, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics/harfbuzz -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics/harfbuzz, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Shared/Notifications ->
  /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Shared/Notifications, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/sksl/codegen -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/sksl/codegen, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/NetworkProcess/storage -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/NetworkProcess/storage, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/InjectedBundle -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/InjectedBundle, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/page/scrolling/coordinated -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/page/scrolling/coordinated, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/Cache -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/Cache, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/mediastream/gstreamer -> /usr/src/debug/webk
 itgtk/2.52.6/Source/WebCore/platform/mediastream/gstreamer, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics/iso -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics/iso, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/xdgmime/src -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/xdgmime/src, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/layout/formattingContexts/table -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/layout/formattingContexts/table, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/NetworkProcess/ServiceWorker -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/NetworkProcess/ServiceWorker, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/rendering/shapes -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/rendering/shapes, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/animations -> /usr/src/debug/webkitgtk/2.52.6/Sourc
 e/WebCore/style/values/animations, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/rendering/updating -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/rendering/updating, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WTF/wtf/fast_float -> /usr/src/debug/webkitgtk/2.52.6/Source/WTF/wtf/fast_float, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/highlight -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/highlight, directory renamed /usr/src/debug/webkitgtk/2.52.5/JavaScriptCore/DerivedSources/yarr -> /usr/src/debug/webkitgtk/2.52.6/JavaScriptCore/DerivedSources/yarr, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bridge/jsc -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bridge/jsc, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/image-
 decoders -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/image-decoders, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/modules/skshaper/include -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/modules/skshaper/include, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/InjectedBundle/API/c -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/InjectedBundle/API/c, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/indexeddb -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/indexeddb, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/webtransport -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/webtransport, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/network/soup -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/network/soup, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/will-
 change -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/will-change, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/common/third_party/xxhash -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/common/third_party/xxhash, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics/adwaita -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics/adwaita, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/text/enchant -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/text/enchant, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/b3 -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/b3, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/CoordinatedGraphics -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/CoordinatedGraphics, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WTF/wtf/posix -> /usr/src
 /debug/webkitgtk/2.52.6/Source/WTF/wtf/posix, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/css/values/easing -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/css/values/easing, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/svg/properties -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/svg/properties, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/soup -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/soup, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/history -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/history, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Shared/API -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Shared/API, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WTF/wtf/dtoa -> /usr/src/debug/webkitgtk/2.52.6/Source/WTF/wtf/dtoa, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/Storage -> /usr/src/debug/webkitgtk/2.52
 .6/Source/WebKit/WebProcess/Storage, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Shared/API/c/skia -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Shared/API/c/skia, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/Inspector/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/Inspector/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/compression -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/compression, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/notifications -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/notifications, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics/gbm -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics/gbm, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/compiler/translator/tree_ops -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/
 compiler/translator/tree_ops, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/forms -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/forms, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/mathml -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/mathml, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/gtk -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/gtk, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/include/private/gpu/ganesh -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/include/private/gpu/ganesh, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/scroll-animations -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/scroll-animations, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/gpu/ganesh/tessellate -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/gpu/ganesh/tessellate, directory
  renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/API/soup -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/API/soup, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/image-decoders/bmp -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/image-decoders/bmp, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/image-decoders/webp -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/image-decoders/webp, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/css/values/text-decoration -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/css/values/text-decoration, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/UserContent -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/UserContent, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/cache -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/cache, directory renamed /usr/src/debug/w
 ebkitgtk/2.52.5/Source/WebKit/WebProcess/InjectedBundle/API/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/InjectedBundle/API/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/box -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/box, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Platform/unix -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Platform/unix, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/include/docs -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/include/docs, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/Databases/IndexedDB -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/Databases/IndexedDB, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/include/GLSLANG -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/include/GLSLANG, directory renamed /usr/src/debug/webkitgtk/2.52.5/Sourc
 e/WebKit/WebProcess/InjectedBundle/API -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/InjectedBundle/API, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/include/pathops -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/include/pathops, directory renamed /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/dtoa -> /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/dtoa, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics/controls -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics/controls, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/grid -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/grid, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/cookie-store -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/cookie-store, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/mediacapabilities -> /usr/src/de
 bug/webkitgtk/2.52.6/Source/WebCore/platform/mediacapabilities, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/gpu/ganesh/geometry -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/gpu/ganesh/geometry, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/common -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/common, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/Automation -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/Automation, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/adwaita -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/adwaita, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/gpu/ganesh/surface -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/gpu/ganesh/surface, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/backgrounds -> /usr/src/debug/web
 kitgtk/2.52.6/Source/WebCore/style/values/backgrounds, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/parser -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/parser, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/webaudio -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/webaudio, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/mock -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/mock, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/color-adjust -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/color-adjust, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/computed -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/computed, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/We
 bProcess/WebCoreSupport -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/WebCoreSupport, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/libANGLE/capture -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/libANGLE/capture, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/inspector/remote -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/inspector/remote, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/transforms/functions -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/transforms/functions, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/gpu/ganesh/glsl -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/gpu/ganesh/glsl, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/css2 -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/css2, directory renamed /usr/src/debug/webkitgtk/2.52.5
 /Source/ThirdParty/skia/src/gpu/ganesh/gl/epoxy -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/gpu/ganesh/gl/epoxy, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/parser -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/parser, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/text -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/text, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/domjit -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/domjit, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/xdg -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/xdg, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/badge -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/badge, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/dom/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/dom/glib, direct
 ory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/mediasession -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/mediasession, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/screen-wake-lock -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/screen-wake-lock, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/modules/svg/include -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/modules/svg/include, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/css/values/motion -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/css/values/motion, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/NetworkProcess/Authentication -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/NetworkProcess/Authentication, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/model-element -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/model-element, directory renamed /us
 r/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/network -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/network, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/plugins -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/plugins, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/NetworkProcess/PrivateClickMeasurement -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/NetworkProcess/PrivateClickMeasurement, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/layout/integration/inline -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/layout/integration/inline, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Shared/gtk -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Shared/gtk, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics/filters/skia -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics/filters/skia, directory renamed /usr/src/debug/webkitgtk/2.5
 2.5/Source/WebCore/platform/image-decoders/gif -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/image-decoders/gif, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/GPU/graphics/Model -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/GPU/graphics/Model, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/GPUProcess -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/GPUProcess, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/css/values/borders -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/css/values/borders, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/css/calc -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/css/calc, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/common/base/anglebase/numerics -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/common/base/anglebase/numerics, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modu
 les/fetch -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/fetch, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/libANGLE/renderer -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/libANGLE/renderer, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/WebGPU -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/WebGPU, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/masking -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/masking, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Shared/Model -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Shared/Model, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/gpu/ganesh -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/gpu/ganesh, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/canvas -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/canvas
 , directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/WebPage -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/WebPage, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/gpu/tessellate -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/gpu/tessellate, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/codec -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/codec, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/images -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/images, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/shapes -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/shapes, directory renamed /usr/src/debug/webkitgtk/2.52.5/WebDriver/DerivedSources -> /usr/src/debug/webkitgtk/2.52.6/WebDriver/DerivedSources, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/loader -
 > /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/loader, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/yarr -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/yarr, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/flexbox -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/flexbox, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/compiler/translator/tree_ops/glsl -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/compiler/translator/tree_ops/glsl, directory renamed /usr/src/debug/webkitgtk/2.52.5/WebKitGTK/DerivedSources/webkit -> /usr/src/debug/webkitgtk/2.52.6/WebKitGTK/DerivedSources/webkit, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/model-element/dummy -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/model-element/dummy, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/scrollbars -> /usr/src/debug/web
 kitgtk/2.52.6/Source/WebCore/style/values/scrollbars, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/Plugins -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/Plugins, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/inline -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/inline, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/easing -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/easing, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/sizing -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/sizing, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/closewatcher -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/closewatcher, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/WebCoreSupport/soup -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/WebCoreSupport/s
 oup, directory renamed /usr/src/debug/webkitgtk/2.52.5/bmalloc/Headers/bmalloc -> /usr/src/debug/webkitgtk/2.52.6/bmalloc/Headers/bmalloc, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/Inspector/gtk -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/Inspector/gtk, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/NetworkProcess/webtransport -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/NetworkProcess/webtransport, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/Model -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/Model, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/audio -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/audio, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WTF/wtf/dragonbox -> /usr/src/debug/webkitgtk/2.52.6/Source/WTF/wtf/dragonbox, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/image-decoders/skia 
 -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/image-decoders/skia, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/GPU/media/gstreamer -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/GPU/media/gstreamer, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/include/private/chromium -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/include/private/chromium, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/WebCoreSupport/gtk -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/WebCoreSupport/gtk, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/layout/integration -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/layout/integration, directory renamed /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/simde/arm -> /usr/src/debug/web
 kitgtk/2.52.6/WTF/Headers/wtf/simde/arm, directory renamed /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/dragonbox/detail -> /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/dragonbox/detail, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/UserContent -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/UserContent, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/plugins -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/plugins, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/ShapeDetection/Interfaces -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/ShapeDetection/Interfaces, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/page -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/page, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/GPU/ShapeDetection -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/GPU/ShapeDetection, directory renamed /usr/src/deb
 ug/webkitgtk/2.52.5/Source/WebCore/style/values/transforms -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/transforms, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/MediaCache -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/MediaCache, directory renamed /usr/src/debug/webkitgtk/2.52.5/PAL/Headers/pal -> /usr/src/debug/webkitgtk/2.52.6/PAL/Headers/pal, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/dom -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/dom, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Shared -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Shared, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WTF/wtf/unicode -> /usr/src/debug/webkitgtk/2.52.6/Source/WTF/wtf/unicode, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/Media -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/Media, directory renamed /usr/src/debug/webkitgtk/2.52.5/Sourc
 e/WebCore/page/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/page/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/Automation/skia -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/Automation/skia, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/WebsiteData -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/WebsiteData, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/builtins -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/builtins, directory renamed /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/unicode/icu -> /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/unicode/icu, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/indexeddb/server -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/indexeddb/server, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/shadow -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/shad
 ow, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/computed/data -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/computed/data, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/css/typedom/numeric -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/css/typedom/numeric, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/base -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/base, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebDriver/soup -> /usr/src/debug/webkitgtk/2.52.6/Source/WebDriver/soup, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WTF/wtf/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WTF/wtf/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/layout/floats -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/layout/floats, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/WebPage/RemoteLayerTree -> /usr/src/debug/webkitgtk/2.52
 .6/Source/WebKit/WebProcess/WebPage/RemoteLayerTree, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/gpu/ganesh/gradients -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/gpu/ganesh/gradients, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/utils -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/utils, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/css/parser -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/css/parser, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/css/values -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/css/values, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/inspector/agents/page -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/inspector/agents/page, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/sksl/tracing -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/sksl/tracing, director
 y renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/loader/archive -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/loader/archive, directory renamed /usr/src/debug/webkitgtk/2.52.5/JavaScriptCore/Headers/JavaScriptCore -> /usr/src/debug/webkitgtk/2.52.6/JavaScriptCore/Headers/JavaScriptCore, directory renamed /usr/src/debug/webkitgtk/2.52.5/PAL/Headers/pal/crypto/tasn1 -> /usr/src/debug/webkitgtk/2.52.6/PAL/Headers/pal/crypto/tasn1, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/compiler/translator/null -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/compiler/translator/null, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/shaders -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/shaders, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/API/gtk -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/API/gtk, directory renamed /usr/src/debug/webkitgtk/2.52.5/Sourc
 e/WebCore/PAL/pal/text -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/PAL/pal/text, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/identity/protocols/ISO18013 -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/identity/protocols/ISO18013, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/encode -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/encode, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/animation -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/animation, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/API -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/API, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/web-locks -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/web-locks, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/filesystem -> /usr/src/debug/webkitgtk/2.52.6/S
 ource/WebCore/Modules/filesystem, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/audio/gstreamer -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/audio/gstreamer, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/layout/formattingContexts/block/tablewrapper -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/layout/formattingContexts/block/tablewrapper, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/b3/air -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/b3/air, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/mediacapabilities -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/mediacapabilities, directory renamed /usr/src/debug/webkitgtk/2.52.5/ANGLE/Headers/ANGLE -> /usr/src/debug/webkitgtk/2.52.6/ANGLE/Headers/ANGLE, directory renamed /usr/src/debug/webkitgtk/2.52.5/JavaScriptCore/DerivedSources/inspector -> /usr/src/debug/webkitgtk/2.52.6/JavaScriptCore/DerivedSource
 s/inspector, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/css/values/filter-effects -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/css/values/filter-effects, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/tools -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/tools, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/Downloads -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/Downloads, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/rendering/svg -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/rendering/svg, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/debugger -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/debugger, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/modules/skcms -> /u
 sr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/modules/skcms, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/async-clipboard -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/async-clipboard, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/editing -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/editing, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/animation -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/animation, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/css/query -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/css/query, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Platform/classifier -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Platform/classifier, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/Authentication -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/Authentication, directory renamed /usr/src/debug/webkitgtk/
 2.52.5/PAL/Headers/pal/crypto/gcrypt -> /usr/src/debug/webkitgtk/2.52.6/PAL/Headers/pal/crypto/gcrypt, directory renamed /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/text -> /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/text, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/layout/formattingContexts/block -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/layout/formattingContexts/block, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/push-api -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/push-api, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/page/text-extraction -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/page/text-extraction, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/reporting -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/reporting, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/include/gpu/ganesh/gl/epoxy -> /usr/src/debug/webkitg
 tk/2.52.6/Source/ThirdParty/skia/include/gpu/ganesh/gl/epoxy, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Shared/API/c -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Shared/API/c, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/Model/InternalAPI -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/Model/InternalAPI, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/modules/skresources/src -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/modules/skresources/src, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bridge -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bridge, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/position -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/position, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/permissions -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/permissions, d
 irectory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WTF/wtf/unix -> /usr/src/debug/webkitgtk/2.52.6/Source/WTF/wtf/unix, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/WebPage/gtk -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/WebPage/gtk, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/include/core -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/include/core, directory renamed /usr/src/debug/webkitgtk/2.52.5/JavaScriptCoreGLib/DerivedSources/jsc -> /usr/src/debug/webkitgtk/2.52.6/JavaScriptCoreGLib/DerivedSources/jsc, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/mediacontrols -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/mediacontrols, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/editing/atspi -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/editing/atspi, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/Launcher/glib 
 -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/Launcher/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics/filters/software -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics/filters/software, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/worklets -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/worklets, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/EntryPoint/unix -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/EntryPoint/unix, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/include/utils -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/include/utils, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/compiler/translator/tree_util -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/compiler/translator/tree_util, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProces
 s/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebDriver/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebDriver/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/rhythm -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/rhythm, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/Inspector/Agents -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/Inspector/Agents, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Shared/API/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Shared/API/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WTF/wtf/threads -> /usr/src/debug/webkitgtk/2.52.6/Source/WTF/wtf/threads, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/gpu/ganesh/gl -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/gpu/ganesh/gl, directory renamed /usr/s
 rc/debug/webkitgtk/2.52.5/Source/WebCore/rendering/style -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/rendering/style, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/rendering -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/rendering, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/modules/skcms/src -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/modules/skcms/src, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/NetworkProcess -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/NetworkProcess, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/InjectedBundle/DOM -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/InjectedBundle/DOM, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/GPU -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/GPU, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WTF/wtf/simdutf -> /usr/src/debug/webkitgtk/2.52.6/S
 ource/WTF/wtf/simdutf, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/API/C/gtk -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/API/C/gtk, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/PAL/pal/system -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/PAL/pal/system, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/Inspector -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/Inspector, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/non-standard -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/non-standard, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/text/gpu -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/text/gpu, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/Automation -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/Automation, directory renamed /usr/src/debug/webki
 tgtk/2.52.5/Source/bmalloc/bmalloc -> /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/bmalloc, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/wasm/debugger -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/wasm/debugger, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/inspector/remote/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/inspector/remote/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/gpu/ganesh/effects -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/gpu/ganesh/effects, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/modules/svg/src -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/modules/svg/src, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics/transforms -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics/transforms, directory renamed /usr/src/debug/webkitgtk/2.52.5/Sourc
 e/WebKit/Platform/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Platform/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/persistence -> /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/persistence, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/mediastream -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/mediastream, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/pointerevents -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/pointerevents, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/sfnt -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/sfnt, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/xml/parser -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/xml/parser, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Shared/Extensions -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Shared/Extensions, di
 rectory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/cairo -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/cairo, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/PAL/pal/crypto/gcrypt -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/PAL/pal/crypto/gcrypt, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/GPUProcess/graphics -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/GPUProcess/graphics, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WTF/wtf -> /usr/src/debug/webkitgtk/2.52.6/Source/WTF/wtf, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/WebPage/CoordinatedGraphics, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/gpu/ganesh/image -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/gpu/ganesh/image, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/
 WebCore/Modules/indexeddb/client -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/indexeddb/client, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebDriver/unix -> /usr/src/debug/webkitgtk/2.52.6/Source/WebDriver/unix, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/gpu/ganesh/ops -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/gpu/ganesh/ops, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/ShapeDetection -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/ShapeDetection, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/rendering/line -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/rendering/line, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WTF/wtf/linux -> /usr/src/debug/webkitgtk/2.52.6/Source/WTF/wtf/linux, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WTF/wtf/text -> /usr/src/debug/webkitgtk/2.52.6/Source/WTF/wtf/text, directory renamed /usr/src
 /debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/GPU/graphics/gbm -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/GPU/graphics/gbm, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/sksl -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/sksl, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/workers/shared -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/workers/shared, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/svg -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/svg, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/GPUProcess/ShapeDetection -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/GPUProcess/ShapeDetection, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/mediasource -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/mediasource, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html -> /usr/src/deb
 ug/webkitgtk/2.52.6/Source/WebCore/html, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/page -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/page, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/contain -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/contain, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/sksl/ir -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/sksl/ir, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/API/C/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/API/C/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/layout/formattingContexts -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/layout/formattingContexts, directory renamed /usr/src/debug
 /webkitgtk/2.52.5/Source/WebKit/WebProcess/GPU/webrtc -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/GPU/webrtc, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/layout/formattingContexts/inline -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/layout/formattingContexts/inline, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/indexeddb/shared -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/indexeddb/shared, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/math -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/math, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/InjectedBundle/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/InjectedBundle/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/inspector/agents/worker -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/inspector/agents/worker, directory renamed /usr/src/debu
 g/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/include/platform -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/include/platform, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/libANGLE -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/libANGLE, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/editing/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/editing/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WTF/wtf/text/icu -> /usr/src/debug/webkitgtk/2.52.6/Source/WTF/wtf/text/icu, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/svg -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/svg, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Shared/WebGPU -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Shared/WebGPU, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/xml -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/xml, directory 
 renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/motion -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/motion, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/layout/integration/flex -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/layout/integration/flex, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics/skia -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics/skia, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/bytecode -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/bytecode, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/anchor-position -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/anchor-position, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/WebPage/soup -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/WebPage/soup, directory renamed /usr/src/debug/webkitgt
 k/2.52.5/Source/WebCore/platform/image-decoders/jpeg -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/image-decoders/jpeg, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/workers/service/background-fetch -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/workers/service/background-fetch, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/primitives -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/primitives, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/compiler/translator -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/compiler/translator, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics/filters -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics/filters, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/speech -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/speech, directory re
 named /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/multicol -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/multicol, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/transitions -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/transitions, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/cssjit -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/cssjit, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/Inspector -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/Inspector, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/storage -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/storage, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/NetworkProcess/Downloads -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/NetworkProcess/Downloads, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Platform/IPC/glib -> 
 /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Platform/IPC/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/Inspector/gtk -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/Inspector/gtk, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/webdriver -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/webdriver, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/gpu/ganesh/mock -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/gpu/ganesh/mock, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/rendering/adwaita -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/rendering/adwaita, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/profiler -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/profiler, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/workers/service/server -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/workers/
 service/server, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/css/values/shapes -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/css/values/shapes, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Shared/RemoteLayerTree -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Shared/RemoteLayerTree, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/gpu/ganesh/text -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/gpu/ganesh/text, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WTF/wtf/simde/arm -> /usr/src/debug/webkitgtk/2.52.6/Source/WTF/wtf/simde/arm, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/layout -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/layout, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/fill-stroke -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/fill-stroke, directory renamed /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf
 /unicode -> /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/unicode, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Platform -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Platform, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/modules/skshaper/src -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/modules/skshaper/src, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/layout/formattingContexts/inline/invalidation -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/layout/formattingContexts/inline/invalidation, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/inspector -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/inspector, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/image_util -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/image_util, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/gtk -> /usr/src/debug/web
 kitgtk/2.52.6/Source/WebKit/WebProcess/gtk, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/sksl/analysis -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/sksl/analysis, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/domjit -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/domjit, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics/x11 -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics/x11, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/libGLESv2 -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/libGLESv2, directory renamed /usr/src/debug/webkitgtk/2.52.5/MiniBrowser/DerivedSources -> /usr/src/debug/webkitgtk/2.52.6/MiniBrowser/DerivedSources, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/opts -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/opts, directory renamed /usr/src/debug/webkitgtk/
 2.52.5/Source/WebCore/platform/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/interpreter -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/interpreter, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/common/base/anglebase -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/common/base/anglebase, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/wasm/js -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/wasm/js, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/runtime -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/runtime, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/calc -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/calc, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/NetworkProcess/Cookies/soup -> /usr/src/debug/webkitgtk/2.52.6
 /Source/WebKit/NetworkProcess/Cookies/soup, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/NetworkProcess/SharedWorker -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/NetworkProcess/SharedWorker, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/linux -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/linux, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/counter-styles -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/counter-styles, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/GPUProcess/graphics/Model -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/GPUProcess/graphics/Model, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics/gstreamer -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics/gstreamer, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/gpu/ganesh/gl/builders -> /usr/src/debug/webkitgtk
 /2.52.6/Source/ThirdParty/skia/src/gpu/ganesh/gl/builders, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/include/encode -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/include/encode, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/Launcher -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/Launcher, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/Network/webrtc -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/Network/webrtc, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/API -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/API, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/url-pattern -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/url-pattern, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/line-grid -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/line-grid, di
 rectory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/GPUProcess/media/gstreamer -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/GPUProcess/media/gstreamer, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/NetworkProcess/cache -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/NetworkProcess/cache, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/storage -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/storage, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/WebGPU/InternalAPI -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/WebGPU/InternalAPI, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WTF/wtf/unicode/icu -> /usr/src/debug/webkitgtk/2.52.6/Source/WTF/wtf/unicode/icu, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/accessibility/atspi -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/accessibility/atspi, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/uni
 x -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/unix, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/ports -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/ports, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics/opentype -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics/opentype, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WTF/wtf/persistence -> /usr/src/debug/webkitgtk/2.52.6/Source/WTF/wtf/persistence, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/ftl -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/ftl, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/lol -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/lol, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/layout/formattingContexts/flex -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/layout/formattingContexts/flex, directory rena
 med /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/layout/formattingContexts/grid -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/layout/formattingContexts/grid, directory renamed /usr/src/debug/webkitgtk/2.52.5/DerivedSources/WebKit -> /usr/src/debug/webkitgtk/2.52.6/DerivedSources/WebKit, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/gpu -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/gpu, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/viewport -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/viewport, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/dfg -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/dfg, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/workers -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/workers, directory renamed /usr/src/debug/webkitgtk/2.52.5/WebCore/DerivedSources -> /usr/src/debug/webkitgtk/2.52.6/WebCore/DerivedSo
 urces, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/WebsiteData/soup -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/WebsiteData/soup, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/entriesapi -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/entriesapi, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WTF/wtf/dragonbox/detail -> /usr/src/debug/webkitgtk/2.52.6/Source/WTF/wtf/dragonbox/detail, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/jit -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/jit, directory renamed /usr/src/debug/webkitgtk/2.52.5/Tools/MiniBrowser/gtk -> /usr/src/debug/webkitgtk/2.52.6/Tools/MiniBrowser/gtk, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/sql -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/sql, directory renamed /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/text/icu -> /usr/src/debug/webkitgtk/2.52.
 6/WTF/Headers/wtf/text/icu, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/inspector -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/inspector, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/image-decoders/ico -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/image-decoders/ico, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/compiler/preprocessor -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/compiler/preprocessor, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/css/values/grid -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/css/values/grid, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/beacon -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/beacon, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics, directory renamed /usr/src/de
 bug/webkitgtk/2.52.5/Source/WebKit/GPUProcess/media -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/GPUProcess/media, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Shared/graphics -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Shared/graphics, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/API/C -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/API/C, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/content -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/content, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/sksl/transform -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/sksl/transform, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/image -> /usr/src/debug/webkitgtk/2.52.
 6/Source/ThirdParty/skia/src/image, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/Network -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/Network, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/svg/graphics/filters -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/svg/graphics/filters, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/Automation/gtk -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/Automation/gtk, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/WebsiteData/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/WebsiteData/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/disassembler -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/disassembler, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/crypto/algorithms -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/crypto/algorithms, directory r
 enamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/inspector/agents -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/inspector/agents, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/include/platform/autogen -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/include/platform/autogen, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/crypto -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/crypto, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/GPUProcess/graphics/WebGPU -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/GPUProcess/graphics/WebGPU, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/webxr -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/webxr, directory renamed /usr/src/debug/webkitgtk/2.52.5/WebKit
 GTK/DerivedSources -> /usr/src/debug/webkitgtk/2.52.6/WebKitGTK/DerivedSources, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/geoclue -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/geoclue, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/soup -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/soup, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/workers/service -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/workers/service, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/audio/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/audio/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/mock/mediasource -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/mock/mediasource, directory renamed /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/dragonbox -> /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/dragonbox, directory ren
 amed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/network/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/network/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/src/core -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/src/core, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/streams -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/streams, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/WebPage/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/WebPage/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/Shared/linux -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/Shared/linux, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/compiler/translator/glsl -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/compiler/translator/glsl, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/W
 ebKit/UIProcess/Media -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/Media, directory renamed /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/glib -> /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/GPUProcess/EntryPoint/unix -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/GPUProcess/EntryPoint/unix, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/workers/shared/context -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/workers/shared/context, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/third_party/zlib/google -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/third_party/zlib/google, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/FullScreen -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/FullScreen, directory renamed /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/unix -> /usr/src/debug/webkitgtk/2.52.6/WTF/H
 eaders/wtf/unix, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/text-decoration -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/text-decoration, directory renamed /usr/src/debug/webkitgtk/2.52.5/PAL/Headers/pal/crypto -> /usr/src/debug/webkitgtk/2.52.6/PAL/Headers/pal/crypto, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/loader/icon -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/loader/icon, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics/displaylists -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics/displaylists, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/Notifications -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/Notifications, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/include/gpu/ganesh/gl -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/include/gpu/ganesh/gl, directory rename
 d /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/Databases -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/Databases, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/overflow -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/overflow, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/GPU/graphics/WebGPU -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/GPU/graphics/WebGPU, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/PAL/pal/crypto -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/PAL/pal/crypto, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/filter-effects -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/filter-effects, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/PAL/pal/crypto/tasn1 -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/PAL/pal/crypto/tasn1, directory renamed /usr/src/debug/webkitgtk/2.
 52.5/Source/WebCore/layout/formattingContexts/inline/ruby -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/layout/formattingContexts/inline/ruby, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/style/values/view-transitions -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/style/values/view-transitions, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/css/typedom/color -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/css/typedom/color, directory renamed /usr/src/debug/webkitgtk/2.52.5/JavaScriptCore/DerivedSources -> /usr/src/debug/webkitgtk/2.52.6/JavaScriptCore/DerivedSources, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/graphics/cairo -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/graphics/cairo, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/
 compiler/translator/tree_ops/msl -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/compiler/translator/tree_ops/msl, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/geolocation -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/geolocation, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/GPUProcess/glib -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/GPUProcess/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/crypto/parameters -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/crypto/parameters, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/page/csp -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/page/csp, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/loader/archive/mhtml -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/loader/archive/mhtml, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/ANGLE/src/common/base/anglebase/containers -> /usr/sr
 c/debug/webkitgtk/2.52.6/Source/ThirdParty/ANGLE/src/common/base/anglebase/containers, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/identity -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/identity, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/Network -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/Network, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/rendering/mathml -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/rendering/mathml, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WTF/wtf/generic -> /usr/src/debug/webkitgtk/2.52.6/Source/WTF/wtf/generic, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/speech -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/speech, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/ThirdParty/skia/include/gpu -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/include/gpu, directory renamed /usr/src
 /debug/webkitgtk/2.52.5/Source/ThirdParty/skia/include/private -> /usr/src/debug/webkitgtk/2.52.6/Source/ThirdParty/skia/include/private, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/accessibility -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/accessibility, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/contentextensions -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/contentextensions, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/webdatabase -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/webdatabase, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/contact-picker -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/contact-picker, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/svg/animation -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/svg/animation, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/UIProcess/Notifications/glib -> /usr/
 src/debug/webkitgtk/2.52.6/Source/WebKit/UIProcess/Notifications/glib, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/JavaScriptCore/assembler -> /usr/src/debug/webkitgtk/2.52.6/Source/JavaScriptCore/assembler, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/Modules/cookie-consent -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/Modules/cookie-consent, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/inspector/agents -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/inspector/agents, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebKit/WebProcess/GPU -> /usr/src/debug/webkitgtk/2.52.6/Source/WebKit/WebProcess/GPU, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/platform/gstreamer -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/platform/gstreamer, directory renamed /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/workers/service/context -> /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/workers/service/context, re
 moved "/usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_mutation_count.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/bmalloc_heap_inlines.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_large_expendable_memory.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_local_allocator_result.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSWorkerNavigatorCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_large_expendable_memory.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSNodeCustomInlines.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDocumentCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/GetPtr.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/ScriptWrappableInlines.h /usr/src/debug/webkitgtk/2.52.5/Sou
 rce/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Identified.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_allocation_callbacks.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_all_shared_page_directories.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SinglyLinkedList.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_allocation_callbacks.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSEventTargetCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Indenter.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_all_shared_page_directories.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/IndexMap.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/IndexSet.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/ScriptSourceCode.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/MainThreadDispatcher.h /usr/
 src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_scavenger.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_scavenger.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/StructuredClone.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_heap_summary.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SIMDHelpers.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compute_summary_object_callbacks.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/VariantExtras.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSCustomElementRegistryCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CallbackAggregator.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_heap_summary.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSSubscriberCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/UUID.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/p
 as_compute_summary_object_callbacks.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/RawHex.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/InlineWeakPtr.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/GraphNodeWorklist.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSMediaSessionCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertEnumeration.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_fd_stream.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_fd_stream.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_partial_view_inlines.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertBufferSource.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compact_heap_reservation.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/RefCountDebugger.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/WebCoreJSClientData.cpp /usr
 /src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/RobinHoodHashTable.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_simple_free_heap_helpers.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/WorkerScriptFetcher.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/WTFProcess.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/AutodrainedPool.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compact_heap_reservation.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/DOMGCOutputConstraint.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_simple_free_heap_helpers.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/InbandWebVTTTextTrack.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SmallMap.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSHTMLTemplateElementCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSShadowRealmGlobalScopeBase.cpp /usr/src/debug/webkitgtk/2.52
 .5/Source/bmalloc/libpas/src/libpas/pas_small_medium_bootstrap_heap_page_provider.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SmallSet.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_heap_table.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMBuiltinConstructorBase.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSWorkerGlobalScopeBase.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_heap_table.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compact_atomic_segregated_size_directory_ptr.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/BufferSource.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSMessageEventCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_small_medium_bootstrap_heap_page_provider.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/InternalReadableStreamDefaultReader.cpp /usr/src/debug/webkitgtk/2.5
 2.5/Source/WebCore/bindings/js/JSObservableArray.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/ExtendedDOMClientIsoSubspaces.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_page_sharing_pool.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSExecStateInstrumentation.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSCSSRuleListCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_aligned_allocation_result.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Bag.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_page_sharing_pool.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/FunctionPtr.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/GarbageCollectionController.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/InternalWritableStreamWriter.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_heap_lock.h /usr/src/debug/webkitgtk/2.52.5
 /Source/WebCore/bindings/js/WebAssemblyCachedScriptSourceProvider.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_red_black_tree.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_red_black_tree.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/WorkerModuleScriptLoader.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_heap_lock.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitvector.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/BackwardsGraph.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SHA1.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/DataCue.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/RefCountedAndCanMakeWeakPtr.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_small_medium_bootstrap_free_heap.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/DOMGCOutputConstraint.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindi
 ngs/js/JSDOMConvertDate.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/IDBBindingUtilities.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/NeverDestroyed.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertObject.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/RecursableLambda.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/OptionSetHash.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSWorkletGlobalScopeBase.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSCustomEventCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_shared_page_directory_by_size.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_get_heap.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_range.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ValueOrReference.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_shared_page_directory_by_size.h /usr/src/debug/we
 bkitgtk/2.52.5/WTF/Headers/wtf/HexNumber.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/WebVTTElement.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_page_base_config.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CompilationThread.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SpanningTree.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/NakedPtr.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/WebCoreBuiltinNames.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/WindowProxy.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_page_base_config.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSWebCodecsAudioDecoderCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSWebCodecsAudioEncoderCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_get_allocation_size.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/TrackBase.cpp /usr/sr
 c/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_designated_intrinsic_heap_inlines.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/WorkQueue.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_basic_heap_config_enumerator_data.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Language.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ListDump.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_basic_heap_config_enumerator_data.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Liveness.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_virtual_range_min_heap.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_large_sharing_pool.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/bmalloc_heap_config.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compact_segregated_shared_view_ptr.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertNull
 .h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSIntersectionObserverEntryCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/bmalloc_heap_config.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_large_sharing_pool.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compact_thread_local_cache_layout_node.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_try_allocate.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSReadableStreamSourceCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_baseline_allocator_table.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMMapLike.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/NumberOfCores.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/InternalReadableStreamDefaultReader.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_baseline_allocator_table.c /usr/sr
 c/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertCallbacks.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/WebVTTTokenizer.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/URLHash.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSEventTargetCustom.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_commit_mode.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_commit_span.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ASCIICType.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/TrailingArray.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMWindowBase.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_commit_span.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_thread_local_cache_layout_entry.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/WebCoreJSClientData.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pa
 s_enumerator_internal.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMAttribute.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_utility_heap_config.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_status_reporter.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_status_reporter.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_utility_heap_config.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_page_sharing_participant_kind.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfit_view_and_index.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SortedArrayMap.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/TinyLRUCache.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_ensure_heap_with_page_caches.c /usr/src/debug/webkitgtk/2.
 52.5/WTF/Headers/wtf/EnumSet.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/JSONValues.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_immortal_heap.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/jit_heap_config.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/InternalWritableStreamWriter.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMGlobalObject.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_ensure_heap_with_page_caches.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/RunLoop.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/ExceptionDetails.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertRecord.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/jit_heap_config.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_immortal_heap.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CompactUniquePtrTuple.h /usr/src/d
 ebug/webkitgtk/2.52.5/WTF/Headers/wtf/Locker.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/CachedScriptSourceProvider.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/GenericHashKey.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMBindingSecurity.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/UniqueRef.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertDictionary.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSNodeCustom.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/ScriptCachedFrameData.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_shared_handle_or_page_boundary.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ContinuousApproximateTime.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConstructorWithDocument.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_size_directory_inlines.h /usr/src/debug/webkitgtk/2.52.5/Source/
 bmalloc/libpas/src/libpas/pas_heap_inlines.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ThreadSafeWeakHashSet.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_full_alloc_bits_inlines.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/UnionFind.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/RefPtr.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_megapage_cache.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_virtual_range.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/ScriptController.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_malloc_stack_logging.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_megapage_cache.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ZippedRange.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/LoggerHelper.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/VTTRegionList.h /usr/src/debug/webkitgtk/2.52.5/Source/b
 malloc/libpas/src/libpas/pas_malloc_stack_logging.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_virtual_range.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMPromise.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSHTMLCanvasElementCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_ptr_hash_map.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/FixedBitVector.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSWorkerGlobalScopeCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/WebVTTToken.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSImageDataCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Float16.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Condition.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_dynamic_primitive_heap_map.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSWorkerGlobalScopeBase.h /usr/
 src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_stream.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_thread_local_cache.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/ScheduledAction.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/TextTrackCueList.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_dynamic_primitive_heap_map.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_stream.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_thread_local_cache.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/OptionalOrReference.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/RefCounter.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSLocationCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/ScriptModuleLoader.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_enumerate_initially_unaccounted_pages.h /usr/src/debug
 /webkitgtk/2.52.5/Source/WebCore/html/track/TextTrack.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compact_cartesian_tree_node_ptr.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_ptr_hash_set.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSAbortSignalCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertXPathNSResolver.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_enumerate_initially_unaccounted_pages.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfit_page_inlines.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/WindowProxy.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/WeakPtrImpl.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/RefCounted.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/DateMath.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/BubbleSort.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSNavig
 ateEventCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_page_base.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CodePtr.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/DataCue.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_page_base.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/StdLibExtras.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bootstrap_heap_page_provider.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_deallocation_logging_mode.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSXPathResultCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/TrackListBase.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/RawPtrTraits.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bootstrap_heap_page_provider.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/LazyUniqueRef.h /usr/src/debug/webkitgtk/2.52.5
 /Source/WebCore/bindings/js/JSValueInWrappedObject.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMMapLike.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SetForScope.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_large_free_heap_definitions.def /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSCallbackData.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ThreadSafeRefCounted.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compact_expendable_memory.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/OSAllocator.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CheckedRef.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSCallbackData.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/FlipBytes.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compact_expendable_memory.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSTrustedTypePolicyCustom.cpp /usr/src/debug
 /webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compact_atomic_bitfit_heap_ptr.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compact_atomic_bitfit_view_ptr.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_page_base_and_kind.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/WebVTTParser.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_thread_local_cache_layout_node_kind.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_exclusive_view.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_reserved_memory_provider.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/OrderMaker.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/RangeSet.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_reserved_memory_provider.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Threading.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas
 _segregated_exclusive_view.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSErrorHandler.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSTreeWalkerCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_found_bit_index.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_coalign.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/AudioTrackConfiguration.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertUnion.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMWindowCustom.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSIDBTransactionCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/VideoTrackConfiguration.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfield_vector.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertPromise.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Deque.h /usr/src
 /debug/webkitgtk/2.52.5/WTF/Headers/wtf/DeferrableRefCounted.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/OptionSet.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_coalign.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_lock.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_large_heap.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/WebCoreJITOperations.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMGlobalObjectInlines.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/LazyRef.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_large_free.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_large_heap.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_lock.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/ReadableStreamDefaultController.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compact_a
 tomic_segregated_view.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Lock.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMPromiseDeferred.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ConcurrentPtrHashSet.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/InbandWebVTTTextTrack.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_darwin_spi.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/PointerPreparations.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSTrustedTypePolicyFactoryCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/FastBitVector.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_try_allocate_primitive.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSPaintRenderingContext2DCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSCustomElementInterface.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_page_sharing_participan
 t.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_simple_type.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_small_large_map_entry.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_page_sharing_participant.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSWebAnimationCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_simple_type.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSMutationRecordCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Expected.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Logger.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ParallelHelperPool.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/StackTrace.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_designated_intrinsic_heap.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/TextTrackCueGeneric.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCor
 e/bindings/js/JSWebGLRenderingContextCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSIntersectionObserverCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_designated_intrinsic_heap.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSWindowProxy.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/LogInitialization.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/FilePrintStream.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_page_and_config.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/WebCoreTypedArrayController.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_simple_large_free_heap.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/bmalloc_heap_innards.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_size_directory.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ThreadGroup.h /usr/src/debug/webkit
 gtk/2.52.5/Source/WebCore/bindings/js/CachedModuleScriptLoader.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMOperation.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_size_directory.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_simple_large_free_heap.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Scope.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/IndexKeyType.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/WeakPtrFactory.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_primitive_heap_ref.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_extended_gcd.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_ptr_min_heap.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/AlignedStorage.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_expendable_memory.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_
 extended_gcd.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_primitive_heap_ref.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ParallelJobs.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_expendable_memory.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/TrackEvent.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/MainThread.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSIDBSerializationGlobalObject.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SingleRootGraph.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSMediaListCustom.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_system_heap.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_page_base_config_inlines.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/WordLock.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMGuardedObject.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindin
 gs/js/JSDOMWindowCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_page_config_kind.def /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_found_index.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertNullable.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSKeyframeEffectCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSStaticRangeCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/HashTraits.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ArgumentCoder.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ProcessPrivilege.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/SerializedScriptValue.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/DOMPromiseProxy.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_large_heap_physical_page_sharing_cache.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_try
 _shrink.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_exclusive_view_inlines.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSPopStateEventCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_mte_config.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_large_heap_physical_page_sharing_cache.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/TriState.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSNavigatorCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/MallocSpan.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CoroutineUtilities.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/ScheduledAction.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/TextTrackCueList.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMPromiseDeferred.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/MallocCommon.h /usr/src/debug/webkitgtk/2.52.5/
 WTF/Headers/wtf/LogChannels.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/AllocSpanMixin.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/AbstractCanMakeCheckedPtr.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConstructorBase.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/WebVTTElement.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/HashMap.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/HashSet.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/PageAllocation.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CryptographicallyRandomNumber.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfit_directory.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_enumerate_large_heaps.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ReadWriteLock.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_enumerate_large_heaps.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bi
 tfit_directory.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CompactVariant.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ValidatedReinterpretCast.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfit_allocator.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CrossThreadTask.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_range_begin_min_heap.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSPromiseRejectionEventCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfit_allocator.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ThreadingPrimitives.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSTrackCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_epoch.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertJSON.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_epoch.c /usr/src/debug/webkitgtk/2.52.5/WT
 F/Headers/wtf/Gigacage.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSCSSStyleDeclarationCustom.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SentinelLinkedList.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSPaintWorkletGlobalScopeCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_zero_memory.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMWrapperCache.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Dominators.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compact_tagged_page_granule_use_count_ptr.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_page_sharing_mode.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/AbstractRefCounted.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSEventListener.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/TextTrackList.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSResizeObser
 verEntryCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_redundant_local_allocator_node.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_tree_direction.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/IteratorRange.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSStyleSheetCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/StackCheck.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_redundant_local_allocator_node.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SaturatedArithmetic.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSMediaControlsHostCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMWindowBase.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/AudioTrackList.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/VTTScanner.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSLazyEventListener.h /usr/src/debug/web
 kitgtk/2.52.5/Source/WebCore/html/track/VideoTrackList.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_debug_spectrum.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Markable.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_try_reallocate.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/PreciseSum.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/TimeWithDynamicClockType.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_debug_spectrum.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_enumerator.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Spectrum.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/VTTCue.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/WebVTTParser.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_heap_ref.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSRangeCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/
 bindings/js/JSReportingObserverCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/EmbeddedFixedVector.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/RefCountedFixedVector.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_enumerator.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_heap_ref.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_page_inlines.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSErrorEventCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSReportBodyCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/StackPointer.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSEventListener.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfit_allocation_result.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_directory_kind.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/IndexedRang
 e.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_directory_inlines.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/LikelyDenseUnsignedIntegerSet.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_try_allocate_intrinsic.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/BooleanLattice.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/HashCountedSet.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_enumerator_region.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_page_role.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/MappedFileData.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_enumerator_region.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMWindowProperties.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSIDBCursorWithValueCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compact_bo
 otstrap_free_heap.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSPerformanceObserverCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_create_basic_heap_page_caches_with_reserved_memory.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SuspendableWorkQueue.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_heap_config_kind.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/TypeCasts.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/BufferedLineReader.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_create_basic_heap_page_caches_with_reserved_memory.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SignedPtr.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_heap_config_kind.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/UniquelyOwned.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_string_stream.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/
 libpas/src/libpas/pas_cartesian_tree.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/UniquelyOwnedPtr.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CompactRefPtrTuple.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMIterator.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SynchronizedFixedQueue.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compact_atomic_segregated_partial_view_ptr.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSStyleSheetCustom.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfit_page_config_variant.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/WebCoreOpaqueRootInlines.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Stopwatch.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/AbstractRefCountedAndCanMakeWeakPtr.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertBase.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_boo
 tstrap_free_heap.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMBindingSecurity.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMPromise.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_page_config_kind_and_role.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/WebVTTTokenizer.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_local_allocator_config_kind.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_shared_view.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSElementCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_page_malloc.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compact_atomic_bitfit_size_class_ptr.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_page_config_kind_and_role.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/
 pas_segregated_shared_view.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_page_malloc.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/MathExtras.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSElementCustom.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDeprecatedCSSOMValueCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_basic_heap_page_caches.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/InlineWeakRef.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/DataMutex.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/FixedVector.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_deallocate.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_utility_heap.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_payload_reservation_page_list.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertEventListener.h /usr/src/debug/webkit
 gtk/2.52.5/WTF/Headers/wtf/Atomics.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_deallocate.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMExceptionHandling.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_utility_heap.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Box.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/PointerComparison.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertSequences.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_payload_reservation_page_list.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_baseline_allocator_result.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_enumerate_segregated_heaps.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfit_allocator_inlines.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CagedPtr.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindi
 ngs/js/ModuleScriptLoaderClient.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertBoolean.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/ScriptWrappable.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SharedTask.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMAsyncIterator.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/TextTrackCue.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_enumerate_segregated_heaps.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/AudioTrackList.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/VideoTrackList.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_fast_megapage_cache.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_fast_megapage_table.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_enumerate_unaccounted_pages_as_meta.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/l
 ibpas/src/libpas/pas_segregated_directory_bit_reference.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Observer.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/jit_heap.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/GregorianDateTime.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMSetLike.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_fast_megapage_cache.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_fast_megapage_table.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/jit_heap.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/TinyPtrSet.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Variant.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_enumerate_unaccounted_pages_as_meta.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CompactVariantOperations.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/FastMalloc.h /usr/src/debug/webkitgtk/2.52.5/WTF/Header
 s/wtf/URLHelpers.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSCSSRuleCustom.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_tiny_large_map_entry.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/WebCoreTypedArrayController.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/bmalloc_heap_internal.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSCSSRuleCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/CachedScriptFetcher.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMWindowProperties.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/LoadableTextTrack.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_page_base_inlines.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/VTTCue.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/LockAlgorithmInlines.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/InternalReadableSt
 ream.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/InternalWritableStream.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/FixedWidthDouble.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_utils.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_versioned_field.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_lenient_compact_unsigned_ptr.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_baseline_allocator.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_local_allocator_scavenger_data.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_monotonic_time.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/UnalignedAccess.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_utils.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_monotonic_time.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas
 _baseline_allocator.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_lenient_compact_unsigned_ptr.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_local_allocator_scavenger_data.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_versioned_field.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_ptr_worklist.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ContinuousTime.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CompletionHandler.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/HashIterators.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/StackStats.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMIterator.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_ptr_worklist.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Ref.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/WallTime.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/DoublyLinkedList.h /us
 r/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_get_page_base_and_kind_for_small_other_in_fast_megapage.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SimpleStats.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_shared_view_inlines.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSNodeCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSWorkletGlobalScopeBase.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CPUTime.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSMessagePortCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Function.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/NoTailCalls.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_thread_local_cache_node.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SixCharacterHash.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/GarbageCollectionController.cpp /usr/src/debug/webkitgtk/2.52.5/
 Source/WebCore/html/track/InbandTextTrack.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_thread_local_cache_node.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/MessageQueue.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ParallelJobsGeneric.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ThreadMessage.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_zero_mode.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_heap_config_utils.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_large_map_entry.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_heap.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ButterflyArray.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/AudioTrack.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/VideoTrack.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/SerializedScriptValue.cpp /usr/src/debug/webk
 itgtk/2.52.5/Source/WebCore/bindings/js/JSWebCodecsVideoDecoderCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSWebCodecsVideoEncoderCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_heap_config_utils.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_race_test_hooks.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_heap.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/WebCoreOpaqueRoot.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfit_page_config.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_lock_free_read_ptr_ptr_hashtable.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ThreadSpecific.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSExecState.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_lock_free_read_ptr_ptr_hashtable.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Sc
 opedLambda.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_log.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compact_heap_ptr.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/FastFloat.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertDate.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSPluginElementFunctions.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_log.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/StringAdaptors.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_heap_for_config.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_heap_for_config.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertOptional.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMAbstractOperations.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/TranslatedProcess.h /usr/src/debug/webkitgtk/2.52.5/W
 TF/Headers/wtf/GenericTimeMixin.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMGuardedObject.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/ModuleScriptLoader.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compact_atomic_enumerable_range_list_chunk_ptr.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/IntervalSet.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/BitVector.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/AudioTrack.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/VideoTrack.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/VTTScanner.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertResult.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/WeakHashCountedSet.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertScheduledAction.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSIDBSerializationGlobalObject.cpp /usr/src/debug
 /webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConstructor.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMWrapper.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSAudioWorkletProcessorCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfit_directory_inlines.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_ensure_heap_forced_into_reserved_memory.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CryptographicUtilities.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ScopedPrintStream.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_ensure_heap_forced_into_reserved_memory.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSIDBObjectStoreCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/RAMSize.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CommaPrinter.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_dyld_state.h /usr/src/debug/w
 ebkitgtk/2.52.5/Source/WebCore/bindings/js/JSServiceWorkerGlobalScopeCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_medium_megapage_cache.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/RefCountedWithInlineWeakPtr.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_dyld_state.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_medium_megapage_cache.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/ScriptModuleLoader.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_page_config_kind.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSShadowRootCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertWebGL.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/AudioTrackConfiguration.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/VideoTrackConfiguration.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/s
 rc/libpas/pas_segregated_page_config_kind.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/TrackBase.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_random.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/CachedModuleScriptLoader.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/BumpPointerAllocator.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/ReadableStreamDefaultController.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSCustomElementInterface.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSHTMLElementCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/TrackListBase.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_random.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/InterferenceGraph.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/LEBDecoder.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/EnumTraits.h /usr/src/debug/webkitgtk/2.52.5/Source
 /WebCore/bindings/js/InternalReadableStream.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/InternalWritableStream.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/DOMWrapperWorld.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/TextTrackList.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSOffscreenCanvasRenderingContext2DCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Unexpected.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMBuiltinConstructorBase.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_page_sharing_pool_scavenge_result.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/RawPointer.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/URL.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_simple_free_heap_declarations.def /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compact_segregated_exclusive_view_ptr.h /usr/src/debug/webk
 itgtk/2.52.5/Source/WebCore/bindings/js/IDBBindingUtilities.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_all_heaps.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_enumerate_bitfit_heaps.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_local_allocator_inlines.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_allocation_result.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_deferred_decommit_log.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_large_free_heap_declarations.def /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_shared_handle.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertVariadic.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_allocation_result.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_enumerate_bitfit_heaps.h /usr/src/debug/web
 kitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_all_heaps.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_shared_handle.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_deferred_decommit_log.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ThreadAssertions.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_large_free_heap_deferred_commit_log.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/DOMWrapperWorld.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/WebAssemblyScriptSourceCode.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/VTTRegionList.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSPluginElementFunctions.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SinglyLinkedListWithTail.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_large_free_heap_deferred_commit_log.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/Ca
 chedScriptFetcher.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_view.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_enumerable_page_malloc.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertSerializedScriptValue.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/StringHashDumpContext.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/FileSystem.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_enumerable_page_malloc.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/WeakHashMap.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_view.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMGlobalObject.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSAttrCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSStylePropertyMapReadOnlyCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_fast_
 large_free_heap.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_view_allocator_inlines.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_view_kind.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_local_allocator.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/WeakListHashSet.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_fast_large_free_heap.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMExceptionHandling.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_local_allocator_kind.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertNumbers.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_local_allocator.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/TextTrackClient.h /usr/src/debug/webkitgtk/2.52.5
 /WTF/Headers/wtf/WorkerPool.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ConcurrentBuffer.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ConcurrentVector.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSIDBRequestCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/PageBlock.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_try_allocate_array.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/DataLog.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/DataRef.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ParkingLot.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_first_level_tiny_large_map_entry.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CagedUniquePtr.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSErrorHandler.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_thread_suspend_lock.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/ExtendedDOMIsoSubspaces.h /
 usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_thread_suspend_lock.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/VTTRegion.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/WorkerModuleScriptLoader.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSResizeObserverCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Assertions.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/MemoryFootprint.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CanMakeWeakPtr.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_decommit_exclusion_range.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/CommonVM.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/PageReservation.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Range.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/WebAssemblyScriptBufferSourceProvider.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_range16.h /usr/
 src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_local_view_cache.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/NaturalLoops.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSWindowProxy.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConstructorNotConstructable.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_local_view_cache.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/TrackEvent.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compact_segregated_size_directory_ptr.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/CommonVM.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/bmalloc_type.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMWrapper.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ApproximateTime.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/StringPrintStream.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/
 src/libpas/bmalloc_type.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/AggregateLogger.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/BloomFilter.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/ScriptWrappable.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSXMLHttpRequestCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_large_free_heap_helpers.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSTextTrackCueCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/FileHandle.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_heap.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_large_free_heap_helpers.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_heap.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/ScriptBufferSourceProvider.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMCastThisValue.h /usr/src/debug/webkitgtk/
 2.52.5/Source/WebCore/bindings/js/JSObservableArray.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compact_atomic_thread_local_cache_layout_node.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/WeakRandom.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/UniqueArray.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConstructorBase.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfit_size_class.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CancellableTask.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_heap_config_kind.def /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfit_size_class.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/FunctionDispatcher.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_page.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/MallocPtr.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pa
 s_segregated_page.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/PriorityQueue.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CrossThreadCopier.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/URLParser.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/WeakPtr.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/AudioTrackClient.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/VideoTrackClient.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_shared_handle_inlines.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/LockAlgorithm.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_compact_bitfit_directory_ptr.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSEventCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ProcessID.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/WeakRef.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSNodeIteratorCustom.cpp /usr/src/debug/webkitgtk/2
 .52.5/Source/bmalloc/libpas/src/libpas/pas_large_virtual_range.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/InbandGenericTextTrack.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/IndexSparseSet.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/dtoa.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_heap_inlines.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/NativePromise.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfit_heap.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfit_page.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfit_view.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_fast_path_allocation_result.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfit_page_config_kind.def /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/InbandGenericTextTrack.h /usr/src/debug/webkitgtk/2.52.5/Source/b
 malloc/libpas/src/libpas/pas_compact_tagged_unsigned_ptr.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfit_heap.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfit_page.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSMutationObserverCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfit_view.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/bmalloc_heap.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/bmalloc_heap.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/MonotonicTime.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSAudioBufferCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/RuntimeApplicationChecks.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_mmap_capability.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/IndexedContainerIterator.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Enumerate
 dArray.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/InbandDataTextTrack.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSUndoItemCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertAny.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_page_header_table.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CompactPtr.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_shared_page_directory.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Packed.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/StackBounds.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSExecState.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/WeakHashSet.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_shared_page_directory.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_page_header_table.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/lib
 pas/src/libpas/pas_shared_handle_or_page_boundary_inlines.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSHistoryCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/HashFunctions.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/RefCountable.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_large_virtual_range_min_heap.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/AccessibleAddress.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_heap_runtime_config.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_partial_view.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_partial_view.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_heap_runtime_config.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfit_page_config_kind.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_thread_local_cache_layout.c
  /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/BitSet.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSAudioBufferSourceNodeCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_bitfit_page_config_kind.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_thread_local_cache_layout.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_page_config.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/RecursiveLockAdapter.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ObjectIdentifier.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSExtendableMessageEventCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_page_config.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_page_granule_use_count.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_large_free_inlines.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bin
 dings/js/JSSVGViewSpecCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_exclusive_view_template_memo_table.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/WeakRandomNumber.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/StructuredClone.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSCanvasRenderingContext2DCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/PrintStream.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_exclusive_view_template_memo_table.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SystemFree.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMLegacyFactoryFunction.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/InbandTextTrack.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CheckedArithmetic.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_directory.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpa
 s/pas_heap_config.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SystemTracing.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_heap_config_utils_inlines.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/LoadableTextTrack.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/TaggedPtr.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Vector.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDocumentCustom.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/InbandDataTextTrack.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_heap_config.c /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_segregated_directory.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertStrings.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Insertion.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_thread_local_cache_layout_node.h /usr/src/debug/webkitgtk/2.52.5/WTF/Heade
 rs/wtf/ThreadSafeRefCountedWithSuppressingSaferCPPChecking.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_thread_local_cache_layout_node.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMSetLike.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_enumerable_range_list.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSShadowRealmGlobalScopeBase.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_free_granules.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CrossThreadQueue.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SafeStrerror.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_physical_memory_transaction.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/MmapSpan.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/TextTrackCueGeneric.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_free_granules.c /usr/src/debug/webkitgtk/2.52.5/Sou
 rce/bmalloc/libpas/src/libpas/pas_enumerable_range_list.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_physical_memory_transaction.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/PtrTag.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMBindingSecurityInlines.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_large_map.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CountingLock.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_large_map.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSHTMLAllCollectionCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMBuiltinConstructor.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertWebGL.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ReferenceWrapperVector.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Seconds.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSNavigationCustom.cpp /us
 r/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/TextTrack.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_root.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ListHashSet.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSEventCustom.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/VTTRegion.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSNodeListCustom.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSCSSStyleDeclarationCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/MemoryPressureHandler.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_committed_pages_vector.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSNodeListCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/HashTable.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/Hasher.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/ThreadSafeWeakPtr.h /usr/src/debug/webkitgtk/2.52.5/Source/bmal
 loc/libpas/src/libpas/pas_committed_pages_vector.c /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/UniStdExtras.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/TextTrackCue.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConstructorNotCallable.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/CompactPointerTuple.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_alignment.c /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSWebGL2RenderingContextCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_generic_large_free_heap.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_simple_free_heap_definitions.def /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SegmentedVector.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_alignment.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_physical_memory_synchronization_style.h /usr/src/debug/webkit
 gtk/2.52.5/Source/WebCore/bindings/js/JSFetchEventCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/html/track/BufferedLineReader.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/AutomaticThread.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/KeyValuePair.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSLazyEventListener.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/MediaTime.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSIDBCursorCustom.cpp /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/SingleThreadIntegralWrapper.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertIndexedDB.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertInterface.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertUndefined.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMQuadCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/ScriptCachedFrameData.cpp /usr/src/de
 bug/webkitgtk/2.52.5/WTF/Headers/wtf/CheckedPtr.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSAudioWorkletGlobalScopeCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertNumbers.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMConvertStrings.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/RunJavaScriptParameters.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSMessageChannelCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSElementInternalsCustom.cpp /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_full_alloc_bits.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_try_allocate_common.h /usr/src/debug/webkitgtk/2.52.5/WTF/Headers/wtf/WTFConfig.h /usr/src/debug/webkitgtk/2.52.5/Source/bmalloc/libpas/src/libpas/pas_page_kind.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/JSDOMWrapperCache.cpp /usr/src/debug/webkitgtk/2.52
 .5/Source/bmalloc/libpas/src/libpas/pas_tri_state.h /usr/src/debug/webkitgtk/2.52.5/Source/WebCore/bindings/js/ScriptController.h", added "/usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_mutation_count.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/bmalloc_heap_inlines.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_large_expendable_memory.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_local_allocator_result.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSWorkerNavigatorCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_large_expendable_memory.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSNodeCustomInlines.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDocumentCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/GetPtr.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc
 _allocator.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/ScriptWrappableInlines.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Identified.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_allocation_callbacks.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_all_shared_page_directories.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SinglyLinkedList.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_allocation_callbacks.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSEventTargetCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Indenter.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_all_shared_page_directories.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/IndexMap.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/IndexSet.h /usr/src/debug/webkitg
 tk/2.52.6/Source/WebCore/bindings/js/ScriptSourceCode.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/MainThreadDispatcher.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_scavenger.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_scavenger.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/StructuredClone.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_heap_summary.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SIMDHelpers.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compute_summary_object_callbacks.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/VariantExtras.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSCustomElementRegistryCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CallbackAggregator.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_heap_summary.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSSubscriber
 Custom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/UUID.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compute_summary_object_callbacks.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/RawHex.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/InlineWeakPtr.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/GraphNodeWorklist.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSMediaSessionCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertEnumeration.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_fd_stream.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_fd_stream.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_partial_view_inlines.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertBufferSource.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compact_heap_reservation.c /usr/src/debug/webkitg
 tk/2.52.6/WTF/Headers/wtf/RefCountDebugger.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/WebCoreJSClientData.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/RobinHoodHashTable.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_simple_free_heap_helpers.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/WorkerScriptFetcher.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/WTFProcess.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/AutodrainedPool.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compact_heap_reservation.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/DOMGCOutputConstraint.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_simple_free_heap_helpers.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/InbandWebVTTTextTrack.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SmallMap.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSHTMLTemplateElement
 Custom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSShadowRealmGlobalScopeBase.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_small_medium_bootstrap_heap_page_provider.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SmallSet.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_heap_table.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMBuiltinConstructorBase.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSWorkerGlobalScopeBase.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_heap_table.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compact_atomic_segregated_size_directory_ptr.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/BufferSource.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSMessageEventCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_small_medium_bootstrap_heap_page_provid
 er.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/InternalReadableStreamDefaultReader.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSObservableArray.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/ExtendedDOMClientIsoSubspaces.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_page_sharing_pool.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSExecStateInstrumentation.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSCSSRuleListCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_aligned_allocation_result.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Bag.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_page_sharing_pool.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/FunctionPtr.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/GarbageCollectionController.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/InternalWrita
 bleStreamWriter.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_heap_lock.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/WebAssemblyCachedScriptSourceProvider.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_red_black_tree.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_red_black_tree.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/WorkerModuleScriptLoader.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_heap_lock.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitvector.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/BackwardsGraph.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SHA1.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/DataCue.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/RefCountedAndCanMakeWeakPtr.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_small_medium_bootstrap_free_heap.c /usr/
 src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/DOMGCOutputConstraint.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertDate.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/IDBBindingUtilities.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/NeverDestroyed.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertObject.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/RecursableLambda.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/OptionSetHash.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSWorkletGlobalScopeBase.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSCustomEventCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_shared_page_directory_by_size.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_get_heap.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_range.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Value
 OrReference.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_shared_page_directory_by_size.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/HexNumber.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/WebVTTElement.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_page_base_config.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CompilationThread.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SpanningTree.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/NakedPtr.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/WebCoreBuiltinNames.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/WindowProxy.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_page_base_config.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSWebCodecsAudioDecoderCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSWebCodecsAudioEncoderCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source
 /bmalloc/libpas/src/libpas/pas_get_allocation_size.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/TrackBase.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_designated_intrinsic_heap_inlines.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/WorkQueue.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_basic_heap_config_enumerator_data.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Language.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ListDump.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_basic_heap_config_enumerator_data.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Liveness.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_virtual_range_min_heap.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_large_sharing_pool.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/bmalloc_heap_config.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/li
 bpas/src/libpas/pas_compact_segregated_shared_view_ptr.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertNull.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSIntersectionObserverEntryCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/bmalloc_heap_config.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_large_sharing_pool.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compact_thread_local_cache_layout_node.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_try_allocate.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSReadableStreamSourceCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_baseline_allocator_table.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMMapLike.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/NumberOfCores.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/InternalR
 eadableStreamDefaultReader.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_baseline_allocator_table.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertCallbacks.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/WebVTTTokenizer.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/URLHash.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSEventTargetCustom.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_commit_mode.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_commit_span.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ASCIICType.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/TrailingArray.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMWindowBase.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_commit_span.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_thread_local_cache_layout_entry.h /usr/src/debug/w
 ebkitgtk/2.52.6/Source/WebCore/bindings/js/WebCoreJSClientData.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_enumerator_internal.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMAttribute.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMOperationReturningPromise.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_utility_heap_config.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_status_reporter.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_status_reporter.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_utility_heap_config.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_page_sharing_participant_kind.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_view_and_index.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SortedArrayMap.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/TinyLRUCac
 he.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_ensure_heap_with_page_caches.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/EnumSet.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/JSONValues.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_immortal_heap.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/jit_heap_config.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/InternalWritableStreamWriter.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMGlobalObject.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_ensure_heap_with_page_caches.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/RunLoop.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/ExceptionDetails.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertRecord.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/jit_heap_config.c /usr/src/debug/webkitgtk/2.52.6/Sou
 rce/bmalloc/libpas/src/libpas/pas_immortal_heap.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CompactUniquePtrTuple.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Locker.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/CachedScriptSourceProvider.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/GenericHashKey.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMBindingSecurity.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/UniqueRef.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertDictionary.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSNodeCustom.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/ScriptCachedFrameData.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_shared_handle_or_page_boundary.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ContinuousApproximateTime.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConstructorWithDocument.h /usr/src/deb
 ug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_size_directory_inlines.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_heap_inlines.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ThreadSafeWeakHashSet.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_full_alloc_bits_inlines.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/UnionFind.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/RefPtr.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_megapage_cache.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_virtual_range.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/ScriptController.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_malloc_stack_logging.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_megapage_cache.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ZippedRange.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/w
 tf/LoggerHelper.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/VTTRegionList.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_malloc_stack_logging.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_virtual_range.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMPromise.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSHTMLCanvasElementCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_ptr_hash_map.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/FixedBitVector.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSWorkerGlobalScopeCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/WebVTTToken.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSImageDataCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Float16.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Condition.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/sr
 c/libpas/pas_dynamic_primitive_heap_map.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSWorkerGlobalScopeBase.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_stream.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_thread_local_cache.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/ScheduledAction.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/TextTrackCueList.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_dynamic_primitive_heap_map.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_stream.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_thread_local_cache.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/OptionalOrReference.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/RefCounter.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSLocationCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/ScriptModule
 Loader.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_enumerate_initially_unaccounted_pages.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/TextTrack.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compact_cartesian_tree_node_ptr.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_ptr_hash_set.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSAbortSignalCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertXPathNSResolver.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_enumerate_initially_unaccounted_pages.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_page_inlines.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/WindowProxy.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/WeakPtrImpl.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/RefCounted.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/DateMa
 th.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/BubbleSort.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSNavigateEventCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_page_base.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CodePtr.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/DataCue.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_page_base.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/StdLibExtras.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bootstrap_heap_page_provider.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_deallocation_logging_mode.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSXPathResultCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/TrackListBase.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/RawPtrTraits.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpa
 s/pas_bootstrap_heap_page_provider.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/LazyUniqueRef.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSValueInWrappedObject.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMMapLike.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SetForScope.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_large_free_heap_definitions.def /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSCallbackData.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ThreadSafeRefCounted.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compact_expendable_memory.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/OSAllocator.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CheckedRef.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSCallbackData.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/FlipBytes.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas
 _compact_expendable_memory.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSTrustedTypePolicyCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compact_atomic_bitfit_heap_ptr.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compact_atomic_bitfit_view_ptr.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_page_base_and_kind.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/WebVTTParser.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_thread_local_cache_layout_node_kind.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_exclusive_view.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_reserved_memory_provider.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/OrderMaker.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/RangeSet.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_reserved_memory_provide
 r.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Threading.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_exclusive_view.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSErrorHandler.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSTreeWalkerCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_found_bit_index.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_coalign.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/AudioTrackConfiguration.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertUnion.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMWindowCustom.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSIDBTransactionCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/VideoTrackConfiguration.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfield_vector.h /usr/src/debu
 g/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertPromise.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Deque.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/DeferrableRefCounted.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/OptionSet.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_coalign.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_lock.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_large_heap.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/WebCoreJITOperations.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMGlobalObjectInlines.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/LazyRef.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_large_free.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_large_heap.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_lock.h /usr/src/debug/webkitgtk/2.52.6/Source/
 WebCore/bindings/js/ReadableStreamDefaultController.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compact_atomic_segregated_view.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Lock.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMPromiseDeferred.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ConcurrentPtrHashSet.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/InbandWebVTTTextTrack.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_darwin_spi.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/PointerPreparations.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSTrustedTypePolicyFactoryCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/FastBitVector.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_try_allocate_primitive.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSPaintRenderingContext2DCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore
 /bindings/js/JSCustomElementInterface.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/TrackOpaqueRoot.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_page_sharing_participant.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_simple_type.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_small_large_map_entry.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_page_sharing_participant.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSWebAnimationCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_simple_type.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSMutationRecordCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Expected.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Logger.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ParallelHelperPool.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/StackTrace.h /usr/src/debug
 /webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_designated_intrinsic_heap.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/TextTrackCueGeneric.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSWebGLRenderingContextCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSIntersectionObserverCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_designated_intrinsic_heap.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSWindowProxy.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/LogInitialization.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/FilePrintStream.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_page_and_config.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/WebCoreTypedArrayController.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_simple_large_free_heap.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/li
 bpas/bmalloc_heap_innards.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_size_directory.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ThreadGroup.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/CachedModuleScriptLoader.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMOperation.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_size_directory.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_simple_large_free_heap.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Scope.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/IndexKeyType.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/WeakPtrFactory.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_primitive_heap_ref.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_extended_gcd.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_ptr_min_heap.h /usr/src/debug/
 webkitgtk/2.52.6/WTF/Headers/wtf/AlignedStorage.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_expendable_memory.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_extended_gcd.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_primitive_heap_ref.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ParallelJobs.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_expendable_memory.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/TrackEvent.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/MainThread.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSIDBSerializationGlobalObject.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SingleRootGraph.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSMediaListCustom.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_system_heap.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_page_base_c
 onfig_inlines.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/WordLock.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMGuardedObject.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMWindowCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_page_config_kind.def /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_found_index.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertNullable.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSKeyframeEffectCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSStaticRangeCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/HashTraits.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ArgumentCoder.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ProcessPrivilege.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/SerializedScriptValue.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bind
 ings/js/DOMPromiseProxy.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_large_heap_physical_page_sharing_cache.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_mte_config.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_exclusive_view_inlines.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_try_shrink.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSPopStateEventCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_mte_config.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_large_heap_physical_page_sharing_cache.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/TriState.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSNavigatorCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/MallocSpan.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CoroutineUtilities.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCor
 e/bindings/js/ScheduledAction.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/TextTrackCueList.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMPromiseDeferred.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/MallocCommon.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/LogChannels.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/AllocSpanMixin.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/AbstractCanMakeCheckedPtr.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConstructorBase.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/WebVTTElement.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/HashMap.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/HashSet.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/PageAllocation.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CryptographicallyRandomNumber.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_directory.h /usr/src/debug/webkitgtk/2.52.6
 /Source/bmalloc/libpas/src/libpas/pas_enumerate_large_heaps.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ReadWriteLock.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_enumerate_large_heaps.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_directory.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CompactVariant.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ValidatedReinterpretCast.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_allocator.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CrossThreadTask.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_range_begin_min_heap.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSPromiseRejectionEventCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_allocator.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ThreadingPrimitives.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindin
 gs/js/JSTrackCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_epoch.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertJSON.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_epoch.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Gigacage.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSCSSStyleDeclarationCustom.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SentinelLinkedList.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSPaintWorkletGlobalScopeCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_zero_memory.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMWrapperCache.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Dominators.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compact_tagged_page_granule_use_count_ptr.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_page_sharing_mode.h /usr
 /src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/AbstractRefCounted.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSEventListener.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/TextTrackList.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSResizeObserverEntryCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_redundant_local_allocator_node.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_tree_direction.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/IteratorRange.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSStyleSheetCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/StackCheck.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_redundant_local_allocator_node.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SaturatedArithmetic.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSMediaControlsHostCustom.cpp /usr/src/debug/webkitgtk/2.52.6/
 Source/WebCore/bindings/js/JSDOMWindowBase.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/AudioTrackList.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/VTTScanner.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSLazyEventListener.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/VideoTrackList.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_debug_spectrum.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Markable.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_try_reallocate.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/PreciseSum.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/TimeWithDynamicClockType.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_debug_spectrum.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_enumerator.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Spectrum.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/trac
 k/VTTCue.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/WebVTTParser.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_heap_ref.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSRangeCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSReportingObserverCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/EmbeddedFixedVector.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/RefCountedFixedVector.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_enumerator.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_heap_ref.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_page_inlines.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSErrorEventCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSReportBodyCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/StackPointer.h /usr/src/debug/webkitgtk/2.52.6/Source/
 WebCore/bindings/js/JSEventListener.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_allocation_result.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_directory_kind.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/IndexedRange.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_directory_inlines.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/LikelyDenseUnsignedIntegerSet.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_try_allocate_intrinsic.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/BooleanLattice.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/HashCountedSet.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_enumerator_region.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_page_role.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/MappedFileData.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas
 /src/libpas/pas_enumerator_region.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMWindowProperties.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSIDBCursorWithValueCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compact_bootstrap_free_heap.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSPerformanceObserverCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_create_basic_heap_page_caches_with_reserved_memory.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SuspendableWorkQueue.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_heap_config_kind.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/TypeCasts.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/BufferedLineReader.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_create_basic_heap_page_caches_with_reserved_memory.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Signed
 Ptr.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_heap_config_kind.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/UniquelyOwned.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_string_stream.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_cartesian_tree.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/UniquelyOwnedPtr.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CompactRefPtrTuple.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMIterator.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SynchronizedFixedQueue.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compact_atomic_segregated_partial_view_ptr.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSStyleSheetCustom.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_page_config_variant.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/WebCoreOpaqueRootInlines.h /usr/s
 rc/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Stopwatch.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/AbstractRefCountedAndCanMakeWeakPtr.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertBase.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bootstrap_free_heap.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMBindingSecurity.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMPromise.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_page_config_kind_and_role.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/WebVTTTokenizer.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_local_allocator_config_kind.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_shared_view.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSElementCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_page_
 malloc.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compact_atomic_bitfit_size_class_ptr.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_page_config_kind_and_role.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_shared_view.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_page_malloc.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/MathExtras.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSElementCustom.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDeprecatedCSSOMValueCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_basic_heap_page_caches.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/InlineWeakRef.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/DataMutex.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/FixedVector.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_deallocate.c /us
 r/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_utility_heap.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_payload_reservation_page_list.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertEventListener.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Atomics.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_deallocate.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMExceptionHandling.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_utility_heap.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Box.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/PointerComparison.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertSequences.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_payload_reservation_page_list.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_baseline_allocator_result.h /usr/src/debug/
 webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_enumerate_segregated_heaps.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_allocator_inlines.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CagedPtr.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/ModuleScriptLoaderClient.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertBoolean.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/ScriptWrappable.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SharedTask.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMAsyncIterator.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/TextTrackCue.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_enumerate_segregated_heaps.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/AudioTrackList.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/VideoTrackList.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/
 libpas/src/libpas/pas_fast_megapage_cache.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_fast_megapage_table.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_enumerate_unaccounted_pages_as_meta.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_directory_bit_reference.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Observer.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/jit_heap.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/GregorianDateTime.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMSetLike.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_fast_megapage_cache.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_fast_megapage_table.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/jit_heap.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/TinyPtrSet.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Varia
 nt.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_enumerate_unaccounted_pages_as_meta.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CompactVariantOperations.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/FastMalloc.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/URLHelpers.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSCSSRuleCustom.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_tiny_large_map_entry.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/WebCoreTypedArrayController.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/bmalloc_heap_internal.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSCSSRuleCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/CachedScriptFetcher.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMWindowProperties.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/LoadableTextTrack.h /usr/src/debug/w
 ebkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_page_base_inlines.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/VTTCue.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/LockAlgorithmInlines.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/InternalReadableStream.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/InternalWritableStream.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/FixedWidthDouble.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_utils.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_versioned_field.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_lenient_compact_unsigned_ptr.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_baseline_allocator.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_local_allocator_scavenger_data.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_monotonic_time.c /usr/sr
 c/debug/webkitgtk/2.52.6/WTF/Headers/wtf/UnalignedAccess.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_utils.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_monotonic_time.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_baseline_allocator.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_lenient_compact_unsigned_ptr.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_local_allocator_scavenger_data.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_versioned_field.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_ptr_worklist.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ContinuousTime.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CompletionHandler.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/HashIterators.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/StackStats.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/binding
 s/js/JSDOMIterator.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_ptr_worklist.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Ref.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/WallTime.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/DoublyLinkedList.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_get_page_base_and_kind_for_small_other_in_fast_megapage.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SimpleStats.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_shared_view_inlines.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSNodeCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSWorkletGlobalScopeBase.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CPUTime.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSMessagePortCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Function.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/NoTailCal
 ls.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_thread_local_cache_node.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SixCharacterHash.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/GarbageCollectionController.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/InbandTextTrack.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_thread_local_cache_node.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/MessageQueue.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ParallelJobsGeneric.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ThreadMessage.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_zero_mode.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_heap_config_utils.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_large_map_entry.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_heap.c /usr/src/debug/webkitgtk/
 2.52.6/WTF/Headers/wtf/ButterflyArray.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/AudioTrack.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/VideoTrack.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/SerializedScriptValue.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSWebCodecsVideoDecoderCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSWebCodecsVideoEncoderCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_heap_config_utils.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_race_test_hooks.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_heap.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/WebCoreOpaqueRoot.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_page_config.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_lock_free_read_ptr_ptr_hashtable.c /usr
 /src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ThreadSpecific.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSExecState.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_lock_free_read_ptr_ptr_hashtable.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ScopedLambda.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_log.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compact_heap_ptr.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/FastFloat.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertDate.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSPluginElementFunctions.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_log.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/StringAdaptors.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_heap_for_config.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/
 pas_heap_for_config.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertOptional.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMAbstractOperations.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/TranslatedProcess.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/GenericTimeMixin.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMGuardedObject.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/ModuleScriptLoader.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compact_atomic_enumerable_range_list_chunk_ptr.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/IntervalSet.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/BitVector.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/AudioTrack.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/VideoTrack.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/VTTScanner.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/
 js/JSDOMConvertResult.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/WeakHashCountedSet.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertScheduledAction.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSIDBSerializationGlobalObject.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConstructor.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMWrapper.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSAudioWorkletProcessorCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_directory_inlines.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_ensure_heap_forced_into_reserved_memory.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CryptographicUtilities.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ScopedPrintStream.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_ensure_heap_forced_into_reserved_memory.h /usr/src/debug/
 webkitgtk/2.52.6/Source/WebCore/bindings/js/JSIDBObjectStoreCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/RAMSize.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CommaPrinter.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_dyld_state.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSServiceWorkerGlobalScopeCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_medium_megapage_cache.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/RefCountedWithInlineWeakPtr.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_dyld_state.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_medium_megapage_cache.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/ScriptModuleLoader.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_page_config_kind.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSShadowRootCustom.cpp /usr/src/debug/web
 kitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertWebGL.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/AudioTrackConfiguration.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/VideoTrackConfiguration.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_page_config_kind.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/TrackBase.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_random.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/CachedModuleScriptLoader.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/BumpPointerAllocator.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/ReadableStreamDefaultController.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSCustomElementInterface.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSHTMLElementCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/TrackListBase.h /usr/src/debug/w
 ebkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_random.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/InterferenceGraph.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/LEBDecoder.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/EnumTraits.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/InternalReadableStream.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/InternalWritableStream.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/DOMWrapperWorld.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/TextTrackList.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSOffscreenCanvasRenderingContext2DCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Unexpected.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMBuiltinConstructorBase.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_page_sharing_pool_scavenge_result.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/RawPoint
 er.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/URL.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_simple_free_heap_declarations.def /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compact_segregated_exclusive_view_ptr.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/IDBBindingUtilities.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_all_heaps.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_enumerate_bitfit_heaps.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_local_allocator_inlines.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_allocation_result.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_deferred_decommit_log.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_large_free_heap_declarations.def /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_shared_ha
 ndle.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertVariadic.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_allocation_result.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_enumerate_bitfit_heaps.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_all_heaps.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_shared_handle.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_deferred_decommit_log.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ThreadAssertions.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_large_free_heap_deferred_commit_log.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/DOMWrapperWorld.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/WebAssemblyScriptSourceCode.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/VTTRegionList.cpp /usr/src/debug/webkitgtk/2.52.6/Source/
 WebCore/bindings/js/JSPluginElementFunctions.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SinglyLinkedListWithTail.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_large_free_heap_deferred_commit_log.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/CachedScriptFetcher.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_view.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_enumerable_page_malloc.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertSerializedScriptValue.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/StringHashDumpContext.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/FileSystem.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_enumerable_page_malloc.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/WeakHashMap.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_view.c /usr/src/debug/webkitgtk/2.52.6/Sou
 rce/WebCore/bindings/js/JSDOMGlobalObject.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSAttrCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSStylePropertyMapReadOnlyCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_fast_large_free_heap.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_view_allocator_inlines.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_view_kind.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_local_allocator.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/WeakListHashSet.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_fast_large_free_heap.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMExceptionHandling.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_local_allo
 cator_kind.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertNumbers.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_local_allocator.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/TextTrackClient.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/WorkerPool.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ConcurrentBuffer.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ConcurrentVector.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSIDBRequestCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/PageBlock.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_try_allocate_array.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/DataLog.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/DataRef.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ParkingLot.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_first_level_tiny_large_map_entry.h /usr/src/debug/webkitgtk/2.52.
 6/Source/WebCore/bindings/js/JSErrorHandler.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_thread_suspend_lock.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/ExtendedDOMIsoSubspaces.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_thread_suspend_lock.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/VTTRegion.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/WorkerModuleScriptLoader.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSResizeObserverCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Assertions.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/MemoryFootprint.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CanMakeWeakPtr.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_decommit_exclusion_range.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/CommonVM.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/PageReservation.h /usr/src/debug
 /webkitgtk/2.52.6/WTF/Headers/wtf/Range.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/WebAssemblyScriptBufferSourceProvider.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_range16.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_local_view_cache.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/NaturalLoops.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSWindowProxy.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConstructorNotConstructable.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_local_view_cache.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/TrackEvent.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compact_segregated_size_directory_ptr.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/CommonVM.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/bmalloc_type.h /usr/src/debug/webkitgtk/2.52.6/Sourc
 e/WebCore/bindings/js/JSDOMWrapper.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ApproximateTime.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/StringPrintStream.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/bmalloc_type.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/AggregateLogger.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/BloomFilter.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/ScriptWrappable.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSXMLHttpRequestCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_large_free_heap_helpers.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSTextTrackCueCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/FileHandle.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_heap.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_large_free_heap_helpers.c /usr/src/debug/webkitgtk/2.52.6/Source/bmall
 oc/libpas/src/libpas/pas_heap.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/ScriptBufferSourceProvider.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMCastThisValue.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSObservableArray.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compact_atomic_thread_local_cache_layout_node.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/WeakRandom.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/UniqueArray.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConstructorBase.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_size_class.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CancellableTask.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_heap_config_kind.def /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_size_class.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/FunctionDi
 spatcher.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_page.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/MallocPtr.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_page.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/PriorityQueue.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CrossThreadCopier.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/URLParser.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/WeakPtr.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/AudioTrackClient.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/VideoTrackClient.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_shared_handle_inlines.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/LockAlgorithm.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compact_bitfit_directory_ptr.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSEventCustom.cpp /us
 r/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ProcessID.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/WeakRef.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSNodeIteratorCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_large_virtual_range.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/InbandGenericTextTrack.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/IndexSparseSet.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/dtoa.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_heap_inlines.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/NativePromise.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_heap.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_page.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_view.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_fast_path_allocation_resu
 lt.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_page_config_kind.def /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/InbandGenericTextTrack.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_compact_tagged_unsigned_ptr.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_heap.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_page.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSMutationObserverCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_view.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/bmalloc_heap.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/bmalloc_heap.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/MonotonicTime.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSAudioBufferCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/RuntimeApplicationChe
 cks.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_mmap_capability.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/IndexedContainerIterator.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/EnumeratedArray.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/InbandDataTextTrack.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSUndoItemCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertAny.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_page_header_table.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CompactPtr.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_shared_page_directory.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Packed.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/StackBounds.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSExecState.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/WeakHashSet.h /usr/src/debug/web
 kitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_shared_page_directory.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_page_header_table.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_shared_handle_or_page_boundary_inlines.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSHistoryCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/HashFunctions.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/RefCountable.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_large_virtual_range_min_heap.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/AccessibleAddress.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_heap_runtime_config.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_partial_view.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_partial_view.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src
 /libpas/pas_heap_runtime_config.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_page_config_kind.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_thread_local_cache_layout.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/BitSet.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSAudioBufferSourceNodeCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_bitfit_page_config_kind.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_thread_local_cache_layout.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSHTMLMediaElementCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_page_config.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/RecursiveLockAdapter.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ObjectIdentifier.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSExtendableMessageEventCustom.cpp /usr/src/debug/
 webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_page_config.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_page_granule_use_count.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_large_free_inlines.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSSVGViewSpecCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_exclusive_view_template_memo_table.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/WeakRandomNumber.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/StructuredClone.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSCanvasRenderingContext2DCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/PrintStream.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_exclusive_view_template_memo_table.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SystemFree.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMLegacyFact
 oryFunction.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/InbandTextTrack.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CheckedArithmetic.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_segregated_directory.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_heap_config.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SystemTracing.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_heap_config_utils_inlines.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/LoadableTextTrack.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/TaggedPtr.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Vector.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDocumentCustom.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/InbandDataTextTrack.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_heap_config.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpa
 s/pas_segregated_directory.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertStrings.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Insertion.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_thread_local_cache_layout_node.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ThreadSafeRefCountedWithSuppressingSaferCPPChecking.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_thread_local_cache_layout_node.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMSetLike.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_enumerable_range_list.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSShadowRealmGlobalScopeBase.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_free_granules.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CrossThreadQueue.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SafeStrerror.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/
 libpas/src/libpas/pas_physical_memory_transaction.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/MmapSpan.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/TextTrackCueGeneric.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_free_granules.c /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_enumerable_range_list.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_physical_memory_transaction.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/PtrTag.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMBindingSecurityInlines.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_large_map.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CountingLock.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_large_map.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSHTMLAllCollectionCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMBui
 ltinConstructor.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertWebGL.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ReferenceWrapperVector.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Seconds.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSNavigationCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/TextTrack.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_root.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ListHashSet.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSEventCustom.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/VTTRegion.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSNodeListCustom.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSCSSStyleDeclarationCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/MemoryPressureHandler.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_committed_pages_vect
 or.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSNodeListCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/HashTable.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/Hasher.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/ThreadSafeWeakPtr.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_committed_pages_vector.c /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/UniStdExtras.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/TextTrackCue.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConstructorNotCallable.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CompactPointerTuple.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_alignment.c /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSWebGL2RenderingContextCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_generic_large_free_heap.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/p
 as_simple_free_heap_definitions.def /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SegmentedVector.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_alignment.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_physical_memory_synchronization_style.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSFetchEventCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/html/track/BufferedLineReader.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/AutomaticThread.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/KeyValuePair.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSLazyEventListener.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/MediaTime.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSIDBCursorCustom.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/SingleThreadIntegralWrapper.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertIndexedDB.h /usr/src/debug/webkitgtk/2.5
 2.6/Source/WebCore/bindings/js/JSDOMConvertInterface.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertUndefined.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMQuadCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/ScriptCachedFrameData.cpp /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/CheckedPtr.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSAudioWorkletGlobalScopeCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertNumbers.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMConvertStrings.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/RunJavaScriptParameters.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSMessageChannelCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSElementInternalsCustom.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_full_alloc_bits.h /usr/src/debug/webkitgtk/2.52
 .6/Source/bmalloc/libpas/src/libpas/pas_try_allocate_common.h /usr/src/debug/webkitgtk/2.52.6/WTF/Headers/wtf/WTFConfig.h /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_page_kind.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/JSDOMWrapperCache.cpp /usr/src/debug/webkitgtk/2.52.6/Source/bmalloc/libpas/src/libpas/pas_tri_state.h /usr/src/debug/webkitgtk/2.52.6/Source/WebCore/bindings/js/ScriptController.h"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-src: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-staticdev: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk-staticdev: PKGV changed from 2.52.5 [default] to 2.52.6 [default]
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk: PV changed from "2.52.5" to "2.52.6"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk: PKGSIZE changed from 135096412 to 135133277 (+0%)
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk: FILELIST: removed "/usr/lib/libwebkitgtk-6.0.so.4.16.9 /usr/lib/libjavascriptcoregtk-6.0.so.1.7.13", added "/usr/lib/libwebkitgtk-6.0.so.4.16.10 /usr/lib/libjavascriptcoregtk-6.0.so.1.7.14"
packages/x86-64-v3-poky-linux/webkitgtk/webkitgtk: PKGV changed from 2.52.5 [default] to 2.52.6 [default]

--===============8710570521830453440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="webkitgtk-changelog.txt"

Changelog for webkitgtk: 2.52.5 -> 2.52.6
Source: Documentation/webkitgtk-6.0/migrating-to-webkitgtk-6.0.html, Documentation/webkitgtk-6.0/signal.BackForwardList.changed.html, Documentation/webkitgtk-6.0/signal.CookieManager.changed.html, Documentation/webkitgtk-6.0/signal.EditorState.changed.html, Documentation/webkitgtk-6.0/signal.FaviconDatabase.favicon-changed.html, Documentation/webkitgtk-6.0/signal.InputMethodContext.preedit-changed.html, Documentation/webkitgtk-6.0/signal.WebView.load-changed.html, Documentation/webkitgtk-6.0/signal.WebView.mouse-target-changed.html, Documentation/webkitgtk-6.0/vfunc.InputMethodContext.preedit_changed.html, Documentation/webkitgtk-6.0/vfunc.WebView.load_changed.html, Documentation/webkitgtk-6.0/vfunc.WebView.mouse_target_changed.html, Documentation/webkitgtk-web-process-extension-6.0/signal.WebEditor.selection-changed.html

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit &ndash; 6.0: Migrating WebKitGTK Applications to GTK 4</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />

  
  <meta property="og:type" content="website"/>

  

  
  <meta property="og:title" content="WebKit: Migrating WebKitGTK Applications to GTK 4"/>
  <meta property="og:description" content="Reference for WebKit-6.0: Migrating WebKitGTK Applications to GTK 4"/>
  <meta name="twitter:title" content="WebKit: Migrating WebKitGTK Applications to GTK 4"/>
  <meta name="twitter:description" content="Reference for WebKit-6.0: Migrating WebKitGTK Applications to GTK 4"/>

  
  <meta name="twitter:card" content="summary"/>

  
  
  
  

  <link rel="stylesheet" href="style.css" type="text/css" />

  

  
  <script src="gtk4-urlmap.js"></script>
  
  
  <script src="fzy.js"></script>
  <script src="search.js"></script>
  
  <script src="main.js"></script>

  
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">
      
      
      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete" placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>
      
      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>
        
        <p>Library Version: 2.52.6</p>
        
      </div>
      
      
      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-docgen</a> 2026.1</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-arrow"></span></button>

    
<section id="main" class="content">
  
  <h4 id="title" style="display:flex;">
    Migrating WebKitGTK Applications to GTK 4
    <a href="#title" class="anchor"></a>
    
  </h4>
  
  <section>
    <div class="docblock">
    <h1 id="migrating-webkitgtk-applications-to-gtk-4">Migrating WebKitGTK Applications to GTK 4<a class="md-anchor" href="#migrating-webkitgtk-applications-to-gtk-4" title="Permanent link"></a></h1>
<p>This document contains guidance to application developers looking to migrate
applications that use WebKitGTK from <span class="caps">GTK</span> 3 to <span class="caps">GTK</span>&nbsp;4.</p>
<p>webkitgtk-6.0 is a new <span class="caps">API</span> version of WebKitGTK designed for use with <span class="caps">GTK</span> 4 and
libsoup 3. This <span class="caps">API</span> version obsoletes webkit2gtk-4.0 and webkit2gtk-4.1, the
<span class="caps">GTK</span> 3 <span class="caps">API</span> versions for libsoup 2 and libsoup 3, respectively. It also obsoletes
webkit2gtk-5.0, which was an earlier unstable <span class="caps">API</span> version for <span class="caps">GTK</span>&nbsp;4.</p>
<h2 id="upgrade-to-libsoup-3">Upgrade to libsoup 3<a class="md-anchor" href="#upgrade-to-libsoup-3" title="Permanent link"></a></h2>
<p>libsoup 2 and libsoup 3 cannot be linked together. If your application currently
uses webkit2gtk-4.0, you must first port to webkit2gtk-4.1 by eliminating use
of libsoup 2. See <a href="https://gnome.pages.gitlab.gnome.org/libsoup/libsoup-3.0/migrating-from-libsoup-2.html">Migrating from libsoup 2</a>
for guidance on this. After first migrating to webkit2gtk-4.1, then it is
time to start looking into&nbsp;webkitgtk-6.0.</p>
<h2 id="stop-using-deprecated-apis">Stop Using Deprecated APIs<a class="md-anchor" href="#stop-using-deprecated-apis" title="Permanent link"></a></h2>
<p>All APIs that were previously deprecated in webkit2gtk-4.0 and webkit2gtk-4.1
have been removed. This includes the original JavaScriptCore <span class="caps">API</span> (e.g.
<code>JSContextRef</code> and <code>JSObjectRef</code>), which has been replaced by the GObject-style
JavaScriptCore <span class="caps">API</span> (e.g. <a href="javascript:void(0)" data-namespace="JavaScriptCore" data-link="class.Context.html" class="external"><code>JSCContext</code></a> and <a href="javascript:void(0)" data-namespace="JavaScriptCore" data-link="class.Value.html" class="external"><code>JSCValue</code></a>)
that is available since 2.22. It also includes the entire GObject <span class="caps">DOM</span> <span class="caps">API</span> (e.g.
<code>WebKitDOMDocument</code>), which has been removed without replacement. Use JavaScript
to interact with and manipulate the <span class="caps">DOM</span> instead, perhaps via
<a href="method.WebView.evaluate_javascript.html"><code>webkit_web_view_evaluate_javascript()</code></a> or
<a href="method.WebView.call_async_javascript_function.html"><code>webkit_web_view_call_async_javascript_function()</code></a> in the <span class="caps">UI</span> process, or
<a href="javascript:void(0)" data-namespace="JavaScriptCore" data-link="method.Value.object_invoke_method.html" class="external"><code>jsc_value_object_invoke_method()</code></a> in the web&nbsp;process.</p>
<p>Run your application with the environment variable <code>G_ENABLE_DIAGNOSTIC=1</code> to
notice use of deprecated signals and&nbsp;properties.</p>
<h2 id="upgrade-to-gtk-4">Upgrade to GTK 4<a class="md-anchor" href="#upgrade-to-gtk-4" title="Permanent link"></a></h2>
<p>After successfully building your webkit2gtk-4.1 application without deprecation
warnings, then it is time to attempt to upgrade to <span class="caps">GTK</span> 4 and webkitgtk-6.0.
This is easier said than done, but <a href="https://docs.gtk.org/gtk4/migrating-3to4.html">the <span class="caps">GTK</span> 4 migration guide</a>
will help. Good&nbsp;luck.</p>
<h2 id="most-types-are-final">Most Types Are Final<a class="md-anchor" href="#most-types-are-final" title="Permanent link"></a></h2>
<p>Only two types are now&nbsp;derivable:</p>
<ul>
<li><a href="class.WebView.html"><code>WebKitWebView</code></a> has been often subclassed to customize its behavior for an
  specific application. This possibility has been kept, as it has proved
  useful in the&nbsp;past.</li>
<li><a href="class.InputMethodContext.html"><code>WebKitInputMethodContext</code></a> is specifically designed in a way that subclassing
  is required to make use of&nbsp;it.</li>
</ul>
<p>The rest of the types are no longer derivable; they are defined with the
<code>G_TYPE_FLAG_FINAL</code> flag set. Use composition instead of&nbsp;derivation.</p>
<h2 id="mandatory-web-process-sandbox">Mandatory Web Process Sandbox<a class="md-anchor" href="#mandatory-web-process-sandbox" title="Permanent link"></a></h2>
<p>The <code>webkit_web_context_set_sandbox_enabled()</code> and <code>webkit_web_context_get_sandbox_enabled()</code>
functions have been removed. The web process sandbox is now always enabled. If
your application&#8217;s web process needs to access extra directories, use
<a href="method.WebContext.add_path_to_sandbox.html"><code>webkit_web_context_add_path_to_sandbox()</code></a> to mount them in the&nbsp;sandbox.</p>
<h2 id="mandatory-process-swap-on-cross-site-navigation">Mandatory Process Swap on Cross-site Navigation<a class="md-anchor" href="#mandatory-process-swap-on-cross-site-navigation" title="Permanent link"></a></h2>
<p>The <code>WebKitWebContext:process-swap-on-cross-site-navigation-enabled</code> property
has been removed. Process swapping is now mandatory. Your application should be
prepared for the web view&#8217;s web process to be replaced when navigating between
different security origins. You can ensure that your application is prepared for
this change before porting to <span class="caps">GTK</span> 4 by testing your application with the
<code>WebKitWebContext:process-swap-on-cross-site-navigation-enabled</code> property
enabled. This property was previously disabled by&nbsp;default.</p>
<h2 id="event-parameter-removed-from-context-menu-and-option-menu-signals">Event Parameter Removed from Context Menu and Option Menu Signals<a class="md-anchor" href="#event-parameter-removed-from-context-menu-and-option-menu-signals" title="Permanent link"></a></h2>
<p><a href="signal.WebView.context-menu.html"><code>WebKitWebView::context-menu</code></a> and <a href="signal.WebView.show-option-menu.html"><code>WebKitWebView::show-option-menu</code></a>
no longer have a <a href="javascript:void(0)" data-namespace="Gdk" data-link="class.Event.html" class="external"><code>GdkEvent</code></a> parameter. Adjust your signal handlers&nbsp;accordingly.</p>
<h2 id="changes-to-webkitwebview-construction">Changes to WebKitWebView Construction<a class="md-anchor" href="#changes-to-webkitwebview-construction" title="Permanent link"></a></h2>
<p><code>webkit_web_view_new_with_context()</code>, <code>webkit_web_view_new_with_settings()</code>,
<code>webkit_web_view_new_with_user_content_manager()</code>, and
<code>webkit_web_view_new_with_related_view()</code> have all been removed. You
may directly use <code>g_object_new()</code> instead. <a href="ctor.WebView.new.html"><code>webkit_web_view_new()</code></a>&nbsp;remains.</p>
<h2 id="network-session-api">Network Session API<a class="md-anchor" href="#network-session-api" title="Permanent link"></a></h2>
<p>WebKit now uses a single global network process for all web contexts, and different
network sessions can be created and used in the same network process. All the networking
APIs have been moved from <a href="class.WebContext.html"><code>WebKitWebContext</code></a> and <a href="class.WebsiteDataManager.html"><code>WebKitWebsiteDataManager</code></a> to the new class
<a href="class.NetworkSession.html"><code>WebKitNetworkSession</code></a>. There&#8217;s a default global persistent session that you can get with
<a href="type_func.NetworkSession.get_default.html"><code>webkit_network_session_get_default()</code></a>. You can also create new sessions with
<a href="ctor.NetworkSession.new.html"><code>webkit_network_session_new()</code></a> for persistent sessions and <a href="ctor.NetworkSession.new_ephemeral.html"><code>webkit_network_session_new_ephemeral()</code></a>
for ephemeral sessions. It&#8217;s no longer possible to create a <a href="class.WebsiteDataManager.html"><code>WebKitWebsiteDataManager</code></a>; it&#8217;s now
created by the <a href="class.NetworkSession.html"><code>WebKitNetworkSession</code></a> automatically at construction time. The <a href="class.NetworkSession.html"><code>WebKitNetworkSession</code></a>
to be used must be passed to the <a href="class.WebView.html"><code>WebKitWebView</code></a> as a construct parameter. You can pass the
same <a href="class.NetworkSession.html"><code>WebKitNetworkSession</code></a> object to several web views to use the same session. The only exception
is automation mode, which uses its own ephemeral session that is configured by the automation
session capabilities. If you notice that your application uses <a href="class.WebContext.html"><code>WebKitWebContext</code></a> or
<a href="class.WebsiteDataManager.html"><code>WebKitWebsiteDataManager</code></a> APIs that no longer exist, look for replacement APIs
in <a href="class.NetworkSession.html"><code>WebKitNetworkSession</code></a>.</p>
<p><code>webkit_web_context_clear_cache()</code> does not have a direct replacement, but you
can use <a href="method.WebsiteDataManager.clear.html"><code>webkit_website_data_manager_clear()</code></a> to achieve the same&nbsp;effect.</p>
<p>The <code>WebKitWebContext::download-started</code> signal has been removed. Use
<a href="signal.NetworkSession.download-started.html"><code>WebKitNetworkSession::download-started</code></a>&nbsp;instead.</p>
<h2 id="favicon-database">Favicon Database<a class="md-anchor" href="#favicon-database" title="Permanent link"></a></h2>
<p><a href="class.FaviconDatabase.html"><code>WebKitFaviconDatabase</code></a> is now owned by <a href="class.WebsiteDataManager.html"><code>WebKitWebsiteDataManager</code></a>
instead of <a href="class.WebContext.html"><code>WebKitWebContext</code></a>. Use
<a href="method.WebsiteDataManager.set_favicons_enabled.html"><code>webkit_website_data_manager_set_favicons_enabled()</code></a> to enable the favicon&nbsp;database.</p>
<p>There is no replacement for <code>webkit_web_context_set_favicon_database_directory()</code>.
Favicons will be stored in the base cache directory of the website data&nbsp;manager.</p>
<h2 id="hardware-acceleration-policy">Hardware Acceleration Policy<a class="md-anchor" href="#hardware-acceleration-policy" title="Permanent link"></a></h2>
<p><code>WEBKIT_HARDWARE_ACCELERATION_POLICY_ON_DEMAND</code> has been removed from
<a href="enum.HardwareAccelerationPolicy.html"><code>WebKitHardwareAccelerationPolicy</code></a>. You may still use
<a href="method.Settings.set_hardware_acceleration_policy.html"><code>webkit_settings_set_hardware_acceleration_policy()</code></a> to enable or disable
hardware&nbsp;acceleration.</p>
<h2 id="scrollbar-appearance">Scrollbar Appearance<a class="md-anchor" href="#scrollbar-appearance" title="Permanent link"></a></h2>
<p>Because <span class="caps">GTK</span> 4 does not contain a foreign drawing <span class="caps">API</span>, it is no longer possible
to draw scrollbars that match arbitrary <span class="caps">GTK</span> themes. Accordingly, the
<code>webkit_web_context_get_use_system_appearance_for_scrollbars</code> and
<code>webkit_web_context_set_use_system_appearance_for_scrollbars</code> APIs have been
removed. WebKit will draw scrollbars that match the Adwaita <span class="caps">GTK</span>&nbsp;theme.</p>
<h2 id="user-script-message-handlers">User Script Message Handlers<a class="md-anchor" href="#user-script-message-handlers" title="Permanent link"></a></h2>
<p><code>webkit_user_content_manager_register_script_message_handler_in_world()</code> and
<code>webkit_user_content_manager_unregister_script_message_handler_in_world()</code> have
been removed. Instead, <a href="method.UserContentManager.register_script_message_handler.html"><code>webkit_user_content_manager_register_script_message_handler()</code></a>
and <a href="method.UserContentManager.unregister_script_message_handler.html"><code>webkit_user_content_manager_unregister_script_message_handler()</code></a> have
gained parameters to specify the script world to&nbsp;use.</p>
<h2 id="download-destination">Download Destination<a class="md-anchor" href="#download-destination" title="Permanent link"></a></h2>
<p><a href="method.Download.set_destination.html"><code>webkit_download_set_destination()</code></a>, <a href="method.Download.get_destination.html"><code>webkit_download_get_destination()</code></a>,
<a href="property.Download.destination.html"><code>WebKitDownload:destination</code></a>, and <a href="signal.Download.created-destination.html"><code>WebKitDownload::created-destination</code></a>
now all use a filesystem path rather than a <span class="caps">URI</span>. All uses must be updated&nbsp;accordingly.</p>
<h2 id="javascript-results">JavaScript Results<a class="md-anchor" href="#javascript-results" title="Permanent link"></a></h2>
<p>WebKitJavascriptResult has been removed. <a href="signal.UserContentManager.script-message-received.html"><code>WebKitUserContentManager::script-message-received</code></a>
now directly returns a <a href="javascript:void(0)" data-namespace="JavaScriptCore" data-link="class.Value.html" class="external"><code>JSCValue</code></a>&nbsp;instead.</p>
<h2 id="web-process-extension">Web Process Extension<a class="md-anchor" href="#web-process-extension" title="Permanent link"></a></h2>
<p>WebKitWebExtension has been renamed to WebKitWebProcessExtension to avoid
confusion with WebExtensions, which are unrelated. This affects many methods and
signals of other objects as well, e.g. <a href="signal.WebContext.initialize-web-process-extensions.html"><code>WebKitWebContext::initialize-web-process-extensions</code></a>.
The name of your extension&#8217;s entry point must now be <code>webkit_web_process_extension_initialize()</code>
or <code>webkit_web_process_extension_initialize_with_user_data()</code>.</p>
<p>Beware that as of WebKitGTK 2.40, the entire web process <span class="caps">API</span> may unfortunately
be removed in the future. For more information on why, see
<a href="https://lists.webkit.org/pipermail/webkit-dev/2022-August/032329.html">this mailing list thread</a>.</p>
    </div>
  </section>
</section>

    
<div id="toc" class="toc">
  <nav aria-labelledby="toc-title">
    <p id="toc-title">Content</p>
    <ul class="toc-list">
      
        
        <li class="toc-list-item"><a href="#upgrade-to-libsoup-3"><span class="link-text">Upgrade to libsoup 3</span></a></li>
        
        <li class="toc-list-item"><a href="#stop-using-deprecated-apis"><span class="link-text">Stop Using Deprecated APIs</span></a></li>
        
        <li class="toc-list-item"><a href="#upgrade-to-gtk-4"><span class="link-text">Upgrade to GTK 4</span></a></li>
        
        <li class="toc-list-item"><a href="#most-types-are-final"><span class="link-text">Most Types Are Final</span></a></li>
        
        <li class="toc-list-item"><a href="#mandatory-web-process-sandbox"><span class="link-text">Mandatory Web Process Sandbox</span></a></li>
        
        <li class="toc-list-item"><a href="#mandatory-process-swap-on-cross-site-navigation"><span class="link-text">Mandatory Process Swap on Cross-site Navigation</span></a></li>
        
        <li class="toc-list-item"><a href="#event-parameter-removed-from-context-menu-and-option-menu-signals"><span class="link-text">Event Parameter Removed from Context Menu and Option Menu Signals</span></a></li>
        
        <li class="toc-list-item"><a href="#changes-to-webkitwebview-construction"><span class="link-text">Changes to WebKitWebView Construction</span></a></li>
        
        <li class="toc-list-item"><a href="#network-session-api"><span class="link-text">Network Session API</span></a></li>
        
        <li class="toc-list-item"><a href="#favicon-database"><span class="link-text">Favicon Database</span></a></li>
        
        <li class="toc-list-item"><a href="#hardware-acceleration-policy"><span class="link-text">Hardware Acceleration Policy</span></a></li>
        
        <li class="toc-list-item"><a href="#scrollbar-appearance"><span class="link-text">Scrollbar Appearance</span></a></li>
        
        <li class="toc-list-item"><a href="#user-script-message-handlers"><span class="link-text">User Script Message Handlers</span></a></li>
        
        <li class="toc-list-item"><a href="#download-destination"><span class="link-text">Download Destination</span></a></li>
        
        <li class="toc-list-item"><a href="#javascript-results"><span class="link-text">JavaScript Results</span></a></li>
        
        <li class="toc-list-item"><a href="#web-process-extension"><span class="link-text">Web Process Extension</span></a></li>
        
      
    </ul>
  </nav>
</div>

    <section id="search" class="content hidden"></section>

    <footer>
    
    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit.BackForwardList::changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />

  
  <meta property="og:type" content="website"/>

  

  
  <meta property="og:title" content="WebKit.BackForwardList::changed"/>
  <meta property="og:description" content="Reference for signal WebKit.BackForwardList::changed"/>
  <meta name="twitter:title" content="WebKit.BackForwardList::changed"/>
  <meta name="twitter:description" content="Reference for signal WebKit.BackForwardList::changed"/>

  
  <meta name="twitter:card" content="summary"/>

  
  
  
  

  <link rel="stylesheet" href="style.css" type="text/css" />

  

  
  <script src="gtk4-urlmap.js"></script>
  
  
  <script src="fzy.js"></script>
  <script src="search.js"></script>
  
  <script src="main.js"></script>

  
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">
      
      
      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete" placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>
      
      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>
        
        <p>Library Version: 2.52.6</p>
        
      </div>
      
<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.BackForwardList.html">BackForwardList</a>
  </div>
</div>
<div class="section">
  <h5>Signals</h5>
  <div class="links">
  
    <a class="signal current" href="signal.BackForwardList.changed.html">changed</a>
  
  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-docgen</a> 2026.1</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-arrow"></span></button>

    
<section id="main" class="content">
  <header>
    <h3>Signal</h3>
    <h1><a href="index.html">WebKit</a><span class="sep"></span><a href="class.BackForwardList.html">BackForwardList</a>::changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p></p>
    </div>
    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>
      </h4>

      <div class="docblock">
        <pre><code><div class="highlight"><pre><span></span><span class="kt">void</span>
<span class="n">changed</span><span class="w"> </span><span class="p">(</span>
<span class="w">  </span><span class="n">WebKitBackForwardList</span><span class="o">*</span><span class="w"> </span><span class="n">self</span><span class="p">,</span>
<span class="w">  </span><span class="n">WebKitBackForwardListItem</span><span class="o">*</span><span class="w"> </span><span class="n">item_added</span><span class="p">,</span>
<span class="w">  </span><span class="n">gpointer</span><span class="w"> </span><span class="n">items_removed</span><span class="p">,</span>
<span class="w">  </span><span class="n">gpointer</span><span class="w"> </span><span class="n">user_data</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description" style="display:flex;">
        Description
        <a href="#description" class="anchor"></a>
        
        <a class="srclink" title="go to source location" href="https://github.com/WebKit/WebKit/tree/main/Source/WebKit/UIProcess/API/glib/WebKitBackForwardList.cpp#L70">[src]</a>
        
      </h4>

      <div class="docblock">
        <p>This signal is emitted when <code>back_forward_list</code> changes. This happens
when the current item is updated, a new item is added or one or more
items are removed. Note that both <code>item_added</code> and <code>items_removed</code> can
<code>NULL</code> when only the current item is updated. Items are only removed
when the list is cleared or the maximum items limit is&nbsp;reached.</p>
      </div>

      <div class="docblock">
        <table>
          <tr><td>Default handler: <p>The default handler is called after the handlers added via <code>g_signal_connect()</code>.</p></td></tr>
          
          
          
          
          
          
          
        </table>
      </div>

      
    </div>

    
    <div class="parameters toggle-wrapper">
      <h4 id="parameters">
        Parameters
        <a href="#parameters" class="anchor"></a>
      </h4>

      <div class="docblock">
        <dl class="arguments">
          
          <dt class="arg-name"><code>item_added</code></dt>
          <dd class="arg-description">
            <p><em>Type:</em>&nbsp;<a href="class.BackForwardListItem.html"><code>WebKitBackForwardListItem</code></a></p>
            <p>The <code>WebKitBackForwardListItem</code> added or <code>NULL</code>.</p>
            <table>
            
            <tr><td>The argument can be <code>NULL</code>.</td></tr>
            
            
            
            
            
            <tr><td title="transfer: none">The data is owned by the caller of the function.</td></tr>
            
            </table>
          </dd>
          
          <dt class="arg-name"><code>items_removed</code></dt>
          <dd class="arg-description">
            <p><em>Type:</em>&nbsp;<code>gpointer</code></p>
            <p>A <code>GList</code> of <code>WebKitBackForwardListItem</code><!-- -->s.</p>
            <table>
            
            <tr><td>The argument can be <code>NULL</code>.</td></tr>
            
            
            
            
            
            <tr><td title="transfer: none">The data is owned by the caller of the function.</td></tr>
            
            </table>
          </dd>
          

          
        </dl>
      </div>
    </div>
    

    

  </section>
</section>

    

    <section id="search" class="content hidden"></section>

    <footer>
    
    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit.CookieManager::changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />

  
  <meta property="og:type" content="website"/>

  

  
  <meta property="og:title" content="WebKit.CookieManager::changed"/>
  <meta property="og:description" content="Reference for signal WebKit.CookieManager::changed"/>
  <meta name="twitter:title" content="WebKit.CookieManager::changed"/>
  <meta name="twitter:description" content="Reference for signal WebKit.CookieManager::changed"/>

  
  <meta name="twitter:card" content="summary"/>

  
  
  
  

  <link rel="stylesheet" href="style.css" type="text/css" />

  

  
  <script src="gtk4-urlmap.js"></script>
  
  
  <script src="fzy.js"></script>
  <script src="search.js"></script>
  
  <script src="main.js"></script>

  
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">
      
      
      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete" placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>
      
      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>
        
        <p>Library Version: 2.52.6</p>
        
      </div>
      
<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.CookieManager.html">CookieManager</a>
  </div>
</div>
<div class="section">
  <h5>Signals</h5>
  <div class="links">
  
    <a class="signal current" href="signal.CookieManager.changed.html">changed</a>
  
  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-docgen</a> 2026.1</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-arrow"></span></button>

    
<section id="main" class="content">
  <header>
    <h3>Signal</h3>
    <h1><a href="index.html">WebKit</a><span class="sep"></span><a href="class.CookieManager.html">CookieManager</a>::changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p></p>
    </div>
    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>
      </h4>

      <div class="docblock">
        <pre><code><div class="highlight"><pre><span></span><span class="kt">void</span>
<span class="n">changed</span><span class="w"> </span><span class="p">(</span>
<span class="w">  </span><span class="n">WebKitCookieManager</span><span class="o">*</span><span class="w"> </span><span class="n">self</span><span class="p">,</span>
<span class="w">  </span><span class="n">gpointer</span><span class="w"> </span><span class="n">user_data</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description" style="display:flex;">
        Description
        <a href="#description" class="anchor"></a>
        
        <a class="srclink" title="go to source location" href="https://github.com/WebKit/WebKit/tree/main/Source/WebKit/UIProcess/API/glib/WebKitCookieManager.cpp#L152">[src]</a>
        
      </h4>

      <div class="docblock">
        <p>This signal is emitted when cookies are added, removed or&nbsp;modified.</p>
      </div>

      <div class="docblock">
        <table>
          <tr><td>Default handler: <p>The default handler is called after the handlers added via <code>g_signal_connect()</code>.</p></td></tr>
          
          
          
          
          
          
          
        </table>
      </div>

      
    </div>

    

    

  </section>
</section>

    

    <section id="search" class="content hidden"></section>

    <footer>
    
    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit.EditorState::changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />

  
  <meta property="og:type" content="website"/>

  

  
  <meta property="og:title" content="WebKit.EditorState::changed"/>
  <meta property="og:description" content="Reference for signal WebKit.EditorState::changed"/>
  <meta name="twitter:title" content="WebKit.EditorState::changed"/>
  <meta name="twitter:description" content="Reference for signal WebKit.EditorState::changed"/>

  
  <meta name="twitter:card" content="summary"/>

  
  
  
  

  <link rel="stylesheet" href="style.css" type="text/css" />

  

  
  <script src="gtk4-urlmap.js"></script>
  
  
  <script src="fzy.js"></script>
  <script src="search.js"></script>
  
  <script src="main.js"></script>

  
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">
      
      
      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete" placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>
      
      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>
        
        <p>Library Version: 2.52.6</p>
        
      </div>
      
<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.EditorState.html">EditorState</a>
  </div>
</div>
<div class="section">
  <h5>Signals</h5>
  <div class="links">
  
    <a class="signal current" href="signal.EditorState.changed.html">changed</a>
  
  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-docgen</a> 2026.1</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-arrow"></span></button>

    
<section id="main" class="content">
  <header>
    <h3>Signal</h3>
    <h1><a href="index.html">WebKit</a><span class="sep"></span><a href="class.EditorState.html">EditorState</a>::changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p><span class="emblem available">since: 2.44</span></p>
    </div>
    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>
      </h4>

      <div class="docblock">
        <pre><code><div class="highlight"><pre><span></span><span class="kt">void</span>
<span class="n">changed</span><span class="w"> </span><span class="p">(</span>
<span class="w">  </span><span class="n">WebKitEditorState</span><span class="o">*</span><span class="w"> </span><span class="n">self</span><span class="p">,</span>
<span class="w">  </span><span class="n">gpointer</span><span class="w"> </span><span class="n">user_data</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description" style="display:flex;">
        Description
        <a href="#description" class="anchor"></a>
        
        <a class="srclink" title="go to source location" href="https://github.com/WebKit/WebKit/tree/main/Source/WebKit/UIProcess/API/glib/WebKitEditorState.cpp#L107">[src]</a>
        
      </h4>

      <div class="docblock">
        <p>Emitted when the <code>WebKitEdtorState</code> is&nbsp;changed.</p>
      </div>

      <div class="docblock">
        <table>
          <tr><td>Default handler: <p>The default handler is called after the handlers added via <code>g_signal_connect()</code>.</p></td></tr>
          
          
          
          
          
          
          <tr><td>Available since: 2.44</td></tr>
          
          
        </table>
      </div>

      
    </div>

    

    

  </section>
</section>

    

    <section id="search" class="content hidden"></section>

    <footer>
    
    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit.FaviconDatabase::favicon-changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />

  
  <meta property="og:type" content="website"/>

  

  
  <meta property="og:title" content="WebKit.FaviconDatabase::favicon-changed"/>
  <meta property="og:description" content="Reference for signal WebKit.FaviconDatabase::favicon-changed"/>
  <meta name="twitter:title" content="WebKit.FaviconDatabase::favicon-changed"/>
  <meta name="twitter:description" content="Reference for signal WebKit.FaviconDatabase::favicon-changed"/>

  
  <meta name="twitter:card" content="summary"/>

  
  
  
  

  <link rel="stylesheet" href="style.css" type="text/css" />

  

  
  <script src="gtk4-urlmap.js"></script>
  
  
  <script src="fzy.js"></script>
  <script src="search.js"></script>
  
  <script src="main.js"></script>

  
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">
      
      
      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete" placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>
      
      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>
        
        <p>Library Version: 2.52.6</p>
        
      </div>
      
<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.FaviconDatabase.html">FaviconDatabase</a>
  </div>
</div>
<div class="section">
  <h5>Signals</h5>
  <div class="links">
  
    <a class="signal current" href="signal.FaviconDatabase.favicon-changed.html">favicon-changed</a>
  
  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-docgen</a> 2026.1</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-arrow"></span></button>

    
<section id="main" class="content">
  <header>
    <h3>Signal</h3>
    <h1><a href="index.html">WebKit</a><span class="sep"></span><a href="class.FaviconDatabase.html">FaviconDatabase</a>::favicon-changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p></p>
    </div>
    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>
      </h4>

      <div class="docblock">
        <pre><code><div class="highlight"><pre><span></span><span class="kt">void</span>
<span class="n">favicon_changed</span><span class="w"> </span><span class="p">(</span>
<span class="w">  </span><span class="n">WebKitFaviconDatabase</span><span class="o">*</span><span class="w"> </span><span class="n">self</span><span class="p">,</span>
<span class="w">  </span><span class="n">gchar</span><span class="o">*</span><span class="w"> </span><span class="n">page_uri</span><span class="p">,</span>
<span class="w">  </span><span class="n">gchar</span><span class="o">*</span><span class="w"> </span><span class="n">favicon_uri</span><span class="p">,</span>
<span class="w">  </span><span class="n">gpointer</span><span class="w"> </span><span class="n">user_data</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description" style="display:flex;">
        Description
        <a href="#description" class="anchor"></a>
        
        <a class="srclink" title="go to source location" href="https://github.com/WebKit/WebKit/tree/main/Source/WebKit/UIProcess/API/glib/WebKitFaviconDatabase.cpp#L77">[src]</a>
        
      </h4>

      <div class="docblock">
        <p>This signal is emitted when the favicon <span class="caps">URI</span> of <code>page_uri</code> has
been changed to <code>favicon_uri</code> in the database. You can connect
to this signal and call <code>webkit_favicon_database_get_favicon()</code>
to get the favicon. If you are interested in the favicon of a
<code>WebKitWebView</code> it&#8217;s easier to use the <code>WebKitWebView:favicon</code>
property. See <code>webkit_web_view_get_favicon()</code> for more&nbsp;details.</p>
      </div>

      <div class="docblock">
        <table>
          <tr><td>Default handler: <p>The default handler is called after the handlers added via <code>g_signal_connect()</code>.</p></td></tr>
          
          
          
          
          
          
          
        </table>
      </div>

      
    </div>

    
    <div class="parameters toggle-wrapper">
      <h4 id="parameters">
        Parameters
        <a href="#parameters" class="anchor"></a>
      </h4>

      <div class="docblock">
        <dl class="arguments">
          
          <dt class="arg-name"><code>page_uri</code></dt>
          <dd class="arg-description">
            <p><em>Type:</em>&nbsp;<code>gchar*</code></p>
            <p>The <span class="caps">URI</span> of the Web page containing the&nbsp;icon.</p>
            <table>
            
            
            
            
            
            
            
            <tr><td title="transfer: none">The data is owned by the caller of the function.</td></tr>
            <tr><td>The value is a NUL terminated UTF-8 string.</td></tr>
            </table>
          </dd>
          
          <dt class="arg-name"><code>favicon_uri</code></dt>
          <dd class="arg-description">
            <p><em>Type:</em>&nbsp;<code>gchar*</code></p>
            <p>The <span class="caps">URI</span> of the&nbsp;favicon.</p>
            <table>
            
            
            
            
            
            
            
            <tr><td title="transfer: none">The data is owned by the caller of the function.</td></tr>
            <tr><td>The value is a NUL terminated UTF-8 string.</td></tr>
            </table>
          </dd>
          

          
        </dl>
      </div>
    </div>
    

    

  </section>
</section>

    

    <section id="search" class="content hidden"></section>

    <footer>
    
    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit.InputMethodContext::preedit-changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />

  
  <meta property="og:type" content="website"/>

  

  
  <meta property="og:title" content="WebKit.InputMethodContext::preedit-changed"/>
  <meta property="og:description" content="Reference for signal WebKit.InputMethodContext::preedit-changed"/>
  <meta name="twitter:title" content="WebKit.InputMethodContext::preedit-changed"/>
  <meta name="twitter:description" content="Reference for signal WebKit.InputMethodContext::preedit-changed"/>

  
  <meta name="twitter:card" content="summary"/>

  
  
  
  

  <link rel="stylesheet" href="style.css" type="text/css" />

  

  
  <script src="gtk4-urlmap.js"></script>
  
  
  <script src="fzy.js"></script>
  <script src="search.js"></script>
  
  <script src="main.js"></script>

  
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">
      
      
      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete" placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>
      
      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>
        
        <p>Library Version: 2.52.6</p>
        
      </div>
      
<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.InputMethodContext.html">InputMethodContext</a>
  </div>
</div>
<div class="section">
  <h5>Signals</h5>
  <div class="links">
  
    <a class="signal" href="signal.InputMethodContext.committed.html">committed</a>
  
    <a class="signal" href="signal.InputMethodContext.delete-surrounding.html">delete-surrounding</a>
  
    <a class="signal current" href="signal.InputMethodContext.preedit-changed.html">preedit-changed</a>
  
    <a class="signal" href="signal.InputMethodContext.preedit-finished.html">preedit-finished</a>
  
    <a class="signal" href="signal.InputMethodContext.preedit-started.html">preedit-started</a>
  
  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-docgen</a> 2026.1</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-arrow"></span></button>

    
<section id="main" class="content">
  <header>
    <h3>Signal</h3>
    <h1><a href="index.html">WebKit</a><span class="sep"></span><a href="class.InputMethodContext.html">InputMethodContext</a>::preedit-changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p><span class="emblem available">since: 2.28</span></p>
    </div>
    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>
      </h4>

      <div class="docblock">
        <pre><code><div class="highlight"><pre><span></span><span class="kt">void</span>
<span class="n">preedit_changed</span><span class="w"> </span><span class="p">(</span>
<span class="w">  </span><span class="n">WebKitInputMethodContext</span><span class="o">*</span><span class="w"> </span><span class="n">self</span><span class="p">,</span>
<span class="w">  </span><span class="n">gpointer</span><span class="w"> </span><span class="n">user_data</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description" style="display:flex;">
        Description
        <a href="#description" class="anchor"></a>
        
        <a class="srclink" title="go to source location" href="https://github.com/WebKit/WebKit/tree/main/Source/WebKit/UIProcess/API/glib/WebKitInputMethodContext.cpp#L272">[src]</a>
        
      </h4>

      <div class="docblock">
        <p>Emitted whenever the preedit sequence currently being entered has changed.
It is also emitted at the end of a preedit sequence, in which case
<code>webkit_input_method_context_get_preedit()</code> returns the empty&nbsp;string.</p>
      </div>

      <div class="docblock">
        <table>
          <tr><td>Default handler: <p>The default handler is called after the handlers added via <code>g_signal_connect()</code>.</p></td></tr>
          
          
          
          
          
          
          <tr><td>Available since: 2.28</td></tr>
          
          
        </table>
      </div>

      
    </div>

    

    

  </section>
</section>

    

    <section id="search" class="content hidden"></section>

    <footer>
    
    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit.WebView::load-changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />

  
  <meta property="og:type" content="website"/>

  

  
  <meta property="og:title" content="WebKit.WebView::load-changed"/>
  <meta property="og:description" content="Reference for signal WebKit.WebView::load-changed"/>
  <meta name="twitter:title" content="WebKit.WebView::load-changed"/>
  <meta name="twitter:description" content="Reference for signal WebKit.WebView::load-changed"/>

  
  <meta name="twitter:card" content="summary"/>

  
  
  
  

  <link rel="stylesheet" href="style.css" type="text/css" />

  

  
  <script src="gtk4-urlmap.js"></script>
  
  
  <script src="fzy.js"></script>
  <script src="search.js"></script>
  
  <script src="main.js"></script>

  
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">
      
      
      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete" placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>
      
      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>
        
        <p>Library Version: 2.52.6</p>
        
      </div>
      
<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.WebView.html">WebView</a>
  </div>
</div>
<div class="section">
  <h5>Signals</h5>
  <div class="links">
  
    <a class="signal" href="signal.WebView.authenticate.html">authenticate</a>
  
    <a class="signal" href="signal.WebView.close.html">close</a>
  
    <a class="signal" href="signal.WebView.context-menu.html">context-menu</a>
  
    <a class="signal" href="signal.WebView.context-menu-dismissed.html">context-menu-dismissed</a>
  
    <a class="signal" href="signal.WebView.create.html">create</a>
  
    <a class="signal" href="signal.WebView.decide-policy.html">decide-policy</a>
  
    <a class="signal" href="signal.WebView.enter-fullscreen.html">enter-fullscreen</a>
  
    <a class="signal" href="signal.WebView.insecure-content-detected.html">insecure-content-detected</a>
  
    <a class="signal" href="signal.WebView.leave-fullscreen.html">leave-fullscreen</a>
  
    <a class="signal current" href="signal.WebView.load-changed.html">load-changed</a>
  
    <a class="signal" href="signal.WebView.load-failed.html">load-failed</a>
  
    <a class="signal" href="signal.WebView.load-failed-with-tls-errors.html">load-failed-with-tls-errors</a>
  
    <a class="signal" href="signal.WebView.mouse-target-changed.html">mouse-target-changed</a>
  
    <a class="signal" href="signal.WebView.permission-request.html">permission-request</a>
  
    <a class="signal" href="signal.WebView.print.html">print</a>
  
    <a class="signal" href="signal.WebView.query-permission-state.html">query-permission-state</a>
  
    <a class="signal" href="signal.WebView.ready-to-show.html">ready-to-show</a>
  
    <a class="signal" href="signal.WebView.resource-load-started.html">resource-load-started</a>
  
    <a class="signal" href="signal.WebView.run-as-modal.html">run-as-modal</a>
  
    <a class="signal" href="signal.WebView.run-color-chooser.html">run-color-chooser</a>
  
    <a class="signal" href="signal.WebView.run-file-chooser.html">run-file-chooser</a>
  
    <a class="signal" href="signal.WebView.script-dialog.html">script-dialog</a>
  
    <a class="signal" href="signal.WebView.show-notification.html">show-notification</a>
  
    <a class="signal" href="signal.WebView.show-option-menu.html">show-option-menu</a>
  
    <a class="signal" href="signal.WebView.submit-form.html">submit-form</a>
  
    <a class="signal" href="signal.WebView.user-message-received.html">user-message-received</a>
  
    <a class="signal" href="signal.WebView.web-process-terminated.html">web-process-terminated</a>
  
  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-docgen</a> 2026.1</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-arrow"></span></button>

    
<section id="main" class="content">
  <header>
    <h3>Signal</h3>
    <h1><a href="index.html">WebKit</a><span class="sep"></span><a href="class.WebView.html">WebView</a>::load-changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p></p>
    </div>
    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>
      </h4>

      <div class="docblock">
        <pre><code><div class="highlight"><pre><span></span><span class="kt">void</span>
<span class="n">load_changed</span><span class="w"> </span><span class="p">(</span>
<span class="w">  </span><span class="n">WebKitWebView</span><span class="o">*</span><span class="w"> </span><span class="n">self</span><span class="p">,</span>
<span class="w">  </span><span class="n">WebKitLoadEvent</span><span class="w"> </span><span class="n">load_event</span><span class="p">,</span>
<span class="w">  </span><span class="n">gpointer</span><span class="w"> </span><span class="n">user_data</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description" style="display:flex;">
        Description
        <a href="#description" class="anchor"></a>
        
        <a class="srclink" title="go to source location" href="https://github.com/WebKit/WebKit/tree/main/Source/WebKit/UIProcess/API/glib/WebKitWebView.cpp#L1800">[src]</a>
        
      </h4>

      <div class="docblock">
        <p>Emitted when a load operation in <code>web_view</code> changes.
The signal is always emitted with <code>WEBKIT_LOAD_STARTED</code> when a
new load request is made and <code>WEBKIT_LOAD_FINISHED</code> when the load
finishes successfully or due to an error. When the ongoing load
operation fails <code>WebKitWebView::load-failed</code> signal is emitted
before <code>WebKitWebView::load-changed</code> is emitted with
<code>WEBKIT_LOAD_FINISHED</code>.
If a redirection is received from the server, this signal is emitted
with <code>WEBKIT_LOAD_REDIRECTED</code> after the initial emission with
<code>WEBKIT_LOAD_STARTED</code> and before <code>WEBKIT_LOAD_COMMITTED</code>.
When the page content starts arriving the signal is emitted with
<code>WEBKIT_LOAD_COMMITTED</code> event.</p>
<p>You can handle this signal and use a switch to track any ongoing
load&nbsp;operation.</p>
<div class="codehilite"><pre><span></span><code><span class="k">static</span><span class="w"> </span><span class="kt">void</span><span class="w"> </span><span class="nf">web_view_load_changed</span><span class="w"> </span><span class="p">(</span><span class="n">WebKitWebView</span><span class="w">  </span><span class="o">*</span><span class="n">web_view</span><span class="p">,</span>
<span class="w">                                   </span><span class="n">WebKitLoadEvent</span><span class="w"> </span><span class="n">load_event</span><span class="p">,</span>
<span class="w">                                   </span><span class="n">gpointer</span><span class="w">        </span><span class="n">user_data</span><span class="p">)</span>
<span class="p">{</span>
<span class="w">    </span><span class="k">switch</span><span class="w"> </span><span class="p">(</span><span class="n">load_event</span><span class="p">)</span><span class="w"> </span><span class="p">{</span>
<span class="w">    </span><span class="k">case</span><span class="w"> </span><span class="no">WEBKIT_LOAD_STARTED</span><span class="p">:</span>
<span class="w">        </span><span class="c1">// New load, we have now a provisional URI</span>
<span class="w">        </span><span class="n">provisional_uri</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="n">webkit_web_view_get_uri</span><span class="w"> </span><span class="p">(</span><span class="n">web_view</span><span class="p">);</span>
<span class="w">        </span><span class="c1">// Here we could start a spinner or update the</span>
<span class="w">        </span><span class="c1">// location bar with the provisional URI</span>
<span class="w">        </span><span class="k">break</span><span class="p">;</span>
<span class="w">    </span><span class="k">case</span><span class="w"> </span><span class="no">WEBKIT_LOAD_REDIRECTED</span><span class="p">:</span>
<span class="w">        </span><span class="n">redirected_uri</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="n">webkit_web_view_get_uri</span><span class="w"> </span><span class="p">(</span><span class="n">web_view</span><span class="p">);</span>
<span class="w">        </span><span class="k">break</span><span class="p">;</span>
<span class="w">    </span><span class="k">case</span><span class="w"> </span><span class="no">WEBKIT_LOAD_COMMITTED</span><span class="p">:</span>
<span class="w">        </span><span class="c1">// The load is being performed. Current URI is</span>
<span class="w">        </span><span class="c1">// the final one and it won&#39;t change unless a new</span>
<span class="w">        </span><span class="c1">// load is requested or a navigation within the</span>
<span class="w">        </span><span class="c1">// same page is performed</span>
<span class="w">        </span><span class="n">uri</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="n">webkit_web_view_get_uri</span><span class="w"> </span><span class="p">(</span><span class="n">web_view</span><span class="p">);</span>
<span class="w">        </span><span class="k">break</span><span class="p">;</span>
<span class="w">    </span><span class="k">case</span><span class="w"> </span><span class="no">WEBKIT_LOAD_FINISHED</span><span class="p">:</span>
<span class="w">        </span><span class="c1">// Load finished, we can now stop the spinner</span>
<span class="w">        </span><span class="k">break</span><span class="p">;</span>
<span class="w">    </span><span class="p">}</span>
<span class="p">}</span>
</code></pre></div>
      </div>

      <div class="docblock">
        <table>
          <tr><td>Default handler: <p>The default handler is called after the handlers added via <code>g_signal_connect()</code>.</p></td></tr>
          
          
          
          
          
          
          
        </table>
      </div>

      
    </div>

    
    <div class="parameters toggle-wrapper">
      <h4 id="parameters">
        Parameters
        <a href="#parameters" class="anchor"></a>
      </h4>

      <div class="docblock">
        <dl class="arguments">
          
          <dt class="arg-name"><code>load_event</code></dt>
          <dd class="arg-description">
            <p><em>Type:</em>&nbsp;<a href="enum.LoadEvent.html"><code>WebKitLoadEvent</code></a></p>
            <p>The <code>WebKitLoadEvent</code>.</p>
            <table>
            
            
            
            
            
            
            
            
            
            </table>
          </dd>
          

          
        </dl>
      </div>
    </div>
    

    

  </section>
</section>

    

    <section id="search" class="content hidden"></section>

    <footer>
    
    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit.WebView::mouse-target-changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />

  
  <meta property="og:type" content="website"/>

  

  
  <meta property="og:title" content="WebKit.WebView::mouse-target-changed"/>
  <meta property="og:description" content="Reference for signal WebKit.WebView::mouse-target-changed"/>
  <meta name="twitter:title" content="WebKit.WebView::mouse-target-changed"/>
  <meta name="twitter:description" content="Reference for signal WebKit.WebView::mouse-target-changed"/>

  
  <meta name="twitter:card" content="summary"/>

  
  
  
  

  <link rel="stylesheet" href="style.css" type="text/css" />

  

  
  <script src="gtk4-urlmap.js"></script>
  
  
  <script src="fzy.js"></script>
  <script src="search.js"></script>
  
  <script src="main.js"></script>

  
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">
      
      
      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete" placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>
      
      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>
        
        <p>Library Version: 2.52.6</p>
        
      </div>
      
<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.WebView.html">WebView</a>
  </div>
</div>
<div class="section">
  <h5>Signals</h5>
  <div class="links">
  
    <a class="signal" href="signal.WebView.authenticate.html">authenticate</a>
  
    <a class="signal" href="signal.WebView.close.html">close</a>
  
    <a class="signal" href="signal.WebView.context-menu.html">context-menu</a>
  
    <a class="signal" href="signal.WebView.context-menu-dismissed.html">context-menu-dismissed</a>
  
    <a class="signal" href="signal.WebView.create.html">create</a>
  
    <a class="signal" href="signal.WebView.decide-policy.html">decide-policy</a>
  
    <a class="signal" href="signal.WebView.enter-fullscreen.html">enter-fullscreen</a>
  
    <a class="signal" href="signal.WebView.insecure-content-detected.html">insecure-content-detected</a>
  
    <a class="signal" href="signal.WebView.leave-fullscreen.html">leave-fullscreen</a>
  
    <a class="signal" href="signal.WebView.load-changed.html">load-changed</a>
  
    <a class="signal" href="signal.WebView.load-failed.html">load-failed</a>
  
    <a class="signal" href="signal.WebView.load-failed-with-tls-errors.html">load-failed-with-tls-errors</a>
  
    <a class="signal current" href="signal.WebView.mouse-target-changed.html">mouse-target-changed</a>
  
    <a class="signal" href="signal.WebView.permission-request.html">permission-request</a>
  
    <a class="signal" href="signal.WebView.print.html">print</a>
  
    <a class="signal" href="signal.WebView.query-permission-state.html">query-permission-state</a>
  
    <a class="signal" href="signal.WebView.ready-to-show.html">ready-to-show</a>
  
    <a class="signal" href="signal.WebView.resource-load-started.html">resource-load-started</a>
  
    <a class="signal" href="signal.WebView.run-as-modal.html">run-as-modal</a>
  
    <a class="signal" href="signal.WebView.run-color-chooser.html">run-color-chooser</a>
  
    <a class="signal" href="signal.WebView.run-file-chooser.html">run-file-chooser</a>
  
    <a class="signal" href="signal.WebView.script-dialog.html">script-dialog</a>
  
    <a class="signal" href="signal.WebView.show-notification.html">show-notification</a>
  
    <a class="signal" href="signal.WebView.show-option-menu.html">show-option-menu</a>
  
    <a class="signal" href="signal.WebView.submit-form.html">submit-form</a>
  
    <a class="signal" href="signal.WebView.user-message-received.html">user-message-received</a>
  
    <a class="signal" href="signal.WebView.web-process-terminated.html">web-process-terminated</a>
  
  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-docgen</a> 2026.1</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-arrow"></span></button>

    
<section id="main" class="content">
  <header>
    <h3>Signal</h3>
    <h1><a href="index.html">WebKit</a><span class="sep"></span><a href="class.WebView.html">WebView</a>::mouse-target-changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p></p>
    </div>
    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>
      </h4>

      <div class="docblock">
        <pre><code><div class="highlight"><pre><span></span><span class="kt">void</span>
<span class="n">mouse_target_changed</span><span class="w"> </span><span class="p">(</span>
<span class="w">  </span><span class="n">WebKitWebView</span><span class="o">*</span><span class="w"> </span><span class="n">self</span><span class="p">,</span>
<span class="w">  </span><span class="n">WebKitHitTestResult</span><span class="o">*</span><span class="w"> </span><span class="n">hit_test_result</span><span class="p">,</span>
<span class="w">  </span><span class="n">guint</span><span class="w"> </span><span class="n">modifiers</span><span class="p">,</span>
<span class="w">  </span><span class="n">gpointer</span><span class="w"> </span><span class="n">user_data</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description" style="display:flex;">
        Description
        <a href="#description" class="anchor"></a>
        
        <a class="srclink" title="go to source location" href="https://github.com/WebKit/WebKit/tree/main/Source/WebKit/UIProcess/API/glib/WebKitWebView.cpp#L2201">[src]</a>
        
      </h4>

      <div class="docblock">
        <p>This signal is emitted when the mouse cursor moves over an
element such as a link, image or a media element. To determine
what type of element the mouse cursor is over, a Hit Test is performed
on the current mouse coordinates and the result is passed in the
<code>hit_test_result</code> argument. The <code>modifiers</code> argument is a bitmask of
<code>GdkModifierType</code> flags indicating the state of modifier keys.
The signal is emitted again when the mouse is moved out of the
current element with a new <code>hit_test_result</code>.</p>
      </div>

      <div class="docblock">
        <table>
          <tr><td>Default handler: <p>The default handler is called after the handlers added via <code>g_signal_connect()</code>.</p></td></tr>
          
          
          
          
          
          
          
        </table>
      </div>

      
    </div>

    
    <div class="parameters toggle-wrapper">
      <h4 id="parameters">
        Parameters
        <a href="#parameters" class="anchor"></a>
      </h4>

      <div class="docblock">
        <dl class="arguments">
          
          <dt class="arg-name"><code>hit_test_result</code></dt>
          <dd class="arg-description">
            <p><em>Type:</em>&nbsp;<a href="class.HitTestResult.html"><code>WebKitHitTestResult</code></a></p>
            <p>A <code>WebKitHitTestResult</code>.</p>
            <table>
            
            
            
            
            
            
            
            <tr><td title="transfer: none">The data is owned by the caller of the function.</td></tr>
            
            </table>
          </dd>
          
          <dt class="arg-name"><code>modifiers</code></dt>
          <dd class="arg-description">
            <p><em>Type:</em>&nbsp;<code>guint</code></p>
            <p>A bitmask of <code>GdkModifierType</code>.</p>
            <table>
            
            
            
            
            
            
            
            
            
            </table>
          </dd>
          

          
        </dl>
      </div>
    </div>
    

    

  </section>
</section>

    

    <section id="search" class="content hidden"></section>

    <footer>
    
    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit.InputMethodContext.preedit_changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />

  
  <meta property="og:type" content="website"/>

  

  
  <meta property="og:title" content="WebKit.InputMethodContext.preedit_changed"/>
  <meta property="og:description" content="Reference for WebKit.InputMethodContext.preedit_changed"/>
  <meta name="twitter:title" content="WebKit.InputMethodContext.preedit_changed"/>
  <meta name="twitter:description" content="Reference for WebKit.InputMethodContext.preedit_changed"/>

  
  <meta name="twitter:card" content="summary"/>

  
  
  
  

  <link rel="stylesheet" href="style.css" type="text/css" />

  

  
  <script src="gtk4-urlmap.js"></script>
  
  
  <script src="fzy.js"></script>
  <script src="search.js"></script>
  
  <script src="main.js"></script>

  
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">
      
      
      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete" placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>
      
      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>
        
        <p>Library Version: 2.52.6</p>
        
      </div>
      
<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.InputMethodContext.html">InputMethodContext</a>
  </div>
</div>
<div class="section">
  <h5>Virtual methods</h5>
  <div class="links">
  
    <a class="method" href="vfunc.InputMethodContext.committed.html">committed</a>
  
    <a class="method" href="vfunc.InputMethodContext.delete_surrounding.html">delete_surrounding</a>
  
    <a class="method" href="vfunc.InputMethodContext.filter_key_event.html">filter_key_event</a>
  
    <a class="method" href="vfunc.InputMethodContext.get_preedit.html">get_preedit</a>
  
    <a class="method" href="vfunc.InputMethodContext.notify_cursor_area.html">notify_cursor_area</a>
  
    <a class="method" href="vfunc.InputMethodContext.notify_focus_in.html">notify_focus_in</a>
  
    <a class="method" href="vfunc.InputMethodContext.notify_focus_out.html">notify_focus_out</a>
  
    <a class="method" href="vfunc.InputMethodContext.notify_surrounding.html">notify_surrounding</a>
  
    <a class="method current" href="vfunc.InputMethodContext.preedit_changed.html">preedit_changed</a>
  
    <a class="method" href="vfunc.InputMethodContext.preedit_finished.html">preedit_finished</a>
  
    <a class="method" href="vfunc.InputMethodContext.preedit_started.html">preedit_started</a>
  
    <a class="method" href="vfunc.InputMethodContext.reset.html">reset</a>
  
    <a class="method" href="vfunc.InputMethodContext.set_enable_preedit.html">set_enable_preedit</a>
  
  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-docgen</a> 2026.1</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-arrow"></span></button>

    
<section id="main" class="content">
  <header>
    <h3>Virtual Method</h3>
    <h1><a href="index.html">WebKit</a><span class="sep"></span><a href="class.InputMethodContext.html">InputMethodContext</a><span class="sep"></span>preedit_changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p></p>
    </div>

    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>
        
        <a class="srclink" title="go to source location" href="https://github.com/WebKit/WebKit/tree/main/WebKitBuild/GTK/Release/WebKitGTK/DerivedSources/webkit/WebKitInputMethodContext.h#L96">[src]</a>
        
      </h4>

      <div class="docblock c-decl">
        <pre><code><div class="highlight"><pre><span></span><span class="kt">void</span>
<span class="n">preedit_changed</span><span class="w"> </span><span class="p">(</span>
<span class="w">  </span><span class="n">WebKitInputMethodContext</span><span class="o">*</span><span class="w"> </span><span class="n">context</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description">
        Description
        <a href="#description" class="anchor"></a>
        
      </h4>

      <div class="docblock">
        <p>No description available.</p>
      </div>

      <div class="docblock">
        
        
        
      </div>

      
    </div>

    

    

  </section>
</section>

    

    <section id="search" class="content hidden"></section>

    <footer>
    
    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit.WebView.load_changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />

  
  <meta property="og:type" content="website"/>

  

  
  <meta property="og:title" content="WebKit.WebView.load_changed"/>
  <meta property="og:description" content="Reference for WebKit.WebView.load_changed"/>
  <meta name="twitter:title" content="WebKit.WebView.load_changed"/>
  <meta name="twitter:description" content="Reference for WebKit.WebView.load_changed"/>

  
  <meta name="twitter:card" content="summary"/>

  
  
  
  

  <link rel="stylesheet" href="style.css" type="text/css" />

  

  
  <script src="gtk4-urlmap.js"></script>
  
  
  <script src="fzy.js"></script>
  <script src="search.js"></script>
  
  <script src="main.js"></script>

  
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">
      
      
      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete" placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>
      
      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>
        
        <p>Library Version: 2.52.6</p>
        
      </div>
      
<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.WebView.html">WebView</a>
  </div>
</div>
<div class="section">
  <h5>Virtual methods</h5>
  <div class="links">
  
    <a class="method" href="vfunc.WebView.authenticate.html">authenticate</a>
  
    <a class="method" href="vfunc.WebView.close.html">close</a>
  
    <a class="method" href="vfunc.WebView.context_menu.html">context_menu</a>
  
    <a class="method" href="vfunc.WebView.context_menu_dismissed.html">context_menu_dismissed</a>
  
    <a class="method" href="vfunc.WebView.create.html">create</a>
  
    <a class="method" href="vfunc.WebView.decide_policy.html">decide_policy</a>
  
    <a class="method" href="vfunc.WebView.enter_fullscreen.html">enter_fullscreen</a>
  
    <a class="method" href="vfunc.WebView.insecure_content_detected.html">insecure_content_detected</a>
  
    <a class="method" href="vfunc.WebView.leave_fullscreen.html">leave_fullscreen</a>
  
    <a class="method current" href="vfunc.WebView.load_changed.html">load_changed</a>
  
    <a class="method" href="vfunc.WebView.load_failed.html">load_failed</a>
  
    <a class="method" href="vfunc.WebView.load_failed_with_tls_errors.html">load_failed_with_tls_errors</a>
  
    <a class="method" href="vfunc.WebView.mouse_target_changed.html">mouse_target_changed</a>
  
    <a class="method" href="vfunc.WebView.permission_request.html">permission_request</a>
  
    <a class="method" href="vfunc.WebView.print.html">print</a>
  
    <a class="method" href="vfunc.WebView.query_permission_state.html">query_permission_state</a>
  
    <a class="method" href="vfunc.WebView.ready_to_show.html">ready_to_show</a>
  
    <a class="method" href="vfunc.WebView.resource_load_started.html">resource_load_started</a>
  
    <a class="method" href="vfunc.WebView.run_as_modal.html">run_as_modal</a>
  
    <a class="method" href="vfunc.WebView.run_color_chooser.html">run_color_chooser</a>
  
    <a class="method" href="vfunc.WebView.run_file_chooser.html">run_file_chooser</a>
  
    <a class="method" href="vfunc.WebView.script_dialog.html">script_dialog</a>
  
    <a class="method" href="vfunc.WebView.show_notification.html">show_notification</a>
  
    <a class="method" href="vfunc.WebView.show_option_menu.html">show_option_menu</a>
  
    <a class="method" href="vfunc.WebView.submit_form.html">submit_form</a>
  
    <a class="method" href="vfunc.WebView.user_message_received.html">user_message_received</a>
  
    <a class="method" href="vfunc.WebView.web_process_crashed.html">web_process_crashed</a>
  
    <a class="method" href="vfunc.WebView.web_process_terminated.html">web_process_terminated</a>
  
  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-docgen</a> 2026.1</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-arrow"></span></button>

    
<section id="main" class="content">
  <header>
    <h3>Virtual Method</h3>
    <h1><a href="index.html">WebKit</a><span class="sep"></span><a href="class.WebView.html">WebView</a><span class="sep"></span>load_changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p></p>
    </div>

    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>
        
        <a class="srclink" title="go to source location" href="https://github.com/WebKit/WebKit/tree/main/WebKitBuild/GTK/Release/WebKitGTK/DerivedSources/webkit/WebKitWebView.h#L247">[src]</a>
        
      </h4>

      <div class="docblock c-decl">
        <pre><code><div class="highlight"><pre><span></span><span class="kt">void</span>
<span class="n">load_changed</span><span class="w"> </span><span class="p">(</span>
<span class="w">  </span><span class="n">WebKitWebView</span><span class="o">*</span><span class="w"> </span><span class="n">web_view</span><span class="p">,</span>
<span class="w">  </span><span class="n">WebKitLoadEvent</span><span class="w"> </span><span class="n">load_event</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description">
        Description
        <a href="#description" class="anchor"></a>
        
      </h4>

      <div class="docblock">
        <p>No description available.</p>
      </div>

      <div class="docblock">
        
        
        
      </div>

      
    </div>

    
    <div class="parameters toggle-wrapper">
      <h4 id="parameters">
        Parameters
        <a href="#parameters" class="anchor"></a>
      </h4>

      <div class="docblock">
        <dl class="arguments">
          
          <dt class="arg-name"><code>load_event</code></dt>
          <dd class="arg-description">
            <p><em>Type:</em>&nbsp;<a href="enum.LoadEvent.html"><code>WebKitLoadEvent</code></a></p>
            <p>No description available.</p>
            <table>
            
            
            
            
            
            
            
            
            
            </table>
          </dd>
          

          
        </dl>
      </div>
    </div>
    

    

  </section>
</section>

    

    <section id="search" class="content hidden"></section>

    <footer>
    
    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKit.WebView.mouse_target_changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />

  
  <meta property="og:type" content="website"/>

  

  
  <meta property="og:title" content="WebKit.WebView.mouse_target_changed"/>
  <meta property="og:description" content="Reference for WebKit.WebView.mouse_target_changed"/>
  <meta name="twitter:title" content="WebKit.WebView.mouse_target_changed"/>
  <meta name="twitter:description" content="Reference for WebKit.WebView.mouse_target_changed"/>

  
  <meta name="twitter:card" content="summary"/>

  
  
  
  

  <link rel="stylesheet" href="style.css" type="text/css" />

  

  
  <script src="gtk4-urlmap.js"></script>
  
  
  <script src="fzy.js"></script>
  <script src="search.js"></script>
  
  <script src="main.js"></script>

  
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">
      
      
      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete" placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>
      
      <div class="section namespace">
        <h3><a href="index.html">WebKit</a></h3>
        <p>API Version: 6.0</p>
        
        <p>Library Version: 2.52.6</p>
        
      </div>
      
<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.WebView.html">WebView</a>
  </div>
</div>
<div class="section">
  <h5>Virtual methods</h5>
  <div class="links">
  
    <a class="method" href="vfunc.WebView.authenticate.html">authenticate</a>
  
    <a class="method" href="vfunc.WebView.close.html">close</a>
  
    <a class="method" href="vfunc.WebView.context_menu.html">context_menu</a>
  
    <a class="method" href="vfunc.WebView.context_menu_dismissed.html">context_menu_dismissed</a>
  
    <a class="method" href="vfunc.WebView.create.html">create</a>
  
    <a class="method" href="vfunc.WebView.decide_policy.html">decide_policy</a>
  
    <a class="method" href="vfunc.WebView.enter_fullscreen.html">enter_fullscreen</a>
  
    <a class="method" href="vfunc.WebView.insecure_content_detected.html">insecure_content_detected</a>
  
    <a class="method" href="vfunc.WebView.leave_fullscreen.html">leave_fullscreen</a>
  
    <a class="method" href="vfunc.WebView.load_changed.html">load_changed</a>
  
    <a class="method" href="vfunc.WebView.load_failed.html">load_failed</a>
  
    <a class="method" href="vfunc.WebView.load_failed_with_tls_errors.html">load_failed_with_tls_errors</a>
  
    <a class="method current" href="vfunc.WebView.mouse_target_changed.html">mouse_target_changed</a>
  
    <a class="method" href="vfunc.WebView.permission_request.html">permission_request</a>
  
    <a class="method" href="vfunc.WebView.print.html">print</a>
  
    <a class="method" href="vfunc.WebView.query_permission_state.html">query_permission_state</a>
  
    <a class="method" href="vfunc.WebView.ready_to_show.html">ready_to_show</a>
  
    <a class="method" href="vfunc.WebView.resource_load_started.html">resource_load_started</a>
  
    <a class="method" href="vfunc.WebView.run_as_modal.html">run_as_modal</a>
  
    <a class="method" href="vfunc.WebView.run_color_chooser.html">run_color_chooser</a>
  
    <a class="method" href="vfunc.WebView.run_file_chooser.html">run_file_chooser</a>
  
    <a class="method" href="vfunc.WebView.script_dialog.html">script_dialog</a>
  
    <a class="method" href="vfunc.WebView.show_notification.html">show_notification</a>
  
    <a class="method" href="vfunc.WebView.show_option_menu.html">show_option_menu</a>
  
    <a class="method" href="vfunc.WebView.submit_form.html">submit_form</a>
  
    <a class="method" href="vfunc.WebView.user_message_received.html">user_message_received</a>
  
    <a class="method" href="vfunc.WebView.web_process_crashed.html">web_process_crashed</a>
  
    <a class="method" href="vfunc.WebView.web_process_terminated.html">web_process_terminated</a>
  
  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-docgen</a> 2026.1</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-arrow"></span></button>

    
<section id="main" class="content">
  <header>
    <h3>Virtual Method</h3>
    <h1><a href="index.html">WebKit</a><span class="sep"></span><a href="class.WebView.html">WebView</a><span class="sep"></span>mouse_target_changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p></p>
    </div>

    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>
        
        <a class="srclink" title="go to source location" href="https://github.com/WebKit/WebKit/tree/main/WebKitBuild/GTK/Release/WebKitGTK/DerivedSources/webkit/WebKitWebView.h#L269">[src]</a>
        
      </h4>

      <div class="docblock c-decl">
        <pre><code><div class="highlight"><pre><span></span><span class="kt">void</span>
<span class="n">mouse_target_changed</span><span class="w"> </span><span class="p">(</span>
<span class="w">  </span><span class="n">WebKitWebView</span><span class="o">*</span><span class="w"> </span><span class="n">web_view</span><span class="p">,</span>
<span class="w">  </span><span class="n">WebKitHitTestResult</span><span class="o">*</span><span class="w"> </span><span class="n">hit_test_result</span><span class="p">,</span>
<span class="w">  </span><span class="n">guint</span><span class="w"> </span><span class="n">modifiers</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description">
        Description
        <a href="#description" class="anchor"></a>
        
      </h4>

      <div class="docblock">
        <p>No description available.</p>
      </div>

      <div class="docblock">
        
        
        
      </div>

      
    </div>

    
    <div class="parameters toggle-wrapper">
      <h4 id="parameters">
        Parameters
        <a href="#parameters" class="anchor"></a>
      </h4>

      <div class="docblock">
        <dl class="arguments">
          
          <dt class="arg-name"><code>hit_test_result</code></dt>
          <dd class="arg-description">
            <p><em>Type:</em>&nbsp;<a href="class.HitTestResult.html"><code>WebKitHitTestResult</code></a></p>
            <p>No description available.</p>
            <table>
            
            
            
            
            
            
            
            <tr><td title="transfer: none">The data is owned by the caller of the method.</td></tr>
            
            </table>
          </dd>
          
          <dt class="arg-name"><code>modifiers</code></dt>
          <dd class="arg-description">
            <p><em>Type:</em>&nbsp;<code>guint</code></p>
            <p>No description available.</p>
            <table>
            
            
            
            
            
            
            
            
            
            </table>
          </dd>
          

          
        </dl>
      </div>
    </div>
    

    

  </section>
</section>

    

    <section id="search" class="content hidden"></section>

    <footer>
    
    </footer>
  </div>
</body>
</html>

<!--
SPDX-FileCopyrightText: The WebKit GTK and WPE teams

SPDX-License-Identifier: BSD, LGPL-2.1
-->

<!DOCTYPE html>
<html lang="en">
<head>
  <title>WebKitWebProcessExtension.WebEditor::selection-changed</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta charset="utf-8" />

  
  <meta property="og:type" content="website"/>

  

  
  <meta property="og:title" content="WebKitWebProcessExtension.WebEditor::selection-changed"/>
  <meta property="og:description" content="Reference for signal WebKitWebProcessExtension.WebEditor::selection-changed"/>
  <meta name="twitter:title" content="WebKitWebProcessExtension.WebEditor::selection-changed"/>
  <meta name="twitter:description" content="Reference for signal WebKitWebProcessExtension.WebEditor::selection-changed"/>

  
  <meta name="twitter:card" content="summary"/>

  
  
  
  

  <link rel="stylesheet" href="style.css" type="text/css" />

  

  
  <script src="gtk4-urlmap.js"></script>
  
  
  <script src="fzy.js"></script>
  <script src="search.js"></script>
  
  <script src="main.js"></script>

  
</head>

<body>
  <div id="body-wrapper" tabindex="-1">

    <nav class="sidebar devhelp-hidden">
      
      
      <div class="search section">
        <form id="search-form" autocomplete="off">
          <input id="search-input" type="text" name="do-not-autocomplete" placeholder="Click, or press 's' to search" autocomplete="off"/>
        </form>
      </div>
      
      <div class="section namespace">
        <h3><a href="index.html">WebKitWebProcessExtension</a></h3>
        <p>API Version: 6.0</p>
        
        <p>Library Version: 2.52.6</p>
        
      </div>
      
<div class="section">
  <h5>Type</h5>
  <div class="links">
    <a href="class.WebEditor.html">WebEditor</a>
  </div>
</div>
<div class="section">
  <h5>Signals</h5>
  <div class="links">
  
    <a class="signal current" href="signal.WebEditor.selection-changed.html">selection-changed</a>
  
  </div>
</div>

      <div class="section generator">
        <p>Generated by <a href="https://gitlab.gnome.org/GNOME/gi-docgen">gi-docgen</a> 2026.1</p>
      </div>
    </nav>

    <button id="btn-to-top" class="hidden"><span class="up-arrow"></span></button>

    
<section id="main" class="content">
  <header>
    <h3>Signal</h3>
    <h1><a href="index.html">WebKitWebProcessExtension</a><span class="sep"></span><a href="class.WebEditor.html">WebEditor</a>::selection-changed</h1>
  </header>

  <section>
    <div class="docblock">
      <p><span class="emblem available">since: 2.10</span></p>
    </div>
    <div class="declaration toggle-wrapper">
      <h4 id="declaration">
        Declaration
        <a href="#declaration" class="anchor"></a>
      </h4>

      <div class="docblock">
        <pre><code><div class="highlight"><pre><span></span><span class="kt">void</span>
<span class="n">selection_changed</span><span class="w"> </span><span class="p">(</span>
<span class="w">  </span><span class="n">WebKitWebEditor</span><span class="o">*</span><span class="w"> </span><span class="n">self</span><span class="p">,</span>
<span class="w">  </span><span class="n">gpointer</span><span class="w"> </span><span class="n">user_data</span>
<span class="p">)</span>
</pre></div>
</code></pre>
      </div>
    </div>

    <div class="description toggle-wrapper">
      <h4 id="description" style="display:flex;">
        Description
        <a href="#description" class="anchor"></a>
        
        <a class="srclink" title="go to source location" href="https://github.com/WebKit/WebKit/tree/main/Source/WebKit/WebProcess/InjectedBundle/API/glib/WebKitWebEditor.cpp#L59">[src]</a>
        
      </h4>

      <div class="docblock">
        <p>This signal is emitted for every selection change inside a <code>WebKitWebPage</code>
as well as for every caret position change as the caret is a collapsed&nbsp;selection.</p>
      </div>

      <div class="docblock">
        <table>
          <tr><td>Default handler: <p>The default handler is called after the handlers added via <code>g_signal_connect()</code>.</p></td></tr>
          
          
          
          
          
          
          <tr><td>Available since: 2.10</td></tr>
          
          
        </table>
      </div>

      
    </div>

    

    

  </section>
</section>

    

    <section id="search" class="content hidden"></section>

    <footer>
    
    </footer>
  </div>
</body>
</html>

--===============8710570521830453440==--

