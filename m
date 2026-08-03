Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA98C55AB9
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 22:03:10 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4388.1785794584752321388
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 15:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=cW8I5P5U;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202608032203053a2879c7e100020711-3a9jbj@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202608032203053a2879c7e100020711
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 00:03:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=FRDMWGR6PyJ/tghDAec/UN4O+K7AcD4Tg3YXzcoV7uc=;
 b=cW8I5P5U5Ya+EqvSRRR3rNDkdCzLC+FE8q89AS9ruFdE8LKY0Zg4fPIn/4dR/S6itcwtwK
 NeO+ny5IVmvTZT8PHiJ0gWMdUp2FwrsWytJdDfbyptHju4KdMbxa2hBcFlqV4+1FKQHlQb20
 bkYwNKSMWHPwJtgeC7uGkC/pjWhmD39c+3SHNeFPxIqYgpHbIP3q8LwSlMWinX2JIfLSLOdv
 A8dg0IjcUOM8xJocTollubNijq5m7BXJrReYRtpi2CMg7ii8GsZtPvJUbYjFnXHvrgHpXCVo
 xUaidcSFB+Kd7//GbhBamnoatBZK2vu0u1zd5HlQaXHjMYhz2boAQeHQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 13/15] ruby: upgrade 4.0.3 -> 4.0.5
Date: Tue,  4 Aug 2026 00:01:53 +0200
Message-ID: <20260803220157.1520377-13-peter.marko@siemens.com>
In-Reply-To: <20260803220157.1520377-1-peter.marko@siemens.com>
References: <20260803220157.1520377-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 22:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242669

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: e176e2295bb6c4ac186c6c7187606827fbd5ffee)

Release notes:
* https://www.ruby-lang.org/en/news/2026/05/11/ruby-4-0-4-released/
* This is a routine update that includes bugfixes.
* https://www.ruby-lang.org/en/news/2026/05/20/ruby-4-0-5-released/
* This release only contains a security fix for CVE-2026-46727:
  Use-after-free in pthread-based getaddrinfo timeout handler and a
  build system regression in Ruby 4.0.4 under C locale

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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

