Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1115.1792734605076074605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 22:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ew7hg5JT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xdkSgweG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a1674f2c2a-505b1c5f-ef4a-4970-9e43-b4ec8ab768a1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792734604;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ibu5UTrWVyzGszVk3isptiadYcxSiHgEGQmqUnsceQI=;
	b=ew7hg5JToXi3ae5sGf7lZuX7I9S6UnsSynL5ygj2Sr0uHCtxCpP+O6jkEEHYop5V
	mNPzP1hKxreSm/4BVZAaf6uf9gBllCAszxo0FBKJsK7trw5ImGl3JTJMJjK5e55LDx3
	R0B+6LiIb7KhEe+oURV0gHu9KYnP/KlCJ85rFnJA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792734604;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ibu5UTrWVyzGszVk3isptiadYcxSiHgEGQmqUnsceQI=;
	b=xdkSgweGWaD0kZwnoNBnpqpU4ak+P0+W3aQSFiCXm87/IEL8CIL/ydGW8YrzynN1
	yxFCSyLyjD1nI/ZVksKjSYG0TjTIQMjWtd4Gbuf/07gHSkkGIj28khGnt9KlqDG45IO
	OS35Ueruyyk2Tuv3Dwpxb+ElpDJztpSsyhA1Rf+U=
Content-Type: multipart/mixed; boundary="===============1059540569322134550=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 4.0.9 SUCCEEDED
Message-ID: <010101a1674f2c2a-505b1c5f-ef4a-4970-9e43-b4ec8ab768a1-000000@us-west-2.amazonses.com>
Date: Fri, 23 Oct 2026 05:50:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.23-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 05:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248479

--===============1059540569322134550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ruby* to *4.0.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ruby-upgrade-4.0.7-4.0.9.patch
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
From f328d066cccab37729ecc61054c5423565a5880f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 23 Oct 2026 05:32:46 +0000
Subject: [PATCH] ruby: upgrade 4.0.7 -> 4.0.9

---
 ...1-Avoid-build-time-race-condition-when-cross-compiling.patch | 2 +-
 .../ruby/0001-Don-t-save-the-original-name-and-timestamp.patch  | 2 +-
 .../0001-extmk-fix-cross-compilation-of-external-gems.patch     | 2 +-
 ...0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch | 2 +-
 .../ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch   | 2 +-
 .../ruby/ruby/0003-rdoc-build-reproducible-documentation.patch  | 2 +-
 ...4-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch | 2 +-
 ...005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch | 2 +-
 .../ruby/ruby/0006-Make-gemspecs-reproducible.patch             | 2 +-
 .../0007-Skip-test_rm_r_no_permissions-test-under-root.patch    | 2 +-
 meta/recipes-devtools/ruby/{ruby_4.0.7.bb => ruby_4.0.9.bb}     | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_4.0.7.bb => ruby_4.0.9.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch b/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch
index d62e3affff..99e53e766f 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-Avoid-build-time-race-condition-when-cross-compiling.patch
@@ -1,4 +1,4 @@
-From 94b3a85def80680c6efb35e75b6e0dcd4bbf4645 Mon Sep 17 00:00:00 2001
+From 3ede4c3b253b8fb5fb5561152f1b72ef503a4913 Mon Sep 17 00:00:00 2001
 From: Paul Barker <paul@pbarker.dev>
 Date: Fri, 31 Jul 2026 13:15:37 +0100
 Subject: [PATCH] Avoid build-time race condition when cross-compiling from a
diff --git a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
index 1fd2066e1e..5d9850256a 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
@@ -1,4 +1,4 @@
-From ac16ff9a35127c718422caf27fbe1dfa2309b136 Mon Sep 17 00:00:00 2001
+From fd84ec69936c5ef82bd988dd36c5dcf7b9d38e76 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 27 Feb 2026 16:59:24 +0800
 Subject: [PATCH] Don't save the original name and timestamp
diff --git a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
index 36037aede3..3a96a94024 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-extmk-fix-cross-compilation-of-external-gems.patch
@@ -1,4 +1,4 @@
-From 846b17f3dbdbbd6b7dd7dcc81fda1826b87ee541 Mon Sep 17 00:00:00 2001
+From 17342b77a52343255752381304b719a5483542c9 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Mon, 30 Sep 2019 16:57:01 +0100
 Subject: [PATCH] extmk: fix cross-compilation of external gems
diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
index ea63dfe227..31d82f4667 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
@@ -1,4 +1,4 @@
-From f94129cac9e412a64bfb3dbd796912df058c6e1b Mon Sep 17 00:00:00 2001
+From 1d51989f08b35b44b1712ef415a353c5999e09bf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jan 2022 20:29:14 -0800
 Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
diff --git a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
index 0e7c23007b..02d448e1c2 100644
--- a/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
+++ b/meta/recipes-devtools/ruby/ruby/0002-Obey-LDFLAGS-for-the-link-of-libruby.patch
@@ -1,4 +1,4 @@
-From 385ea30ee2219bf9d1c702f18e38a2402a77a443 Mon Sep 17 00:00:00 2001
+From 6250054dc7518edb5000c2ea4ed6590bf98d5ec7 Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Thu, 5 May 2016 10:59:07 -0700
 Subject: [PATCH] Obey LDFLAGS for the link of libruby
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index 8bf6f38afe..7026205f4a 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,4 +1,4 @@
-From 3f6ac07fd0359eb3d41db86a4276b5c7818f2e6b Mon Sep 17 00:00:00 2001
+From f77d8551c396cc32a4eeef47a40cc92996e66606 Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
 Subject: [PATCH] rdoc: build reproducible documentation
diff --git a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
index c50cd7d2b2..82a0b8519b 100644
--- a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
+++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
@@ -1,4 +1,4 @@
-From 0347f66bb6e834c5a5d469f5903527699a8a9f8e Mon Sep 17 00:00:00 2001
+From fe76f85867462c275f2d308f366d4456f1feee27 Mon Sep 17 00:00:00 2001
 From: Reiner Herrmann <reiner@reiner-h.de>
 Date: Tue, 10 Oct 2017 15:06:13 -0300
 Subject: [PATCH] lib/mkmf.rb: sort list of object files in generated Makefile
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
index e4974ff72e..d6aaba2a6e 100644
--- a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
@@ -1,4 +1,4 @@
-From 0e53d59cddda29e0c1d7d4196cc1255e04a3b39f Mon Sep 17 00:00:00 2001
+From 3611fc216b2f886aa9c464ca49f1397556039281 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
index 3dfe4897f6..5e6a1bc96b 100644
--- a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
@@ -1,4 +1,4 @@
-From d4723a7dda5d2b57863ee1bba6a7456c732ea8e6 Mon Sep 17 00:00:00 2001
+From c80d1ca630a53b53c1aac2acd58b451f20a90969 Mon Sep 17 00:00:00 2001
 From: Lucas Kanashiro <kanashiro@debian.org>
 Date: Fri, 1 Nov 2019 15:25:17 -0300
 Subject: [PATCH] Make gemspecs reproducible
diff --git a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
index 70b3efb4d5..412cfa07ae 100644
--- a/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
+++ b/meta/recipes-devtools/ruby/ruby/0007-Skip-test_rm_r_no_permissions-test-under-root.patch
@@ -1,4 +1,4 @@
-From a811d47c307d33a1ee78c752dc2fff57ce6b0ba8 Mon Sep 17 00:00:00 2001
+From 75d1751ab2361e144917c6bb4dae6ace21b4f068 Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Mon, 7 Jul 2025 15:05:57 +0800
 Subject: [PATCH] Skip test_rm_r_no_permissions test under root
diff --git a/meta/recipes-devtools/ruby/ruby_4.0.7.bb b/meta/recipes-devtools/ruby/ruby_4.0.9.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_4.0.7.bb
rename to meta/recipes-devtools/ruby/ruby_4.0.9.bb
index d8dcde5fbb..8c3f8fdf68 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.7.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.9.bb
@@ -49,7 +49,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "911ace20f90d068ca0e4dda6d0e4f0f81e52e52f2dd4f4004c721e253412e82d"
+SRC_URI[sha256sum] = "c35350682ff050b79702d57ade4516e7336063f510155d19fb2fb5b3f3909511"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.47.1


--===============1059540569322134550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ruby: PKGV changed from 4.0.7 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/ruby: SRC_URI changed from "http://cache.ruby-lang.org/pub/ruby/4.0/ruby-4.0.7.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-documentation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch file://0001-Don-t-save-the-original-name-and-timestamp.patch file://0001-Avoid-build-time-race-condition-when-cross-compiling.patch" to "http://cache.ruby-lang.org/pub/ruby/4.0/ruby-4.0.9.tar.gz file://0001-extmk-fix-cross-compilation-of-external-gems.patch file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch file://run-ptest file://0003-rdoc-build-reproducible-document
 ation.patch file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch file://0006-Make-gemspecs-reproducible.patch file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch file://0001-Don-t-save-the-original-name-and-timestamp.patch file://0001-Avoid-build-time-race-condition-when-cross-compiling.patch"
packages/x86-64-v3-poky-linux/ruby: PV changed from "4.0.7" to "4.0.9"
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PKGSIZE changed from 18159264 to 18234456 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: FILELIST: removed "/usr/lib/.debug/libruby.so.4.0.7", added "/usr/lib/.debug/libruby.so.4.0.9"
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PKGV changed from 4.0.7 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-dbg: PV changed from "4.0.7" to "4.0.9"
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PKGSIZE changed from 1614877 to 1615075 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PKGV changed from 4.0.7 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-dev: PV changed from "4.0.7" to "4.0.9"
packages/x86-64-v3-poky-linux/ruby/ruby-doc: PKGV changed from 4.0.7 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-doc: PV changed from "4.0.7" to "4.0.9"
packages/x86-64-v3-poky-linux/ruby/ruby-locale: PKGV changed from 4.0.7 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-locale: PV changed from "4.0.7" to "4.0.9"
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PKGSIZE changed from 10404268 to 10427815 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: FILELIST: added "/usr/lib/ruby/ptest/test/-ext-/thread/test_fork_lock.rb"
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PKGV changed from 4.0.7 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-ptest: PV changed from "4.0.7" to "4.0.9"
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: PKGV changed from 4.0.7 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-rdoc: PV changed from "4.0.7" to "4.0.9"
packages/x86-64-v3-poky-linux/ruby/ruby-ri-docs: PKGV changed from 4.0.7 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-ri-docs: PV changed from "4.0.7" to "4.0.9"
packages/x86-64-v3-poky-linux/ruby/ruby-src: PKGSIZE changed from 41556236 to 41566586 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby-src: FILELIST: directory renamed /usr/src/debug/ruby/4.0.7/ext/zlib -> /usr/src/debug/ruby/4.0.9/ext/zlib, directory renamed /usr/src/debug/ruby/4.0.7/ext/date -> /usr/src/debug/ruby/4.0.9/ext/date, directory renamed /usr/src/debug/ruby/4.0.7/enc/trans -> /usr/src/debug/ruby/4.0.9/enc/trans, directory renamed /usr/src/debug/ruby/4.0.7/include/ruby/fiber -> /usr/src/debug/ruby/4.0.9/include/ruby/fiber, directory renamed /usr/src/debug/ruby/4.0.7/prism/templates/ext/prism -> /usr/src/debug/ruby/4.0.9/prism/templates/ext/prism, directory renamed /usr/src/debug/ruby/4.0.7/ext/coverage -> /usr/src/debug/ruby/4.0.9/ext/coverage, directory renamed /usr/src/debug/ruby/4.0.7/ext/digest/bubblebabble -> /usr/src/debug/ruby/4.0.9/ext/digest/bubblebabble, directory renamed /usr/src/debug/ruby/4.0.7/include/ruby/internal/arithmetic -> /usr/src/debug/ruby/4.0.9/include/ruby/internal/arithmetic, directory renamed /usr/src/debug/ruby/4.0.7/include/ruby/io -> /u
 sr/src/debug/ruby/4.0.9/include/ruby/io, directory renamed /usr/src/debug/ruby/4.0.7/enc/unicode/17.0.0 -> /usr/src/debug/ruby/4.0.9/enc/unicode/17.0.0, directory renamed /usr/src/debug/ruby/4.0.7/.bundle/gems/rbs-3.10.0/ext/rbs_extension -> /usr/src/debug/ruby/4.0.9/.bundle/gems/rbs-3.10.0/ext/rbs_extension, directory renamed /usr/src/debug/ruby/4.0.7/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal -> /usr/src/debug/ruby/4.0.9/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal, directory renamed /usr/src/debug/ruby/4.0.7/ext/psych -> /usr/src/debug/ruby/4.0.9/ext/psych, directory renamed /usr/src/debug/ruby/4.0.7/ext/json/parser -> /usr/src/debug/ruby/4.0.9/ext/json/parser, directory renamed /usr/src/debug/ruby/4.0.7/ext/json/vendor -> /usr/src/debug/ruby/4.0.9/ext/json/vendor, directory renamed /usr/src/debug/ruby/4.0.7/ext/io/console -> /usr/src/debug/ruby/4.0.9/ext/io/console, directory renamed /usr/src/debug/ruby/4.0.7/ccan/list -> /usr/src/debug/ruby/4.0.9/ccan/list, directory renamed 
 /usr/src/debug/ruby/4.0.7/ext/cgi/escape -> /usr/src/debug/ruby/4.0.9/ext/cgi/escape, directory renamed /usr/src/debug/ruby/4.0.7/ext/digest/md5 -> /usr/src/debug/ruby/4.0.9/ext/digest/md5, directory renamed /usr/src/debug/ruby/4.0.7/.bundle/gems/syslog-0.3.0/ext/syslog -> /usr/src/debug/ruby/4.0.9/.bundle/gems/syslog-0.3.0/ext/syslog, directory renamed /usr/src/debug/ruby/4.0.7/.bundle/gems/racc-1.8.1/ext/racc/cparse -> /usr/src/debug/ruby/4.0.9/.bundle/gems/racc-1.8.1/ext/racc/cparse, directory renamed /usr/src/debug/ruby/4.0.7/include/ruby/internal/encoding -> /usr/src/debug/ruby/4.0.9/include/ruby/internal/encoding, directory renamed /usr/src/debug/ruby/4.0.7/ext/digest/sha1 -> /usr/src/debug/ruby/4.0.9/ext/digest/sha1, directory renamed /usr/src/debug/ruby/4.0.7/ext/openssl -> /usr/src/debug/ruby/4.0.9/ext/openssl, directory renamed /usr/src/debug/ruby/4.0.7/.bundle/gems/fiddle-1.1.8/ext/fiddle -> /usr/src/debug/ruby/4.0.9/.bundle/gems/fiddle-1.1.8/ext/fiddle, directory renamed
  /usr/src/debug/ruby/4.0.7/.bundle/gems/rbs-3.10.0/src/util -> /usr/src/debug/ruby/4.0.9/.bundle/gems/rbs-3.10.0/src/util, directory renamed /usr/src/debug/ruby/4.0.7/.bundle/gems/rbs-3.10.0/include/rbs/util -> /usr/src/debug/ruby/4.0.9/.bundle/gems/rbs-3.10.0/include/rbs/util, directory renamed /usr/src/debug/ruby/4.0.7/ext/digest/sha2 -> /usr/src/debug/ruby/4.0.9/ext/digest/sha2, directory renamed /usr/src/debug/ruby/4.0.7/ext/stringio -> /usr/src/debug/ruby/4.0.9/ext/stringio, directory renamed /usr/src/debug/ruby/4.0.7/prism/templates/src -> /usr/src/debug/ruby/4.0.9/prism/templates/src, directory renamed /usr/src/debug/ruby/4.0.7/gc -> /usr/src/debug/ruby/4.0.9/gc, directory renamed /usr/src/debug/ruby/4.0.7/include/ruby/internal -> /usr/src/debug/ruby/4.0.9/include/ruby/internal, directory renamed /usr/src/debug/ruby/4.0.7/.bundle/gems/rbs-3.10.0/include/rbs -> /usr/src/debug/ruby/4.0.9/.bundle/gems/rbs-3.10.0/include/rbs, directory renamed /usr/src/debug/ruby/4.0.7/include/ru
 by -> /usr/src/debug/ruby/4.0.9/include/ruby, directory renamed /usr/src/debug/ruby/4.0.7/include/ruby/internal/intern -> /usr/src/debug/ruby/4.0.9/include/ruby/internal/intern, directory renamed /usr/src/debug/ruby/4.0.7/tool/ruby_vm/views -> /usr/src/debug/ruby/4.0.9/tool/ruby_vm/views, directory renamed /usr/src/debug/ruby/4.0.7/ext/socket -> /usr/src/debug/ruby/4.0.9/ext/socket, directory renamed /usr/src/debug/ruby/4.0.7/enc -> /usr/src/debug/ruby/4.0.9/enc, directory renamed /usr/src/debug/ruby/4.0.7/ext/io/nonblock -> /usr/src/debug/ruby/4.0.9/ext/io/nonblock, directory renamed /usr/src/debug/ruby/4.0.7/include/ruby/internal/intern/select -> /usr/src/debug/ruby/4.0.9/include/ruby/internal/intern/select, directory renamed /usr/src/debug/ruby/4.0.7/defs -> /usr/src/debug/ruby/4.0.9/defs, directory renamed /usr/src/debug/ruby/4.0.7/prism/util -> /usr/src/debug/ruby/4.0.9/prism/util, directory renamed /usr/src/debug/ruby/4.0.7/ext/json/generator -> /usr/src/debug/ruby/4.0.9/ext/j
 son/generator, directory renamed /usr/src/debug/ruby/4.0.7/ext/fcntl -> /usr/src/debug/ruby/4.0.9/ext/fcntl, directory renamed /usr/src/debug/ruby/4.0.7/.bundle/gems/debug-1.11.1/ext/debug -> /usr/src/debug/ruby/4.0.9/.bundle/gems/debug-1.11.1/ext/debug, directory renamed /usr/src/debug/ruby/4.0.7/ext/ripper -> /usr/src/debug/ruby/4.0.9/ext/ripper, directory renamed /usr/src/debug/ruby/4.0.7/ext/rbconfig/sizeof -> /usr/src/debug/ruby/4.0.9/ext/rbconfig/sizeof, directory renamed /usr/src/debug/ruby/4.0.7/gc/default -> /usr/src/debug/ruby/4.0.9/gc/default, directory renamed /usr/src/debug/ruby/4.0.7/ext/digest/rmd160 -> /usr/src/debug/ruby/4.0.9/ext/digest/rmd160, directory renamed /usr/src/debug/ruby/4.0.7/ext/json/fbuffer -> /usr/src/debug/ruby/4.0.9/ext/json/fbuffer, directory renamed /usr/src/debug/ruby/4.0.7/coroutine/amd64 -> /usr/src/debug/ruby/4.0.9/coroutine/amd64, directory renamed /usr/src/debug/ruby/4.0.7/ext/objspace -> /usr/src/debug/ruby/4.0.9/ext/objspace, directory re
 named /usr/src/debug/ruby/4.0.7/ext/erb/escape -> /usr/src/debug/ruby/4.0.9/ext/erb/escape, directory renamed /usr/src/debug/ruby/4.0.7/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal/missing -> /usr/src/debug/ruby/4.0.9/.bundle/gems/bigdecimal-4.0.1/ext/bigdecimal/missing, directory renamed /usr/src/debug/ruby/4.0.7/ext/etc -> /usr/src/debug/ruby/4.0.9/ext/etc, directory renamed /usr/src/debug/ruby/4.0.7/.bundle/gems/rbs-3.10.0/src -> /usr/src/debug/ruby/4.0.9/.bundle/gems/rbs-3.10.0/src, directory renamed /usr/src/debug/ruby/4.0.7/ext/json/simd -> /usr/src/debug/ruby/4.0.9/ext/json/simd, directory renamed /usr/src/debug/ruby/4.0.7/ext/continuation -> /usr/src/debug/ruby/4.0.9/ext/continuation, directory renamed /usr/src/debug/ruby/4.0.7/internal -> /usr/src/debug/ruby/4.0.9/internal, directory renamed /usr/src/debug/ruby/4.0.7/missing -> /usr/src/debug/ruby/4.0.9/missing, directory renamed /usr/src/debug/ruby/4.0.7/ext/pty -> /usr/src/debug/ruby/4.0.9/ext/pty, directory renamed /usr/
 src/debug/ruby/4.0.7/.bundle/gems/nkf-0.2.0/ext/nkf/nkf-utf8 -> /usr/src/debug/ruby/4.0.9/.bundle/gems/nkf-0.2.0/ext/nkf/nkf-utf8, directory renamed /usr/src/debug/ruby/4.0.7 -> /usr/src/debug/ruby/4.0.9, directory renamed /usr/src/debug/ruby/4.0.7/.bundle/gems/nkf-0.2.0/ext/nkf -> /usr/src/debug/ruby/4.0.9/.bundle/gems/nkf-0.2.0/ext/nkf, directory renamed /usr/src/debug/ruby/4.0.7/ext -> /usr/src/debug/ruby/4.0.9/ext, directory renamed /usr/src/debug/ruby/4.0.7/enc/jis -> /usr/src/debug/ruby/4.0.9/enc/jis, directory renamed /usr/src/debug/ruby/4.0.7/ext/digest -> /usr/src/debug/ruby/4.0.9/ext/digest, directory renamed /usr/src/debug/ruby/4.0.7/ext/strscan -> /usr/src/debug/ruby/4.0.9/ext/strscan, directory renamed /usr/src/debug/ruby/4.0.7/ext/monitor -> /usr/src/debug/ruby/4.0.9/ext/monitor, directory renamed /usr/src/debug/ruby/4.0.7/prism -> /usr/src/debug/ruby/4.0.9/prism, directory renamed /usr/src/debug/ruby/4.0.7/include/ruby/internal/core -> /usr/src/debug/ruby/4.0.9/includ
 e/ruby/internal/core, directory renamed /usr/src/debug/ruby/4.0.7/ext/io/wait -> /usr/src/debug/ruby/4.0.9/ext/io/wait
packages/x86-64-v3-poky-linux/ruby/ruby-src: PKGV changed from 4.0.7 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-src: PV changed from "4.0.7" to "4.0.9"
packages/x86-64-v3-poky-linux/ruby/ruby-staticdev: PKGV changed from 4.0.7 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/ruby/ruby-staticdev: PV changed from "4.0.7" to "4.0.9"
packages/x86-64-v3-poky-linux/ruby/ruby: PKGSIZE changed from 35720617 to 35753385 (+0%)
packages/x86-64-v3-poky-linux/ruby/ruby: FILELIST: removed "/usr/lib/libruby.so.4.0.7 /usr/lib/ruby/gems/4.0.0/specifications/default/prism-1.8.1.gemspec", added "/usr/lib/libruby.so.4.0.9 /usr/lib/ruby/gems/4.0.0/specifications/default/prism-1.8.2.gemspec"
packages/x86-64-v3-poky-linux/ruby/ruby: PKGV changed from 4.0.7 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/ruby/ruby: PV changed from "4.0.7" to "4.0.9"
Changes to packages/x86-64-v3-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.4.0 changed symlink target from libruby.so.4.0.7 to libruby.so.4.0.9
  /usr/lib/libruby.so changed symlink target from libruby.so.4.0.7 to libruby.so.4.0.9
  /usr/lib/libruby.so.4.0.7 moved to /usr/lib/libruby.so.4.0.9
  /usr/lib/ruby/gems/4.0.0/gems/prism-1.8.1 moved to /usr/lib/ruby/gems/4.0.0/gems/prism-1.8.2
  /usr/lib/ruby/gems/4.0.0/specifications/default/prism-1.8.1.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/prism-1.8.2.gemspec

--===============1059540569322134550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/ruby/ruby-ptest: FILELIST: added "/usr/lib/ruby/ptest/test/-ext-/thread/test_fork_lock.rb"
packages/x86-64-v3-poky-linux/ruby/ruby: FILELIST: removed "/usr/lib/ruby/gems/4.0.0/specifications/default/prism-1.8.1.gemspec /usr/lib/libruby.so.4.0.7", added "/usr/lib/ruby/gems/4.0.0/specifications/default/prism-1.8.2.gemspec /usr/lib/libruby.so.4.0.9"
Changes to packages/x86-64-v3-poky-linux/ruby (sysroot):
  /usr/lib/libruby.so.4.0 changed symlink target from libruby.so.4.0.7 to libruby.so.4.0.9
  /usr/lib/libruby.so changed symlink target from libruby.so.4.0.7 to libruby.so.4.0.9
  /usr/lib/libruby.so.4.0.7 moved to /usr/lib/libruby.so.4.0.9
  /usr/lib/ruby/gems/4.0.0/gems/prism-1.8.1 moved to /usr/lib/ruby/gems/4.0.0/gems/prism-1.8.2
  /usr/lib/ruby/gems/4.0.0/specifications/default/prism-1.8.1.gemspec moved to /usr/lib/ruby/gems/4.0.0/specifications/default/prism-1.8.2.gemspec

--===============1059540569322134550==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-4.0.7-4.0.9.patch"

RnJvbSBmMzI4ZDA2NmNjY2FiMzc3MjllY2M2MTA1NGM1NDIzNTY1YTU4ODBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjMgT2N0IDIwMjYgMDU6MzI6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
dWJ5OiB1cGdyYWRlIDQuMC43IC0+IDQuMC45CgotLS0KIC4uLjEtQXZvaWQtYnVpbGQtdGltZS1y
YWNlLWNvbmRpdGlvbi13aGVuLWNyb3NzLWNvbXBpbGluZy5wYXRjaCB8IDIgKy0KIC4uLi9ydWJ5
LzAwMDEtRG9uLXQtc2F2ZS10aGUtb3JpZ2luYWwtbmFtZS1hbmQtdGltZXN0YW1wLnBhdGNoICB8
IDIgKy0KIC4uLi8wMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRlcm5hbC1n
ZW1zLnBhdGNoICAgICB8IDIgKy0KIC4uLjAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5k
LVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaCB8IDIgKy0KIC4uLi9ydWJ5L3J1YnkvMDAwMi1P
YmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2ggICB8IDIgKy0KIC4uLi9y
dWJ5L3J1YnkvMDAwMy1yZG9jLWJ1aWxkLXJlcHJvZHVjaWJsZS1kb2N1bWVudGF0aW9uLnBhdGNo
ICB8IDIgKy0KIC4uLjQtbGliLW1rbWYucmItc29ydC1saXN0LW9mLW9iamVjdC1maWxlcy1pbi1n
ZW5lcmF0ZWQtTS5wYXRjaCB8IDIgKy0KIC4uLjAwNS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxl
LWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRjaCB8IDIgKy0KIC4uLi9ydWJ5L3J1YnkvMDAw
Ni1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaCAgICAgICAgICAgICB8IDIgKy0KIC4u
Li8wMDA3LVNraXAtdGVzdF9ybV9yX25vX3Blcm1pc3Npb25zLXRlc3QtdW5kZXItcm9vdC5wYXRj
aCAgICB8IDIgKy0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3tydWJ5XzQuMC43LmJiID0+
IHJ1YnlfNC4wLjkuYmJ9ICAgICB8IDIgKy0KIDExIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlv
bnMoKyksIDExIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3tydWJ5XzQuMC43LmJiID0+IHJ1YnlfNC4wLjkuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLUF2b2lkLWJ1aWxkLXRpbWUtcmFjZS1j
b25kaXRpb24td2hlbi1jcm9zcy1jb21waWxpbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5LzAwMDEtQXZvaWQtYnVpbGQtdGltZS1yYWNlLWNvbmRpdGlvbi13aGVuLWNy
b3NzLWNvbXBpbGluZy5wYXRjaAppbmRleCBkNjJlM2FmZmZmLi45OWU1M2U3NjZmIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtQXZvaWQtYnVpbGQtdGlt
ZS1yYWNlLWNvbmRpdGlvbi13aGVuLWNyb3NzLWNvbXBpbGluZy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtQXZvaWQtYnVpbGQtdGltZS1yYWNlLWNvbmRp
dGlvbi13aGVuLWNyb3NzLWNvbXBpbGluZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTRi
M2E4NWRlZjgwNjgwYzZlZmIzNWU3NWI2ZTBkY2Q0YmJmNDY0NSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gM2VkZTRjM2IyNTNiOGZiNWZiNTU2MTE1MmYxYjcyZWY1MDNhNDkxMyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBhdWwgQmFya2VyIDxwYXVsQHBiYXJrZXIuZGV2
PgogRGF0ZTogRnJpLCAzMSBKdWwgMjAyNiAxMzoxNTozNyArMDEwMAogU3ViamVjdDogW1BBVENI
XSBBdm9pZCBidWlsZC10aW1lIHJhY2UgY29uZGl0aW9uIHdoZW4gY3Jvc3MtY29tcGlsaW5nIGZy
b20gYQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLURv
bi10LXNhdmUtdGhlLW9yaWdpbmFsLW5hbWUtYW5kLXRpbWVzdGFtcC5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1Eb24tdC1zYXZlLXRoZS1vcmlnaW5hbC1uYW1l
LWFuZC10aW1lc3RhbXAucGF0Y2gKaW5kZXggMWZkMjA2NmUxZS4uNWQ5ODUwMjU2YSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLURvbi10LXNhdmUtdGhl
LW9yaWdpbmFsLW5hbWUtYW5kLXRpbWVzdGFtcC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnVieS9ydWJ5LzAwMDEtRG9uLXQtc2F2ZS10aGUtb3JpZ2luYWwtbmFtZS1hbmQtdGlt
ZXN0YW1wLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhYzE2ZmY5YTM1MTI3YzcxODQyMmNh
ZjI3ZmJlMWRmYTIzMDliMTM2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmZDg0ZWM2
OTkzNmM1ZWY4MmJkOTg4ZGQzNmM1ZGNmN2I5ZDM4ZTc2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogQ2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KIERhdGU6
IEZyaSwgMjcgRmViIDIwMjYgMTY6NTk6MjQgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gRG9uJ3Qg
c2F2ZSB0aGUgb3JpZ2luYWwgbmFtZSBhbmQgdGltZXN0YW1wCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9u
LW9mLWV4dGVybmFsLWdlbXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5
LzAwMDEtZXh0bWstZml4LWNyb3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0Y2gK
aW5kZXggMzYwMzdhZWRlMy4uM2E5NmE5NDAyNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3J1YnkvcnVieS8wMDAxLWV4dG1rLWZpeC1jcm9zcy1jb21waWxhdGlvbi1vZi1leHRl
cm5hbC1nZW1zLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAw
MS1leHRtay1maXgtY3Jvc3MtY29tcGlsYXRpb24tb2YtZXh0ZXJuYWwtZ2Vtcy5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gODQ2YjE3ZjNkYmRiYmQ2YjdkZDdkY2M4MWZkYTE4MjZiODdlZTU0
MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTczNDJiNzdhNTIzNDMyNTU3NTIzODEz
MDRiNzE5YTU0ODM1NDJjOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206ID0/VVRGLTg/
cT9BbmRyPUMzPUE5PTIwRHJhc3ppaz89IDxhbmRyZS5kcmFzemlrQGpjaS5jb20+CiBEYXRlOiBN
b24sIDMwIFNlcCAyMDE5IDE2OjU3OjAxICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGV4dG1rOiBm
aXggY3Jvc3MtY29tcGlsYXRpb24gb2YgZXh0ZXJuYWwgZ2VtcwpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAxLXZtX2R1bXAuYy1EZWZpbmUtUkVHX1MxLWFu
ZC1SRUdfUzItZm9yLW11c2wtcmlzY3YucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVi
eS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3ItbXVzbC1y
aXNjdi5wYXRjaAppbmRleCBlYTYzZGZlMjI3Li4zMWQ4MmY0NjY3IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEt
YW5kLVJFR19TMi1mb3ItbXVzbC1yaXNjdi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcnVieS9ydWJ5LzAwMDEtdm1fZHVtcC5jLURlZmluZS1SRUdfUzEtYW5kLVJFR19TMi1mb3It
bXVzbC1yaXNjdi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjk0MTI5Y2FjOWU0MTJhNjRi
ZmIzZGJkNzk2OTEyZGYwNThjNmUxYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWQ1
MTk4OWYwOGIzNWI0NGIxNzEyZWY0MTVhMzUzYzU5OTllMDliZiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDI1
IEphbiAyMDIyIDIwOjI5OjE0IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHZtX2R1bXAuYzogRGVm
aW5lIFJFR19TMSBhbmQgUkVHX1MyIGZvciBtdXNsL3Jpc2N2CmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDItT2JleS1MREZMQUdTLWZvci10aGUtbGluay1v
Zi1saWJydWJ5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAyLU9i
ZXktTERGTEFHUy1mb3ItdGhlLWxpbmstb2YtbGlicnVieS5wYXRjaAppbmRleCAwZTdjMjMwMDdi
Li4wMmQ0NDhlMWMyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5
LzAwMDItT2JleS1MREZMQUdTLWZvci10aGUtbGluay1vZi1saWJydWJ5LnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1s
aW5rLW9mLWxpYnJ1YnkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDM4NWVhMzBlZTIyMTli
ZjlkMWM3MDJmMThlMzhhMjQwMmE3N2E0NDMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDYyNTAwNTRkYzc1MThlZGI1MDAwYzJlYTRlZDY1OTBiZjk4ZDVlYzcgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBDaHJpc3RvcGhlciBMYXJzb24gPGNocmlzX2xhcnNvbkBtZW50b3Iu
Y29tPgogRGF0ZTogVGh1LCA1IE1heSAyMDE2IDEwOjU5OjA3IC0wNzAwCiBTdWJqZWN0OiBbUEFU
Q0hdIE9iZXkgTERGTEFHUyBmb3IgdGhlIGxpbmsgb2YgbGlicnVieQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDAzLXJkb2MtYnVpbGQtcmVwcm9kdWNpYmxl
LWRvY3VtZW50YXRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAw
MDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaAppbmRleCA4YmY2
ZjM4YWZlLi43MDI2MjA1ZjRhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVi
eS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXByb2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDMtcmRvYy1idWlsZC1yZXBy
b2R1Y2libGUtZG9jdW1lbnRhdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2Y2YWMw
N2ZkMDM1OWViM2Q0MWRiODZhNDI3NmI1Yzc4MThmMmU2YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZjc3ZDg1NTFjMzk2Y2MzMmE0ZWVlZjQ3YTQwY2M5Mjk5NmU2NjYwNiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENocmlzdGlhbiBIb2ZzdGFlZHRsZXIgPHplaGFAZGVi
aWFuLm9yZz4KIERhdGU6IFR1ZSwgMTAgT2N0IDIwMTcgMTU6MDQ6MzQgLTAzMDAKIFN1YmplY3Q6
IFtQQVRDSF0gcmRvYzogYnVpbGQgcmVwcm9kdWNpYmxlIGRvY3VtZW50YXRpb24KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNC1saWItbWttZi5yYi1zb3J0
LWxpc3Qtb2Ytb2JqZWN0LWZpbGVzLWluLWdlbmVyYXRlZC1NLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlzdC1vZi1vYmplY3Qt
ZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gKaW5kZXggYzUwY2Q3ZDJiMi4uODJhMGI4NTE5YiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21m
LnJiLXNvcnQtbGlzdC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA0LWxpYi1ta21mLnJiLXNvcnQtbGlz
dC1vZi1vYmplY3QtZmlsZXMtaW4tZ2VuZXJhdGVkLU0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDAzNDdmNjZiYjZlODM0YzVhNWQ0NjlmNTkwMzUyNzY5OWE4YTlmOGUgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGZlNzZmODU4Njc0NjJjMjc1ZjJkMzA4ZjM2NmQ0NDU2ZjFmZWVl
MjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSZWluZXIgSGVycm1hbm4gPHJlaW5l
ckByZWluZXItaC5kZT4KIERhdGU6IFR1ZSwgMTAgT2N0IDIwMTcgMTU6MDY6MTMgLTAzMDAKIFN1
YmplY3Q6IFtQQVRDSF0gbGliL21rbWYucmI6IHNvcnQgbGlzdCBvZiBvYmplY3QgZmlsZXMgaW4g
Z2VuZXJhdGVkIE1ha2VmaWxlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVi
eS9ydWJ5LzAwMDUtTWFyay1HZW1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIy
NS10b28ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDUtTWFyay1H
ZW1zcGVjLXJlcHJvZHVjaWJsZS1jaGFuZ2UtZml4aW5nLTc4NDIyNS10b28ucGF0Y2gKaW5kZXgg
ZTQ5NzRmZjcyZS4uZDZhYWJhMmE2ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3J1YnkvcnVieS8wMDA1LU1hcmstR2Vtc3BlYy1yZXByb2R1Y2libGUtY2hhbmdlLWZpeGluZy03
ODQyMjUtdG9vLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAw
NS1NYXJrLUdlbXNwZWMtcmVwcm9kdWNpYmxlLWNoYW5nZS1maXhpbmctNzg0MjI1LXRvby5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMGU1M2Q1OWNkZGRhMjllMGMxZDdkNDE5NmNjMTI1NWUw
NGEzYjM5ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzYxMWZjMjE2YjJmODg2YWE5
YzQ2NGNhNDlmMTM5NzU1NjAzOTI4MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEx1
Y2FzIEthbmFzaGlybyA8a2FuYXNoaXJvQGRlYmlhbi5vcmc+CiBEYXRlOiBGcmksIDEgTm92IDIw
MTkgMTU6MjU6MTcgLTAzMDAKIFN1YmplY3Q6IFtQQVRDSF0gTWFrZSBnZW1zcGVjcyByZXByb2R1
Y2libGUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNi1N
YWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dWJ5L3J1YnkvMDAwNi1NYWtlLWdlbXNwZWNzLXJlcHJvZHVjaWJsZS5wYXRjaAppbmRleCAzZGZl
NDg5N2Y2Li41ZTZhMWJjOTZiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVi
eS9ydWJ5LzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA2LU1ha2UtZ2Vtc3BlY3MtcmVwcm9kdWNpYmxl
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkNDcyM2E3ZGRhNWQyYjU3ODYzZWUxYmJhNmE3
NDU2YzczMmVhOGU2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjODBkMWNhNjMwYTUz
YjUzYzFhYWMyYWNkNThiNDUxZjIwYTkwOTY5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogTHVjYXMgS2FuYXNoaXJvIDxrYW5hc2hpcm9AZGViaWFuLm9yZz4KIERhdGU6IEZyaSwgMSBO
b3YgMjAxOSAxNToyNToxNyAtMDMwMAogU3ViamVjdDogW1BBVENIXSBNYWtlIGdlbXNwZWNzIHJl
cHJvZHVjaWJsZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8w
MDA3LVNraXAtdGVzdF9ybV9yX25vX3Blcm1pc3Npb25zLXRlc3QtdW5kZXItcm9vdC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwNy1Ta2lwLXRlc3Rfcm1fcl9ub19w
ZXJtaXNzaW9ucy10ZXN0LXVuZGVyLXJvb3QucGF0Y2gKaW5kZXggNzBiM2VmYjRkNS4uNDEyY2Zh
MDdhZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieS8wMDA3LVNr
aXAtdGVzdF9ybV9yX25vX3Blcm1pc3Npb25zLXRlc3QtdW5kZXItcm9vdC5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDctU2tpcC10ZXN0X3JtX3Jfbm9fcGVy
bWlzc2lvbnMtdGVzdC11bmRlci1yb290LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhODEx
ZDQ3YzMwN2QzM2ExZWU3OGM3NTJkYzJmZmY1N2NlNmIwYmE4IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA3NWQxNzUxYWIyMzYxZTE0NDkxN2M2YmI0ZGFlNmFjZTIxYjRmMDY4IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSmlheWluZyBTb25nIDxqaWF5aW5nLnNvbmcuY25A
d2luZHJpdmVyLmNvbT4KIERhdGU6IE1vbiwgNyBKdWwgMjAyNSAxNTowNTo1NyArMDgwMAogU3Vi
amVjdDogW1BBVENIXSBTa2lwIHRlc3Rfcm1fcl9ub19wZXJtaXNzaW9ucyB0ZXN0IHVuZGVyIHJv
b3QKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfNC4wLjcuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5XzQuMC45LmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfNC4wLjcu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfNC4wLjkuYmIKaW5k
ZXggZDhkY2RlNWZiYi4uOGMzZjhmZGY2OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3J1YnkvcnVieV80LjAuNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9y
dWJ5XzQuMC45LmJiCkBAIC00OSw3ICs0OSw3IEBAIGRvX2NvbmZpZ3VyZTpwcmVwZW5kKCkgewog
CiBERVBFTkRTOmFwcGVuZDpsaWJjLW11c2wgPSAiIGxpYnVjb250ZXh0IgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiOTExYWNlMjBmOTBkMDY4Y2EwZTRkZGE2ZDBlNGYwZjgxZTUyZTUyZjJkZDRm
NDAwNGM3MjFlMjUzNDEyZTgyZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjMzUzNTA2ODJmZjA1
MGI3OTcwMmQ1N2FkZTQ1MTZlNzMzNjA2M2Y1MTAxNTVkMTlmYjJmYjViM2YzOTA5NTExIgogCiBQ
QUNLQUdFQ09ORklHID8/PSAiIgogUEFDS0FHRUNPTkZJRyArPSAiJHtAYmIudXRpbHMuZmlsdGVy
KCdESVNUUk9fRkVBVFVSRVMnLCAnaXB2NicsIGQpfSIKLS0gCjIuNDcuMQoK

--===============1059540569322134550==--
