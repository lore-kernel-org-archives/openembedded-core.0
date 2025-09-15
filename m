Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214A6CCA474
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:55:00 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.30883.1757937275830919196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Hx4+tqG6;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RDYABOoW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101994d3a6069-0ca99ba5-355d-465d-8320-36c9b036428a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=w/jFrj1+MI/gf8MWxYPsblCqhkKG9lB8DMzZspLvWX8=;
	b=Hx4+tqG6yv6QaObV4/pqiMBQBwaqvFR32qxNK7ZWfu9azrK48DP4tk6H0dxmka32
	3f668FZm5EUVdxyt/1Bp3Ptuhq6kCrc/8LafEYTWnDs+dD7LWN7q8I1pX/6V9zLfdeR
	nzekexecBx3t1IA8dimlE2TQWmXo9tEaIeWaQlEE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=w/jFrj1+MI/gf8MWxYPsblCqhkKG9lB8DMzZspLvWX8=;
	b=RDYABOoWDN0JGBScRGkyRUhZ5rF1x/p6m2lXmRgRbKpoldeaQKxYTVSXZ+E1RHTc
	QCNnMfw8fns/bWPo+3wZTK8fAp/boZ9rHbFgIaZ3BYABb3O+d0+QWSEmXEjq9RVx2v+
	vjj6ZhvIlnWrtJITgf3KOdme/GUBR6n+eJzDn36s=
Content-Type: multipart/mixed; boundary="===============9143134775926402482=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] webkitgtk: upgrading to 2.48.6 FAILED
Message-ID: <010101994d3a6069-0ca99ba5-355d-465d-8320-36c9b036428a-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223472

--===============9143134775926402482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *webkitgtk* to *2.48.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-webkitgtk-upgrade-2.48.5-2.48.6.patch
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
From d0e96f59eae2f21a1036cd648f9d1fc16c380ebf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 11:21:04 +0000
Subject: [PATCH] webkitgtk: upgrade 2.48.5 -> 2.48.6

---
 ...able-to-control-macro-__PAS_ALWAYS_I.patch |  6 ++--
 ...spection.cmake-prefix-variables-obta.patch |  2 +-
 ...-on-RISCV-https-bugs.webkit.org-show.patch |  4 +--
 .../webkitgtk/fix-armv7-compilation.patch     | 32 -------------------
 .../webkit/webkitgtk/fix-ftbfs-riscv64.patch  | 22 ++++++++-----
 .../webkit/webkitgtk/no-musttail-arm.patch    |  4 +--
 .../webkit/webkitgtk/reproducibility.patch    |  2 +-
 .../webkit/webkitgtk/sys_futex.patch          | 11 ++++++-
 .../webkit/webkitgtk/t6-not-declared.patch    |  4 +--
 ...ebkitgtk_2.48.5.bb => webkitgtk_2.48.6.bb} |  3 +-
 10 files changed, 36 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.48.5.bb => webkitgtk_2.48.6.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
index f990384511..df201e3c32 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
@@ -1,4 +1,4 @@
-From bbf661310448d430350eb2ad8c5869ace648dcf8 Mon Sep 17 00:00:00 2001
+From fbc274831eff820c05067cd741fb38887522c272 Mon Sep 17 00:00:00 2001
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
@@ -57,7 +57,7 @@ index 5d5fb38c..a554f700 100644
  #else
  #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
 diff --git a/Source/cmake/WebKitCompilerFlags.cmake b/Source/cmake/WebKitCompilerFlags.cmake
-index f5ec0a55..dfd741e7 100644
+index de1cb6c4..b6ff0b78 100644
 --- a/Source/cmake/WebKitCompilerFlags.cmake
 +++ b/Source/cmake/WebKitCompilerFlags.cmake
 @@ -503,3 +503,10 @@ endif ()
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index b11a18ba22..6f449e020d 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -1,4 +1,4 @@
-From e0dfc113b016227da8a654d625e8f568b56761d0 Mon Sep 17 00:00:00 2001
+From 987dd316beb587afe6514365d34ba6e9d5b7dac8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch
index 40a7133052..cd46f4db1b 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch
@@ -1,4 +1,4 @@
-From 984538dcce7b184269efc1e1b0fb78e1cb932b5d Mon Sep 17 00:00:00 2001
+From 24c68ba6811ed97c333948caacf63ebb55fc41ea Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch b/meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch
deleted file mode 100644
index a857d55ae4..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7999ecd5ee4ea3123f7e75634d2bc57f57ca7070 Mon Sep 17 00:00:00 2001
-From: Justin Michaud <jmichaud@igalia.com>
-Date: Wed, 6 Aug 2025 21:14:26 +0300
-Subject: [PATCH] REGRESSION(2.48.5): [WPE][GTK] Does not compile on ARMv7
- https://bugs.webkit.org/show_bug.cgi?id=296921
-
-Unreviewed build fix.
-
-* Source/JavaScriptCore/llint/WebAssembly.asm: Replace addq with addp
-  for sp on armv7
-
-Canonical link: https://commits.webkit.org/290945.344@webkitglib/2.48
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/7999ecd5ee4ea3123f7e75634d2bc57f57ca7070]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- Source/JavaScriptCore/llint/WebAssembly.asm | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Source/JavaScriptCore/llint/WebAssembly.asm b/Source/JavaScriptCore/llint/WebAssembly.asm
-index 1ac3e2accf3c..bd9041404eb1 100644
---- a/Source/JavaScriptCore/llint/WebAssembly.asm
-+++ b/Source/JavaScriptCore/llint/WebAssembly.asm
-@@ -736,7 +736,7 @@ if JSVALUE64
-     storep memoryBase, Callee[cfr]
- else
-     loadp [sp], ws0
--    addq 2 * SlotSize, sp
-+    addp 2 * SlotSize, sp
-     storep ws0, Callee[cfr]
- end
- 
diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
index e436896098..26b88451e8 100644
--- a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
@@ -1,13 +1,17 @@
+From fed5fd1b72cf56a31ec11d355f5393f5b29195f9 Mon Sep 17 00:00:00 2001
 From: Alberto Garcia <berto@igalia.com>
-Description: Use WTF_CPU_UNKNOWN when building for riscv64
- WebKitGTK doesn't build on riscv64 even with the JIT disabled.
- Treating the CPU as unknown is perhaps a bit severe, but it allows us
- to get the build done until someone steps up to maintain this
- properly.
-Bug: https://bugs.webkit.org/show_bug.cgi?id=271371
+Date: Mon, 15 Sep 2025 11:20:03 +0000
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
index 367e6b8342..5f0ab9a2ab 100644
--- a/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/no-musttail-arm.patch
@@ -1,4 +1,4 @@
-From 4602261fa44d6bbb4c3698c79e08a6a40a6edc5a Mon Sep 17 00:00:00 2001
+From 2bee6c19f56f08677e544a41044c36df3d0a4a3f Mon Sep 17 00:00:00 2001
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
index 436ad2f02c..1ebe6804c7 100644
--- a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
@@ -1,4 +1,4 @@
-From 65e9a68c9d05f4902c2fc34303b7f8233ffa98d5 Mon Sep 17 00:00:00 2001
+From 4dcb05e083aea5e7220ccb7e1ab23a0db357030a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 3 Jan 2022 14:18:34 +0000
 Subject: [PATCH] webkitgtk: Add reproducibility fix
diff --git a/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch b/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
index 19d18dea88..17f6c8c676 100644
--- a/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
@@ -1,7 +1,16 @@
-Fix build on newer 32bit architectures with only 64bit time_t
+From cf9deed49da130af9d7b746374fad354e08f0168 Mon Sep 17 00:00:00 2001
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
index 4b0cf364d8..f8320ec80b 100644
--- a/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/t6-not-declared.patch
@@ -1,4 +1,4 @@
-From 29431aec88764072a032aa4411e26e566a3a6c0b Mon Sep 17 00:00:00 2001
+From 51f2df390088fdbcc106a9f46952bdb46925433d Mon Sep 17 00:00:00 2001
 From: Michael Catanzaro <mcatanzaro@redhat.com>
 Date: Mon, 5 Feb 2024 11:00:49 -0600
 Subject: [PATCH] =?UTF-8?q?LowLevelInterpreter.cpp:339:21:=20error:=20?=
@@ -21,7 +21,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-index 76c46889..500be433 100644
+index 2f739d6b..6b49d28c 100644
 --- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
 +++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
 @@ -336,8 +336,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.6.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.48.6.bb
index 35b8ee2a90..5fcaf77617 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.6.bb
@@ -18,9 +18,8 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://sys_futex.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            file://fix-ftbfs-riscv64.patch \
-           file://fix-armv7-compilation.patch \
            "
-SRC_URI[sha256sum] = "bb64ed9d1cfd58e8b5e89ccad71dd31adfed56336bad7695031ad0b668e1987c"
+SRC_URI[sha256sum] = "d9ac3034b7a39c2aaa567e6112b3124b158e591a74439e46974a031dd0e44e24"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.47.1


--===============9143134775926402482==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-webkitgtk-upgrade-2.48.5-2.48.6.patch"

RnJvbSBkMGU5NmY1OWVhZTJmMjFhMTAzNmNkNjQ4ZjlkMWZjMTZjMzgwZWJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMTE6MjE6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
ZWJraXRndGs6IHVwZ3JhZGUgMi40OC41IC0+IDIuNDguNgoKLS0tCiAuLi5hYmxlLXRvLWNvbnRy
b2wtbWFjcm8tX19QQVNfQUxXQVlTX0kucGF0Y2ggfCAgNiArKy0tCiAuLi5zcGVjdGlvbi5jbWFr
ZS1wcmVmaXgtdmFyaWFibGVzLW9idGEucGF0Y2ggfCAgMiArLQogLi4uLW9uLVJJU0NWLWh0dHBz
LWJ1Z3Mud2Via2l0Lm9yZy1zaG93LnBhdGNoIHwgIDQgKy0tCiAuLi4vd2Via2l0Z3RrL2ZpeC1h
cm12Ny1jb21waWxhdGlvbi5wYXRjaCAgICAgfCAzMiAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4v
d2Via2l0L3dlYmtpdGd0ay9maXgtZnRiZnMtcmlzY3Y2NC5wYXRjaCAgfCAyMiArKysrKysrKy0t
LS0tCiAuLi4vd2Via2l0L3dlYmtpdGd0ay9uby1tdXN0dGFpbC1hcm0ucGF0Y2ggICAgfCAgNCAr
LS0KIC4uLi93ZWJraXQvd2Via2l0Z3RrL3JlcHJvZHVjaWJpbGl0eS5wYXRjaCAgICB8ICAyICst
CiAuLi4vd2Via2l0L3dlYmtpdGd0ay9zeXNfZnV0ZXgucGF0Y2ggICAgICAgICAgfCAxMSArKysr
KystCiAuLi4vd2Via2l0L3dlYmtpdGd0ay90Ni1ub3QtZGVjbGFyZWQucGF0Y2ggICAgfCAgNCAr
LS0KIC4uLmVia2l0Z3RrXzIuNDguNS5iYiA9PiB3ZWJraXRndGtfMi40OC42LmJifSB8ICAzICst
CiAxMCBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCA1NCBkZWxldGlvbnMoLSkKIGRl
bGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL2ZpeC1h
cm12Ny1jb21waWxhdGlvbi5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC97
d2Via2l0Z3RrXzIuNDguNS5iYiA9PiB3ZWJraXRndGtfMi40OC42LmJifSAoOTglKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvMDAwMS1DTWFrZS1BZGQt
YS12YXJpYWJsZS10by1jb250cm9sLW1hY3JvLV9fUEFTX0FMV0FZU19JLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay8wMDAxLUNNYWtlLUFkZC1hLXZhcmlhYmxlLXRv
LWNvbnRyb2wtbWFjcm8tX19QQVNfQUxXQVlTX0kucGF0Y2gKaW5kZXggZjk5MDM4NDUxMS4uZGYy
MDFlM2MzMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay8w
MDAxLUNNYWtlLUFkZC1hLXZhcmlhYmxlLXRvLWNvbnRyb2wtbWFjcm8tX19QQVNfQUxXQVlTX0ku
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay8wMDAxLUNNYWtl
LUFkZC1hLXZhcmlhYmxlLXRvLWNvbnRyb2wtbWFjcm8tX19QQVNfQUxXQVlTX0kucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGJiZjY2MTMxMDQ0OGQ0MzAzNTBlYjJhZDhjNTg2OWFjZTY0OGRj
ZjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZiYzI3NDgzMWVmZjgyMGMwNTA2N2Nk
NzQxZmIzODg4NzUyMmMyNzIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLYWkgS2Fu
ZyA8a2FpLmthbmdAd2luZHJpdmVyLmNvbT4KIERhdGU6IEZyaSwgMTEgQXVnIDIwMjMgMTQ6MjA6
NDggKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gQWRkIGEgdmFyaWFibGUgdG8gY29udHJvbCBtYWNy
bwpAQCAtNDQsNyArNDQsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLYWkgS2FuZyA8a2FpLmthbmdAd2lu
ZHJpdmVyLmNvbT4KICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQogCiBkaWZmIC0tZ2l0IGEvU291cmNlL2JtYWxsb2MvbGlicGFzL3NyYy9saWJwYXMvcGFz
X3V0aWxzX3ByZWZpeC5oIGIvU291cmNlL2JtYWxsb2MvbGlicGFzL3NyYy9saWJwYXMvcGFzX3V0
aWxzX3ByZWZpeC5oCi1pbmRleCA1ZDVmYjM4Yy4uYTU1NGY3MDAgMTAwNjQ0CitpbmRleCAyNDVl
MmVlZi4uNjQ5NTVmYWQgMTAwNjQ0CiAtLS0gYS9Tb3VyY2UvYm1hbGxvYy9saWJwYXMvc3JjL2xp
YnBhcy9wYXNfdXRpbHNfcHJlZml4LmgKICsrKyBiL1NvdXJjZS9ibWFsbG9jL2xpYnBhcy9zcmMv
bGlicGFzL3Bhc191dGlsc19wcmVmaXguaAogQEAgLTQ0LDcgKzQ0LDcgQEAgX19QQVNfQkVHSU5f
RVhURVJOX0M7CkBAIC01Nyw3ICs1Nyw3IEBAIGluZGV4IDVkNWZiMzhjLi5hNTU0ZjcwMCAxMDA2
NDQKICAjZWxzZQogICNkZWZpbmUgX19QQVNfQUxXQVlTX0lOTElORV9CVVRfTk9UX0lOTElORQog
ZGlmZiAtLWdpdCBhL1NvdXJjZS9jbWFrZS9XZWJLaXRDb21waWxlckZsYWdzLmNtYWtlIGIvU291
cmNlL2NtYWtlL1dlYktpdENvbXBpbGVyRmxhZ3MuY21ha2UKLWluZGV4IGY1ZWMwYTU1Li5kZmQ3
NDFlNyAxMDA2NDQKK2luZGV4IGRlMWNiNmM0Li5iNmZmMGI3OCAxMDA2NDQKIC0tLSBhL1NvdXJj
ZS9jbWFrZS9XZWJLaXRDb21waWxlckZsYWdzLmNtYWtlCiArKysgYi9Tb3VyY2UvY21ha2UvV2Vi
S2l0Q29tcGlsZXJGbGFncy5jbWFrZQogQEAgLTUwMywzICs1MDMsMTAgQEAgZW5kaWYgKCkKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvMDAwMS1GaW5kR09i
amVjdEludHJvc3BlY3Rpb24uY21ha2UtcHJlZml4LXZhcmlhYmxlcy1vYnRhLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay8wMDAxLUZpbmRHT2JqZWN0SW50cm9zcGVj
dGlvbi5jbWFrZS1wcmVmaXgtdmFyaWFibGVzLW9idGEucGF0Y2gKaW5kZXggYjExYTE4YmEyMi4u
NmY0NDllMDIwZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0
ay8wMDAxLUZpbmRHT2JqZWN0SW50cm9zcGVjdGlvbi5jbWFrZS1wcmVmaXgtdmFyaWFibGVzLW9i
dGEucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay8wMDAxLUZp
bmRHT2JqZWN0SW50cm9zcGVjdGlvbi5jbWFrZS1wcmVmaXgtdmFyaWFibGVzLW9idGEucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGUwZGZjMTEzYjAxNjIyN2RhOGE2NTRkNjI1ZThmNTY4YjU2
NzYxZDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDk4N2RkMzE2YmViNTg3YWZlNjUx
NDM2NWQzNGJhNmU5ZDViN2RhYzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMjcgT2N0
IDIwMTUgMTY6MDI6MTkgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gRmluZEdPYmplY3RJbnRyb3Nw
ZWN0aW9uLmNtYWtlOiBwcmVmaXggdmFyaWFibGVzIG9idGFpbmVkCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrLzAwMDEtRml4LWJ1aWxkLWVycm9ycy1vbi1S
SVNDVi1odHRwcy1idWdzLndlYmtpdC5vcmctc2hvdy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zYXRv
L3dlYmtpdC93ZWJraXRndGsvMDAwMS1GaXgtYnVpbGQtZXJyb3JzLW9uLVJJU0NWLWh0dHBzLWJ1
Z3Mud2Via2l0Lm9yZy1zaG93LnBhdGNoCmluZGV4IDQwYTcxMzMwNTIuLmNkNDZmNGRiMWIgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvMDAwMS1GaXgtYnVp
bGQtZXJyb3JzLW9uLVJJU0NWLWh0dHBzLWJ1Z3Mud2Via2l0Lm9yZy1zaG93LnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvMDAwMS1GaXgtYnVpbGQtZXJyb3Jz
LW9uLVJJU0NWLWh0dHBzLWJ1Z3Mud2Via2l0Lm9yZy1zaG93LnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSA5ODQ1MzhkY2NlN2IxODQyNjllZmMxZTFiMGZiNzhlMWNiOTMyYjVkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyNGM2OGJhNjgxMWVkOTdjMzMzOTQ4Y2FhY2Y2M2ViYjU1
ZmM0MWVhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMjEgTWFyIDIwMjUgMDE6MjE6MjIgLTA3MDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gRml4IGJ1aWxkIGVycm9ycyBvbiBSSVNDVgpAQCAtMTcsNyArMTcsNyBAQCBT
aWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvU291cmNlL1dlYkNvcmUvY29udGVu
dGV4dGVuc2lvbnMvQ29udGVudEV4dGVuc2lvbkFjdGlvbnMuaCBiL1NvdXJjZS9XZWJDb3JlL2Nv
bnRlbnRleHRlbnNpb25zL0NvbnRlbnRFeHRlbnNpb25BY3Rpb25zLmgKLWluZGV4IDBiNzVkMmUx
ZGY3OC4uNjFjYjMzYzk0Y2U4IDEwMDY0NAoraW5kZXggMGI3NWQyZTEuLjYxY2IzM2M5IDEwMDY0
NAogLS0tIGEvU291cmNlL1dlYkNvcmUvY29udGVudGV4dGVuc2lvbnMvQ29udGVudEV4dGVuc2lv
bkFjdGlvbnMuaAogKysrIGIvU291cmNlL1dlYkNvcmUvY29udGVudGV4dGVuc2lvbnMvQ29udGVu
dEV4dGVuc2lvbkFjdGlvbnMuaAogQEAgLTI4LDYgKzI4LDcgQEAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvZml4LWFybXY3LWNvbXBpbGF0aW9uLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay9maXgtYXJtdjctY29tcGlsYXRp
b24ucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGE4NTdkNTVhZTQuLjAwMDAw
MDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay9maXgtYXJtdjct
Y29tcGlsYXRpb24ucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzMiArMCwwIEBACi1Gcm9tIDc5
OTllY2Q1ZWU0ZWEzMTIzZjdlNzU2MzRkMmJjNTdmNTdjYTcwNzAgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCi1Gcm9tOiBKdXN0aW4gTWljaGF1ZCA8am1pY2hhdWRAaWdhbGlhLmNvbT4KLURhdGU6
IFdlZCwgNiBBdWcgMjAyNSAyMToxNDoyNiArMDMwMAotU3ViamVjdDogW1BBVENIXSBSRUdSRVNT
SU9OKDIuNDguNSk6IFtXUEVdW0dUS10gRG9lcyBub3QgY29tcGlsZSBvbiBBUk12NwotIGh0dHBz
Oi8vYnVncy53ZWJraXQub3JnL3Nob3dfYnVnLmNnaT9pZD0yOTY5MjEKLQotVW5yZXZpZXdlZCBi
dWlsZCBmaXguCi0KLSogU291cmNlL0phdmFTY3JpcHRDb3JlL2xsaW50L1dlYkFzc2VtYmx5LmFz
bTogUmVwbGFjZSBhZGRxIHdpdGggYWRkcAotICBmb3Igc3Agb24gYXJtdjcKLQotQ2Fub25pY2Fs
IGxpbms6IGh0dHBzOi8vY29tbWl0cy53ZWJraXQub3JnLzI5MDk0NS4zNDRAd2Via2l0Z2xpYi8y
LjQ4Ci0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0aHViLmNvbS9XZWJL
aXQvV2ViS2l0L2NvbW1pdC83OTk5ZWNkNWVlNGVhMzEyM2Y3ZTc1NjM0ZDJiYzU3ZjU3Y2E3MDcw
XQotU2lnbmVkLW9mZi1ieTogR3lvcmd5IFNhcnZhcmkgPHNrYW5kaWdyYXVuQGdtYWlsLmNvbT4K
LS0tLQotIFNvdXJjZS9KYXZhU2NyaXB0Q29yZS9sbGludC9XZWJBc3NlbWJseS5hc20gfCAyICst
Ci0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRpZmYg
LS1naXQgYS9Tb3VyY2UvSmF2YVNjcmlwdENvcmUvbGxpbnQvV2ViQXNzZW1ibHkuYXNtIGIvU291
cmNlL0phdmFTY3JpcHRDb3JlL2xsaW50L1dlYkFzc2VtYmx5LmFzbQotaW5kZXggMWFjM2UyYWNj
ZjNjLi5iZDkwNDE0MDRlYjEgMTAwNjQ0Ci0tLS0gYS9Tb3VyY2UvSmF2YVNjcmlwdENvcmUvbGxp
bnQvV2ViQXNzZW1ibHkuYXNtCi0rKysgYi9Tb3VyY2UvSmF2YVNjcmlwdENvcmUvbGxpbnQvV2Vi
QXNzZW1ibHkuYXNtCi1AQCAtNzM2LDcgKzczNiw3IEBAIGlmIEpTVkFMVUU2NAotICAgICBzdG9y
ZXAgbWVtb3J5QmFzZSwgQ2FsbGVlW2Nmcl0KLSBlbHNlCi0gICAgIGxvYWRwIFtzcF0sIHdzMAot
LSAgICBhZGRxIDIgKiBTbG90U2l6ZSwgc3AKLSsgICAgYWRkcCAyICogU2xvdFNpemUsIHNwCi0g
ICAgIHN0b3JlcCB3czAsIENhbGxlZVtjZnJdCi0gZW5kCi0gCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL2ZpeC1mdGJmcy1yaXNjdjY0LnBhdGNoIGIvbWV0
YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0ay9maXgtZnRiZnMtcmlzY3Y2NC5wYXRjaApp
bmRleCBlNDM2ODk2MDk4Li4yNmI4ODQ1MWU4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc2F0
by93ZWJraXQvd2Via2l0Z3RrL2ZpeC1mdGJmcy1yaXNjdjY0LnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvZml4LWZ0YmZzLXJpc2N2NjQucGF0Y2gKQEAgLTEs
MTMgKzEsMTcgQEAKK0Zyb20gZmVkNWZkMWI3MmNmNTZhMzFlYzExZDM1NWY1MzkzZjViMjkxOTVm
OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsYmVydG8gR2FyY2lhIDxiZXJ0b0Bp
Z2FsaWEuY29tPgotRGVzY3JpcHRpb246IFVzZSBXVEZfQ1BVX1VOS05PV04gd2hlbiBidWlsZGlu
ZyBmb3IgcmlzY3Y2NAotIFdlYktpdEdUSyBkb2Vzbid0IGJ1aWxkIG9uIHJpc2N2NjQgZXZlbiB3
aXRoIHRoZSBKSVQgZGlzYWJsZWQuCi0gVHJlYXRpbmcgdGhlIENQVSBhcyB1bmtub3duIGlzIHBl
cmhhcHMgYSBiaXQgc2V2ZXJlLCBidXQgaXQgYWxsb3dzIHVzCi0gdG8gZ2V0IHRoZSBidWlsZCBk
b25lIHVudGlsIHNvbWVvbmUgc3RlcHMgdXAgdG8gbWFpbnRhaW4gdGhpcwotIHByb3Blcmx5Lgot
QnVnOiBodHRwczovL2J1Z3Mud2Via2l0Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjcxMzcxCitEYXRl
OiBNb24sIDE1IFNlcCAyMDI1IDExOjIwOjAzICswMDAwCitTdWJqZWN0OiBbUEFUQ0hdIFVwc3Ry
ZWFtLVN0YXR1czogU3VibWl0dGVkCisgW2h0dHBzOi8vYnVncy53ZWJraXQub3JnL3Nob3dfYnVn
LmNnaT9pZD0yNzEzNzEjYzFdIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqCisgPHJhai5raGVtQGdt
YWlsLmNvbT4KIAotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vYnVncy53ZWJr
aXQub3JnL3Nob3dfYnVnLmNnaT9pZD0yNzEzNzEjYzFdCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgorLS0tCisgU291cmNlL1dURi93dGYvUGxhdGZvcm1DUFUu
aCAgICB8IDggLS0tLS0tLS0KKyBTb3VyY2UvY21ha2UvV2ViS2l0Q29tbW9uLmNtYWtlIHwgMiAt
LQorIDIgZmlsZXMgY2hhbmdlZCwgMTAgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9Tb3Vy
Y2UvV1RGL3d0Zi9QbGF0Zm9ybUNQVS5oIGIvU291cmNlL1dURi93dGYvUGxhdGZvcm1DUFUuaAor
aW5kZXggOGFhYzEwMjQuLmQ5ZDY5YTQwIDEwMDY0NAogLS0tIGEvU291cmNlL1dURi93dGYvUGxh
dGZvcm1DUFUuaAogKysrIGIvU291cmNlL1dURi93dGYvUGxhdGZvcm1DUFUuaAogQEAgLTI4Niwx
NCArMjg2LDYgQEAKQEAgLTI1LDYgKzI5LDggQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4KICAjaWYgIUNQVShLTk9XTikKICAjZGVmaW5lIFdURl9DUFVfVU5L
Tk9XTiAxCiAgI2VuZGlmCitkaWZmIC0tZ2l0IGEvU291cmNlL2NtYWtlL1dlYktpdENvbW1vbi5j
bWFrZSBiL1NvdXJjZS9jbWFrZS9XZWJLaXRDb21tb24uY21ha2UKK2luZGV4IDM4YWMwYzQ3Li45
ZDc4NzNlMiAxMDA2NDQKIC0tLSBhL1NvdXJjZS9jbWFrZS9XZWJLaXRDb21tb24uY21ha2UKICsr
KyBiL1NvdXJjZS9jbWFrZS9XZWJLaXRDb21tb24uY21ha2UKIEBAIC0xMjUsOCArMTI1LDYgQEAg
aWYgKE5PVCBIQVNfUlVOX1dFQktJVF9DT01NT04pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
c2F0by93ZWJraXQvd2Via2l0Z3RrL25vLW11c3R0YWlsLWFybS5wYXRjaCBiL21ldGEvcmVjaXBl
cy1zYXRvL3dlYmtpdC93ZWJraXRndGsvbm8tbXVzdHRhaWwtYXJtLnBhdGNoCmluZGV4IDM2N2U2
YjgzNDIuLjVmMGFiOWEyYWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93
ZWJraXRndGsvbm8tbXVzdHRhaWwtYXJtLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3dl
YmtpdC93ZWJraXRndGsvbm8tbXVzdHRhaWwtYXJtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSA0NjAyMjYxZmE0NGQ2YmJiNGMzNjk4Yzc5ZTA4YTZhNDBhNmVkYzVhIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSAyYmVlNmMxOWY1NmYwODY3N2U1NDRhNDEwNDRjMzZkZjNkMGE0YTNm
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWls
LmNvbT4KIERhdGU6IEZyaSwgMTIgSmFuIDIwMjQgMDk6MjE6MzkgLTA4MDAKIFN1YmplY3Q6IFtQ
QVRDSF0gY2xhbmcvYXJtOiBEbyBub3QgdXNlIE1VU1RfVEFJTF9DQUxMCkBAIC0yMCw3ICsyMCw3
IEBAIFNpZ25lZC1vZmYtYnk6IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPgogIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0
IGEvU291cmNlL1dURi93dGYvQ29tcGlsZXIuaCBiL1NvdXJjZS9XVEYvd3RmL0NvbXBpbGVyLmgK
LWluZGV4IDE2ZTQxNmQuLjY4ZGQ5YTAgMTAwNjQ0CitpbmRleCAxNmU0MTZkNi4uNjhkZDlhMDAg
MTAwNjQ0CiAtLS0gYS9Tb3VyY2UvV1RGL3d0Zi9Db21waWxlci5oCiArKysgYi9Tb3VyY2UvV1RG
L3d0Zi9Db21waWxlci5oCiBAQCAtMjkzLDcgKzI5Myw3IEBACmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL3JlcHJvZHVjaWJpbGl0eS5wYXRjaCBiL21ldGEv
cmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvcmVwcm9kdWNpYmlsaXR5LnBhdGNoCmluZGV4
IDQzNmFkMmYwMmMuLjFlYmU2ODA0YzcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zYXRvL3dl
YmtpdC93ZWJraXRndGsvcmVwcm9kdWNpYmlsaXR5LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1z
YXRvL3dlYmtpdC93ZWJraXRndGsvcmVwcm9kdWNpYmlsaXR5LnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSA2NWU5YTY4YzlkMDVmNDkwMmMyZmMzNDMwM2I3ZjgyMzNmZmE5OGQ1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0ZGNiMDVlMDgzYWVhNWU3MjIwY2NiN2UxYWIyM2EwZGIz
NTcwMzBhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJp
Y2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBNb24sIDMgSmFuIDIwMjIg
MTQ6MTg6MzQgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gd2Via2l0Z3RrOiBBZGQgcmVwcm9kdWNp
YmlsaXR5IGZpeApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3dlYmtpdGd0
ay9zeXNfZnV0ZXgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL3N5
c19mdXRleC5wYXRjaAppbmRleCAxOWQxOGRlYTg4Li4xN2Y2YzhjNjc2IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL3N5c19mdXRleC5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL3N5c19mdXRleC5wYXRjaApAQCAtMSw3
ICsxLDE2IEBACi1GaXggYnVpbGQgb24gbmV3ZXIgMzJiaXQgYXJjaGl0ZWN0dXJlcyB3aXRoIG9u
bHkgNjRiaXQgdGltZV90CitGcm9tIGNmOWRlZWQ0OWRhMTMwYWY5ZDdiNzQ2Mzc0ZmFkMzU0ZTA4
ZjAxNjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPgorRGF0ZTogV2VkLCAxOCBEZWMgMjAyNCAyMDoyNDoyMiAtMDgwMAorU3ViamVj
dDogW1BBVENIXSBGaXggYnVpbGQgb24gbmV3ZXIgMzJiaXQgYXJjaGl0ZWN0dXJlcyB3aXRoIG9u
bHkgNjRiaXQgdGltZV90CiAKIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2No
cm9taXVtLXJldmlldy5nb29nbGVzb3VyY2UuY29tL2MvYW5nbGUvYW5nbGUvKy82MTA4Mzk3XQog
U2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KKy0tLQorIFNvdXJj
ZS9UaGlyZFBhcnR5L0FOR0xFL3NyYy9jb21tb24vU2ltcGxlTXV0ZXguY3BwIHwgMyArKysKKyAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCisKK2RpZmYgLS1naXQgYS9Tb3VyY2UvVGhp
cmRQYXJ0eS9BTkdMRS9zcmMvY29tbW9uL1NpbXBsZU11dGV4LmNwcCBiL1NvdXJjZS9UaGlyZFBh
cnR5L0FOR0xFL3NyYy9jb21tb24vU2ltcGxlTXV0ZXguY3BwCitpbmRleCA0ZWQwYWY1MS4uMTFm
ZWRhNmMgMTAwNjQ0CiAtLS0gYS9Tb3VyY2UvVGhpcmRQYXJ0eS9BTkdMRS9zcmMvY29tbW9uL1Np
bXBsZU11dGV4LmNwcAogKysrIGIvU291cmNlL1RoaXJkUGFydHkvQU5HTEUvc3JjL2NvbW1vbi9T
aW1wbGVNdXRleC5jcHAKIEBAIC0xNyw2ICsxNyw5IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrL3Q2LW5vdC1kZWNsYXJlZC5wYXRjaCBiL21ldGEvcmVj
aXBlcy1zYXRvL3dlYmtpdC93ZWJraXRndGsvdDYtbm90LWRlY2xhcmVkLnBhdGNoCmluZGV4IDRi
MGNmMzY0ZDguLmY4MzIwZWM4MGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtp
dC93ZWJraXRndGsvdDYtbm90LWRlY2xhcmVkLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zYXRv
L3dlYmtpdC93ZWJraXRndGsvdDYtbm90LWRlY2xhcmVkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSAyOTQzMWFlYzg4NzY0MDcyYTAzMmFhNDQxMWUyNmU1NjZhM2E2YzBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSA1MWYyZGYzOTAwODhmZGJjYzEwNmE5ZjQ2OTUyYmRiNDY5MjU0
MzNkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWljaGFlbCBDYXRhbnphcm8gPG1j
YXRhbnphcm9AcmVkaGF0LmNvbT4KIERhdGU6IE1vbiwgNSBGZWIgMjAyNCAxMTowMDo0OSAtMDYw
MAogU3ViamVjdDogW1BBVENIXSA9P1VURi04P3E/TG93TGV2ZWxJbnRlcnByZXRlci5jcHA6MzM5
OjIxOj0yMGVycm9yOj0yMD89CkBAIC0yMSw3ICsyMSw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAy
IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvU291cmNlL0phdmFTY3JpcHRDb3JlL2xsaW50
L0xvd0xldmVsSW50ZXJwcmV0ZXIuY3BwIGIvU291cmNlL0phdmFTY3JpcHRDb3JlL2xsaW50L0xv
d0xldmVsSW50ZXJwcmV0ZXIuY3BwCi1pbmRleCA3NmM0Njg4OS4uNTAwYmU0MzMgMTAwNjQ0Citp
bmRleCAyZjczOWQ2Yi4uNmI0OWQyOGMgMTAwNjQ0CiAtLS0gYS9Tb3VyY2UvSmF2YVNjcmlwdENv
cmUvbGxpbnQvTG93TGV2ZWxJbnRlcnByZXRlci5jcHAKICsrKyBiL1NvdXJjZS9KYXZhU2NyaXB0
Q29yZS9sbGludC9Mb3dMZXZlbEludGVycHJldGVyLmNwcAogQEAgLTMzNiw4ICszMzYsNiBAQCBK
U1ZhbHVlIENMb29wOjpleGVjdXRlKE9wY29kZUlEIGVudHJ5T3Bjb2RlSUQsIHZvaWQqIGV4ZWN1
dGFibGVBZGRyZXNzLCBWTSogdm0sCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJr
aXQvd2Via2l0Z3RrXzIuNDguNS5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93ZWJraXRn
dGtfMi40OC42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1zYXRvL3dlYmtpdC93ZWJraXRndGtfMi40OC41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
c2F0by93ZWJraXQvd2Via2l0Z3RrXzIuNDguNi5iYgppbmRleCAzNWI4ZWUyYTkwLi41ZmNhZjc3
NjE3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrXzIuNDgu
NS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd2Via2l0Z3RrXzIuNDguNi5iYgpA
QCAtMTgsOSArMTgsOCBAQCBTUkNfVVJJID0gImh0dHBzOi8vd3d3LndlYmtpdGd0ay5vcmcvcmVs
ZWFzZXMvJHtCUE59LSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly9zeXNfZnV0ZXgu
cGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1GaXgtYnVpbGQtZXJyb3JzLW9uLVJJU0NW
LWh0dHBzLWJ1Z3Mud2Via2l0Lm9yZy1zaG93LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL2Zp
eC1mdGJmcy1yaXNjdjY0LnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovL2ZpeC1hcm12Ny1jb21w
aWxhdGlvbi5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiYjY0
ZWQ5ZDFjZmQ1OGU4YjVlODljY2FkNzFkZDMxYWRmZWQ1NjMzNmJhZDc2OTUwMzFhZDBiNjY4ZTE5
ODdjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ5YWMzMDM0YjdhMzljMmFhYTU2N2U2MTEyYjMx
MjRiMTU4ZTU5MWE3NDQzOWU0Njk3NGEwMzFkZDBlNDRlMjQiCiAKIGluaGVyaXQgY21ha2UgcGtn
Y29uZmlnIGdvYmplY3QtaW50cm9zcGVjdGlvbiBwZXJsbmF0aXZlIGZlYXR1cmVzX2NoZWNrIHVw
c3RyZWFtLXZlcnNpb24taXMtZXZlbiBnaS1kb2NnZW4KIAotLSAKMi40Ny4xCgo=

--===============9143134775926402482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1939 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1939 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-24fa44452bed35519c25cffc3e2f92233ebb33fd"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:24fa44452bed35519c25cffc3e2f92233ebb33fd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 650 Local 637 Mirrors 0 Missed 13 Current 896 (98% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 999 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1009 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1010 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1011 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1029 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1034 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1035 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1038 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe enchant2-2.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsecret-0.21.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsoup-3.6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnotify-0.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk4-4.18.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe enchant2-2.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1087 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_create_spdx_setscene)
NOTE: recipe libnotify-0.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsecret-0.21.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsoup-3.6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk4-4.18.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1102 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1106 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1115 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1125 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libwpe-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.56.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwpe-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.56.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1169 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/systemd/systemd_257.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1184 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1186 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1198 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1210 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-11.4.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-1_257.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_25.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-11.4.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1225 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_25.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe systemd-1_257.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1235 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1305 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1341 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1385 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1389 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1429 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1515 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 2445 of 4216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.6.bb:do_recipe_qa)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1520 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.42.bb:do_create_spdx_setscene)
NOTE: recipe webkitgtk-2.48.6-r0: task do_recipe_qa: Started
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe webkitgtk-2.48.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2614 of 4216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.6.bb:do_fetch)
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1529 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe webkitgtk-2.48.6-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.48.6-r0: task do_fetch: Succeeded
NOTE: Running task 2621 of 4216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.6.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1532 of 1546 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe webkitgtk-2.48.6-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4094 of 4216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe webkitgtk-2.48.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.48.6-r0: task do_unpack: Succeeded
NOTE: Running task 4199 of 4216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.6.bb:do_patch)
NOTE: Running task 4200 of 4216 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.6.bb:do_collect_spdx_deps)
NOTE: recipe webkitgtk-2.48.6-r0: task do_patch: Started
NOTE: recipe webkitgtk-2.48.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe webkitgtk-2.48.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe webkitgtk-2.48.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe webkitgtk-2.48.6-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 4200 tasks of which 4194 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250915112049.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250915112049.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.6.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/webkitgtk/2.48.6/temp/log.do_patch.1717462
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: webkitgtk-2.48.6-r0 do_patch: QA Issue: Malformed Upstream-Status in patch
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
Please correct according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
Subject: [PATCH] Upstream-Status: Submitted [patch-status]
ERROR: webkitgtk-2.48.6-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/webkitgtk/2.48.6/temp/log.do_patch.1717462
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.6.bb:do_patch) failed with exit code '1'

--===============9143134775926402482==--

