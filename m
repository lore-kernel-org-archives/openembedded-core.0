Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE641CD6E65
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:48 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1580.1780328143724228234
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=oA8UTfFr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DqM0fqIq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019e83d39db4-750261e6-8e1a-4319-b4c5-cc06da38bc82-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328144;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Fkh66vNqJubsRSNgOAqum2LZo73eHT9/x2e50qwIATc=;
	b=oA8UTfFrFWRSRKWMVqg1se8WI/F73pbOU7uinhrYNvBCA5iuCy1wh6WhXqyXl0Id
	Jm57zUjswQoD2I/vp8i49J4ICl7Q3f8sEZx7ChDAOTsmQlG3uwbACE6jqkiHgh23rLw
	HnwI3GSZ9DIbMPL+MDB1YpeNNtR4lkCg5Ea3T8Wk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328144;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Fkh66vNqJubsRSNgOAqum2LZo73eHT9/x2e50qwIATc=;
	b=DqM0fqIqN7B/fBluRsB8sQ4aEXLU2V2BhzvlvAWNFjfDu+XlFmBEMayHsh6fuRWp
	s1+PSPNklmunfsGiL/gEI8L3krF8JQU5Fl8APibdhYN50o/b9AFIghKcm4YZFVkdwsZ
	YIrb0SDPMWadZ6Mni5NO+wYwUTSkj7qOK4hyobjo=
Content-Type: multipart/mixed; boundary="===============7641072120056719464=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 4.0.5 SUCCEEDED
Message-ID: <0101019e83d39db4-750261e6-8e1a-4319-b4c5-cc06da38bc82-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237903

--===============7641072120056719464==
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
From 4e2f9aebdd019d2184f8688a358e06a00ba19d1e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 10:05:24 +0000
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
index 2c48ca184d..0edb93a899 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
@@ -1,4 +1,4 @@
-From 73edbaf1a89e05e92f91ed97348a65c4ce740cea Mon Sep 17 00:00:00 2001
+From 15be6d9985b1452c7f64c117d1ca52c2323eca92 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 27 Feb 2026 16:59:24 +0800
 Subject: [PATCH] Don't save the original name and timestamp
diff --git a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
index 3bf80b1613..444d819f62 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
@@ -1,4 +1,4 @@
-From f2ea81d4707614309cda02be59dd6ccbde9b2441 Mon Sep 17 00:00:00 2001
+From 5f3e6fd3aeb39bda6819f2b0c7e0b7a8d6002614 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 30 Sep 2019 16:57:01 +0100
 Subject: [PATCH] extmk: fix cross-compilation of external gems
diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
index 32d55cde9f..5ee02d5a39 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
@@ -1,4 +1,4 @@
-From 875543f1bc5da190543e2696a47cfaaf939e1549 Mon Sep 17 00:00:00 2001
+From adfedd938ac076c0ac0adbc25988ffc11a488479 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jan 2022 20:29:14 -0800
 Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index 11aec87934..aed6a6bb37 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,4 +1,4 @@
-From c460fce052e04a8126f5e0554f68359ef986c5f8 Mon Sep 17 00:00:00 2001
+From e38ed3d9761696684c6a985400212c87c8479a77 Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index 863960839d..db5aa1154c 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,4 +1,4 @@
-From 3a335538594d0eb3da6155a64b473a46fd06ce76 Mon Sep 17 00:00:00 2001
+From 5525d69162451be10d867e1c1f5eed6347e91c8d Mon Sep 17 00:00:00 2001
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
index 2c1f857d75..01c9cb5792 100644
--- a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
+++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
@@ -1,4 +1,4 @@
-From e94b898d11e3bd5c412aa3b772040870cddf36c7 Mon Sep 17 00:00:00 2001
+From 1215d5dd805f77736670ee8d315af420f0a09ac8 Mon Sep 17 00:00:00 2001
 From: Reiner Herrmann <reiner@reiner-h.de>
 Date: Tue, 10 Oct 2017 15:06:13 -0300
 Subject: [PATCH] lib/mkmf.rb: sort list of object files in generated Makefile
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index 746d102292..91dd79817b 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From f21e09b9c8f5975887cd85e3ec4dcf9838f62575 Mon Sep 17 00:00:00 2001
+From 1bad7890e9f6f104c1980b4321660a76c22e14de Mon Sep 17 00:00:00 2001
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
index cdfa2144d7..a331ee96b2 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,4 +1,4 @@
-From 2a18efc076a20bc270215a802d72618ad0605f91 Mon Sep 17 00:00:00 2001
+From e81cd7e15a6ea5fdb2fb8817fab8228ba76c7175 Mon Sep 17 00:00:00 2001
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
index 93b7406858..15ba8ab20c 100644
--- a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
+++ b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
@@ -1,4 +1,4 @@
-From 4a48511f45606eff4e03f004fb6aea6f8ccd1eaf Mon Sep 17 00:00:00 2001
+From 47af3cc4cb312d0c61d3f9a467e40789c387026b Mon Sep 17 00:00:00 2001
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


--===============7641072120056719464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/markup -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/markup, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/aliki/css -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/aliki/css, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/code_object -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/code_object, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/i18n -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/i18n, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/parser -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/parser, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/man -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/man, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/pot -> /usr/lib/ruby/gems/4
 .0.0/gems/rdoc-7.0.4/lib/rdoc/generator/pot, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/stats -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/stats, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/rd -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/rd, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/ri -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/ri, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/json_index/js -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/json_index/js, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/markdown -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/markdown, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/aliki -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/aliki, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib
 /rdoc/generator/template/darkfish/css -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/darkfish/css, directory renamed /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6/exe -> /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10/exe, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/darkfish/images -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/darkfish/images, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/exe -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/exe, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/darkfish/js -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/darkfish/js, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/darkfish -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/
 rdoc/generator/template/darkfish, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/darkfish/fonts -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/darkfish/fonts, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/aliki/js -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/aliki/js, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/code_object/context -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/code_object/context, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3 -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4, removed "/usr/lib/ruby/gems/4.0.0/specifications/rdoc-7.0.3.gemspec /usr/li
 b/ruby/gems/4.0.0/cache/rdoc-7.0.3.gem /usr/lib/libruby.so.4.0.3 /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.6.gemspec", added "/usr/lib/ruby/gems/4.0.0/specifications/rdoc-7.0.4.gemspec /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.10.gemspec /usr/lib/libruby.so.4.0.5 /usr/lib/ruby/gems/4.0.0/cache/rdoc-7.0.4.gem /usr/lib/ruby/4.0.0/bundler/templates/newgem/github/workflows/build-gems.yml.tt /usr/lib/ruby/4.0.0/bundler/templates/newgem/ext/newgem/build.rs.tt"
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

--===============7641072120056719464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ruby: SRC_URI changed from "http://cache.ruby-lang.org/pub/ruby/4.0/ruby-4.0.3.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch file://0001-Don-t-save-the-original-name-and-timestamp.patch" to "http://cache.ruby-lang.org/pub/ruby/4.0/ruby-4.0.5.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-genera
 ted-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch file://0001-Don-t-save-the-original-name-and-timestamp.patch"
packages/x86-64-v3-poky-linux/ruby: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby: PV changed from "4.0.3" to "4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: FILELIST: removed "/usr/lib/.debug/libruby.so.4.0.3", added "/usr/lib/.debug/libruby.so.4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PKGSIZE changed from 18123184 to 18129304 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PV changed from "4.0.3" to "4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PV changed from "4.0.3" to "4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby-doc: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-doc: PV changed from "4.0.3" to "4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby-locale: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-locale: PV changed from "4.0.3" to "4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PKGSIZE changed from 10252720 to 10267138 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PV changed from "4.0.3" to "4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: PV changed from "4.0.3" to "4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby-ri-docs: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-ri-docs: PV changed from "4.0.3" to "4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby-src: FILELIST: directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/internal/core -> /usr/src/debug/ruby/4.0.5/include/ruby/internal/core, directory renamed /usr/src/debug/ruby/4.0.3/ext/rbconfig/sizeof -> /usr/src/debug/ruby/4.0.5/ext/rbconfig/sizeof, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/syslog-0.3.0/ext/syslog -> /usr/src/debug/ruby/4.0.5/.bundle/gems/syslog-0.3.0/ext/syslog, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/internal/encoding -> /usr/src/debug/ruby/4.0.5/include/ruby/internal/encoding, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/io -> /usr/src/debug/ruby/4.0.5/include/ruby/io, directory renamed /usr/src/debug/ruby/4.0.3/ext/fcntl -> /usr/src/debug/ruby/4.0.5/ext/fcntl, directory renamed /usr/src/debug/ruby/4.0.3/gc -> /usr/src/debug/ruby/4.0.5/gc, directory renamed /usr/src/debug/ruby/4.0.3/tool/ruby_vm/views -> /usr/src/debug/ruby/4.0.5/tool/ruby_vm/views, directory renamed /usr/sr
 c/debug/ruby/4.0.3/ext/continuation -> /usr/src/debug/ruby/4.0.5/ext/continuation, directory renamed /usr/src/debug/ruby/4.0.3/prism/templates/src -> /usr/src/debug/ruby/4.0.5/prism/templates/src, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/nkf-0.2.0/ext/nkf/nkf-utf8 -> /usr/src/debug/ruby/4.0.5/.bundle/gems/nkf-0.2.0/ext/nkf/nkf-utf8, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/rbs-3.10.0/ext/rbs_extension -> /usr/src/debug/ruby/4.0.5/.bundle/gems/rbs-3.10.0/ext/rbs_extension, directory renamed /usr/src/debug/ruby/4.0.3/ccan/list -> /usr/src/debug/ruby/4.0.5/ccan/list, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/internal/arithmetic -> /usr/src/debug/ruby/4.0.5/include/ruby/internal/arithmetic, directory renamed /usr/src/debug/ruby/4.0.3/prism/templates/ext/prism -> /usr/src/debug/ruby/4.0.5/prism/templates/ext/prism, directory renamed /usr/src/debug/ruby/4.0.3/ext/io/console -> /usr/src/debug/ruby/4.0.5/ext/io/console, directory renamed /usr/s
 rc/debug/ruby/4.0.3/defs -> /usr/src/debug/ruby/4.0.5/defs, directory renamed /usr/src/debug/ruby/4.0.3/ext/io/wait -> /usr/src/debug/ruby/4.0.5/ext/io/wait, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/racc-1.8.1/ext/racc/cparse -> /usr/src/debug/ruby/4.0.5/.bundle/gems/racc-1.8.1/ext/racc/cparse, directory renamed /usr/src/debug/ruby/4.0.3/ext/stringio -> /usr/src/debug/ruby/4.0.5/ext/stringio, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/rbs-3.10.0/src -> /usr/src/debug/ruby/4.0.5/.bundle/gems/rbs-3.10.0/src, directory renamed /usr/src/debug/ruby/4.0.3/ext/monitor -> /usr/src/debug/ruby/4.0.5/ext/monitor, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/rbs-3.10.0/include/rbs/util -> /usr/src/debug/ruby/4.0.5/.bundle/gems/rbs-3.10.0/include/rbs/util, directory renamed /usr/src/debug/ruby/4.0.3/ext/psych -> /usr/src/debug/ruby/4.0.5/ext/psych, directory renamed /usr/src/debug/ruby/4.0.3/enc/trans -> /usr/src/debug/ruby/4.0.5/enc/trans, directory ren
 amed /usr/src/debug/ruby/4.0.3/ext -> /usr/src/debug/ruby/4.0.5/ext, directory renamed /usr/src/debug/ruby/4.0.3/ext/erb/escape -> /usr/src/debug/ruby/4.0.5/ext/erb/escape, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/debug-1.11.1/ext/debug -> /usr/src/debug/ruby/4.0.5/.bundle/gems/debug-1.11.1/ext/debug, directory renamed /usr/src/debug/ruby/4.0.3/ext/io/nonblock -> /usr/src/debug/ruby/4.0.5/ext/io/nonblock, directory renamed /usr/src/debug/ruby/4.0.3/ext/coverage -> /usr/src/debug/ruby/4.0.5/ext/coverage, directory renamed /usr/src/debug/ruby/4.0.3/coroutine/amd64 -> /usr/src/debug/ruby/4.0.5/coroutine/amd64, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/rbs-3.10.0/include/rbs -> /usr/src/debug/ruby/4.0.5/.bundle/gems/rbs-3.10.0/include/rbs, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/rbs-3.10.0/src/util -> /usr/src/debug/ruby/4.0.5/.bundle/gems/rbs-3.10.0/src/util, directory renamed /usr/src/debug/ruby/4.0.3/ext/socket -> /usr/src/debug/ruby/4.
 0.5/ext/socket, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/internal -> /usr/src/debug/ruby/4.0.5/include/ruby/internal, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/internal/intern/select -> /usr/src/debug/ruby/4.0.5/include/ruby/internal/intern/select, directory renamed /usr/src/debug/ruby/4.0.3/ext/etc -> /usr/src/debug/ruby/4.0.5/ext/etc, directory renamed /usr/src/debug/ruby/4.0.3/ext/digest -> /usr/src/debug/ruby/4.0.5/ext/digest, directory renamed /usr/src/debug/ruby/4.0.3/ext/objspace -> /usr/src/debug/ruby/4.0.5/ext/objspace, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby -> /usr/src/debug/ruby/4.0.5/include/ruby, directory renamed /usr/src/debug/ruby/4.0.3/missing -> /usr/src/debug/ruby/4.0.5/missing, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/fiddle-1.1.8/ext/fiddle -> /usr/src/debug/ruby/4.0.5/.bundle/gems/fiddle-1.1.8/ext/fiddle, directory renamed /usr/src/debug/ruby/4.0.3/ext/digest/sha1 -> /usr/src/debug/ruby/4.0.5/ext/
 digest/sha1, directory renamed /usr/src/debug/ruby/4.0.3/ext/digest/sha2 -> /usr/src/debug/ruby/4.0.5/ext/digest/sha2, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/internal/intern -> /usr/src/debug/ruby/4.0.5/include/ruby/internal/intern, directory renamed /usr/src/debug/ruby/4.0.3/prism/util -> /usr/src/debug/ruby/4.0.5/prism/util, directory renamed /usr/src/debug/ruby/4.0.3/ext/pty -> /usr/src/debug/ruby/4.0.5/ext/pty, directory renamed /usr/src/debug/ruby/4.0.3/prism -> /usr/src/debug/ruby/4.0.5/prism, directory renamed /usr/src/debug/ruby/4.0.3/enc/unicode/17.0.0 -> /usr/src/debug/ruby/4.0.5/enc/unicode/17.0.0, directory renamed /usr/src/debug/ruby/4.0.3/enc/jis -> /usr/src/debug/ruby/4.0.5/enc/jis, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal -> /usr/src/debug/ruby/4.0.5/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal, directory renamed /usr/src/debug/ruby/4.0.3 -> /usr/src/debug/ruby/4.0.5, directory renamed /usr/src/debug/r
 uby/4.0.3/ext/digest/bubblebabble -> /usr/src/debug/ruby/4.0.5/ext/digest/bubblebabble, directory renamed /usr/src/debug/ruby/4.0.3/ext/json/simd -> /usr/src/debug/ruby/4.0.5/ext/json/simd, directory renamed /usr/src/debug/ruby/4.0.3/ext/cgi/escape -> /usr/src/debug/ruby/4.0.5/ext/cgi/escape, directory renamed /usr/src/debug/ruby/4.0.3/ext/json/generator -> /usr/src/debug/ruby/4.0.5/ext/json/generator, directory renamed /usr/src/debug/ruby/4.0.3/ext/strscan -> /usr/src/debug/ruby/4.0.5/ext/strscan, directory renamed /usr/src/debug/ruby/4.0.3/ext/zlib -> /usr/src/debug/ruby/4.0.5/ext/zlib, directory renamed /usr/src/debug/ruby/4.0.3/ext/json/fbuffer -> /usr/src/debug/ruby/4.0.5/ext/json/fbuffer, directory renamed /usr/src/debug/ruby/4.0.3/ext/json/parser -> /usr/src/debug/ruby/4.0.5/ext/json/parser, directory renamed /usr/src/debug/ruby/4.0.3/ext/json/vendor -> /usr/src/debug/ruby/4.0.5/ext/json/vendor, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/bigdecimal-4.0.1/ext/big
 decimal/missing -> /usr/src/debug/ruby/4.0.5/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal/missing, directory renamed /usr/src/debug/ruby/4.0.3/include/ruby/fiber -> /usr/src/debug/ruby/4.0.5/include/ruby/fiber, directory renamed /usr/src/debug/ruby/4.0.3/.bundle/gems/nkf-0.2.0/ext/nkf -> /usr/src/debug/ruby/4.0.5/.bundle/gems/nkf-0.2.0/ext/nkf, directory renamed /usr/src/debug/ruby/4.0.3/ext/ripper -> /usr/src/debug/ruby/4.0.5/ext/ripper, directory renamed /usr/src/debug/ruby/4.0.3/gc/default -> /usr/src/debug/ruby/4.0.5/gc/default, directory renamed /usr/src/debug/ruby/4.0.3/internal -> /usr/src/debug/ruby/4.0.5/internal, directory renamed /usr/src/debug/ruby/4.0.3/ext/openssl -> /usr/src/debug/ruby/4.0.5/ext/openssl, directory renamed /usr/src/debug/ruby/4.0.3/ext/date -> /usr/src/debug/ruby/4.0.5/ext/date, directory renamed /usr/src/debug/ruby/4.0.3/ext/digest/md5 -> /usr/src/debug/ruby/4.0.5/ext/digest/md5, directory renamed /usr/src/debug/ruby/4.0.3/enc -> /usr/src/debug/ruby/4
 .0.5/enc, directory renamed /usr/src/debug/ruby/4.0.3/ext/digest/rmd160 -> /usr/src/debug/ruby/4.0.5/ext/digest/rmd160
packages/x86-64-v3-poky-linux/ruby/ruby-src: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-src: PKGSIZE changed from 40710188 to 40714378 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-src: PV changed from "4.0.3" to "4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby-staticdev: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-staticdev: PV changed from "4.0.3" to "4.0.5"
packages/x86-64-v3-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/darkfish/images -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/darkfish/images, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/code_object/context -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/code_object/context, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/pot -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/pot, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/darkfish/css -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/darkfish/css, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/darkfish -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/darkfish, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/t
 emplate/aliki -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/aliki, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/parser -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/parser, directory renamed /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.6/exe -> /usr/lib/ruby/gems/4.0.0/gems/bundler-4.0.10/exe, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/exe -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/exe, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/code_object -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/code_object, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/darkfish/js -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/darkfish/js, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rd
 oc/i18n -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/i18n, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/aliki/css -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/aliki/css, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3 -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/markdown -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/markdown, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/aliki/js -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/aliki/js, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/ri -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/ri, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/rd -> /usr
 /lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/rd, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/stats -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/stats, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/man -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/man, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/json_index/js -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/json_index/js, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/generator/template/darkfish/fonts -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/generator/template/darkfish/fonts, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib, directory renamed /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.3/lib/rdoc/markup -> /usr/lib/ruby/gems/4.0.0/gems/rdoc-7.0.4/lib/rdoc/markup, removed "/usr/lib/libruby.so.4.0.3 /usr/lib/ruby/gems/4.0.0/cache/rdoc-7.0.
 3.gem /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.6.gemspec /usr/lib/ruby/gems/4.0.0/specifications/rdoc-7.0.3.gemspec", added "/usr/lib/ruby/4.0.0/bundler/templates/newgem/github/workflows/build-gems.yml.tt /usr/lib/ruby/4.0.0/bundler/templates/newgem/ext/newgem/build.rs.tt /usr/lib/ruby/gems/4.0.0/cache/rdoc-7.0.4.gem /usr/lib/ruby/gems/4.0.0/specifications/rdoc-7.0.4.gemspec /usr/lib/libruby.so.4.0.5 /usr/lib/ruby/gems/4.0.0/specifications/default/bundler-4.0.10.gemspec"
packages/x86-64-v3-poky-linux/ruby/ruby: PKGV changed from 4.0.3 [default] to 4.0.5 [default]
packages/x86-64-v3-poky-linux/ruby/ruby: PKGSIZE changed from 35598552 to 35616581 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby: PV changed from "4.0.3" to "4.0.5"
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

--===============7641072120056719464==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-4.0.3-4.0.5.patch"

RnJvbSA0ZTJmOWFlYmRkMDE5ZDIxODRmODY4OGEzNThlMDZhMDBiYTE5ZDFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMDowNToyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJ1
Ynk6IHVwZ3JhZGUgNC4wLjMgLT4gNC4wLjUKCi0tLQogLi4uLURvbi10LXNhdmUtdGhlLW9yaWdp
bmFsLW5hbWUtYW5kLXRpbWVzdGFtcC5wYXRjaCB8ICAyICstCiAuLi54dG1rLWZpeC1jcm9zcy1j
b21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoIHwgIDIgKy0KIC4uLnAuYy1EZWZpbmUt
UkVHX1MxLWFuZC1SRUdfUzItZm9yLW11c2wtcmlzY3YucGF0Y2ggfCAgMiArLQogLi4uLzAwMDIt
T2JleS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNoICB8ICAyICstCiAuLi4v
MDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoIHwgMTIgKysr
KysrLS0tLS0tCiAuLi5yYi1zb3J0LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWluLWdlbmVyYXRlZC1N
LnBhdGNoIHwgIDIgKy0KIC4uLm1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIy
NS10b28ucGF0Y2ggfCAgNiArKystLS0KIC4uLi9ydWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNz
LXJlcHJvZHVjaWJsZS5wYXRjaCAgfCAxMCArKysrKy0tLS0tCiAuLi5pcC10ZXN0X3JtX3Jfbm9f
cGVybWlzc2lvbnMtdGVzdC11bmRlci1yb290LnBhdGNoIHwgIDIgKy0KIC4uLi9ydWJ5L3tydWJ5
XzQuMC4zLmJiID0+IHJ1YnlfNC4wLjUuYmJ9ICAgICAgICAgICAgfCAgMiArLQogMTAgZmlsZXMg
Y2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1Ynkve3J1YnlfNC4wLjMuYmIgPT4gcnVieV80LjAuNS5iYn0gKDk4
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtRG9u
LXQtc2F2ZS10aGUtb3JpZ2luYWwtbmFtZS1hbmQtdGltZXN0YW1wLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLURvbi10LXNhdmUtdGhlLW9yaWdpbmFsLW5hbWUt
YW5kLXRpbWVzdGFtcC5wYXRjaAppbmRleCAyYzQ4Y2ExODRkLi4wZWRiOTNhODk5IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtRG9uLXQtc2F2ZS10aGUt
b3JpZ2luYWwtbmFtZS1hbmQtdGltZXN0YW1wLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9ydWJ5L3J1YnkvMDAwMS1Eb24tdC1zYXZlLXRoZS1vcmlnaW5hbC1uYW1lLWFuZC10aW1l
c3RhbXAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDczZWRiYWYxYTg5ZTA1ZTkyZjkxZWQ5
NzM0OGE2NWM0Y2U3NDBjZWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE1YmU2ZDk5
ODViMTQ1MmM3ZjY0YzExN2QxY2E1MmMyMzIzZWNhOTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPgogRGF0ZTog
RnJpLCAyNyBGZWIgMjAyNiAxNjo1OToyNCArMDgwMAogU3ViamVjdDogW1BBVENIXSBEb24ndCBz
YXZlIHRoZSBvcmlnaW5hbCBuYW1lIGFuZCB0aW1lc3RhbXAKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24t
b2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1Ynkv
MDAwMS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaApp
bmRleCAzYmY4MGIxNjEzLi40NDRkODE5ZjYyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnVieS9ydWJ5LzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVy
bmFsLWdlbXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAx
LWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSBmMmVhODFkNDcwNzYxNDMwOWNkYTAyYmU1OWRkNmNjYmRlOWIyNDQx
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1ZjNlNmZkM2FlYjM5YmRhNjgxOWYyYjBj
N2UwYjdhOGQ2MDAyNjE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogPT9VVEYtOD9x
P0FuZHI9QzM9QTk9MjBEcmFzemlrPz0gPGFuZHJlLmRyYXN6aWtAamNpLmNvbT4KIERhdGU6IE1v
biwgMzAgU2VwIDIwMTkgMTY6NTc6MDEgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gZXh0bWs6IGZp
eCBjcm9zcy1jb21waWxhdGlvbiBvZiBleHRlcm5hbCBnZW1zCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5k
LVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZvci1tdXNsLXJp
c2N2LnBhdGNoCmluZGV4IDMyZDU1Y2RlOWYuLjVlZTAyZDVhMzkgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1h
bmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZvci1t
dXNsLXJpc2N2LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4NzU1NDNmMWJjNWRhMTkwNTQz
ZTI2OTZhNDdjZmFhZjkzOWUxNTQ5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhZGZl
ZGQ5MzhhYzA3NmMwYWMwYWRiYzI1OTg4ZmZjMTFhNDg4NDc5IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMjUg
SmFuIDIwMjIgMjA6Mjk6MTQgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdm1fZHVtcC5jOiBEZWZp
bmUgUkVHX1MxIGFuZCBSRUdfUzIgZm9yIG11c2wvcmlzY3YKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9m
LWxpYnJ1YnkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDItT2Jl
eS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNoCmluZGV4IDExYWVjODc5MzQu
LmFlZDZhNmJiMzcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1Ynkv
MDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxp
bmstb2YtbGlicnVieS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzQ2MGZjZTA1MmUwNGE4
MTI2ZjVlMDU1NGY2ODM1OWVmOTg2YzVmOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
ZTM4ZWQzZDk3NjE2OTY2ODRjNmE5ODU0MDAyMTJjODdjODQ3OWE3NyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IENocmlzdG9waGVyIExhcnNvbiA8Y2hyaXNfbGFyc29uQG1lbnRvci5j
b20+CiBEYXRlOiBUaHUsIDUgTWF5IDIwMTYgMTA6NTk6MDcgLTA3MDAKIFN1YmplY3Q6IFtQQVRD
SF0gT2JleSBMREZMQUdTIGZvciB0aGUgbGluayBvZiBsaWJydWJ5CmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUt
ZG9jdW1lbnRhdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAw
My1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoCmluZGV4IDg2Mzk2
MDgzOWQuLmRiNWFhMTE1NGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3J1YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJv
ZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzYTMzNTUz
ODU5NGQwZWIzZGE2MTU1YTY0YjQ3M2E0NmZkMDZjZTc2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA1NTI1ZDY5MTYyNDUxYmUxMGQ4NjdlMWMxZjVlZWQ2MzQ3ZTkxYzhkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hyaXN0aWFuIEhvZnN0YWVkdGxlciA8emVoYUBkZWJp
YW4ub3JnPgogRGF0ZTogVHVlLCAxMCBPY3QgMjAxNyAxNTowNDozNCAtMDMwMAogU3ViamVjdDog
W1BBVENIXSByZG9jOiBidWlsZCByZXByb2R1Y2libGUgZG9jdW1lbnRhdGlvbgpAQCAtMTMsMTMg
KzEzLDEzIEBAIFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBIb2ZzdGFlZHRsZXIgPHplaGFAZGVi
aWFuLm9yZz4KIHJlYmFzZSB0byB2ZXJzaW9uIDQuMC4xCiBTaWduZWQtb2ZmLWJ5OiBDaGFuZ3Fp
bmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPgogLS0tCi0gLmJ1bmRsZS9nZW1zL3Jk
b2MtNy4wLjMvbGliL3Jkb2MvZ2VuZXJhdG9yL2pzb25faW5kZXgucmIgfCA0ICsrLS0KKyAuYnVu
ZGxlL2dlbXMvcmRvYy03LjAuNC9saWIvcmRvYy9nZW5lcmF0b3IvanNvbl9pbmRleC5yYiB8IDQg
KystLQogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAK
LWRpZmYgLS1naXQgYS8uYnVuZGxlL2dlbXMvcmRvYy03LjAuMy9saWIvcmRvYy9nZW5lcmF0b3Iv
anNvbl9pbmRleC5yYiBiLy5idW5kbGUvZ2Vtcy9yZG9jLTcuMC4zL2xpYi9yZG9jL2dlbmVyYXRv
ci9qc29uX2luZGV4LnJiCi1pbmRleCAwNjVjYWE0Li5jZmExZjMzIDEwMDY0NAotLS0tIGEvLmJ1
bmRsZS9nZW1zL3Jkb2MtNy4wLjMvbGliL3Jkb2MvZ2VuZXJhdG9yL2pzb25faW5kZXgucmIKLSsr
KyBiLy5idW5kbGUvZ2Vtcy9yZG9jLTcuMC4zL2xpYi9yZG9jL2dlbmVyYXRvci9qc29uX2luZGV4
LnJiCitkaWZmIC0tZ2l0IGEvLmJ1bmRsZS9nZW1zL3Jkb2MtNy4wLjQvbGliL3Jkb2MvZ2VuZXJh
dG9yL2pzb25faW5kZXgucmIgYi8uYnVuZGxlL2dlbXMvcmRvYy03LjAuNC9saWIvcmRvYy9nZW5l
cmF0b3IvanNvbl9pbmRleC5yYgoraW5kZXggYzYxMzkxZC4uOTExNWRiZCAxMDA2NDQKKy0tLSBh
Ly5idW5kbGUvZ2Vtcy9yZG9jLTcuMC40L2xpYi9yZG9jL2dlbmVyYXRvci9qc29uX2luZGV4LnJi
CisrKysgYi8uYnVuZGxlL2dlbXMvcmRvYy03LjAuNC9saWIvcmRvYy9nZW5lcmF0b3IvanNvbl9p
bmRleC5yYgogQEAgLTE3Niw3ICsxNzYsNyBAQCBjbGFzcyBSRG9jOjpHZW5lcmF0b3I6Okpzb25J
bmRleAogICAgICBkZWJ1Z19tc2cgIldyaXRpbmcgZ3ppcHBlZCBzZWFyY2ggaW5kZXggdG8gJXMi
ICUgb3V0ZmlsZQogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVi
eS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVk
LU0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDQtbGliLW1rbWYu
cmItc29ydC1saXN0LW9mLW9iamVjdC1maWxlcy1pbi1nZW5lcmF0ZWQtTS5wYXRjaAppbmRleCAy
YzFmODU3ZDc1Li4wMWM5Y2I1NzkyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnVieS9ydWJ5LzAwMDQtbGliLW1rbWYucmItc29ydC1saXN0LW9mLW9iamVjdC1maWxlcy1pbi1n
ZW5lcmF0ZWQtTS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAw
MDQtbGliLW1rbWYucmItc29ydC1saXN0LW9mLW9iamVjdC1maWxlcy1pbi1nZW5lcmF0ZWQtTS5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTk0Yjg5OGQxMWUzYmQ1YzQxMmFhM2I3NzIwNDA4
NzBjZGRmMzZjNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTIxNWQ1ZGQ4MDVmNzc3
MzY2NzBlZThkMzE1YWY0MjBmMGEwOWFjOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IFJlaW5lciBIZXJybWFubiA8cmVpbmVyQHJlaW5lci1oLmRlPgogRGF0ZTogVHVlLCAxMCBPY3Qg
MjAxNyAxNTowNjoxMyAtMDMwMAogU3ViamVjdDogW1BBVENIXSBsaWIvbWttZi5yYjogc29ydCBs
aXN0IG9mIG9iamVjdCBmaWxlcyBpbiBnZW5lcmF0ZWQgTWFrZWZpbGUKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNp
YmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmct
Nzg0MjI1LXRvby5wYXRjaAppbmRleCA3NDZkMTAyMjkyLi45MWRkNzk4MTdiIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJv
ZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3J1YnkvcnVieS8wMDA1LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2libGUtY2hhbmdl
LWZpeGluZy03ODQyMjUtdG9vLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmMjFlMDliOWM4
ZjU5NzU4ODdjZDg1ZTNlYzRkY2Y5ODM4ZjYyNTc1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSAxYmFkNzg5MGU5ZjZmMTA0YzE5ODBiNDMyMTY2MGE3NmMyMmUxNGRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogTHVjYXMgS2FuYXNoaXJvIDxrYW5hc2hpcm9AZGViaWFuLm9y
Zz4KIERhdGU6IEZyaSwgMSBOb3YgMjAxOSAxNToyNToxNyAtMDMwMAogU3ViamVjdDogW1BBVENI
XSBNYWtlIGdlbXNwZWNzIHJlcHJvZHVjaWJsZQpAQCAtMTIsMTAgKzEyLDEwIEBAIFVwc3RyZWFt
LVN0YXR1czogQmFja3BvcnQgW2RlYmlhbl0KICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9saWIvcnVieWdlbXMvc3BlY2lmaWNh
dGlvbi5yYiBiL2xpYi9ydWJ5Z2Vtcy9zcGVjaWZpY2F0aW9uLnJiCi1pbmRleCA1MDNmMGE0Li41
ZDMzYjA5IDEwMDY0NAoraW5kZXggMmRiOTM1Mi4uOTI1YjdhMCAxMDA2NDQKIC0tLSBhL2xpYi9y
dWJ5Z2Vtcy9zcGVjaWZpY2F0aW9uLnJiCiArKysgYi9saWIvcnVieWdlbXMvc3BlY2lmaWNhdGlv
bi5yYgotQEAgLTE3MDUsNyArMTcwNSw5IEBAIGNsYXNzIEdlbTo6U3BlY2lmaWNhdGlvbiA8IEdl
bTo6QmFzaWNTcGVjaWZpY2F0aW9uCitAQCAtMTcxNCw3ICsxNzE0LDkgQEAgY2xhc3MgR2VtOjpT
cGVjaWZpY2F0aW9uIDwgR2VtOjpCYXNpY1NwZWNpZmljYXRpb24KICAgICAgICAgICAgICAgICAg
cmFpc2UoR2VtOjpJbnZhbGlkU3BlY2lmaWNhdGlvbkV4Y2VwdGlvbiwKICAgICAgICAgICAgICAg
ICAgICAgICAgImludmFsaWQgZGF0ZSBmb3JtYXQgaW4gc3BlY2lmaWNhdGlvbjogI3tkYXRlLmlu
c3BlY3R9IikKICAgICAgICAgICAgICAgIGVuZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9k
dWNpYmxlLnBhdGNoCmluZGV4IGNkZmEyMTQ0ZDcuLmEzMzFlZTk2YjIgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVj
aWJsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDYtTWFr
ZS1nZW1zcGVjcy1yZXByb2R1Y2libGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDJhMThl
ZmMwNzZhMjBiYzI3MDIxNWE4MDJkNzI2MThhZDA2MDVmOTEgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIGU4MWNkN2UxNWE2ZWE1ZmRiMmZiODgxN2ZhYjgyMjhiYTc2YzcxNzUgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBMdWNhcyBLYW5hc2hpcm8gPGthbmFzaGlyb0BkZWJp
YW4ub3JnPgogRGF0ZTogRnJpLCAxIE5vdiAyMDE5IDE1OjI1OjE3IC0wMzAwCiBTdWJqZWN0OiBb
UEFUQ0hdIE1ha2UgZ2Vtc3BlY3MgcmVwcm9kdWNpYmxlCkBAIC0xMyw3ICsxMyw3IEBAIFNpZ25l
ZC1vZmYtYnk6IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+CiAtLS0K
ICAuYnVuZGxlL2dlbXMvYmlnZGVjaW1hbC00LjAuMS9iaWdkZWNpbWFsLmdlbXNwZWMgfCAxICsK
ICAuYnVuZGxlL2dlbXMvZmlkZGxlLTEuMS44L2ZpZGRsZS5nZW1zcGVjICAgICAgICAgfCAxICsK
LSAuYnVuZGxlL2dlbXMvcmRvYy03LjAuMy9yZG9jLmdlbXNwZWMgICAgICAgICAgICAgfCAxICsK
KyAuYnVuZGxlL2dlbXMvcmRvYy03LjAuNC9yZG9jLmdlbXNwZWMgICAgICAgICAgICAgfCAxICsK
ICBleHQvaW8vY29uc29sZS9pby1jb25zb2xlLmdlbXNwZWMgICAgICAgICAgICAgICAgfCAxICsK
ICBsaWIvaXBhZGRyLmdlbXNwZWMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsK
ICA1IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQpAQCAtNDIsMTAgKzQyLDEwIEBAIGlu
ZGV4IDAwOTJmNTIuLmY3N2MyMjQgMTAwNjQ0CiAgICBzcGVjLmF1dGhvcnMgICAgICAgPSBbIkFh
cm9uIFBhdHRlcnNvbiIsICJTSElCQVRBIEhpcm9zaGkiXQogICAgc3BlYy5lbWFpbCAgICAgICAg
ID0gWyJhYXJvbkB0ZW5kZXJsb3ZlbWFraW5nLmNvbSIsICJoc2J0QHJ1YnktbGFuZy5vcmciXQog
IAotZGlmZiAtLWdpdCBhLy5idW5kbGUvZ2Vtcy9yZG9jLTcuMC4zL3Jkb2MuZ2Vtc3BlYyBiLy5i
dW5kbGUvZ2Vtcy9yZG9jLTcuMC4zL3Jkb2MuZ2Vtc3BlYworZGlmZiAtLWdpdCBhLy5idW5kbGUv
Z2Vtcy9yZG9jLTcuMC40L3Jkb2MuZ2Vtc3BlYyBiLy5idW5kbGUvZ2Vtcy9yZG9jLTcuMC40L3Jk
b2MuZ2Vtc3BlYwogaW5kZXggYWRhOTM0MS4uNTg3MWVjMiAxMDA2NDQKLS0tLSBhLy5idW5kbGUv
Z2Vtcy9yZG9jLTcuMC4zL3Jkb2MuZ2Vtc3BlYwotKysrIGIvLmJ1bmRsZS9nZW1zL3Jkb2MtNy4w
LjMvcmRvYy5nZW1zcGVjCistLS0gYS8uYnVuZGxlL2dlbXMvcmRvYy03LjAuNC9yZG9jLmdlbXNw
ZWMKKysrKyBiLy5idW5kbGUvZ2Vtcy9yZG9jLTcuMC40L3Jkb2MuZ2Vtc3BlYwogQEAgLTcsNiAr
Nyw3IEBAIGVuZAogIAogIEdlbTo6U3BlY2lmaWNhdGlvbi5uZXcgZG8gfHN8CmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDctU2tpcC10ZXN0X3JtX3Jfbm9f
cGVybWlzc2lvbnMtdGVzdC11bmRlci1yb290LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1YnkvcnVieS8wMDA3LVNraXAtdGVzdF9ybV9yX25vX3Blcm1pc3Npb25zLXRlc3QtdW5kZXIt
cm9vdC5wYXRjaAppbmRleCA5M2I3NDA2ODU4Li4xNWJhOGFiMjBjIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDctU2tpcC10ZXN0X3JtX3Jfbm9fcGVybWlz
c2lvbnMtdGVzdC11bmRlci1yb290LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwNy1Ta2lwLXRlc3Rfcm1fcl9ub19wZXJtaXNzaW9ucy10ZXN0LXVuZGVyLXJv
b3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDRhNDg1MTFmNDU2MDZlZmY0ZTAzZjAwNGZi
NmFlYTZmOGNjZDFlYWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQ3YWYzY2M0Y2Iz
MTJkMGM2MWQzZjlhNDY3ZTQwNzg5YzM4NzAyNmIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBKaWF5aW5nIFNvbmcgPGppYXlpbmcuc29uZy5jbkB3aW5kcml2ZXIuY29tPgogRGF0ZTog
TW9uLCA3IEp1bCAyMDI1IDE1OjA1OjU3ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIFNraXAgdGVz
dF9ybV9yX25vX3Blcm1pc3Npb25zIHRlc3QgdW5kZXIgcm9vdApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV80LjAuMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnlfNC4wLjUuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV80LjAuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3J1YnkvcnVieV80LjAuNS5iYgppbmRleCA1NmYxNjczNzljLi5hMDk4MWJm
NjIyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzQuMC4zLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfNC4wLjUuYmIKQEAgLTQ4LDcg
KzQ4LDcgQEAgZG9fY29uZmlndXJlOnByZXBlbmQoKSB7CiAKIERFUEVORFM6YXBwZW5kOmxpYmMt
bXVzbCA9ICIgbGlidWNvbnRleHQiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3Nzk2NGFjYzM3
MGQ1YzgzNzViOTUwMmU1YmE2YzEzYzAzZWY5MWFiOWViOWY1MjFjODRmYjQyYjljOWE2YjBmIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjdkNjE0OTA3OWE2M2Y4YWUxZDMyNmM5ZmE2NWM2MDE5YmEy
ZGMzMTU1ZWFlN2IzOTE1OTgxNzkxMWM4ODk1OGUiCiAKIFBBQ0tBR0VDT05GSUcgPz89ICIiCiBQ
QUNLQUdFQ09ORklHICs9ICIke0BiYi51dGlscy5maWx0ZXIoJ0RJU1RST19GRUFUVVJFUycsICdp
cHY2JywgZCl9IgotLSAKMi40Ny4xCgo=

--===============7641072120056719464==--

