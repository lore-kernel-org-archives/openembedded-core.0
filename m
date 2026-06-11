Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC868CDB46C
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:54 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50415.1781195499127124843
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Uq5H/7/P;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EuoleBZL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019eb786922d-7303948d-0f91-4380-92f2-1adfc84554ae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195510;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4D/wUMKNkSzuTiWWfGfuBQYSLWC6w59ZXfnTx55Nu5o=;
	b=Uq5H/7/PevsgQwikxmWcyNTjkA76k7Z+5TW7c2oYxXR2lBPxed0VS3HR8PdxRAsr
	VkkyKMYniJRdioui81knHkuYJpTiiwqew8TnVtpa6Sg0vAI9Vmfm8kzA85stORmubJK
	iBmHJpuPOwCSivg5LQiItBv0WluVfZo0+4WcY3L0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195510;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4D/wUMKNkSzuTiWWfGfuBQYSLWC6w59ZXfnTx55Nu5o=;
	b=EuoleBZL4iyXZiiKXkzeMfFhMnmY31aLh6SjY0aM0mSUwPpCBTk1/YlAOjGQwVhP
	ylBBNWEhFhu2GT4nNRRRvhGETAnR65JTXMqzN8hfI7fysb0MFZbxINZTBGShC+Ct0WG
	rLlvTi0LM6kZOnHEwxo9Z7u1UDq+SO2+9RpEVG8I=
Content-Type: multipart/mixed; boundary="===============6655466059918108421=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 4.0.5 SUCCEEDED
Message-ID: <0101019eb786922d-7303948d-0f91-4380-92f2-1adfc84554ae-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238510

--===============6655466059918108421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ruby* to *4.0.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ruby-upgrade-4.0.3-4.0.5.patch
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
From 3244875543345133b10b35c735b4d5e45065cf00 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 10:49:10 +0000
Subject: [PATCH] ruby: upgrade 4.0.3 -> 4.0.5

---
 ...-Don-t-save-the-original-name-and-timestamp.patch |  2 +-
 ...xtmk-fix-cross-compilation-of-external-gems.patch |  2 +-
 ...p.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch |  2 +-
 .../0002-Obey-LDFLAGS-for-the-link-of-libruby.patch  |  2 +-
 .../0003-rdoc-build-reproducible-documentation.patch | 12 ++++++------
 ...rb-sort-list-of-object-files-in-generated-M.patch |  2 +-
 ...mspec-reproducible-change-fixing-784225-too.patch |  6 +++---
 .../ruby/ruby/0006-Make-gemspecs-reproducible.patch  | 10 +++++-----
 ...ip-test_rm_r_no_permissions-test-under-root.patch |  2 +-
 .../ruby/{ruby_4.0.3.bb => ruby_4.0.5.bb}            |  2 +-
 10 files changed, 21 insertions(+), 21 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_4.0.3.bb => ruby_4.0.5.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
index 2c48ca184d..b5bcfab924 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
@@ -1,4 +1,4 @@
-From 73edbaf1a89e05e92f91ed97348a65c4ce740cea Mon Sep 17 00:00:00 2001
+From efd3a6d0f0cef4b2313a106f1a00e7d4a597d510 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 27 Feb 2026 16:59:24 +0800
 Subject: [PATCH] Don't save the original name and timestamp
diff --git a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
index 3bf80b1613..e00ce7bb73 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
@@ -1,4 +1,4 @@
-From f2ea81d4707614309cda02be59dd6ccbde9b2441 Mon Sep 17 00:00:00 2001
+From 7c1f11416499ce7cd1e6874840df2498e922ab78 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 30 Sep 2019 16:57:01 +0100
 Subject: [PATCH] extmk: fix cross-compilation of external gems
diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
index 32d55cde9f..8ae4202e60 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
@@ -1,4 +1,4 @@
-From 875543f1bc5da190543e2696a47cfaaf939e1549 Mon Sep 17 00:00:00 2001
+From 4b66682db87a92d20c5ef0a00ea6eef41526d0cc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jan 2022 20:29:14 -0800
 Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index 11aec87934..af4f768442 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,4 +1,4 @@
-From c460fce052e04a8126f5e0554f68359ef986c5f8 Mon Sep 17 00:00:00 2001
+From e1cb706a8653c632419803f8d36f3dd2d787face Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index 863960839d..5c038a50cc 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,4 +1,4 @@
-From 3a335538594d0eb3da6155a64b473a46fd06ce76 Mon Sep 17 00:00:00 2001
+From 8476953b735fabad857ddfe78dd3ffcbef4028c5 Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
 Subject: [PATCH] rdoc: build reproducible documentation
@@ -13,13 +13,13 @@ Signed-off-by: Christian Hofstaedtler <zeha@debian.org>
 rebase to version 4.0.1
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- .bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb | 4 ++--
+ .bundle/gems/rdoc-7.0.4/lib/rdoc/generator/json_index.rb | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb b/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb
-index 065caa4..cfa1f33 100644
---- a/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb
-+++ b/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb
+diff --git a/.bundle/gems/rdoc-7.0.4/lib/rdoc/generator/json_index.rb b/.bundle/gems/rdoc-7.0.4/lib/rdoc/generator/json_index.rb
+index c61391d..9115dbd 100644
+--- a/.bundle/gems/rdoc-7.0.4/lib/rdoc/generator/json_index.rb
++++ b/.bundle/gems/rdoc-7.0.4/lib/rdoc/generator/json_index.rb
 @@ -176,7 +176,7 @@ class RDoc::Generator::JsonIndex
      debug_msg "Writing gzipped search index to %s" % outfile
  
diff --git a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
index 2c1f857d75..0ba10724cb 100644
--- a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
+++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
@@ -1,4 +1,4 @@
-From e94b898d11e3bd5c412aa3b772040870cddf36c7 Mon Sep 17 00:00:00 2001
+From 9fa6d40d1f7eed5be981c034c3f36bd4a3b5efab Mon Sep 17 00:00:00 2001
 From: Reiner Herrmann <reiner@reiner-h.de>
 Date: Tue, 10 Oct 2017 15:06:13 -0300
 Subject: [PATCH] lib/mkmf.rb: sort list of object files in generated Makefile
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index 746d102292..4a10f861dc 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From f21e09b9c8f5975887cd85e3ec4dcf9838f62575 Mon Sep 17 00:00:00 2001
+From 265381bc616fa281a58b3761c33620c465884ca8 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -12,10 +12,10 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index 503f0a4..5d33b09 100644
+index 2db9352..925b7a0 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
-@@ -1705,7 +1705,9 @@ class Gem::Specification < Gem::BasicSpecification
+@@ -1714,7 +1714,9 @@ class Gem::Specification < Gem::BasicSpecification
                  raise(Gem::InvalidSpecificationException,
                        "invalid date format in specification: #{date.inspect}")
                end
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index cdfa2144d7..92439ffd7a 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,4 +1,4 @@
-From 2a18efc076a20bc270215a802d72618ad0605f91 Mon Sep 17 00:00:00 2001
+From 40236d16b640b0c522a550b628cbfb6ee0cdc972 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -13,7 +13,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  .bundle/gems/bigdecimal-4.0.1/bigdecimal.gemspec | 1 +
  .bundle/gems/fiddle-1.1.8/fiddle.gemspec         | 1 +
- .bundle/gems/rdoc-7.0.3/rdoc.gemspec             | 1 +
+ .bundle/gems/rdoc-7.0.4/rdoc.gemspec             | 1 +
  ext/io/console/io-console.gemspec                | 1 +
  lib/ipaddr.gemspec                               | 1 +
  5 files changed, 5 insertions(+)
@@ -42,10 +42,10 @@ index 0092f52..f77c224 100644
    spec.authors       = ["Aaron Patterson", "SHIBATA Hiroshi"]
    spec.email         = ["aaron@tenderlovemaking.com", "hsbt@ruby-lang.org"]
  
-diff --git a/.bundle/gems/rdoc-7.0.3/rdoc.gemspec b/.bundle/gems/rdoc-7.0.3/rdoc.gemspec
+diff --git a/.bundle/gems/rdoc-7.0.4/rdoc.gemspec b/.bundle/gems/rdoc-7.0.4/rdoc.gemspec
 index ada9341..5871ec2 100644
---- a/.bundle/gems/rdoc-7.0.3/rdoc.gemspec
-+++ b/.bundle/gems/rdoc-7.0.3/rdoc.gemspec
+--- a/.bundle/gems/rdoc-7.0.4/rdoc.gemspec
++++ b/.bundle/gems/rdoc-7.0.4/rdoc.gemspec
 @@ -7,6 +7,7 @@ end
  
  Gem::Specification.new do |s|
diff --git a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
index 93b7406858..cb77fffe56 100644
--- a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
+++ b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
@@ -1,4 +1,4 @@
-From 4a48511f45606eff4e03f004fb6aea6f8ccd1eaf Mon Sep 17 00:00:00 2001
+From ccb40b4715abfb6c53d431bf421ccfbcdbc4ff93 Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Mon, 7 Jul 2025 15:05:57 +0800
 Subject: [PATCH] Skip test_rm_r_no_permissions test under root
diff --git a/meta/recipes-devtools/ruby/ruby_4.0.3.bb b/meta/recipes-devtools/ruby/ruby_4.0.5.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_4.0.3.bb
rename to meta/recipes-devtools/ruby/ruby_4.0.5.bb
index 56f167379c..a0981bf622 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.5.bb
@@ -48,7 +48,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "77964acc370d5c8375b9502e5ba6c13c03ef91ab9eb9f521c84fb42b9c9a6b0f"
+SRC_URI[sha256sum] = "7d6149079a63f8ae1d326c9fa65c6019ba2dc3155eae7b39159817911c88958e"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.47.1


--===============6655466059918108421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ruby: PV changed from "4.0.3" to "4.0.5"
packages/x86-64-v3-poky-linux/ruby: SRC_URI changed from "http://cache.ruby-lang.org/pub/ruby/4.0/ruby-4.0.3.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch file://0001-Don-t-save-the-original-name-and-timestamp.patch" to "http://cache.ruby-lang.org/pub/ruby/4.0/ruby-4.0.5.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-genera
 ted-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch file://0001-Don-t-save-the-original-name-and-timestamp.patch"
packages/x86-64-v3-poky-linux/ruby: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PV changed from "4.0.3" to "4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: FILELIST: removed "/usr/lib/.debug/libruby.so.4.0.3", added "/usr/lib/.debug/libruby.so.4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PKGSIZE changed from 18123184 to 18129304 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PV changed from "4.0.3" to "4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-doc: PV changed from "4.0.3" to "4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby-doc: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-locale: PV changed from "4.0.3" to "4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby-locale: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PV changed from "4.0.3" to "4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PKGSIZE changed from 10252720 to 10267138 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: PV changed from "4.0.3" to "4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-ri-docs: PV changed from "4.0.3" to "4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby-ri-docs: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-src: PV changed from "4.0.3" to "4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby-src: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-src: FILELIST: directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/nkf-0.2.0/ext/nkf/nkf-utf8 -> /usr/src/debug/ruby/4.0.5/.bundle/gems/nkf-0.2.0/ext/nkf/nkf-utf8, directory renamed /usr/src/debug/ruby/4.0.3/ext/date -> /usr/src/debug/ruby/4.0.5/ext/date, directory renamed /usr/src/debug/ruby/4.0.3/ext/io/console -> /usr/src/debug/ruby/4.0.5/ext/io/console, directory renamed /usr/src/debug/ruby/4.0.3/ext -> /usr/src/debug/ruby/4.0.5/ext, directory renamed /usr/src/debug/ruby/4.0.3/enc/unicode/17.0.0 -> /usr/src/debug/ruby/4.0.5/enc/unicode/17.0.0, directory renamed /usr/src/debug/ruby/4.0.3/ext/digest -> /usr/src/debug/ruby/4.0.5/ext/digest, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/racc-1.8.1/ext/racc/cparse -> /usr/src/debug/ruby/4.0.5/.bundle/gems/racc-1.8.1/ext/racc/cparse, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/internal -> /usr/src/debug/ruby/4.0.5/include/ruby/internal, directory renamed /usr/src/debu
 g/ruby/4.0.3/include/ruby/internal/intern -> /usr/src/debug/ruby/4.0.5/include/ruby/internal/intern, directory renamed /usr/src/debug/ruby/4.0.3 -> /usr/src/debug/ruby/4.0.5, directory renamed /usr/src/debug/ruby/4.0.3/prism/util -> /usr/src/debug/ruby/4.0.5/prism/util, directory renamed /usr/src/debug/ruby/4.0.3/ext/zlib -> /usr/src/debug/ruby/4.0.5/ext/zlib, directory renamed /usr/src/debug/ruby/4.0.3/ext/json/parser -> /usr/src/debug/ruby/4.0.5/ext/json/parser, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/debug-1.11.1/ext/debug -> /usr/src/debug/ruby/4.0.5/.bundle/gems/debug-1.11.1/ext/debug, directory renamed /usr/src/debug/ruby/4.0.3/ext/json/vendor -> /usr/src/debug/ruby/4.0.5/ext/json/vendor, directory renamed /usr/src/debug/ruby/4.0.3/prism -> /usr/src/debug/ruby/4.0.5/prism, directory renamed /usr/src/debug/ruby/4.0.3/ext/ripper -> /usr/src/debug/ruby/4.0.5/ext/ripper, directory renamed /usr/src/debug/ruby/4.0.3/ext/json/simd -> /usr/src/debug/ruby/4.0.5/ext/jso
 n/simd, directory renamed /usr/src/debug/ruby/4.0.3/tool/ruby_vm/views -> /usr/src/debug/ruby/4.0.5/tool/ruby_vm/views, directory renamed /usr/src/debug/ruby/4.0.3/ext/json/fbuffer -> /usr/src/debug/ruby/4.0.5/ext/json/fbuffer, directory renamed /usr/src/debug/ruby/4.0.3/ext/digest/md5 -> /usr/src/debug/ruby/4.0.5/ext/digest/md5, directory renamed /usr/src/debug/ruby/4.0.3/ccan/list -> /usr/src/debug/ruby/4.0.5/ccan/list, directory renamed /usr/src/debug/ruby/4.0.3/ext/erb/escape -> /usr/src/debug/ruby/4.0.5/ext/cgi/escape, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/rbs-3.10.0/src -> /usr/src/debug/ruby/4.0.5/.bundle/gems/rbs-3.10.0/src, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/internal/core -> /usr/src/debug/ruby/4.0.5/include/ruby/internal/core, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/io -> /usr/src/debug/ruby/4.0.5/include/ruby/io, directory renamed /usr/src/debug/ruby/4.0.3/gc/default -> /usr/src/debug/ruby/4.0.5/gc/default, directo
 ry renamed /usr/src/debug/ruby/4.0.3/ext/digest/rmd160 -> /usr/src/debug/ruby/4.0.5/ext/digest/rmd160, directory renamed /usr/src/debug/ruby/4.0.3/ext/rbconfig/sizeof -> /usr/src/debug/ruby/4.0.5/ext/rbconfig/sizeof, directory renamed /usr/src/debug/ruby/4.0.3/internal -> /usr/src/debug/ruby/4.0.5/internal, directory renamed /usr/src/debug/ruby/4.0.3/ext/cgi/escape -> /usr/src/debug/ruby/4.0.5/ext/erb/escape, directory renamed /usr/src/debug/ruby/4.0.3/ext/stringio -> /usr/src/debug/ruby/4.0.5/ext/stringio, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/rbs-3.10.0/include/rbs -> /usr/src/debug/ruby/4.0.5/.bundle/gems/rbs-3.10.0/include/rbs, directory renamed /usr/src/debug/ruby/4.0.3/ext/strscan -> /usr/src/debug/ruby/4.0.5/ext/strscan, directory renamed /usr/src/debug/ruby/4.0.3/prism/templates/src -> /usr/src/debug/ruby/4.0.5/prism/templates/src, directory renamed /usr/src/debug/ruby/4.0.3/gc -> /usr/src/debug/ruby/4.0.5/gc, directory renamed /usr/src/debug/ruby/4.0.3/in
 clude/ruby/fiber -> /usr/src/debug/ruby/4.0.5/include/ruby/fiber, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby -> /usr/src/debug/ruby/4.0.5/include/ruby, directory renamed /usr/src/debug/ruby/4.0.3/ext/io/nonblock -> /usr/src/debug/ruby/4.0.5/ext/io/nonblock, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/rbs-3.10.0/include/rbs/util -> /usr/src/debug/ruby/4.0.5/.bundle/gems/rbs-3.10.0/include/rbs/util, directory renamed /usr/src/debug/ruby/4.0.3/ext/socket -> /usr/src/debug/ruby/4.0.5/ext/socket, directory renamed /usr/src/debug/ruby/4.0.3/defs -> /usr/src/debug/ruby/4.0.5/defs, directory renamed /usr/src/debug/ruby/4.0.3/coroutine/amd64 -> /usr/src/debug/ruby/4.0.5/coroutine/amd64, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/fiddle-1.1.8/ext/fiddle -> /usr/src/debug/ruby/4.0.5/.bundle/gems/fiddle-1.1.8/ext/fiddle, directory renamed /usr/src/debug/ruby/4.0.3/ext/coverage -> /usr/src/debug/ruby/4.0.5/ext/coverage, directory renamed /usr/src/debug/ru
 by/4.0.3/prism/templates/ext/prism -> /usr/src/debug/ruby/4.0.5/prism/templates/ext/prism, directory renamed /usr/src/debug/ruby/4.0.3/ext/json/generator -> /usr/src/debug/ruby/4.0.5/ext/json/generator, directory renamed /usr/src/debug/ruby/4.0.3/ext/openssl -> /usr/src/debug/ruby/4.0.5/ext/openssl, directory renamed /usr/src/debug/ruby/4.0.3/ext/psych -> /usr/src/debug/ruby/4.0.5/ext/psych, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/internal/arithmetic -> /usr/src/debug/ruby/4.0.5/include/ruby/internal/arithmetic, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/internal/encoding -> /usr/src/debug/ruby/4.0.5/include/ruby/internal/encoding, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/nkf-0.2.0/ext/nkf -> /usr/src/debug/ruby/4.0.5/.bundle/gems/nkf-0.2.0/ext/nkf, directory renamed /usr/src/debug/ruby/4.0.3/enc/trans -> /usr/src/debug/ruby/4.0.5/enc/trans, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal -> /usr
 /src/debug/ruby/4.0.5/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/rbs-3.10.0/src/util -> /usr/src/debug/ruby/4.0.5/.bundle/gems/rbs-3.10.0/src/util, directory renamed /usr/src/debug/ruby/4.0.3/enc/jis -> /usr/src/debug/ruby/4.0.5/enc/jis, directory renamed /usr/src/debug/ruby/4.0.3/ext/continuation -> /usr/src/debug/ruby/4.0.5/ext/continuation, directory renamed /usr/src/debug/ruby/4.0.3/ext/monitor -> /usr/src/debug/ruby/4.0.5/ext/monitor, directory renamed /usr/src/debug/ruby/4.0.3/ext/fcntl -> /usr/src/debug/ruby/4.0.5/ext/fcntl, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/internal/intern/select -> /usr/src/debug/ruby/4.0.5/include/ruby/internal/intern/select, directory renamed /usr/src/debug/ruby/4.0.3/ext/digest/sha1 -> /usr/src/debug/ruby/4.0.5/ext/digest/sha1, directory renamed /usr/src/debug/ruby/4.0.3/ext/digest/sha2 -> /usr/src/debug/ruby/4.0.5/ext/digest/sha2, directory renamed /usr/src/debug/ruby/4.0
 .3/ext/pty -> /usr/src/debug/ruby/4.0.5/ext/pty, directory renamed /usr/src/debug/ruby/4.0.3/ext/digest/bubblebabble -> /usr/src/debug/ruby/4.0.5/ext/digest/bubblebabble, directory renamed /usr/src/debug/ruby/4.0.3/ext/objspace -> /usr/src/debug/ruby/4.0.5/ext/objspace, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal/missing -> /usr/src/debug/ruby/4.0.5/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal/missing, directory renamed /usr/src/debug/ruby/4.0.3/ext/etc -> /usr/src/debug/ruby/4.0.5/ext/etc, directory renamed /usr/src/debug/ruby/4.0.3/ext/io/wait -> /usr/src/debug/ruby/4.0.5/ext/io/wait, directory renamed /usr/src/debug/ruby/4.0.3/enc -> /usr/src/debug/ruby/4.0.5/enc, directory renamed /usr/src/debug/ruby/4.0.3/missing -> /usr/src/debug/ruby/4.0.5/missing, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/syslog-0.3.0/ext/syslog -> /usr/src/debug/ruby/4.0.5/.bundle/gems/syslog-0.3.0/ext/syslog, directory renamed /usr/src/debug/ruby/
 4.0.3/.bundle/gems/rbs-3.10.0/ext/rbs_extension -> /usr/src/debug/ruby/4.0.5/.bundle/gems/rbs-3.10.0/ext/rbs_extension
packages/x86-64-v3-poky-linux/ruby/ruby-src: PKGSIZE changed from 40710188 to 40714378 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-staticdev: PV changed from "4.0.3" to "4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby-staticdev: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby: PV changed from "4.0.3" to "4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/aliki -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/aliki, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/darkfish/css -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/darkfish/css, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/pot -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/pot, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/json_index/js -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/json_index/js, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/aliki/js -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/aliki/js, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/gener
 ator/template/darkfish -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/darkfish, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/stats -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/stats, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/darkfish/fonts -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/darkfish/fonts, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/darkfish/js -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/darkfish/js, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/aliki/css -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/
 generator/template/aliki/css, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/exe -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/exe, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/markup -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/markup, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/rd -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/rd, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/ri -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/ri, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/man -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/man, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/darkfish/images -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/darkfish/images, directory renamed
  /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3 -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/i18n -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/i18n, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/markdown -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/markdown, directory renamed /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6/exe -> /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10/exe, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/code_object/context -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/code_object/context, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/code_object -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/code_object, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/parser -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/parser, removed "/usr/lib/libruby.so.4.0.3 /usr/lib/ruby/gems/4.0.0/specifications/
 default/bundler-4.0.6.gemspec /usr/lib/ruby/gems/4.0.0/cache/rdoc-7.0.3.gem /usr/lib/ruby/gems/4.0.0/specifications/rdoc-7.0.3.gemspec", added "/usr/lib/ruby/4.0.0/bundler/templates/newgem/ext/newgem/build.rs.tt /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.10.gemspec /usr/lib/ruby/gems/4.0.0/specifications/rdoc-7.0.4.gemspec /usr/lib/ruby/gems/4.0.0/cache/rdoc-7.0.4.gem /usr/lib/ruby/4.0.0/bundler/templates/newgem/github/workflows/build-gems.yml.tt /usr/lib/libruby.so.4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby: PKGSIZE changed from 35598552 to 35616581 (+0%)
Changes to packages/x86-64-v3-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.4.0 changed symlink target from libruby.so.4.0.3 to libruby.so.4.0.5
  /usr/lib/libruby.so changed symlink target from libruby.so.4.0.3 to libruby.so.4.0.5
  /usr/lib/libruby.so.4.0.3 moved to /usr/lib/libruby.so.4.0.5
  /usr/lib/ruby/gems/4.0.0/cache/rdoc-7.0.3.gem moved to /usr/lib/ruby/gems/4.0.0/cache/rdoc-7.0.4.gem
  /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3 moved to /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4
  /usr/lib/ruby/gems/4.0.0/specifications/rdoc-7.0.3.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/rdoc-7.0.4.gemspec
  /usr/lib/ruby/4.0.0/bundler/templates/newgem/ext/newgem/build.rs.tt was added
  /usr/lib/ruby/4.0.0/bundler/templates/newgem/github/workflows/build-gems.yml.tt was added
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10 was added
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10/exe was added
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10/exe/bundle was added
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10/exe/bundler was added
  /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.10.gemspec was added
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6 was removed
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6/exe was removed
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6/exe/bundle was removed
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6/exe/bundler was removed
  /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.6.gemspec was removed

--===============6655466059918108421==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-4.0.3-4.0.5.patch"

RnJvbSAzMjQ0ODc1NTQzMzQ1MTMzYjEwYjM1YzczNWI0ZDVlNDUwNjVjZjAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTA6NDk6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
dWJ5OiB1cGdyYWRlIDQuMC4zIC0+IDQuMC41CgotLS0KIC4uLi1Eb24tdC1zYXZlLXRoZS1vcmln
aW5hbC1uYW1lLWFuZC10aW1lc3RhbXAucGF0Y2ggfCAgMiArLQogLi4ueHRtay1maXgtY3Jvc3Mt
Y29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaCB8ICAyICstCiAuLi5wLmMtRGVmaW5l
LVJFR19TMS1hbmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoIHwgIDIgKy0KIC4uLi8wMDAy
LU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaCAgfCAgMiArLQogLi4u
LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaCB8IDEyICsr
KysrKy0tLS0tLQogLi4ucmItc29ydC1saXN0LW9mLW9iamVjdC1maWxlcy1pbi1nZW5lcmF0ZWQt
TS5wYXRjaCB8ICAyICstCiAuLi5tc3BlYy1yZXByb2R1Y2libGUtY2hhbmdlLWZpeGluZy03ODQy
MjUtdG9vLnBhdGNoIHwgIDYgKysrLS0tCiAuLi4vcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVj
cy1yZXByb2R1Y2libGUucGF0Y2ggIHwgMTAgKysrKystLS0tLQogLi4uaXAtdGVzdF9ybV9yX25v
X3Blcm1pc3Npb25zLXRlc3QtdW5kZXItcm9vdC5wYXRjaCB8ICAyICstCiAuLi4vcnVieS97cnVi
eV80LjAuMy5iYiA9PiBydWJ5XzQuMC41LmJifSAgICAgICAgICAgIHwgIDIgKy0KIDEwIGZpbGVz
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydWJ5L3tydWJ5XzQuMC4zLmJiID0+IHJ1YnlfNC4wLjUuYmJ9ICg5
OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLURv
bi10LXNhdmUtdGhlLW9yaWdpbmFsLW5hbWUtYW5kLXRpbWVzdGFtcC5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1Eb24tdC1zYXZlLXRoZS1vcmlnaW5hbC1uYW1l
LWFuZC10aW1lc3RhbXAucGF0Y2gKaW5kZXggMmM0OGNhMTg0ZC4uYjViY2ZhYjkyNCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLURvbi10LXNhdmUtdGhl
LW9yaWdpbmFsLW5hbWUtYW5kLXRpbWVzdGFtcC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnVieS9ydWJ5LzAwMDEtRG9uLXQtc2F2ZS10aGUtb3JpZ2luYWwtbmFtZS1hbmQtdGlt
ZXN0YW1wLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3M2VkYmFmMWE4OWUwNWU5MmY5MWVk
OTczNDhhNjVjNGNlNzQwY2VhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlZmQzYTZk
MGYwY2VmNGIyMzEzYTEwNmYxYTAwZTdkNGE1OTdkNTEwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogQ2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KIERhdGU6
IEZyaSwgMjcgRmViIDIwMjYgMTY6NTk6MjQgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gRG9uJ3Qg
c2F2ZSB0aGUgb3JpZ2luYWwgbmFtZSBhbmQgdGltZXN0YW1wCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9u
LW9mLWV4dGVybmFsLWdlbXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5
LzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0Y2gK
aW5kZXggM2JmODBiMTYxMy4uZTAwY2U3YmI3MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieS8wMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRl
cm5hbC1nZW1zLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAw
MS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gZjJlYTgxZDQ3MDc2MTQzMDljZGEwMmJlNTlkZDZjY2JkZTliMjQ0
MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gN2MxZjExNDE2NDk5Y2U3Y2QxZTY4NzQ4
NDBkZjI0OThlOTIyYWI3OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206ID0/VVRGLTg/
cT9BbmRyPUMzPUE5PTIwRHJhc3ppaz89IDxhbmRyZS5kcmFzemlrQGpjaS5jb20+CiBEYXRlOiBN
b24sIDMwIFNlcCAyMDE5IDE2OjU3OjAxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGV4dG1rOiBm
aXggY3Jvc3MtY29tcGlsYXRpb24gb2YgZXh0ZXJuYWwgZ2VtcwpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLXZtX2R1bXAuYy1EZWZpbmUtUkVHX1MxLWFu
ZC1SRUdfUzItZm9yLW11c2wtcmlzY3YucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVi
eS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVzbC1y
aXNjdi5wYXRjaAppbmRleCAzMmQ1NWNkZTlmLi44YWU0MjAyZTYwIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEt
YW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3It
bXVzbC1yaXNjdi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gODc1NTQzZjFiYzVkYTE5MDU0
M2UyNjk2YTQ3Y2ZhYWY5MzllMTU0OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNGI2
NjY4MmRiODdhOTJkMjBjNWVmMGEwMGVhNmVlZjQxNTI2ZDBjYyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDI1
IEphbiAyMDIyIDIwOjI5OjE0IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHZtX2R1bXAuYzogRGVm
aW5lIFJFR19TMSBhbmQgUkVHX1MyIGZvciBtdXNsL3Jpc2N2CmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDItT2JleS1MREZMQUdTLWZvci10aGUtbGluay1v
Zi1saWJydWJ5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAyLU9i
ZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaAppbmRleCAxMWFlYzg3OTM0
Li5hZjRmNzY4NDQyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5
LzAwMDItT2JleS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1s
aW5rLW9mLWxpYnJ1YnkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGM0NjBmY2UwNTJlMDRh
ODEyNmY1ZTA1NTRmNjgzNTllZjk4NmM1ZjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGUxY2I3MDZhODY1M2M2MzI0MTk4MDNmOGQzNmYzZGQyZDc4N2ZhY2UgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBDaHJpc3RvcGhlciBMYXJzb24gPGNocmlzX2xhcnNvbkBtZW50b3Iu
Y29tPgogRGF0ZTogVGh1LCA1IE1heSAyMDE2IDEwOjU5OjA3IC0wNzAwCiBTdWJqZWN0OiBbUEFU
Q0hdIE9iZXkgTERGTEFHUyBmb3IgdGhlIGxpbmsgb2YgbGlicnVieQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxl
LWRvY3VtZW50YXRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAw
MDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaAppbmRleCA4NjM5
NjA4MzlkLi41YzAzOGE1MGNjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVi
eS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXBy
b2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2EzMzU1
Mzg1OTRkMGViM2RhNjE1NWE2NGI0NzNhNDZmZDA2Y2U3NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gODQ3Njk1M2I3MzVmYWJhZDg1N2RkZmU3OGRkM2ZmY2JlZjQwMjhjNSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENocmlzdGlhbiBIb2ZzdGFlZHRsZXIgPHplaGFAZGVi
aWFuLm9yZz4KIERhdGU6IFR1ZSwgMTAgT2N0IDIwMTcgMTU6MDQ6MzQgLTAzMDAKIFN1YmplY3Q6
IFtQQVRDSF0gcmRvYzogYnVpbGQgcmVwcm9kdWNpYmxlIGRvY3VtZW50YXRpb24KQEAgLTEzLDEz
ICsxMywxMyBAQCBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gSG9mc3RhZWR0bGVyIDx6ZWhhQGRl
Ymlhbi5vcmc+CiByZWJhc2UgdG8gdmVyc2lvbiA0LjAuMQogU2lnbmVkLW9mZi1ieTogQ2hhbmdx
aW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KIC0tLQotIC5idW5kbGUvZ2Vtcy9y
ZG9jLTcuMC4zL2xpYi9yZG9jL2dlbmVyYXRvci9qc29uX2luZGV4LnJiIHwgNCArKy0tCisgLmJ1
bmRsZS9nZW1zL3Jkb2MtNy4wLjQvbGliL3Jkb2MvZ2VuZXJhdG9yL2pzb25faW5kZXgucmIgfCA0
ICsrLS0KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
Ci1kaWZmIC0tZ2l0IGEvLmJ1bmRsZS9nZW1zL3Jkb2MtNy4wLjMvbGliL3Jkb2MvZ2VuZXJhdG9y
L2pzb25faW5kZXgucmIgYi8uYnVuZGxlL2dlbXMvcmRvYy03LjAuMy9saWIvcmRvYy9nZW5lcmF0
b3IvanNvbl9pbmRleC5yYgotaW5kZXggMDY1Y2FhNC4uY2ZhMWYzMyAxMDA2NDQKLS0tLSBhLy5i
dW5kbGUvZ2Vtcy9yZG9jLTcuMC4zL2xpYi9yZG9jL2dlbmVyYXRvci9qc29uX2luZGV4LnJiCi0r
KysgYi8uYnVuZGxlL2dlbXMvcmRvYy03LjAuMy9saWIvcmRvYy9nZW5lcmF0b3IvanNvbl9pbmRl
eC5yYgorZGlmZiAtLWdpdCBhLy5idW5kbGUvZ2Vtcy9yZG9jLTcuMC40L2xpYi9yZG9jL2dlbmVy
YXRvci9qc29uX2luZGV4LnJiIGIvLmJ1bmRsZS9nZW1zL3Jkb2MtNy4wLjQvbGliL3Jkb2MvZ2Vu
ZXJhdG9yL2pzb25faW5kZXgucmIKK2luZGV4IGM2MTM5MWQuLjkxMTVkYmQgMTAwNjQ0CistLS0g
YS8uYnVuZGxlL2dlbXMvcmRvYy03LjAuNC9saWIvcmRvYy9nZW5lcmF0b3IvanNvbl9pbmRleC5y
YgorKysrIGIvLmJ1bmRsZS9nZW1zL3Jkb2MtNy4wLjQvbGliL3Jkb2MvZ2VuZXJhdG9yL2pzb25f
aW5kZXgucmIKIEBAIC0xNzYsNyArMTc2LDcgQEAgY2xhc3MgUkRvYzo6R2VuZXJhdG9yOjpKc29u
SW5kZXgKICAgICAgZGVidWdfbXNnICJXcml0aW5nIGd6aXBwZWQgc2VhcmNoIGluZGV4IHRvICVz
IiAlIG91dGZpbGUKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1
YnkvMDAwNC1saWItbWttZi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWluLWdlbmVyYXRl
ZC1NLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21m
LnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gKaW5kZXgg
MmMxZjg1N2Q3NS4uMGJhMTA3MjRjYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4t
Z2VuZXJhdGVkLU0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8w
MDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0u
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGU5NGI4OThkMTFlM2JkNWM0MTJhYTNiNzcyMDQw
ODcwY2RkZjM2YzcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDlmYTZkNDBkMWY3ZWVk
NWJlOTgxYzAzNGMzZjM2YmQ0YTNiNWVmYWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBSZWluZXIgSGVycm1hbm4gPHJlaW5lckByZWluZXItaC5kZT4KIERhdGU6IFR1ZSwgMTAgT2N0
IDIwMTcgMTU6MDY6MTMgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gbGliL21rbWYucmI6IHNvcnQg
bGlzdCBvZiBvYmplY3QgZmlsZXMgaW4gZ2VuZXJhdGVkIE1ha2VmaWxlCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJvZHVj
aWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5n
LTc4NDIyNS10b28ucGF0Y2gKaW5kZXggNzQ2ZDEwMjI5Mi4uNGExMGY4NjFkYyAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA1LU1hcmstR2Vtc3BlYy1yZXBy
b2R1Y2libGUtY2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5n
ZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjIxZTA5Yjlj
OGY1OTc1ODg3Y2Q4NWUzZWM0ZGNmOTgzOGY2MjU3NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gMjY1MzgxYmM2MTZmYTI4MWE1OGIzNzYxYzMzNjIwYzQ2NTg4NGNhOCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEx1Y2FzIEthbmFzaGlybyA8a2FuYXNoaXJvQGRlYmlhbi5v
cmc+CiBEYXRlOiBGcmksIDEgTm92IDIwMTkgMTU6MjU6MTcgLTAzMDAKIFN1YmplY3Q6IFtQQVRD
SF0gTWFrZSBnZW1zcGVjcyByZXByb2R1Y2libGUKQEAgLTEyLDEwICsxMiwxMCBAQCBVcHN0cmVh
bS1TdGF0dXM6IEJhY2twb3J0IFtkZWJpYW5dCiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbGliL3J1YnlnZW1zL3NwZWNpZmlj
YXRpb24ucmIgYi9saWIvcnVieWdlbXMvc3BlY2lmaWNhdGlvbi5yYgotaW5kZXggNTAzZjBhNC4u
NWQzM2IwOSAxMDA2NDQKK2luZGV4IDJkYjkzNTIuLjkyNWI3YTAgMTAwNjQ0CiAtLS0gYS9saWIv
cnVieWdlbXMvc3BlY2lmaWNhdGlvbi5yYgogKysrIGIvbGliL3J1YnlnZW1zL3NwZWNpZmljYXRp
b24ucmIKLUBAIC0xNzA1LDcgKzE3MDUsOSBAQCBjbGFzcyBHZW06OlNwZWNpZmljYXRpb24gPCBH
ZW06OkJhc2ljU3BlY2lmaWNhdGlvbgorQEAgLTE3MTQsNyArMTcxNCw5IEBAIGNsYXNzIEdlbTo6
U3BlY2lmaWNhdGlvbiA8IEdlbTo6QmFzaWNTcGVjaWZpY2F0aW9uCiAgICAgICAgICAgICAgICAg
IHJhaXNlKEdlbTo6SW52YWxpZFNwZWNpZmljYXRpb25FeGNlcHRpb24sCiAgICAgICAgICAgICAg
ICAgICAgICAgICJpbnZhbGlkIGRhdGUgZm9ybWF0IGluIHNwZWNpZmljYXRpb246ICN7ZGF0ZS5p
bnNwZWN0fSIpCiAgICAgICAgICAgICAgICBlbmQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9ydWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJv
ZHVjaWJsZS5wYXRjaAppbmRleCBjZGZhMjE0NGQ3Li45MjQzOWZmZDdhIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1
Y2libGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1h
a2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyYTE4
ZWZjMDc2YTIwYmMyNzAyMTVhODAyZDcyNjE4YWQwNjA1ZjkxIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA0MDIzNmQxNmI2NDBiMGM1MjJhNTUwYjYyOGNiZmI2ZWUwY2RjOTcyIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTHVjYXMgS2FuYXNoaXJvIDxrYW5hc2hpcm9AZGVi
aWFuLm9yZz4KIERhdGU6IEZyaSwgMSBOb3YgMjAxOSAxNToyNToxNyAtMDMwMAogU3ViamVjdDog
W1BBVENIXSBNYWtlIGdlbXNwZWNzIHJlcHJvZHVjaWJsZQpAQCAtMTMsNyArMTMsNyBAQCBTaWdu
ZWQtb2ZmLWJ5OiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPgogLS0t
CiAgLmJ1bmRsZS9nZW1zL2JpZ2RlY2ltYWwtNC4wLjEvYmlnZGVjaW1hbC5nZW1zcGVjIHwgMSAr
CiAgLmJ1bmRsZS9nZW1zL2ZpZGRsZS0xLjEuOC9maWRkbGUuZ2Vtc3BlYyAgICAgICAgIHwgMSAr
Ci0gLmJ1bmRsZS9nZW1zL3Jkb2MtNy4wLjMvcmRvYy5nZW1zcGVjICAgICAgICAgICAgIHwgMSAr
CisgLmJ1bmRsZS9nZW1zL3Jkb2MtNy4wLjQvcmRvYy5nZW1zcGVjICAgICAgICAgICAgIHwgMSAr
CiAgZXh0L2lvL2NvbnNvbGUvaW8tY29uc29sZS5nZW1zcGVjICAgICAgICAgICAgICAgIHwgMSAr
CiAgbGliL2lwYWRkci5nZW1zcGVjICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSAr
CiAgNSBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKQEAgLTQyLDEwICs0MiwxMCBAQCBp
bmRleCAwMDkyZjUyLi5mNzdjMjI0IDEwMDY0NAogICAgc3BlYy5hdXRob3JzICAgICAgID0gWyJB
YXJvbiBQYXR0ZXJzb24iLCAiU0hJQkFUQSBIaXJvc2hpIl0KICAgIHNwZWMuZW1haWwgICAgICAg
ICA9IFsiYWFyb25AdGVuZGVybG92ZW1ha2luZy5jb20iLCAiaHNidEBydWJ5LWxhbmcub3JnIl0K
ICAKLWRpZmYgLS1naXQgYS8uYnVuZGxlL2dlbXMvcmRvYy03LjAuMy9yZG9jLmdlbXNwZWMgYi8u
YnVuZGxlL2dlbXMvcmRvYy03LjAuMy9yZG9jLmdlbXNwZWMKK2RpZmYgLS1naXQgYS8uYnVuZGxl
L2dlbXMvcmRvYy03LjAuNC9yZG9jLmdlbXNwZWMgYi8uYnVuZGxlL2dlbXMvcmRvYy03LjAuNC9y
ZG9jLmdlbXNwZWMKIGluZGV4IGFkYTkzNDEuLjU4NzFlYzIgMTAwNjQ0Ci0tLS0gYS8uYnVuZGxl
L2dlbXMvcmRvYy03LjAuMy9yZG9jLmdlbXNwZWMKLSsrKyBiLy5idW5kbGUvZ2Vtcy9yZG9jLTcu
MC4zL3Jkb2MuZ2Vtc3BlYworLS0tIGEvLmJ1bmRsZS9nZW1zL3Jkb2MtNy4wLjQvcmRvYy5nZW1z
cGVjCisrKysgYi8uYnVuZGxlL2dlbXMvcmRvYy03LjAuNC9yZG9jLmdlbXNwZWMKIEBAIC03LDYg
KzcsNyBAQCBlbmQKICAKICBHZW06OlNwZWNpZmljYXRpb24ubmV3IGRvIHxzfApkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA3LVNraXAtdGVzdF9ybV9yX25v
X3Blcm1pc3Npb25zLXRlc3QtdW5kZXItcm9vdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnkvMDAwNy1Ta2lwLXRlc3Rfcm1fcl9ub19wZXJtaXNzaW9ucy10ZXN0LXVuZGVy
LXJvb3QucGF0Y2gKaW5kZXggOTNiNzQwNjg1OC4uY2I3N2ZmZmU1NiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA3LVNraXAtdGVzdF9ybV9yX25vX3Blcm1p
c3Npb25zLXRlc3QtdW5kZXItcm9vdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5LzAwMDctU2tpcC10ZXN0X3JtX3Jfbm9fcGVybWlzc2lvbnMtdGVzdC11bmRlci1y
b290LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0YTQ4NTExZjQ1NjA2ZWZmNGUwM2YwMDRm
YjZhZWE2ZjhjY2QxZWFmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjY2I0MGI0NzE1
YWJmYjZjNTNkNDMxYmY0MjFjY2ZiY2RiYzRmZjkzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogSmlheWluZyBTb25nIDxqaWF5aW5nLnNvbmcuY25Ad2luZHJpdmVyLmNvbT4KIERhdGU6
IE1vbiwgNyBKdWwgMjAyNSAxNTowNTo1NyArMDgwMAogU3ViamVjdDogW1BBVENIXSBTa2lwIHRl
c3Rfcm1fcl9ub19wZXJtaXNzaW9ucyB0ZXN0IHVuZGVyIHJvb3QKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfNC4wLjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5XzQuMC41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfNC4wLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfNC4wLjUuYmIKaW5kZXggNTZmMTY3Mzc5Yy4uYTA5ODFi
ZjYyMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV80LjAuMy5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzQuMC41LmJiCkBAIC00OCw3
ICs0OCw3IEBAIGRvX2NvbmZpZ3VyZTpwcmVwZW5kKCkgewogCiBERVBFTkRTOmFwcGVuZDpsaWJj
LW11c2wgPSAiIGxpYnVjb250ZXh0IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzc5NjRhY2Mz
NzBkNWM4Mzc1Yjk1MDJlNWJhNmMxM2MwM2VmOTFhYjllYjlmNTIxYzg0ZmI0MmI5YzlhNmIwZiIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3ZDYxNDkwNzlhNjNmOGFlMWQzMjZjOWZhNjVjNjAxOWJh
MmRjMzE1NWVhZTdiMzkxNTk4MTc5MTFjODg5NThlIgogCiBQQUNLQUdFQ09ORklHID8/PSAiIgog
UEFDS0FHRUNPTkZJRyArPSAiJHtAYmIudXRpbHMuZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMnLCAn
aXB2NicsIGQpfSIKLS0gCjIuNDcuMQoK

--===============6655466059918108421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/i18n -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/i18n, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/darkfish/js -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/darkfish/js, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/darkfish/images -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/darkfish/images, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/code_object -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/code_object, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/markdown -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/markdown, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/parser -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/parser, directory renamed
  /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/pot -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/pot, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3 -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/darkfish -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/darkfish, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/man -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/man, directory renamed /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6/exe -> /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10/exe, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/ri -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/ri, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-
 7.0.4/lib, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/rd -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/rd, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/markup -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/markup, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/darkfish/css -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/darkfish/css, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/aliki -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/aliki, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/darkfish/fonts -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/darkfish/fonts, directory renamed /usr/lib/ruby/
 gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/stats -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/stats, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/aliki/js -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/aliki/js, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/aliki/css -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/aliki/css, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/code_object/context -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/code_object/context, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/exe -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/exe, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/json_index/js -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/json_index/js, removed "/usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.6.gems
 pec /usr/lib/libruby.so.4.0.3 /usr/lib/ruby/gems/4.0.0/specifications/rdoc-7.0.3.gemspec /usr/lib/ruby/gems/4.0.0/cache/rdoc-7.0.3.gem", added "/usr/lib/ruby/4.0.0/bundler/templates/newgem/ext/newgem/build.rs.tt /usr/lib/ruby/4.0.0/bundler/templates/newgem/github/workflows/build-gems.yml.tt /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.10.gemspec /usr/lib/libruby.so.4.0.5 /usr/lib/ruby/gems/4.0.0/cache/rdoc-7.0.4.gem /usr/lib/ruby/gems/4.0.0/specifications/rdoc-7.0.4.gemspec"
Changes to packages/x86-64-v3-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.4.0 changed symlink target from libruby.so.4.0.3 to libruby.so.4.0.5
  /usr/lib/libruby.so changed symlink target from libruby.so.4.0.3 to libruby.so.4.0.5
  /usr/lib/libruby.so.4.0.3 moved to /usr/lib/libruby.so.4.0.5
  /usr/lib/ruby/gems/4.0.0/cache/rdoc-7.0.3.gem moved to /usr/lib/ruby/gems/4.0.0/cache/rdoc-7.0.4.gem
  /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3 moved to /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4
  /usr/lib/ruby/gems/4.0.0/specifications/rdoc-7.0.3.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/rdoc-7.0.4.gemspec
  /usr/lib/ruby/4.0.0/bundler/templates/newgem/ext/newgem/build.rs.tt was added
  /usr/lib/ruby/4.0.0/bundler/templates/newgem/github/workflows/build-gems.yml.tt was added
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10 was added
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10/exe was added
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10/exe/bundle was added
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10/exe/bundler was added
  /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.10.gemspec was added
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6 was removed
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6/exe was removed
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6/exe/bundle was removed
  /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6/exe/bundler was removed
  /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.6.gemspec was removed

--===============6655466059918108421==--

