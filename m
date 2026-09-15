Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857EAC88E7D
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 05:49:36 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16932.1789451367911067456
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 22:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FC+B98Pt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kTGtJccm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a0a39cf21c-a8c09eed-d7b4-433f-8f56-6fab7e796eaa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789451367;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PQfV+K6ph7giLVJHj6AOulkv2QS7yo/zwlfXw5u/MIc=;
	b=FC+B98PtigjCmybxTwk72S4DLCZtvshT/5Xh1L0DMrjoecibsTVqterodJoxTAI+
	wSOCUP1ivuz8l9shFb/DfjDZjp4UnNBcdJaoVSq8QxKbb3mjLbVktpTurvaP47/MNLG
	UYX38h4/tY1dibEW4sMbVyFCELum8OokY2OZ/PvY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789451367;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PQfV+K6ph7giLVJHj6AOulkv2QS7yo/zwlfXw5u/MIc=;
	b=kTGtJccmfIrzIGH8Q2MabgHKL2f2eVX0k9M6k5mI6xHJSBj2gs+IlSfyxzYlzjxQ
	S5qvexzaLmPhG4kG8L/7FxB84p0AFJEAH/cWGuNuRLyuijT81hXaqhbCDaXfGy8XPd5
	2l/y8ZQErfNxopo5FJjus16zBWn1HzEap3MsbWu8=
Content-Type: multipart/mixed; boundary="===============6594084398357969513=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 4.0.7 SUCCEEDED
Message-ID: <010101a0a39cf21c-a8c09eed-d7b4-433f-8f56-6fab7e796eaa-000000@us-west-2.amazonses.com>
Date: Tue, 15 Sep 2026 05:49:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 05:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245815

--===============6594084398357969513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ruby* to *4.0.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ruby-upgrade-4.0.6-4.0.7.patch
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
From e89e008497ac8dcd0cb9ace8d2622e9313984e44 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Sep 2026 05:31:03 +0000
Subject: [PATCH] ruby: upgrade 4.0.6 -> 4.0.7

---
 ...id-build-time-race-condition-when-cross-compiling.patch | 7 ++-----
 .../0001-Don-t-save-the-original-name-and-timestamp.patch  | 2 +-
 ...0001-extmk-fix-cross-compilation-of-external-gems.patch | 2 +-
 ...vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch | 4 ++--
 .../ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch   | 2 +-
 .../ruby/0003-rdoc-build-reproducible-documentation.patch  | 2 +-
 ...-mkmf.rb-sort-list-of-object-files-in-generated-M.patch | 2 +-
 ...ark-Gemspec-reproducible-change-fixing-784225-too.patch | 6 +++---
 .../ruby/ruby/0006-Make-gemspecs-reproducible.patch        | 2 +-
 ...007-Skip-test_rm_r_no_permissions-test-under-root.patch | 2 +-
 .../recipes-devtools/ruby/{ruby_4.0.6.bb => ruby_4.0.7.bb} | 2 +-
 11 files changed, 15 insertions(+), 18 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_4.0.6.bb => ruby_4.0.7.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch b/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch
index 3435dae7d0..d62e3affff 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch
@@ -1,4 +1,4 @@
-From b79c9ccbf17852f3ffd6acb8cc56124829e03edf Mon Sep 17 00:00:00 2001
+From 94b3a85def80680c6efb35e75b6e0dcd4bbf4645 Mon Sep 17 00:00:00 2001
 From: Paul Barker <paul@pbarker.dev>
 Date: Fri, 31 Jul 2026 13:15:37 +0100
 Subject: [PATCH] Avoid build-time race condition when cross-compiling from a
@@ -39,7 +39,7 @@ Signed-off-by: Paul Barker <paul@pbarker.dev>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/defs/gmake.mk b/defs/gmake.mk
-index e6f553fa8c1b..413057ca6896 100644
+index e6f553f..413057c 100644
 --- a/defs/gmake.mk
 +++ b/defs/gmake.mk
 @@ -435,9 +435,7 @@ endif
@@ -62,6 +62,3 @@ index e6f553fa8c1b..413057ca6896 100644
  
  include $(top_srcdir)/yjit/yjit.mk
  include $(top_srcdir)/zjit/zjit.mk
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
index b5bcfab924..1fd2066e1e 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
@@ -1,4 +1,4 @@
-From efd3a6d0f0cef4b2313a106f1a00e7d4a597d510 Mon Sep 17 00:00:00 2001
+From ac16ff9a35127c718422caf27fbe1dfa2309b136 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 27 Feb 2026 16:59:24 +0800
 Subject: [PATCH] Don't save the original name and timestamp
diff --git a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
index e00ce7bb73..36037aede3 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
@@ -1,4 +1,4 @@
-From 7c1f11416499ce7cd1e6874840df2498e922ab78 Mon Sep 17 00:00:00 2001
+From 846b17f3dbdbbd6b7dd7dcc81fda1826b87ee541 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 30 Sep 2019 16:57:01 +0100
 Subject: [PATCH] extmk: fix cross-compilation of external gems
diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
index 8ae4202e60..ea63dfe227 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
@@ -1,4 +1,4 @@
-From 4b66682db87a92d20c5ef0a00ea6eef41526d0cc Mon Sep 17 00:00:00 2001
+From f94129cac9e412a64bfb3dbd796912df058c6e1b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jan 2022 20:29:14 -0800
 Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/vm_dump.c b/vm_dump.c
-index e2b4804..0b7d868 100644
+index 8558ed8..230702d 100644
 --- a/vm_dump.c
 +++ b/vm_dump.c
 @@ -40,6 +40,11 @@
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index af4f768442..0e7c23007b 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,4 +1,4 @@
-From e1cb706a8653c632419803f8d36f3dd2d787face Mon Sep 17 00:00:00 2001
+From 385ea30ee2219bf9d1c702f18e38a2402a77a443 Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index 5c038a50cc..8bf6f38afe 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,4 +1,4 @@
-From 8476953b735fabad857ddfe78dd3ffcbef4028c5 Mon Sep 17 00:00:00 2001
+From 3f6ac07fd0359eb3d41db86a4276b5c7818f2e6b Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
 Subject: [PATCH] rdoc: build reproducible documentation
diff --git a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
index 0ba10724cb..c50cd7d2b2 100644
--- a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
+++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
@@ -1,4 +1,4 @@
-From 9fa6d40d1f7eed5be981c034c3f36bd4a3b5efab Mon Sep 17 00:00:00 2001
+From 0347f66bb6e834c5a5d469f5903527699a8a9f8e Mon Sep 17 00:00:00 2001
 From: Reiner Herrmann <reiner@reiner-h.de>
 Date: Tue, 10 Oct 2017 15:06:13 -0300
 Subject: [PATCH] lib/mkmf.rb: sort list of object files in generated Makefile
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index 4a10f861dc..e4974ff72e 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From 265381bc616fa281a58b3761c33620c465884ca8 Mon Sep 17 00:00:00 2001
+From 0e53d59cddda29e0c1d7d4196cc1255e04a3b39f Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -12,10 +12,10 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index 2db9352..925b7a0 100644
+index 9ae135c..427ab48 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
-@@ -1714,7 +1714,9 @@ class Gem::Specification < Gem::BasicSpecification
+@@ -1726,7 +1726,9 @@ class Gem::Specification < Gem::BasicSpecification
                  raise(Gem::InvalidSpecificationException,
                        "invalid date format in specification: #{date.inspect}")
                end
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index 92439ffd7a..3dfe4897f6 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,4 +1,4 @@
-From 40236d16b640b0c522a550b628cbfb6ee0cdc972 Mon Sep 17 00:00:00 2001
+From d4723a7dda5d2b57863ee1bba6a7456c732ea8e6 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
diff --git a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
index cb77fffe56..70b3efb4d5 100644
--- a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
+++ b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
@@ -1,4 +1,4 @@
-From ccb40b4715abfb6c53d431bf421ccfbcdbc4ff93 Mon Sep 17 00:00:00 2001
+From a811d47c307d33a1ee78c752dc2fff57ce6b0ba8 Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Mon, 7 Jul 2025 15:05:57 +0800
 Subject: [PATCH] Skip test_rm_r_no_permissions test under root
diff --git a/meta/recipes-devtools/ruby/ruby_4.0.6.bb b/meta/recipes-devtools/ruby/ruby_4.0.7.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_4.0.6.bb
rename to meta/recipes-devtools/ruby/ruby_4.0.7.bb
index d2a81a0ba5..324de86f8c 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.6.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.7.bb
@@ -49,7 +49,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "837d299e8f7ddf2be31a229a7a7e019d354979825117989acb3b32b1a9be262a"
+SRC_URI[sha256sum] = "911ace20f90d068ca0e4dda6d0e4f0f81e52e52f2dd4f4004c721e253412e82d"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.47.1


--===============6594084398357969513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/ruby/ruby-ptest: FILELIST: added "/usr/lib/ruby/ptest/test/resolv/test_resource_leak.rb"
packages/x86-64-v3-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/4.0.0/gems/erb-6.0.1.1/libexec -> /usr/lib/ruby/gems/4.0.0/gems/erb-6.0.7/libexec, directory renamed /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.16/exe -> /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.20/exe, removed "/usr/lib/ruby/gems/4.0.0/specifications/default/erb-6.0.1.1.gemspec /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.16.gemspec /usr/lib/libruby.so.4.0.6 /usr/lib/ruby/gems/4.0.0/specifications/default/resolv-0.7.0.gemspec", added "/usr/lib/ruby/gems/4.0.0/specifications/default/erb-6.0.7.gemspec /usr/lib/libruby.so.4.0.7 /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.20.gemspec /usr/lib/ruby/gems/4.0.0/specifications/default/resolv-0.7.2.gemspec"
Changes to packages/x86-64-v3-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.4.0 changed symlink target from libruby.so.4.0.6 to libruby.so.4.0.7
  /usr/lib/libruby.so changed symlink target from libruby.so.4.0.6 to libruby.so.4.0.7
  /usr/lib/libruby.so.4.0.6 moved to /usr/lib/libruby.so.4.0.7
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.16 moved to /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.20
  /usr/lib/ruby/gems/4.0.0/gems/resolv-0.7.0 moved to /usr/lib/ruby/gems/4.0.0/gems/resolv-0.7.2
  /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.16.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.20.gemspec
  /usr/lib/ruby/gems/4.0.0/specifications/default/resolv-0.7.0.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/resolv-0.7.2.gemspec
  /usr/lib/ruby/gems/4.0.0/gems/erb-6.0.7 was added
  /usr/lib/ruby/gems/4.0.0/gems/erb-6.0.7/libexec was added
  /usr/lib/ruby/gems/4.0.0/gems/erb-6.0.7/libexec/erb was added
  /usr/lib/ruby/gems/4.0.0/specifications/default/erb-6.0.7.gemspec was added
  /usr/lib/ruby/gems/4.0.0/gems/erb-6.0.1.1 was removed
  /usr/lib/ruby/gems/4.0.0/gems/erb-6.0.1.1/libexec was removed
  /usr/lib/ruby/gems/4.0.0/gems/erb-6.0.1.1/libexec/erb was removed
  /usr/lib/ruby/gems/4.0.0/specifications/default/erb-6.0.1.1.gemspec was removed

--===============6594084398357969513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ruby: SRC_URI changed from "http://cache.ruby-lang.org/pub/ruby/4.0/ruby-4.0.6.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch file://0001-Don-t-save-the-original-name-and-timestamp.patch file://0001-Avoid-build-time-race-condition-when-cross-compiling.patch" to "http://cache.ruby-lang.org/pub/ruby/4.0/ruby-4.0.7.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-document
 ation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch file://0001-Don-t-save-the-original-name-and-timestamp.patch file://0001-Avoid-build-time-race-condition-when-cross-compiling.patch"
packages/x86-64-v3-poky-linux/ruby: PKGV changed from 4.0.6 [default] to 4.0.7 [default]
packages/x86-64-v3-poky-linux/ruby: PV changed from "4.0.6" to "4.0.7"
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: FILELIST: removed "/usr/lib/.debug/libruby.so.4.0.6", added "/usr/lib/.debug/libruby.so.4.0.7"
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PKGV changed from 4.0.6 [default] to 4.0.7 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PKGSIZE changed from 18153648 to 18159264 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PV changed from "4.0.6" to "4.0.7"
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PKGV changed from 4.0.6 [default] to 4.0.7 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PV changed from "4.0.6" to "4.0.7"
packages/x86-64-v3-poky-linux/ruby/ruby-doc: PKGV changed from 4.0.6 [default] to 4.0.7 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-doc: PV changed from "4.0.6" to "4.0.7"
packages/x86-64-v3-poky-linux/ruby/ruby-locale: PKGV changed from 4.0.6 [default] to 4.0.7 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-locale: PV changed from "4.0.6" to "4.0.7"
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: FILELIST: added "/usr/lib/ruby/ptest/test/resolv/test_resource_leak.rb"
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PKGV changed from 4.0.6 [default] to 4.0.7 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PKGSIZE changed from 10351033 to 10404268 (+1%)
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PV changed from "4.0.6" to "4.0.7"
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: PKGV changed from 4.0.6 [default] to 4.0.7 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: PV changed from "4.0.6" to "4.0.7"
packages/x86-64-v3-poky-linux/ruby/ruby-ri-docs: PKGV changed from 4.0.6 [default] to 4.0.7 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-ri-docs: PV changed from "4.0.6" to "4.0.7"
packages/x86-64-v3-poky-linux/ruby/ruby-src: FILELIST: directory renamed /usr/src/debug/ruby/4.0.6/ext/strscan -> /usr/src/debug/ruby/4.0.7/ext/strscan, directory renamed /usr/src/debug/ruby/4.0.6/.bundle/gems/rbs-3.10.0/ext/rbs_extension -> /usr/src/debug/ruby/4.0.7/.bundle/gems/rbs-3.10.0/ext/rbs_extension, directory renamed /usr/src/debug/ruby/4.0.6/ext/json/generator -> /usr/src/debug/ruby/4.0.7/ext/json/generator, directory renamed /usr/src/debug/ruby/4.0.6/.bundle/gems/fiddle-1.1.8/ext/fiddle -> /usr/src/debug/ruby/4.0.7/.bundle/gems/fiddle-1.1.8/ext/fiddle, directory renamed /usr/src/debug/ruby/4.0.6/internal -> /usr/src/debug/ruby/4.0.7/internal, directory renamed /usr/src/debug/ruby/4.0.6/include/ruby/io -> /usr/src/debug/ruby/4.0.7/include/ruby/io, directory renamed /usr/src/debug/ruby/4.0.6/ext/digest/md5 -> /usr/src/debug/ruby/4.0.7/ext/digest/md5, directory renamed /usr/src/debug/ruby/4.0.6/include/ruby -> /usr/src/debug/ruby/4.0.7/include/ruby, directory renamed /usr/sr
 c/debug/ruby/4.0.6/include/ruby/internal -> /usr/src/debug/ruby/4.0.7/include/ruby/internal, directory renamed /usr/src/debug/ruby/4.0.6/ext/date -> /usr/src/debug/ruby/4.0.7/ext/date, directory renamed /usr/src/debug/ruby/4.0.6/ext/json/simd -> /usr/src/debug/ruby/4.0.7/ext/json/simd, directory renamed /usr/src/debug/ruby/4.0.6/.bundle/gems/rbs-3.10.0/include/rbs/util -> /usr/src/debug/ruby/4.0.7/.bundle/gems/rbs-3.10.0/include/rbs/util, directory renamed /usr/src/debug/ruby/4.0.6/enc/trans -> /usr/src/debug/ruby/4.0.7/enc/trans, directory renamed /usr/src/debug/ruby/4.0.6/ext/json/parser -> /usr/src/debug/ruby/4.0.7/ext/json/parser, directory renamed /usr/src/debug/ruby/4.0.6/ext/json/vendor -> /usr/src/debug/ruby/4.0.7/ext/json/vendor, directory renamed /usr/src/debug/ruby/4.0.6/enc -> /usr/src/debug/ruby/4.0.7/enc, directory renamed /usr/src/debug/ruby/4.0.6/ext/erb/escape -> /usr/src/debug/ruby/4.0.7/ext/erb/escape, directory renamed /usr/src/debug/ruby/4.0.6/prism/templates/sr
 c -> /usr/src/debug/ruby/4.0.7/prism/templates/src, directory renamed /usr/src/debug/ruby/4.0.6/ext/zlib -> /usr/src/debug/ruby/4.0.7/ext/zlib, directory renamed /usr/src/debug/ruby/4.0.6/ext/digest/rmd160 -> /usr/src/debug/ruby/4.0.7/ext/digest/rmd160, directory renamed /usr/src/debug/ruby/4.0.6/ext/fcntl -> /usr/src/debug/ruby/4.0.7/ext/fcntl, directory renamed /usr/src/debug/ruby/4.0.6/ext/rbconfig/sizeof -> /usr/src/debug/ruby/4.0.7/ext/rbconfig/sizeof, directory renamed /usr/src/debug/ruby/4.0.6/ext/psych -> /usr/src/debug/ruby/4.0.7/ext/psych, directory renamed /usr/src/debug/ruby/4.0.6/include/ruby/internal/intern -> /usr/src/debug/ruby/4.0.7/include/ruby/internal/intern, directory renamed /usr/src/debug/ruby/4.0.6/ext/digest/sha1 -> /usr/src/debug/ruby/4.0.7/ext/digest/sha1, directory renamed /usr/src/debug/ruby/4.0.6/ext/monitor -> /usr/src/debug/ruby/4.0.7/ext/monitor, directory renamed /usr/src/debug/ruby/4.0.6/ext/digest/sha2 -> /usr/src/debug/ruby/4.0.7/ext/digest/sha2,
  directory renamed /usr/src/debug/ruby/4.0.6/ext/objspace -> /usr/src/debug/ruby/4.0.7/ext/objspace, directory renamed /usr/src/debug/ruby/4.0.6/ext/ripper -> /usr/src/debug/ruby/4.0.7/ext/ripper, directory renamed /usr/src/debug/ruby/4.0.6/ext/continuation -> /usr/src/debug/ruby/4.0.7/ext/continuation, directory renamed /usr/src/debug/ruby/4.0.6/gc -> /usr/src/debug/ruby/4.0.7/gc, directory renamed /usr/src/debug/ruby/4.0.6/.bundle/gems/syslog-0.3.0/ext/syslog -> /usr/src/debug/ruby/4.0.7/.bundle/gems/syslog-0.3.0/ext/syslog, directory renamed /usr/src/debug/ruby/4.0.6/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal/missing -> /usr/src/debug/ruby/4.0.7/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal/missing, directory renamed /usr/src/debug/ruby/4.0.6/.bundle/gems/rbs-3.10.0/include/rbs -> /usr/src/debug/ruby/4.0.7/.bundle/gems/rbs-3.10.0/include/rbs, directory renamed /usr/src/debug/ruby/4.0.6/ext/cgi/escape -> /usr/src/debug/ruby/4.0.7/ext/cgi/escape, directory renamed /usr/src/debug/r
 uby/4.0.6/ext/stringio -> /usr/src/debug/ruby/4.0.7/ext/stringio, directory renamed /usr/src/debug/ruby/4.0.6/prism -> /usr/src/debug/ruby/4.0.7/prism, directory renamed /usr/src/debug/ruby/4.0.6/include/ruby/internal/encoding -> /usr/src/debug/ruby/4.0.7/include/ruby/internal/encoding, directory renamed /usr/src/debug/ruby/4.0.6/.bundle/gems/rbs-3.10.0/src -> /usr/src/debug/ruby/4.0.7/.bundle/gems/rbs-3.10.0/src, directory renamed /usr/src/debug/ruby/4.0.6/ext/socket -> /usr/src/debug/ruby/4.0.7/ext/socket, directory renamed /usr/src/debug/ruby/4.0.6/tool/ruby_vm/views -> /usr/src/debug/ruby/4.0.7/tool/ruby_vm/views, directory renamed /usr/src/debug/ruby/4.0.6/gc/default -> /usr/src/debug/ruby/4.0.7/gc/default, directory renamed /usr/src/debug/ruby/4.0.6/coroutine/amd64 -> /usr/src/debug/ruby/4.0.7/coroutine/amd64, directory renamed /usr/src/debug/ruby/4.0.6 -> /usr/src/debug/ruby/4.0.7, directory renamed /usr/src/debug/ruby/4.0.6/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal -> /us
 r/src/debug/ruby/4.0.7/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal, directory renamed /usr/src/debug/ruby/4.0.6/.bundle/gems/debug-1.11.1/ext/debug -> /usr/src/debug/ruby/4.0.7/.bundle/gems/debug-1.11.1/ext/debug, directory renamed /usr/src/debug/ruby/4.0.6/ext/io/nonblock -> /usr/src/debug/ruby/4.0.7/ext/io/nonblock, directory renamed /usr/src/debug/ruby/4.0.6/ext/digest -> /usr/src/debug/ruby/4.0.7/ext/digest, directory renamed /usr/src/debug/ruby/4.0.6/ext -> /usr/src/debug/ruby/4.0.7/ext, directory renamed /usr/src/debug/ruby/4.0.6/.bundle/gems/nkf-0.2.0/ext/nkf/nkf-utf8 -> /usr/src/debug/ruby/4.0.7/.bundle/gems/nkf-0.2.0/ext/nkf/nkf-utf8, directory renamed /usr/src/debug/ruby/4.0.6/include/ruby/internal/arithmetic -> /usr/src/debug/ruby/4.0.7/include/ruby/internal/arithmetic, directory renamed /usr/src/debug/ruby/4.0.6/ext/json/fbuffer -> /usr/src/debug/ruby/4.0.7/ext/json/fbuffer, directory renamed /usr/src/debug/ruby/4.0.6/prism/util -> /usr/src/debug/ruby/4.0.7/prism/util, 
 directory renamed /usr/src/debug/ruby/4.0.6/ext/coverage -> /usr/src/debug/ruby/4.0.7/ext/coverage, directory renamed /usr/src/debug/ruby/4.0.6/ccan/list -> /usr/src/debug/ruby/4.0.7/ccan/list, directory renamed /usr/src/debug/ruby/4.0.6/enc/unicode/17.0.0 -> /usr/src/debug/ruby/4.0.7/enc/unicode/17.0.0, directory renamed /usr/src/debug/ruby/4.0.6/ext/digest/bubblebabble -> /usr/src/debug/ruby/4.0.7/ext/digest/bubblebabble, directory renamed /usr/src/debug/ruby/4.0.6/.bundle/gems/racc-1.8.1/ext/racc/cparse -> /usr/src/debug/ruby/4.0.7/.bundle/gems/racc-1.8.1/ext/racc/cparse, directory renamed /usr/src/debug/ruby/4.0.6/enc/jis -> /usr/src/debug/ruby/4.0.7/enc/jis, directory renamed /usr/src/debug/ruby/4.0.6/ext/io/console -> /usr/src/debug/ruby/4.0.7/ext/io/console, directory renamed /usr/src/debug/ruby/4.0.6/.bundle/gems/rbs-3.10.0/src/util -> /usr/src/debug/ruby/4.0.7/.bundle/gems/rbs-3.10.0/src/util, directory renamed /usr/src/debug/ruby/4.0.6/ext/pty -> /usr/src/debug/ruby/4.0.7/
 ext/pty, directory renamed /usr/src/debug/ruby/4.0.6/include/ruby/internal/intern/select -> /usr/src/debug/ruby/4.0.7/include/ruby/internal/intern/select, directory renamed /usr/src/debug/ruby/4.0.6/include/ruby/fiber -> /usr/src/debug/ruby/4.0.7/include/ruby/fiber, directory renamed /usr/src/debug/ruby/4.0.6/ext/openssl -> /usr/src/debug/ruby/4.0.7/ext/openssl, directory renamed /usr/src/debug/ruby/4.0.6/missing -> /usr/src/debug/ruby/4.0.7/missing, directory renamed /usr/src/debug/ruby/4.0.6/ext/etc -> /usr/src/debug/ruby/4.0.7/ext/etc, directory renamed /usr/src/debug/ruby/4.0.6/ext/io/wait -> /usr/src/debug/ruby/4.0.7/ext/io/wait, directory renamed /usr/src/debug/ruby/4.0.6/include/ruby/internal/core -> /usr/src/debug/ruby/4.0.7/include/ruby/internal/core, directory renamed /usr/src/debug/ruby/4.0.6/prism/templates/ext/prism -> /usr/src/debug/ruby/4.0.7/prism/templates/ext/prism, directory renamed /usr/src/debug/ruby/4.0.6/defs -> /usr/src/debug/ruby/4.0.7/defs, directory rename
 d /usr/src/debug/ruby/4.0.6/.bundle/gems/nkf-0.2.0/ext/nkf -> /usr/src/debug/ruby/4.0.7/.bundle/gems/nkf-0.2.0/ext/nkf
packages/x86-64-v3-poky-linux/ruby/ruby-src: PKGV changed from 4.0.6 [default] to 4.0.7 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-src: PKGSIZE changed from 40758946 to 40765712 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-src: PV changed from "4.0.6" to "4.0.7"
packages/x86-64-v3-poky-linux/ruby/ruby-staticdev: PKGV changed from 4.0.6 [default] to 4.0.7 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-staticdev: PV changed from "4.0.6" to "4.0.7"
packages/x86-64-v3-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/4.0.0/gems/erb-6.0.1.1/libexec -> /usr/lib/ruby/gems/4.0.0/gems/erb-6.0.7/libexec, directory renamed /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.16/exe -> /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.20/exe, removed "/usr/lib/ruby/gems/4.0.0/specifications/default/erb-6.0.1.1.gemspec /usr/lib/libruby.so.4.0.6 /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.16.gemspec /usr/lib/ruby/gems/4.0.0/specifications/default/resolv-0.7.0.gemspec", added "/usr/lib/libruby.so.4.0.7 /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.20.gemspec /usr/lib/ruby/gems/4.0.0/specifications/default/erb-6.0.7.gemspec /usr/lib/ruby/gems/4.0.0/specifications/default/resolv-0.7.2.gemspec"
packages/x86-64-v3-poky-linux/ruby/ruby: PKGV changed from 4.0.6 [default] to 4.0.7 [default]
packages/x86-64-v3-poky-linux/ruby/ruby: PKGSIZE changed from 35686689 to 35720706 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby: PV changed from "4.0.6" to "4.0.7"
Changes to packages/x86-64-v3-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.4.0 changed symlink target from libruby.so.4.0.6 to libruby.so.4.0.7
  /usr/lib/libruby.so changed symlink target from libruby.so.4.0.6 to libruby.so.4.0.7
  /usr/lib/libruby.so.4.0.6 moved to /usr/lib/libruby.so.4.0.7
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.16 moved to /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.20
  /usr/lib/ruby/gems/4.0.0/gems/resolv-0.7.0 moved to /usr/lib/ruby/gems/4.0.0/gems/resolv-0.7.2
  /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.16.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.20.gemspec
  /usr/lib/ruby/gems/4.0.0/specifications/default/resolv-0.7.0.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/resolv-0.7.2.gemspec
  /usr/lib/ruby/gems/4.0.0/gems/erb-6.0.7 was added
  /usr/lib/ruby/gems/4.0.0/gems/erb-6.0.7/libexec was added
  /usr/lib/ruby/gems/4.0.0/gems/erb-6.0.7/libexec/erb was added
  /usr/lib/ruby/gems/4.0.0/specifications/default/erb-6.0.7.gemspec was added
  /usr/lib/ruby/gems/4.0.0/gems/erb-6.0.1.1 was removed
  /usr/lib/ruby/gems/4.0.0/gems/erb-6.0.1.1/libexec was removed
  /usr/lib/ruby/gems/4.0.0/gems/erb-6.0.1.1/libexec/erb was removed
  /usr/lib/ruby/gems/4.0.0/specifications/default/erb-6.0.1.1.gemspec was removed

--===============6594084398357969513==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-4.0.6-4.0.7.patch"

RnJvbSBlODllMDA4NDk3YWM4ZGNkMGNiOWFjZThkMjYyMmU5MzEzOTg0ZTQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgU2VwIDIwMjYgMDU6MzE6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
dWJ5OiB1cGdyYWRlIDQuMC42IC0+IDQuMC43CgotLS0KIC4uLmlkLWJ1aWxkLXRpbWUtcmFjZS1j
b25kaXRpb24td2hlbi1jcm9zcy1jb21waWxpbmcucGF0Y2ggfCA3ICsrLS0tLS0KIC4uLi8wMDAx
LURvbi10LXNhdmUtdGhlLW9yaWdpbmFsLW5hbWUtYW5kLXRpbWVzdGFtcC5wYXRjaCAgfCAyICst
CiAuLi4wMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBh
dGNoIHwgMiArLQogLi4udm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVz
bC1yaXNjdi5wYXRjaCB8IDQgKystLQogLi4uL3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRo
ZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2ggICB8IDIgKy0KIC4uLi9ydWJ5LzAwMDMtcmRvYy1idWls
ZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaCAgfCAyICstCiAuLi4tbWttZi5yYi1z
b3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWluLWdlbmVyYXRlZC1NLnBhdGNoIHwgMiArLQogLi4u
YXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaCB8
IDYgKysrLS0tCiAuLi4vcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUu
cGF0Y2ggICAgICAgIHwgMiArLQogLi4uMDA3LVNraXAtdGVzdF9ybV9yX25vX3Blcm1pc3Npb25z
LXRlc3QtdW5kZXItcm9vdC5wYXRjaCB8IDIgKy0KIC4uLi9yZWNpcGVzLWRldnRvb2xzL3J1Ynkv
e3J1YnlfNC4wLjYuYmIgPT4gcnVieV80LjAuNy5iYn0gfCAyICstCiAxMSBmaWxlcyBjaGFuZ2Vk
LCAxNSBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnVieS97cnVieV80LjAuNi5iYiA9PiBydWJ5XzQuMC43LmJifSAoOTglKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1Bdm9pZC1idWls
ZC10aW1lLXJhY2UtY29uZGl0aW9uLXdoZW4tY3Jvc3MtY29tcGlsaW5nLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLUF2b2lkLWJ1aWxkLXRpbWUtcmFjZS1jb25k
aXRpb24td2hlbi1jcm9zcy1jb21waWxpbmcucGF0Y2gKaW5kZXggMzQzNWRhZTdkMC4uZDYyZTNh
ZmZmZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLUF2
b2lkLWJ1aWxkLXRpbWUtcmFjZS1jb25kaXRpb24td2hlbi1jcm9zcy1jb21waWxpbmcucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLUF2b2lkLWJ1aWxkLXRp
bWUtcmFjZS1jb25kaXRpb24td2hlbi1jcm9zcy1jb21waWxpbmcucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIGI3OWM5Y2NiZjE3ODUyZjNmZmQ2YWNiOGNjNTYxMjQ4MjllMDNlZGYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDk0YjNhODVkZWY4MDY4MGM2ZWZiMzVlNzViNmUwZGNk
NGJiZjQ2NDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQYXVsIEJhcmtlciA8cGF1
bEBwYmFya2VyLmRldj4KIERhdGU6IEZyaSwgMzEgSnVsIDIwMjYgMTM6MTU6MzcgKzAxMDAKIFN1
YmplY3Q6IFtQQVRDSF0gQXZvaWQgYnVpbGQtdGltZSByYWNlIGNvbmRpdGlvbiB3aGVuIGNyb3Nz
LWNvbXBpbGluZyBmcm9tIGEKQEAgLTM5LDcgKzM5LDcgQEAgU2lnbmVkLW9mZi1ieTogUGF1bCBC
YXJrZXIgPHBhdWxAcGJhcmtlci5kZXY+CiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2RlZnMvZ21ha2UubWsgYi9kZWZzL2dt
YWtlLm1rCi1pbmRleCBlNmY1NTNmYThjMWIuLjQxMzA1N2NhNjg5NiAxMDA2NDQKK2luZGV4IGU2
ZjU1M2YuLjQxMzA1N2MgMTAwNjQ0CiAtLS0gYS9kZWZzL2dtYWtlLm1rCiArKysgYi9kZWZzL2dt
YWtlLm1rCiBAQCAtNDM1LDkgKzQzNSw3IEBAIGVuZGlmCkBAIC02Miw2ICs2MiwzIEBAIGluZGV4
IGU2ZjU1M2ZhOGMxYi4uNDEzMDU3Y2E2ODk2IDEwMDY0NAogIAogIGluY2x1ZGUgJCh0b3Bfc3Jj
ZGlyKS95aml0L3lqaXQubWsKICBpbmNsdWRlICQodG9wX3NyY2RpcikvemppdC96aml0Lm1rCi0t
LSAKLTIuNDMuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5
LzAwMDEtRG9uLXQtc2F2ZS10aGUtb3JpZ2luYWwtbmFtZS1hbmQtdGltZXN0YW1wLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLURvbi10LXNhdmUtdGhlLW9yaWdp
bmFsLW5hbWUtYW5kLXRpbWVzdGFtcC5wYXRjaAppbmRleCBiNWJjZmFiOTI0Li4xZmQyMDY2ZTFl
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtRG9uLXQt
c2F2ZS10aGUtb3JpZ2luYWwtbmFtZS1hbmQtdGltZXN0YW1wLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1Eb24tdC1zYXZlLXRoZS1vcmlnaW5hbC1uYW1l
LWFuZC10aW1lc3RhbXAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGVmZDNhNmQwZjBjZWY0
YjIzMTNhMTA2ZjFhMDBlN2Q0YTU5N2Q1MTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGFjMTZmZjlhMzUxMjdjNzE4NDIyY2FmMjdmYmUxZGZhMjMwOWIxMzYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29t
PgogRGF0ZTogRnJpLCAyNyBGZWIgMjAyNiAxNjo1OToyNCArMDgwMAogU3ViamVjdDogW1BBVENI
XSBEb24ndCBzYXZlIHRoZSBvcmlnaW5hbCBuYW1lIGFuZCB0aW1lc3RhbXAKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1leHRtay1maXgtY3Jvc3MtY29t
cGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwMS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vt
cy5wYXRjaAppbmRleCBlMDBjZTdiYjczLi4zNjAzN2FlZGUzIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9u
LW9mLWV4dGVybmFsLWdlbXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1Ynkv
cnVieS8wMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3YzFmMTE0MTY0OTljZTdjZDFlNjg3NDg0MGRmMjQ5
OGU5MjJhYjc4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4NDZiMTdmM2RiZGJiZDZi
N2RkN2RjYzgxZmRhMTgyNmI4N2VlNTQxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
PT9VVEYtOD9xP0FuZHI9QzM9QTk9MjBEcmFzemlrPz0gPGFuZHJlLmRyYXN6aWtAamNpLmNvbT4K
IERhdGU6IE1vbiwgMzAgU2VwIDIwMTkgMTY6NTc6MDEgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0g
ZXh0bWs6IGZpeCBjcm9zcy1jb21waWxhdGlvbiBvZiBleHRlcm5hbCBnZW1zCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1S
RUdfUzEtYW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZv
ci1tdXNsLXJpc2N2LnBhdGNoCmluZGV4IDhhZTQyMDJlNjAuLmVhNjNkZmUyMjcgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5l
LVJFR19TMS1hbmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQtUkVH
X1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0YjY2NjgyZGI4
N2E5MmQyMGM1ZWYwYTAwZWE2ZWVmNDE1MjZkMGNjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBmOTQxMjljYWM5ZTQxMmE2NGJmYjNkYmQ3OTY5MTJkZjA1OGM2ZTFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6
IFR1ZSwgMjUgSmFuIDIwMjIgMjA6Mjk6MTQgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdm1fZHVt
cC5jOiBEZWZpbmUgUkVHX1MxIGFuZCBSRUdfUzIgZm9yIG11c2wvcmlzY3YKQEAgLTE0LDcgKzE0
LDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS92bV9kdW1wLmMgYi92
bV9kdW1wLmMKLWluZGV4IGUyYjQ4MDQuLjBiN2Q4NjggMTAwNjQ0CitpbmRleCA4NTU4ZWQ4Li4y
MzA3MDJkIDEwMDY0NAogLS0tIGEvdm1fZHVtcC5jCiArKysgYi92bV9kdW1wLmMKIEBAIC00MCw2
ICs0MCwxMSBAQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8w
MDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9m
LWxpYnJ1YnkucGF0Y2gKaW5kZXggYWY0Zjc2ODQ0Mi4uMGU3YzIzMDA3YiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhl
LWxpbmstb2YtbGlicnVieS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9y
dWJ5LzAwMDItT2JleS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSBlMWNiNzA2YTg2NTNjNjMyNDE5ODAzZjhkMzZmM2RkMmQ3ODdmYWNl
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzODVlYTMwZWUyMjE5YmY5ZDFjNzAyZjE4
ZTM4YTI0MDJhNzdhNDQzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hyaXN0b3Bo
ZXIgTGFyc29uIDxjaHJpc19sYXJzb25AbWVudG9yLmNvbT4KIERhdGU6IFRodSwgNSBNYXkgMjAx
NiAxMDo1OTowNyAtMDcwMAogU3ViamVjdDogW1BBVENIXSBPYmV5IExERkxBR1MgZm9yIHRoZSBs
aW5rIG9mIGxpYnJ1YnkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1
YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxl
LWRvY3VtZW50YXRpb24ucGF0Y2gKaW5kZXggNWMwMzhhNTBjYy4uOGJmNmYzOGFmZSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVw
cm9kdWNpYmxlLWRvY3VtZW50YXRpb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxlLWRvY3VtZW50YXRpb24ucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDg0NzY5NTNiNzM1ZmFiYWQ4NTdkZGZlNzhkZDNmZmNi
ZWY0MDI4YzUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDNmNmFjMDdmZDAzNTllYjNk
NDFkYjg2YTQyNzZiNWM3ODE4ZjJlNmIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBD
aHJpc3RpYW4gSG9mc3RhZWR0bGVyIDx6ZWhhQGRlYmlhbi5vcmc+CiBEYXRlOiBUdWUsIDEwIE9j
dCAyMDE3IDE1OjA0OjM0IC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHJkb2M6IGJ1aWxkIHJlcHJv
ZHVjaWJsZSBkb2N1bWVudGF0aW9uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5LzAwMDQtbGliLW1rbWYucmItc29ydC1saXN0LW9mLW9iamVjdC1maWxlcy1pbi1n
ZW5lcmF0ZWQtTS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNC1s
aWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWluLWdlbmVyYXRlZC1NLnBhdGNo
CmluZGV4IDBiYTEwNzI0Y2IuLmM1MGNkN2QyYjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9ydWJ5L3J1YnkvMDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZp
bGVzLWluLWdlbmVyYXRlZC1NLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3J1YnkvMDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWluLWdlbmVy
YXRlZC1NLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5ZmE2ZDQwZDFmN2VlZDViZTk4MWMw
MzRjM2YzNmJkNGEzYjVlZmFiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwMzQ3ZjY2
YmI2ZTgzNGM1YTVkNDY5ZjU5MDM1Mjc2OTlhOGE5ZjhlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogUmVpbmVyIEhlcnJtYW5uIDxyZWluZXJAcmVpbmVyLWguZGU+CiBEYXRlOiBUdWUs
IDEwIE9jdCAyMDE3IDE1OjA2OjEzIC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxpYi9ta21mLnJi
OiBzb3J0IGxpc3Qgb2Ygb2JqZWN0IGZpbGVzIGluIGdlbmVyYXRlZCBNYWtlZmlsZQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA1LU1hcmstR2Vtc3BlYy1y
ZXByb2R1Y2libGUtY2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3J1YnkvcnVieS8wMDA1LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2libGUtY2hhbmdl
LWZpeGluZy03ODQyMjUtdG9vLnBhdGNoCmluZGV4IDRhMTBmODYxZGMuLmU0OTc0ZmY3MmUgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNw
ZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJvZHVjaWJs
ZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDI2
NTM4MWJjNjE2ZmEyODFhNThiMzc2MWMzMzYyMGM0NjU4ODRjYTggTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDBlNTNkNTljZGRkYTI5ZTBjMWQ3ZDQxOTZjYzEyNTVlMDRhM2IzOWYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBMdWNhcyBLYW5hc2hpcm8gPGthbmFzaGlyb0Bk
ZWJpYW4ub3JnPgogRGF0ZTogRnJpLCAxIE5vdiAyMDE5IDE1OjI1OjE3IC0wMzAwCiBTdWJqZWN0
OiBbUEFUQ0hdIE1ha2UgZ2Vtc3BlY3MgcmVwcm9kdWNpYmxlCkBAIC0xMiwxMCArMTIsMTAgQEAg
VXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbZGViaWFuXQogIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2xpYi9ydWJ5Z2Vtcy9z
cGVjaWZpY2F0aW9uLnJiIGIvbGliL3J1YnlnZW1zL3NwZWNpZmljYXRpb24ucmIKLWluZGV4IDJk
YjkzNTIuLjkyNWI3YTAgMTAwNjQ0CitpbmRleCA5YWUxMzVjLi40MjdhYjQ4IDEwMDY0NAogLS0t
IGEvbGliL3J1YnlnZW1zL3NwZWNpZmljYXRpb24ucmIKICsrKyBiL2xpYi9ydWJ5Z2Vtcy9zcGVj
aWZpY2F0aW9uLnJiCi1AQCAtMTcxNCw3ICsxNzE0LDkgQEAgY2xhc3MgR2VtOjpTcGVjaWZpY2F0
aW9uIDwgR2VtOjpCYXNpY1NwZWNpZmljYXRpb24KK0BAIC0xNzI2LDcgKzE3MjYsOSBAQCBjbGFz
cyBHZW06OlNwZWNpZmljYXRpb24gPCBHZW06OkJhc2ljU3BlY2lmaWNhdGlvbgogICAgICAgICAg
ICAgICAgICByYWlzZShHZW06OkludmFsaWRTcGVjaWZpY2F0aW9uRXhjZXB0aW9uLAogICAgICAg
ICAgICAgICAgICAgICAgICAiaW52YWxpZCBkYXRlIGZvcm1hdCBpbiBzcGVjaWZpY2F0aW9uOiAj
e2RhdGUuaW5zcGVjdH0iKQogICAgICAgICAgICAgICAgZW5kCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVj
cy1yZXByb2R1Y2libGUucGF0Y2gKaW5kZXggOTI0MzlmZmQ3YS4uM2RmZTQ4OTdmNiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3Mt
cmVwcm9kdWNpYmxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1Ynkv
MDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gNDAyMzZkMTZiNjQwYjBjNTIyYTU1MGI2MjhjYmZiNmVlMGNkYzk3MiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gZDQ3MjNhN2RkYTVkMmI1Nzg2M2VlMWJiYTZhNzQ1NmM3MzJlYThl
NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEx1Y2FzIEthbmFzaGlybyA8a2FuYXNo
aXJvQGRlYmlhbi5vcmc+CiBEYXRlOiBGcmksIDEgTm92IDIwMTkgMTU6MjU6MTcgLTAzMDAKIFN1
YmplY3Q6IFtQQVRDSF0gTWFrZSBnZW1zcGVjcyByZXByb2R1Y2libGUKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNy1Ta2lwLXRlc3Rfcm1fcl9ub19wZXJt
aXNzaW9ucy10ZXN0LXVuZGVyLXJvb3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVi
eS9ydWJ5LzAwMDctU2tpcC10ZXN0X3JtX3Jfbm9fcGVybWlzc2lvbnMtdGVzdC11bmRlci1yb290
LnBhdGNoCmluZGV4IGNiNzdmZmZlNTYuLjcwYjNlZmI0ZDUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNy1Ta2lwLXRlc3Rfcm1fcl9ub19wZXJtaXNzaW9u
cy10ZXN0LXVuZGVyLXJvb3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1Ynkv
cnVieS8wMDA3LVNraXAtdGVzdF9ybV9yX25vX3Blcm1pc3Npb25zLXRlc3QtdW5kZXItcm9vdC5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gY2NiNDBiNDcxNWFiZmI2YzUzZDQzMWJmNDIxY2Nm
YmNkYmM0ZmY5MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTgxMWQ0N2MzMDdkMzNh
MWVlNzhjNzUyZGMyZmZmNTdjZTZiMGJhOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEppYXlpbmcgU29uZyA8amlheWluZy5zb25nLmNuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBNb24s
IDcgSnVsIDIwMjUgMTU6MDU6NTcgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gU2tpcCB0ZXN0X3Jt
X3Jfbm9fcGVybWlzc2lvbnMgdGVzdCB1bmRlciByb290CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzQuMC42LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1
YnkvcnVieV80LjAuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzQuMC42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnVieS9ydWJ5XzQuMC43LmJiCmluZGV4IGQyYTgxYTBiYTUuLjMyNGRlODZmOGMg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfNC4wLjYuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV80LjAuNy5iYgpAQCAtNDksNyArNDks
NyBAQCBkb19jb25maWd1cmU6cHJlcGVuZCgpIHsKIAogREVQRU5EUzphcHBlbmQ6bGliYy1tdXNs
ID0gIiBsaWJ1Y29udGV4dCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjgzN2QyOTllOGY3ZGRm
MmJlMzFhMjI5YTdhN2UwMTlkMzU0OTc5ODI1MTE3OTg5YWNiM2IzMmIxYTliZTI2MmEiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiOTExYWNlMjBmOTBkMDY4Y2EwZTRkZGE2ZDBlNGYwZjgxZTUyZTUy
ZjJkZDRmNDAwNGM3MjFlMjUzNDEyZTgyZCIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiIKIFBBQ0tB
R0VDT05GSUcgKz0gIiR7QGJiLnV0aWxzLmZpbHRlcignRElTVFJPX0ZFQVRVUkVTJywgJ2lwdjYn
LCBkKX0iCi0tIAoyLjQ3LjEKCg==

--===============6594084398357969513==--

