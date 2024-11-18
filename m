Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050C7D62040
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:32 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.4798.1731964613643664920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Wv0xJrw3;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=GEnlZNg/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010193412333ed-6668b9ad-0d4d-4871-ba9f-49a37965c292-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pVyS2dhxg3gQL7yCezs1G0S/l/Jles8wP6koMpf/uuM=;
	b=Wv0xJrw3XdsG+kTrXuAsqVJyoYrdOv2BPoqWv2VCc1PNmQKXsQf86VROvQ/Km6WC
	MnA2eXRTMll7hWHb/B1IIndCUW/3xiekfSU6OJgTqKaLiQ3yw6udHanTxNwj3YX+wR9
	ju3lS5O+oF1rYZvd715yWKcnl5aiNkYQJi3ztXM8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964646;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pVyS2dhxg3gQL7yCezs1G0S/l/Jles8wP6koMpf/uuM=;
	b=GEnlZNg/LaXIKT9NjQ/gjWo1mwHoOXGJI5mpeC6o5v4BcADU3kDO5Hmh3sf58a8D
	z4BOx6nMoY0XWMuDRgPrS9t1KROd5QheT/0uzZF6xT+XR3h2MNCaCFWSsoeT3Ibu2+Q
	WFJmclie2oI0AVdz5neN6F7S2MqkSOOZy7MmvWKs=
Content-Type: multipart/mixed; boundary="===============5837428133843357998=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 3.3.6 SUCCEEDED
Message-ID: <01010193412333ed-6668b9ad-0d4d-4871-ba9f-49a37965c292-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207304

--===============5837428133843357998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ruby* to *3.3.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ruby-upgrade-3.3.5-3.3.6.patch
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
From 4c76c8b8771871c8f509b574582ae19047c2e867 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 17 Nov 2024 06:37:39 +0000
Subject: [PATCH] ruby: upgrade 3.3.5 -> 3.3.6

---
 .../0001-extmk-fix-cross-compilation-of-external-gems.patch | 2 +-
 ...-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch | 2 +-
 .../ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch    | 2 +-
 .../ruby/0003-rdoc-build-reproducible-documentation.patch   | 2 +-
 ...b-mkmf.rb-sort-list-of-object-files-in-generated-M.patch | 2 +-
 ...Mark-Gemspec-reproducible-change-fixing-784225-too.patch | 6 +++---
 .../ruby/ruby/0006-Make-gemspecs-reproducible.patch         | 2 +-
 meta/recipes-devtools/ruby/{ruby_3.3.5.bb => ruby_3.3.6.bb} | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.3.5.bb => ruby_3.3.6.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
index bd8f736247..57ba9b3e16 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
@@ -1,4 +1,4 @@
-From b74950d4f06bbfb91b2e68044147a226c15f4639 Mon Sep 17 00:00:00 2001
+From 1d82d28f4ab9e3433a79bc0977f9f64432b10b74 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 30 Sep 2019 16:57:01 +0100
 Subject: [PATCH] extmk: fix cross-compilation of external gems
diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
index bc1744da82..fe43e041c8 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
@@ -1,4 +1,4 @@
-From f4edf72c76bc06fa92c61f6cb9163cc777912a1f Mon Sep 17 00:00:00 2001
+From f5aa6d312e8e525b739f82e91f9c01e9f07081b8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jan 2022 20:29:14 -0800
 Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index 6f95685917..c7cce4b7dd 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,4 +1,4 @@
-From e6267676addd27f3c02667116185211d711ef940 Mon Sep 17 00:00:00 2001
+From 7be088ba19f66996d3ea6b33c6fcdb1d4cc0858a Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index abbbd35702..e95bbf6c56 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,4 +1,4 @@
-From 09a6df0d32e2177406ed391e536c0c7c4b503c5d Mon Sep 17 00:00:00 2001
+From 352712755f23629a2ebb4e9daa7ed041e7f647af Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
 Subject: [PATCH] rdoc: build reproducible documentation
diff --git a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
index f08aaf555f..af3f3c5654 100644
--- a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
+++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
@@ -1,4 +1,4 @@
-From f491fff7d006954c1c51eb7a513a85bdbab0fe5a Mon Sep 17 00:00:00 2001
+From ed946c9158a8f567cd2b9399bbdcd1c018040561 Mon Sep 17 00:00:00 2001
 From: Reiner Herrmann <reiner@reiner-h.de>
 Date: Tue, 10 Oct 2017 15:06:13 -0300
 Subject: [PATCH] lib/mkmf.rb: sort list of object files in generated Makefile
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index 5570cdfcaa..2d2fd6cbea 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From 91304f26dd4153ecae752ea875eec9ce2d5d3963 Mon Sep 17 00:00:00 2001
+From e29bb09824502fde9f5668cbc30ae1a509d9b7cc Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
@@ -12,10 +12,10 @@ Upstream-Status: Backport [debian]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/lib/rubygems/specification.rb b/lib/rubygems/specification.rb
-index 05ce483..5f2dbd1 100644
+index e438669..3ce9af8 100644
 --- a/lib/rubygems/specification.rb
 +++ b/lib/rubygems/specification.rb
-@@ -1698,7 +1698,9 @@ class Gem::Specification < Gem::BasicSpecification
+@@ -1707,7 +1707,9 @@ class Gem::Specification < Gem::BasicSpecification
                  raise(Gem::InvalidSpecificationException,
                        "invalid date format in specification: #{date.inspect}")
                end
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index 8a1daba7bd..b3e003f93d 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,4 +1,4 @@
-From 42f8019e62f392f5bc09c25e90cc63123eb764fe Mon Sep 17 00:00:00 2001
+From e0c410882a1b6e303bc06cf7196160dc2b5d47a7 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
diff --git a/meta/recipes-devtools/ruby/ruby_3.3.5.bb b/meta/recipes-devtools/ruby/ruby_3.3.6.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_3.3.5.bb
rename to meta/recipes-devtools/ruby/ruby_3.3.6.bb
index c5609893ca..6751b36a44 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.6.bb
@@ -47,7 +47,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "3781a3504222c2f26cb4b9eb9c1a12dbf4944d366ce24a9ff8cf99ecbce75196"
+SRC_URI[sha256sum] = "8dc48fffaf270f86f1019053f28e51e4da4cce32a36760a0603a9aee67d7fd8d"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.44.1


--===============5837428133843357998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/ruby/ruby-ptest: FILELIST: added "/usr/lib/ruby/ptest/test/rubygems/rubygems/commands/ins_command.rb /usr/lib/ruby/ptest/test/rubygems/rubygems/commands/interrupt_command.rb"
packages/core2-64-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.1/lib -> /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.2/lib, directory renamed /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.1/ext/debug -> /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.2/ext/debug, directory renamed /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.1/lib/debug -> /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.2/lib/debug, directory renamed /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.16/exe -> /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.22/exe, directory renamed /usr/lib/ruby/gems/3.3.0/gems/syntax_suggest-2.0.0/exe -> /usr/lib/ruby/gems/3.3.0/gems/syntax_suggest-2.0.1/exe, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib/rexml/validation -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9/lib/rexml/validation, directory renamed /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.1/lib/debug/dap_custom -> /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.2/lib/debug/dap_custom, directory renamed /usr/lib/ruby/ge
 ms/3.3.0/gems/rexml-3.3.6/lib/rexml/parsers -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9/lib/rexml/parsers, directory renamed /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.1/misc -> /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.2/misc, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/doc/rexml -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9/doc/rexml, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib/rexml -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9/lib/rexml, directory renamed /usr/lib/ruby/gems/3.3.0/extensions/x86_64-linux-gnu/3.3.0/debug-1.9.1 -> /usr/lib/ruby/gems/3.3.0/extensions/x86_64-linux-gnu/3.3.0/debug-1.9.2, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/doc/rexml/tasks/rdoc -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9/doc/rexml/tasks/rdoc, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6 -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9, directory renamed /usr/lib/ruby/gems/3.3.0/extensions/x86_64-linux-gnu/3.3.0/debug-1.9.1/debug -> /usr/
 lib/ruby/gems/3.3.0/extensions/x86_64-linux-gnu/3.3.0/debug-1.9.2/debug, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9/lib, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib/rexml/light -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9/lib/rexml/light, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib/rexml/dtd -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9/lib/rexml/dtd, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib/rexml/formatters -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9/lib/rexml/formatters, directory renamed /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.1 -> /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.2, directory renamed /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.1/exe -> /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.2/exe, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/doc/rexml/tasks/tocs -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9/doc/rexml/tasks/tocs, removed "/usr/lib/ruby
 /3.3.0/reline/ansi.rb /usr/lib/ruby/gems/3.3.0/specifications/rexml-3.3.6.gemspec /usr/lib/ruby/3.3.0/reline/windows.rb /usr/bin/racc.lock /usr/bin/rake.lock /usr/bin/rdbg.lock /usr/bin/rdoc.lock /usr/lib/ruby/gems/3.3.0/cache/debug-1.9.1.gem /usr/lib/libruby.so.3.3.5 /usr/lib/ruby/gems/3.3.0/specifications/default/reline-0.5.7.gemspec /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.16.gemspec /usr/bin/typeprof.lock /usr/bin/bundle.lock /usr/bin/syntax_suggest.lock /usr/bin/ri.lock /usr/lib/ruby/gems/3.3.0/specifications/default/json-2.7.1.gemspec /usr/lib/ruby/3.3.0/reline/general_io.rb /usr/lib/ruby/gems/3.3.0/specifications/debug-1.9.1.gemspec /usr/bin/rbs.lock /usr/bin/irb.lock /usr/lib/ruby/gems/3.3.0/specifications/default/syntax_suggest-2.0.0.gemspec /usr/bin/erb.lock /usr/bin/bundler.lock /usr/lib/ruby/gems/3.3.0/cache/rexml-3.3.6.gem", added "/usr/lib/ruby/gems/3.3.0/specifications/rexml-3.3.9.gemspec /usr/lib/ruby/3.3.0/bundler/vendor/securerandom/lib/secureran
 dom.rb /usr/lib/ruby/3.3.0/bundler/vendor/securerandom/lib/random/formatter.rb /usr/lib/ruby/3.3.0/reline/io/dumb.rb /usr/lib/ruby/gems/3.3.0/cache/rexml-3.3.9.gem /usr/lib/ruby/gems/3.3.0/cache/debug-1.9.2.gem /usr/lib/ruby/3.3.0/rubygems/vendored_securerandom.rb /usr/lib/libruby.so.3.3.6 /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.22.gemspec /usr/lib/ruby/3.3.0/reline/io/windows.rb /usr/lib/ruby/gems/3.3.0/specifications/default/json-2.7.2.gemspec /usr/lib/ruby/gems/3.3.0/specifications/default/reline-0.5.10.gemspec /usr/lib/ruby/gems/3.3.0/specifications/debug-1.9.2.gemspec /usr/lib/ruby/gems/3.3.0/specifications/default/syntax_suggest-2.0.1.gemspec /usr/lib/ruby/3.3.0/bundler/vendored_securerandom.rb /usr/lib/ruby/3.3.0/reline/io/ansi.rb /usr/lib/ruby/3.3.0/reline/key_actor/composite.rb /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom/lib/securerandom.rb /usr/lib/ruby/3.3.0/reline/io.rb /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom/lib/random/formatter.rb"
Changes to packages/core2-64-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.3 changed symlink target from libruby.so.3.3.5 to libruby.so.3.3.6
  /usr/lib/libruby.so changed symlink target from libruby.so.3.3.5 to libruby.so.3.3.6
  /usr/lib/libruby.so.3.3.5 moved to /usr/lib/libruby.so.3.3.6
  /usr/lib/ruby/gems/3.3.0/cache/debug-1.9.1.gem moved to /usr/lib/ruby/gems/3.3.0/cache/debug-1.9.2.gem
  /usr/lib/ruby/gems/3.3.0/cache/rexml-3.3.6.gem moved to /usr/lib/ruby/gems/3.3.0/cache/rexml-3.3.9.gem
  /usr/lib/ruby/gems/3.3.0/extensions/x86_64-linux-gnu/3.3.0/debug-1.9.1 moved to /usr/lib/ruby/gems/3.3.0/extensions/x86_64-linux-gnu/3.3.0/debug-1.9.2
  /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.16 moved to /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.22
  /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.1 moved to /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.2
  /usr/lib/ruby/gems/3.3.0/gems/json-2.7.1 moved to /usr/lib/ruby/gems/3.3.0/gems/json-2.7.2
  /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6 moved to /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9
  /usr/lib/ruby/gems/3.3.0/gems/syntax_suggest-2.0.0 moved to /usr/lib/ruby/gems/3.3.0/gems/syntax_suggest-2.0.1
  /usr/lib/ruby/gems/3.3.0/specifications/debug-1.9.1.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/debug-1.9.2.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.16.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.22.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/default/json-2.7.1.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/default/json-2.7.2.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/default/syntax_suggest-2.0.0.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/default/syntax_suggest-2.0.1.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/rexml-3.3.6.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/rexml-3.3.9.gemspec
  /usr/lib/ruby/3.3.0/bundler/vendored_securerandom.rb was added
  /usr/lib/ruby/3.3.0/bundler/vendor/securerandom was added
  /usr/lib/ruby/3.3.0/bundler/vendor/securerandom/lib was added
  /usr/lib/ruby/3.3.0/bundler/vendor/securerandom/lib/random was added
  /usr/lib/ruby/3.3.0/bundler/vendor/securerandom/lib/random/formatter.rb was added
  /usr/lib/ruby/3.3.0/bundler/vendor/securerandom/lib/securerandom.rb was added
  /usr/lib/ruby/3.3.0/reline/io was added
  /usr/lib/ruby/3.3.0/reline/io/ansi.rb was added
  /usr/lib/ruby/3.3.0/reline/io/dumb.rb was added
  /usr/lib/ruby/3.3.0/reline/io.rb was added
  /usr/lib/ruby/3.3.0/reline/io/windows.rb was added
  /usr/lib/ruby/3.3.0/reline/key_actor/composite.rb was added
  /usr/lib/ruby/3.3.0/rubygems/vendored_securerandom.rb was added
  /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom was added
  /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom/lib was added
  /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom/lib/random was added
  /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom/lib/random/formatter.rb was added
  /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom/lib/securerandom.rb was added
  /usr/lib/ruby/gems/3.3.0/gems/reline-0.5.10 was added
  /usr/lib/ruby/gems/3.3.0/specifications/default/reline-0.5.10.gemspec was added
  /usr/lib/ruby/3.3.0/reline/ansi.rb was removed
  /usr/lib/ruby/3.3.0/reline/general_io.rb was removed
  /usr/lib/ruby/3.3.0/reline/windows.rb was removed
  /usr/lib/ruby/gems/3.3.0/gems/reline-0.5.7 was removed
  /usr/lib/ruby/gems/3.3.0/specifications/default/reline-0.5.7.gemspec was removed
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.3 changed symlink target from libruby.so.3.3.5 to libruby.so.3.3.6
  /usr/lib/libruby.so changed symlink target from libruby.so.3.3.5 to libruby.so.3.3.6
  /usr/lib/libruby.so.3.3.5 moved to /usr/lib/libruby.so.3.3.6
  /usr/lib/ruby/gems/3.3.0/cache/debug-1.9.1.gem moved to /usr/lib/ruby/gems/3.3.0/cache/debug-1.9.2.gem
  /usr/lib/ruby/gems/3.3.0/cache/rexml-3.3.6.gem moved to /usr/lib/ruby/gems/3.3.0/cache/rexml-3.3.9.gem
  /usr/lib/ruby/gems/3.3.0/extensions/x86_64-linux-gnu/3.3.0/debug-1.9.1 moved to /usr/lib/ruby/gems/3.3.0/extensions/x86_64-linux-gnu/3.3.0/debug-1.9.2
  /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.16 moved to /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.22
  /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.1 moved to /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.2
  /usr/lib/ruby/gems/3.3.0/gems/json-2.7.1 moved to /usr/lib/ruby/gems/3.3.0/gems/json-2.7.2
  /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6 moved to /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9
  /usr/lib/ruby/gems/3.3.0/gems/syntax_suggest-2.0.0 moved to /usr/lib/ruby/gems/3.3.0/gems/syntax_suggest-2.0.1
  /usr/lib/ruby/gems/3.3.0/specifications/debug-1.9.1.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/debug-1.9.2.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.16.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.22.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/default/json-2.7.1.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/default/json-2.7.2.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/default/syntax_suggest-2.0.0.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/default/syntax_suggest-2.0.1.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/rexml-3.3.6.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/rexml-3.3.9.gemspec
  /usr/lib/ruby/3.3.0/bundler/vendored_securerandom.rb was added
  /usr/lib/ruby/3.3.0/bundler/vendor/securerandom was added
  /usr/lib/ruby/3.3.0/bundler/vendor/securerandom/lib was added
  /usr/lib/ruby/3.3.0/bundler/vendor/securerandom/lib/random was added
  /usr/lib/ruby/3.3.0/bundler/vendor/securerandom/lib/random/formatter.rb was added
  /usr/lib/ruby/3.3.0/bundler/vendor/securerandom/lib/securerandom.rb was added
  /usr/lib/ruby/3.3.0/reline/io was added
  /usr/lib/ruby/3.3.0/reline/io/ansi.rb was added
  /usr/lib/ruby/3.3.0/reline/io/dumb.rb was added
  /usr/lib/ruby/3.3.0/reline/io.rb was added
  /usr/lib/ruby/3.3.0/reline/io/windows.rb was added
  /usr/lib/ruby/3.3.0/reline/key_actor/composite.rb was added
  /usr/lib/ruby/3.3.0/rubygems/vendored_securerandom.rb was added
  /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom was added
  /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom/lib was added
  /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom/lib/random was added
  /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom/lib/random/formatter.rb was added
  /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom/lib/securerandom.rb was added
  /usr/lib/ruby/gems/3.3.0/gems/reline-0.5.10 was added
  /usr/lib/ruby/gems/3.3.0/specifications/default/reline-0.5.10.gemspec was added
  /usr/bin/bundle.lock was removed
  /usr/bin/bundler.lock was removed
  /usr/bin/erb.lock was removed
  /usr/bin/irb.lock was removed
  /usr/bin/racc.lock was removed
  /usr/bin/rake.lock was removed
  /usr/bin/rbs.lock was removed
  /usr/bin/rdbg.lock was removed
  /usr/bin/rdoc.lock was removed
  /usr/bin/ri.lock was removed
  /usr/bin/syntax_suggest.lock was removed
  /usr/bin/typeprof.lock was removed
  /usr/lib/ruby/3.3.0/reline/ansi.rb was removed
  /usr/lib/ruby/3.3.0/reline/general_io.rb was removed
  /usr/lib/ruby/3.3.0/reline/windows.rb was removed
  /usr/lib/ruby/gems/3.3.0/gems/reline-0.5.7 was removed
  /usr/lib/ruby/gems/3.3.0/specifications/default/reline-0.5.7.gemspec was removed

--===============5837428133843357998==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-3.3.5-3.3.6.patch"

RnJvbSA0Yzc2YzhiODc3MTg3MWM4ZjUwOWI1NzQ1ODJhZTE5MDQ3YzJlODY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTcgTm92IDIwMjQgMDY6Mzc6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
dWJ5OiB1cGdyYWRlIDMuMy41IC0+IDMuMy42CgotLS0KIC4uLi8wMDAxLWV4dG1rLWZpeC1jcm9z
cy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoIHwgMiArLQogLi4uLXZtX2R1bXAu
Yy1EZWZpbmUtUkVHX1MxLWFuZC1SRUdfUzItZm9yLW11c2wtcmlzY3YucGF0Y2ggfCAyICstCiAu
Li4vcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaCAg
ICB8IDIgKy0KIC4uLi9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRh
dGlvbi5wYXRjaCAgIHwgMiArLQogLi4uYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmls
ZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2ggfCAyICstCiAuLi5NYXJrLUdlbXNwZWMtcmVwcm9kdWNp
YmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaCB8IDYgKysrLS0tCiAuLi4vcnVieS9y
dWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUucGF0Y2ggICAgICAgICB8IDIgKy0K
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3tydWJ5XzMuMy41LmJiID0+IHJ1YnlfMy4zLjYu
YmJ9IHwgMiArLQogOCBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS97cnVieV8zLjMuNS5iYiA9
PiBydWJ5XzMuMy42LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnkvMDAwMS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwt
Z2Vtcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1leHRtay1m
aXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaAppbmRleCBiZDhmNzM2
MjQ3Li41N2JhOWIzZTE2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9y
dWJ5LzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLWV4dG1rLWZpeC1j
cm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1nZW1zLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBiNzQ5NTBkNGYwNmJiZmI5MWIyZTY4MDQ0MTQ3YTIyNmMxNWY0NjM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSAxZDgyZDI4ZjRhYjllMzQzM2E3OWJjMDk3N2Y5ZjY0NDMyYjEw
Yjc0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogPT9VVEYtOD9xP0FuZHI9QzM9QTk9
MjBEcmFzemlrPz0gPGFuZHJlLmRyYXN6aWtAamNpLmNvbT4KIERhdGU6IE1vbiwgMzAgU2VwIDIw
MTkgMTY6NTc6MDEgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gZXh0bWs6IGZpeCBjcm9zcy1jb21w
aWxhdGlvbiBvZiBleHRlcm5hbCBnZW1zCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3It
bXVzbC1yaXNjdi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS12
bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBhdGNoCmlu
ZGV4IGJjMTc0NGRhODIuLmZlNDNlMDQxYzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9ydWJ5L3J1YnkvMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZv
ci1tdXNsLXJpc2N2LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1Ynkv
MDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQtUkVHX1MyLWZvci1tdXNsLXJpc2N2LnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmNGVkZjcyYzc2YmMwNmZhOTJjNjFmNmNiOTE2M2Nj
Nzc3OTEyYTFmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmNWFhNmQzMTJlOGU1MjVi
NzM5ZjgyZTkxZjljMDFlOWYwNzA4MWI4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMjUgSmFuIDIwMjIgMjA6
Mjk6MTQgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdm1fZHVtcC5jOiBEZWZpbmUgUkVHX1MxIGFu
ZCBSRUdfUzIgZm9yIG11c2wvcmlzY3YKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDItT2JleS1MREZMQUdTLWZv
ci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNoCmluZGV4IDZmOTU2ODU5MTcuLmM3Y2NlNGI3ZGQg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxE
RkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieS8wMDAyLU9iZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVi
eS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTYyNjc2NzZhZGRkMjdmM2MwMjY2NzExNjE4
NTIxMWQ3MTFlZjk0MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gN2JlMDg4YmExOWY2
Njk5NmQzZWE2YjMzYzZmY2RiMWQ0Y2MwODU4YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IENocmlzdG9waGVyIExhcnNvbiA8Y2hyaXNfbGFyc29uQG1lbnRvci5jb20+CiBEYXRlOiBU
aHUsIDUgTWF5IDIwMTYgMTA6NTk6MDcgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gT2JleSBMREZM
QUdTIGZvciB0aGUgbGluayBvZiBsaWJydWJ5CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlv
bi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMy1yZG9jLWJ1aWxk
LXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoCmluZGV4IGFiYmJkMzU3MDIuLmU5NWJi
ZjZjNTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMy1y
ZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1
bWVudGF0aW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwOWE2ZGYwZDMyZTIxNzc0MDZl
ZDM5MWU1MzZjMGM3YzRiNTAzYzVkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzNTI3
MTI3NTVmMjM2MjlhMmViYjRlOWRhYTdlZDA0MWU3ZjY0N2FmIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQ2hyaXN0aWFuIEhvZnN0YWVkdGxlciA8emVoYUBkZWJpYW4ub3JnPgogRGF0
ZTogVHVlLCAxMCBPY3QgMjAxNyAxNTowNDozNCAtMDMwMAogU3ViamVjdDogW1BBVENIXSByZG9j
OiBidWlsZCByZXByb2R1Y2libGUgZG9jdW1lbnRhdGlvbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmpl
Y3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVi
eS9ydWJ5LzAwMDQtbGliLW1rbWYucmItc29ydC1saXN0LW9mLW9iamVjdC1maWxlcy1pbi1nZW5l
cmF0ZWQtTS5wYXRjaAppbmRleCBmMDhhYWY1NTVmLi5hZjNmM2M1NjU0IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDQtbGliLW1rbWYucmItc29ydC1saXN0
LW9mLW9iamVjdC1maWxlcy1pbi1nZW5lcmF0ZWQtTS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDQtbGliLW1rbWYucmItc29ydC1saXN0LW9mLW9iamVjdC1m
aWxlcy1pbi1nZW5lcmF0ZWQtTS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjQ5MWZmZjdk
MDA2OTU0YzFjNTFlYjdhNTEzYTg1YmRiYWIwZmU1YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gZWQ5NDZjOTE1OGE4ZjU2N2NkMmI5Mzk5YmJkY2QxYzAxODA0MDU2MSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IFJlaW5lciBIZXJybWFubiA8cmVpbmVyQHJlaW5lci1oLmRl
PgogRGF0ZTogVHVlLCAxMCBPY3QgMjAxNyAxNTowNjoxMyAtMDMwMAogU3ViamVjdDogW1BBVENI
XSBsaWIvbWttZi5yYjogc29ydCBsaXN0IG9mIG9iamVjdCBmaWxlcyBpbiBnZW5lcmF0ZWQgTWFr
ZWZpbGUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1N
YXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNS1NYXJrLUdlbXNwZWMtcmVwcm9k
dWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaAppbmRleCA1NTcwY2RmY2FhLi4y
ZDJmZDZjYmVhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAw
MDUtTWFyay1HZW1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA1LU1hcmstR2Vtc3Bl
Yy1yZXByb2R1Y2libGUtY2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA5MTMwNGYyNmRkNDE1M2VjYWU3NTJlYTg3NWVlYzljZTJkNWQzOTYzIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlMjliYjA5ODI0NTAyZmRlOWY1NjY4Y2JjMzBhZTFh
NTA5ZDliN2NjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTHVjYXMgS2FuYXNoaXJv
IDxrYW5hc2hpcm9AZGViaWFuLm9yZz4KIERhdGU6IEZyaSwgMSBOb3YgMjAxOSAxNToyNToxNyAt
MDMwMAogU3ViamVjdDogW1BBVENIXSBNYWtlIGdlbXNwZWNzIHJlcHJvZHVjaWJsZQpAQCAtMTIs
MTAgKzEyLDEwIEBAIFVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2RlYmlhbl0KICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9s
aWIvcnVieWdlbXMvc3BlY2lmaWNhdGlvbi5yYiBiL2xpYi9ydWJ5Z2Vtcy9zcGVjaWZpY2F0aW9u
LnJiCi1pbmRleCAwNWNlNDgzLi41ZjJkYmQxIDEwMDY0NAoraW5kZXggZTQzODY2OS4uM2NlOWFm
OCAxMDA2NDQKIC0tLSBhL2xpYi9ydWJ5Z2Vtcy9zcGVjaWZpY2F0aW9uLnJiCiArKysgYi9saWIv
cnVieWdlbXMvc3BlY2lmaWNhdGlvbi5yYgotQEAgLTE2OTgsNyArMTY5OCw5IEBAIGNsYXNzIEdl
bTo6U3BlY2lmaWNhdGlvbiA8IEdlbTo6QmFzaWNTcGVjaWZpY2F0aW9uCitAQCAtMTcwNyw3ICsx
NzA3LDkgQEAgY2xhc3MgR2VtOjpTcGVjaWZpY2F0aW9uIDwgR2VtOjpCYXNpY1NwZWNpZmljYXRp
b24KICAgICAgICAgICAgICAgICAgcmFpc2UoR2VtOjpJbnZhbGlkU3BlY2lmaWNhdGlvbkV4Y2Vw
dGlvbiwKICAgICAgICAgICAgICAgICAgICAgICAgImludmFsaWQgZGF0ZSBmb3JtYXQgaW4gc3Bl
Y2lmaWNhdGlvbjogI3tkYXRlLmluc3BlY3R9IikKICAgICAgICAgICAgICAgIGVuZApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3Mt
cmVwcm9kdWNpYmxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2
LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxlLnBhdGNoCmluZGV4IDhhMWRhYmE3YmQuLmIzZTAw
M2Y5M2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNi1N
YWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDQyZjgwMTllNjJmMzkyZjViYzA5YzI1ZTkwY2M2MzEyM2ViNzY0ZmUg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGUwYzQxMDg4MmExYjZlMzAzYmMwNmNmNzE5
NjE2MGRjMmI1ZDQ3YTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBMdWNhcyBLYW5h
c2hpcm8gPGthbmFzaGlyb0BkZWJpYW4ub3JnPgogRGF0ZTogRnJpLCAxIE5vdiAyMDE5IDE1OjI1
OjE3IC0wMzAwCiBTdWJqZWN0OiBbUEFUQ0hdIE1ha2UgZ2Vtc3BlY3MgcmVwcm9kdWNpYmxlCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuMy41LmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8zLjMuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDk4
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuMy41LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzMuMy42LmJiCmluZGV4IGM1
NjA5ODkzY2EuLjY3NTFiMzZhNDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnlfMy4zLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8z
LjMuNi5iYgpAQCAtNDcsNyArNDcsNyBAQCBkb19jb25maWd1cmU6cHJlcGVuZCgpIHsKIAogREVQ
RU5EUzphcHBlbmQ6bGliYy1tdXNsID0gIiBsaWJ1Y29udGV4dCIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjM3ODFhMzUwNDIyMmMyZjI2Y2I0YjllYjljMWExMmRiZjQ5NDRkMzY2Y2UyNGE5ZmY4
Y2Y5OWVjYmNlNzUxOTYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGRjNDhmZmZhZjI3MGY4NmYx
MDE5MDUzZjI4ZTUxZTRkYTRjY2UzMmEzNjc2MGEwNjAzYTlhZWU2N2Q3ZmQ4ZCIKIAogUEFDS0FH
RUNPTkZJRyA/Pz0gIiIKIFBBQ0tBR0VDT05GSUcgKz0gIiR7QGJiLnV0aWxzLmZpbHRlcignRElT
VFJPX0ZFQVRVUkVTJywgJ2lwdjYnLCBkKX0iCi0tIAoyLjQ0LjEKCg==

--===============5837428133843357998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ruby: PKGV changed from 3.3.5 [default] to 3.3.6 [default]
packages/core2-64-poky-linux/ruby: PV changed from "3.3.5" to "3.3.6"
packages/core2-64-poky-linux/ruby: SRC_URI changed from "http://cache.ruby-lang.org/pub/ruby/3.3/ruby-3.3.5.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch" to "http://cache.ruby-lang.org/pub/ruby/3.3/ruby-3.3.6.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch 
 file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch"
packages/core2-64-poky-linux/ruby/ruby-dbg: PKGV changed from 3.3.5 [default] to 3.3.6 [default]
packages/core2-64-poky-linux/ruby/ruby-dbg: PV changed from "3.3.5" to "3.3.6"
packages/core2-64-poky-linux/ruby/ruby-dbg: FILELIST: directory renamed /usr/lib/ruby/gems/3.3.0/extensions/x86_64-linux-gnu/3.3.0/debug-1.9.1/debug/.debug -> /usr/lib/ruby/gems/3.3.0/extensions/x86_64-linux-gnu/3.3.0/debug-1.9.2/debug/.debug, removed "/usr/lib/.debug/libruby.so.3.3.5", added "/usr/lib/.debug/libruby.so.3.3.6"
packages/core2-64-poky-linux/ruby/ruby-dbg: PKGSIZE changed from 15782680 to 15785608 (+0%)
packages/core2-64-poky-linux/ruby/ruby-dev: PKGV changed from 3.3.5 [default] to 3.3.6 [default]
packages/core2-64-poky-linux/ruby/ruby-dev: PV changed from "3.3.5" to "3.3.6"
packages/core2-64-poky-linux/ruby/ruby-doc: PKGV changed from 3.3.5 [default] to 3.3.6 [default]
packages/core2-64-poky-linux/ruby/ruby-doc: PV changed from "3.3.5" to "3.3.6"
packages/core2-64-poky-linux/ruby/ruby-locale: PKGV changed from 3.3.5 [default] to 3.3.6 [default]
packages/core2-64-poky-linux/ruby/ruby-locale: PV changed from "3.3.5" to "3.3.6"
packages/core2-64-poky-linux/ruby/ruby-ptest: PKGV changed from 3.3.5 [default] to 3.3.6 [default]
packages/core2-64-poky-linux/ruby/ruby-ptest: PV changed from "3.3.5" to "3.3.6"
packages/core2-64-poky-linux/ruby/ruby-ptest: FILELIST: added "/usr/lib/ruby/ptest/test/rubygems/rubygems/commands/interrupt_command.rb /usr/lib/ruby/ptest/test/rubygems/rubygems/commands/ins_command.rb"
packages/core2-64-poky-linux/ruby/ruby-ptest: PKGSIZE changed from 18161141 to 18178593 (+0%)
packages/core2-64-poky-linux/ruby/ruby-rdoc: PKGV changed from 3.3.5 [default] to 3.3.6 [default]
packages/core2-64-poky-linux/ruby/ruby-rdoc: PV changed from "3.3.5" to "3.3.6"
packages/core2-64-poky-linux/ruby/ruby-ri-docs: PKGV changed from 3.3.5 [default] to 3.3.6 [default]
packages/core2-64-poky-linux/ruby/ruby-ri-docs: PV changed from "3.3.5" to "3.3.6"
packages/core2-64-poky-linux/ruby/ruby-src: PKGV changed from 3.3.5 [default] to 3.3.6 [default]
packages/core2-64-poky-linux/ruby/ruby-src: PV changed from "3.3.5" to "3.3.6"
packages/core2-64-poky-linux/ruby/ruby-src: PKGSIZE changed from 38230883 to 38232479 (+0%)
packages/core2-64-poky-linux/ruby/ruby-staticdev: PKGV changed from 3.3.5 [default] to 3.3.6 [default]
packages/core2-64-poky-linux/ruby/ruby-staticdev: PV changed from "3.3.5" to "3.3.6"
packages/core2-64-poky-linux/ruby/ruby: PKGV changed from 3.3.5 [default] to 3.3.6 [default]
packages/core2-64-poky-linux/ruby/ruby: PV changed from "3.3.5" to "3.3.6"
packages/core2-64-poky-linux/ruby/ruby: FILELIST: directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib/rexml/formatters -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9/lib/rexml/formatters, directory renamed /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.1/lib -> /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.2/lib, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib/rexml/light -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9/lib/rexml/light, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib/rexml/parsers -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9/lib/rexml/parsers, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/doc/rexml/tasks/tocs -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9/doc/rexml/tasks/tocs, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6 -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9/lib, directory renamed /usr/lib/ruby/gems/3
 .3.0/gems/rexml-3.3.6/lib/rexml/validation -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9/lib/rexml/validation, directory renamed /usr/lib/ruby/gems/3.3.0/extensions/x86_64-linux-gnu/3.3.0/debug-1.9.1 -> /usr/lib/ruby/gems/3.3.0/extensions/x86_64-linux-gnu/3.3.0/debug-1.9.2, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/doc/rexml/tasks/rdoc -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9/doc/rexml/tasks/rdoc, directory renamed /usr/lib/ruby/gems/3.3.0/extensions/x86_64-linux-gnu/3.3.0/debug-1.9.1/debug -> /usr/lib/ruby/gems/3.3.0/extensions/x86_64-linux-gnu/3.3.0/debug-1.9.2/debug, directory renamed /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.1/exe -> /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.2/exe, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib/rexml/dtd -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9/lib/rexml/dtd, directory renamed /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.1/lib/debug/dap_custom -> /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.2/lib/debug/dap_custom, dir
 ectory renamed /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.16/exe -> /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.22/exe, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/doc/rexml -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9/doc/rexml, directory renamed /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6/lib/rexml -> /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9/lib/rexml, directory renamed /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.1/ext/debug -> /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.2/ext/debug, directory renamed /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.1/lib/debug -> /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.2/lib/debug, directory renamed /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.1/misc -> /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.2/misc, directory renamed /usr/lib/ruby/gems/3.3.0/gems/syntax_suggest-2.0.0/exe -> /usr/lib/ruby/gems/3.3.0/gems/syntax_suggest-2.0.1/exe, directory renamed /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.1 -> /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.2, removed "/usr/lib/ruby
 /gems/3.3.0/specifications/default/json-2.7.1.gemspec /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.16.gemspec /usr/bin/typeprof.lock /usr/lib/libruby.so.3.3.5 /usr/lib/ruby/gems/3.3.0/cache/rexml-3.3.6.gem /usr/bin/ri.lock /usr/lib/ruby/gems/3.3.0/specifications/rexml-3.3.6.gemspec /usr/bin/bundle.lock /usr/lib/ruby/gems/3.3.0/cache/debug-1.9.1.gem /usr/lib/ruby/3.3.0/reline/windows.rb /usr/lib/ruby/gems/3.3.0/specifications/debug-1.9.1.gemspec /usr/bin/syntax_suggest.lock /usr/lib/ruby/3.3.0/reline/general_io.rb /usr/bin/bundler.lock /usr/bin/rake.lock /usr/bin/rdbg.lock /usr/bin/racc.lock /usr/lib/ruby/gems/3.3.0/specifications/default/reline-0.5.7.gemspec /usr/bin/rdoc.lock /usr/lib/ruby/gems/3.3.0/specifications/default/syntax_suggest-2.0.0.gemspec /usr/bin/rbs.lock /usr/bin/erb.lock /usr/bin/irb.lock /usr/lib/ruby/3.3.0/reline/ansi.rb", added "/usr/lib/ruby/3.3.0/bundler/vendor/securerandom/lib/random/formatter.rb /usr/lib/ruby/gems/3.3.0/specifications/default/j
 son-2.7.2.gemspec /usr/lib/ruby/3.3.0/rubygems/vendored_securerandom.rb /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.22.gemspec /usr/lib/ruby/3.3.0/reline/io/windows.rb /usr/lib/libruby.so.3.3.6 /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom/lib/securerandom.rb /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom/lib/random/formatter.rb /usr/lib/ruby/gems/3.3.0/specifications/rexml-3.3.9.gemspec /usr/lib/ruby/gems/3.3.0/specifications/debug-1.9.2.gemspec /usr/lib/ruby/3.3.0/reline/io/dumb.rb /usr/lib/ruby/gems/3.3.0/specifications/default/reline-0.5.10.gemspec /usr/lib/ruby/3.3.0/bundler/vendor/securerandom/lib/securerandom.rb /usr/lib/ruby/3.3.0/reline/io/ansi.rb /usr/lib/ruby/3.3.0/reline/io.rb /usr/lib/ruby/gems/3.3.0/specifications/default/syntax_suggest-2.0.1.gemspec /usr/lib/ruby/3.3.0/reline/key_actor/composite.rb /usr/lib/ruby/3.3.0/bundler/vendored_securerandom.rb /usr/lib/ruby/gems/3.3.0/cache/debug-1.9.2.gem /usr/lib/ruby/gems/3.3.0/cache/rexml-3.3.9.gem"
packages/core2-64-poky-linux/ruby/ruby: PKGSIZE changed from 26940938 to 26985415 (+0%)
Changes to packages/core2-64-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.3.3 changed symlink target from libruby.so.3.3.5 to libruby.so.3.3.6
  /usr/lib/libruby.so changed symlink target from libruby.so.3.3.5 to libruby.so.3.3.6
  /usr/lib/libruby.so.3.3.5 moved to /usr/lib/libruby.so.3.3.6
  /usr/lib/ruby/gems/3.3.0/cache/debug-1.9.1.gem moved to /usr/lib/ruby/gems/3.3.0/cache/debug-1.9.2.gem
  /usr/lib/ruby/gems/3.3.0/cache/rexml-3.3.6.gem moved to /usr/lib/ruby/gems/3.3.0/cache/rexml-3.3.9.gem
  /usr/lib/ruby/gems/3.3.0/extensions/x86_64-linux-gnu/3.3.0/debug-1.9.1 moved to /usr/lib/ruby/gems/3.3.0/extensions/x86_64-linux-gnu/3.3.0/debug-1.9.2
  /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.16 moved to /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.22
  /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.1 moved to /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.2
  /usr/lib/ruby/gems/3.3.0/gems/json-2.7.1 moved to /usr/lib/ruby/gems/3.3.0/gems/json-2.7.2
  /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6 moved to /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9
  /usr/lib/ruby/gems/3.3.0/gems/syntax_suggest-2.0.0 moved to /usr/lib/ruby/gems/3.3.0/gems/syntax_suggest-2.0.1
  /usr/lib/ruby/gems/3.3.0/specifications/debug-1.9.1.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/debug-1.9.2.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.16.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.22.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/default/json-2.7.1.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/default/json-2.7.2.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/default/syntax_suggest-2.0.0.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/default/syntax_suggest-2.0.1.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/rexml-3.3.6.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/rexml-3.3.9.gemspec
  /usr/lib/ruby/3.3.0/bundler/vendored_securerandom.rb was added
  /usr/lib/ruby/3.3.0/bundler/vendor/securerandom was added
  /usr/lib/ruby/3.3.0/bundler/vendor/securerandom/lib was added
  /usr/lib/ruby/3.3.0/bundler/vendor/securerandom/lib/random was added
  /usr/lib/ruby/3.3.0/bundler/vendor/securerandom/lib/random/formatter.rb was added
  /usr/lib/ruby/3.3.0/bundler/vendor/securerandom/lib/securerandom.rb was added
  /usr/lib/ruby/3.3.0/reline/io was added
  /usr/lib/ruby/3.3.0/reline/io/ansi.rb was added
  /usr/lib/ruby/3.3.0/reline/io/dumb.rb was added
  /usr/lib/ruby/3.3.0/reline/io.rb was added
  /usr/lib/ruby/3.3.0/reline/io/windows.rb was added
  /usr/lib/ruby/3.3.0/reline/key_actor/composite.rb was added
  /usr/lib/ruby/3.3.0/rubygems/vendored_securerandom.rb was added
  /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom was added
  /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom/lib was added
  /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom/lib/random was added
  /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom/lib/random/formatter.rb was added
  /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom/lib/securerandom.rb was added
  /usr/lib/ruby/gems/3.3.0/gems/reline-0.5.10 was added
  /usr/lib/ruby/gems/3.3.0/specifications/default/reline-0.5.10.gemspec was added
  /usr/lib/ruby/3.3.0/reline/ansi.rb was removed
  /usr/lib/ruby/3.3.0/reline/general_io.rb was removed
  /usr/lib/ruby/3.3.0/reline/windows.rb was removed
  /usr/lib/ruby/gems/3.3.0/gems/reline-0.5.7 was removed
  /usr/lib/ruby/gems/3.3.0/specifications/default/reline-0.5.7.gemspec was removed
Changes to packages/x86_64-linux/ruby-native (sysroot):
  /usr/lib/libruby.so.3.3 changed symlink target from libruby.so.3.3.5 to libruby.so.3.3.6
  /usr/lib/libruby.so changed symlink target from libruby.so.3.3.5 to libruby.so.3.3.6
  /usr/lib/libruby.so.3.3.5 moved to /usr/lib/libruby.so.3.3.6
  /usr/lib/ruby/gems/3.3.0/cache/debug-1.9.1.gem moved to /usr/lib/ruby/gems/3.3.0/cache/debug-1.9.2.gem
  /usr/lib/ruby/gems/3.3.0/cache/rexml-3.3.6.gem moved to /usr/lib/ruby/gems/3.3.0/cache/rexml-3.3.9.gem
  /usr/lib/ruby/gems/3.3.0/extensions/x86_64-linux-gnu/3.3.0/debug-1.9.1 moved to /usr/lib/ruby/gems/3.3.0/extensions/x86_64-linux-gnu/3.3.0/debug-1.9.2
  /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.16 moved to /usr/lib/ruby/gems/3.3.0/gems/bundler-2.5.22
  /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.1 moved to /usr/lib/ruby/gems/3.3.0/gems/debug-1.9.2
  /usr/lib/ruby/gems/3.3.0/gems/json-2.7.1 moved to /usr/lib/ruby/gems/3.3.0/gems/json-2.7.2
  /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.6 moved to /usr/lib/ruby/gems/3.3.0/gems/rexml-3.3.9
  /usr/lib/ruby/gems/3.3.0/gems/syntax_suggest-2.0.0 moved to /usr/lib/ruby/gems/3.3.0/gems/syntax_suggest-2.0.1
  /usr/lib/ruby/gems/3.3.0/specifications/debug-1.9.1.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/debug-1.9.2.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.16.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/default/bundler-2.5.22.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/default/json-2.7.1.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/default/json-2.7.2.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/default/syntax_suggest-2.0.0.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/default/syntax_suggest-2.0.1.gemspec
  /usr/lib/ruby/gems/3.3.0/specifications/rexml-3.3.6.gemspec moved to /usr/lib/ruby/gems/3.3.0/specifications/rexml-3.3.9.gemspec
  /usr/lib/ruby/3.3.0/bundler/vendored_securerandom.rb was added
  /usr/lib/ruby/3.3.0/bundler/vendor/securerandom was added
  /usr/lib/ruby/3.3.0/bundler/vendor/securerandom/lib was added
  /usr/lib/ruby/3.3.0/bundler/vendor/securerandom/lib/random was added
  /usr/lib/ruby/3.3.0/bundler/vendor/securerandom/lib/random/formatter.rb was added
  /usr/lib/ruby/3.3.0/bundler/vendor/securerandom/lib/securerandom.rb was added
  /usr/lib/ruby/3.3.0/reline/io was added
  /usr/lib/ruby/3.3.0/reline/io/ansi.rb was added
  /usr/lib/ruby/3.3.0/reline/io/dumb.rb was added
  /usr/lib/ruby/3.3.0/reline/io.rb was added
  /usr/lib/ruby/3.3.0/reline/io/windows.rb was added
  /usr/lib/ruby/3.3.0/reline/key_actor/composite.rb was added
  /usr/lib/ruby/3.3.0/rubygems/vendored_securerandom.rb was added
  /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom was added
  /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom/lib was added
  /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom/lib/random was added
  /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom/lib/random/formatter.rb was added
  /usr/lib/ruby/3.3.0/rubygems/vendor/securerandom/lib/securerandom.rb was added
  /usr/lib/ruby/gems/3.3.0/gems/reline-0.5.10 was added
  /usr/lib/ruby/gems/3.3.0/specifications/default/reline-0.5.10.gemspec was added
  /usr/bin/bundle.lock was removed
  /usr/bin/bundler.lock was removed
  /usr/bin/erb.lock was removed
  /usr/bin/irb.lock was removed
  /usr/bin/racc.lock was removed
  /usr/bin/rake.lock was removed
  /usr/bin/rbs.lock was removed
  /usr/bin/rdbg.lock was removed
  /usr/bin/rdoc.lock was removed
  /usr/bin/ri.lock was removed
  /usr/bin/syntax_suggest.lock was removed
  /usr/bin/typeprof.lock was removed
  /usr/lib/ruby/3.3.0/reline/ansi.rb was removed
  /usr/lib/ruby/3.3.0/reline/general_io.rb was removed
  /usr/lib/ruby/3.3.0/reline/windows.rb was removed
  /usr/lib/ruby/gems/3.3.0/gems/reline-0.5.7 was removed
  /usr/lib/ruby/gems/3.3.0/specifications/default/reline-0.5.7.gemspec was removed

--===============5837428133843357998==--

