Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A96C5DF8C
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 07:23:07 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1698.1787210579172421816
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 00:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gmqLYtRh;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bTl58Ks2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a01e0d38a8-17e2e2bb-af60-4aca-9fdf-ac38f73a29c3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787210578;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=+9b/134Zb1mqcUww2HHGbG+t0QvFtsvikLPBH9G35Xw=;
	b=gmqLYtRhOohZg1bfz7MJcaTsiQOZlpw+154qVEONYDLsnkIsFoO46smYWHuSkjJ6
	ixm0INY5lqdwrSa6GVqp2D9ddeJXoEdmD0UWXXRoIIZ0nT/5eK89ryE9AoM77nQAy4g
	+nnvd8J8VRbd8IdyKFDY3VXF1CCSBN4rlkQhrZ0s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787210578;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=+9b/134Zb1mqcUww2HHGbG+t0QvFtsvikLPBH9G35Xw=;
	b=bTl58Ks2IdzIWypBs2fdUZNpLH5IqFVhNmGkn/FReQAYC2jaNKihzBYhjj3K9vl/
	vf0+jBdd7beHWQ6wAy2mxm1QgvbfHrDaeThzf7CJsFQ3AqdULMFJiDDP3MegxvyDNkN
	5VGSUM6wtF0CGrjXCkvUGshczPxwCfIrNxzTb7KE=
Content-Type: multipart/mixed; boundary="===============7370903965217890959=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.20.27 SUCCEEDED
Message-ID: <010101a01e0d38a8-17e2e2bb-af60-4aca-9fdf-ac38f73a29c3-000000@us-west-2.amazonses.com>
Date: Thu, 20 Aug 2026 07:22:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.20-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 07:23:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243810

--===============7370903965217890959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bind* to *9.20.27* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.20.26-9.20.27.patch
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
From 8ccc212a050981102720b3e6eb53e485beb2c07d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 20 Aug 2026 05:09:55 +0000
Subject: [PATCH] bind: upgrade 9.20.26 -> 9.20.27

Source: doc/changelog/changelog-9.20.27.rst

BIND 9.20.27
------------

New Features
~~~~~~~~~~~~

- Disclose active Negative Trust Anchors with Extended DNS Error 33.
  ``566e7018278``

  A Negative Trust Anchor (RFC 7646) turns off DNSSEC validation for a
  domain, so a name that would normally fail validation resolves
  instead. named now marks such answers with Extended DNS Error code 33,
  "Negative Trust Anchor", so operators can see at a glance when a
  response came back only because an NTA was in effect. :gl:`#6268`
  :gl:`!12426`

- Add development guidance for AI coding agents under .agents/skills/
  ``ef651c93709``

  This adds a set of skill documents that give AI coding agents the
  project's established practices up front instead of having them
  rediscovered (or gotten wrong) in every session: the canonical build
  and test invocations, the memory-allocator contract, the disciplines
  for RCU mutation, per-loop sharded structures, struct-layout work, and
  flight-recorder debugging of concurrency bugs, plus the commit and
  merge-request conventions. :gl:`!12401`

- Add more unit tests for isc_time API. ``9d6855ef735``

  While working on internal 64-bit time for BIND 9, the unit test suite
  for isc_time API has been extended.

  Backport the unit tests from 64-bit time branch to the main branch.
  This should make the unit tests for isc_time API (mostly) complete.

  Related to #2959 :gl:`!12432`

Feature Changes
~~~~~~~~~~~~~~~

- Batch qp transaction for RPZ updates. ``cb40fb91fa2``

  RPZ was built around fine-grained locking, but that forces the use of
  many small qp transactions. With this MR, we switch qp transaction to
  handle the full update to the rpz summary structure. While this
  serializes the RPZ updates, the reduced overhead from batching qp
  transactions more than compensates for it and results in improvements
  for big RPZ zones. :gl:`#5787`, #6270 :gl:`!12493`

- Pass the work callback result to the done callback. ``65cdb7c7613``

  The `isc_work` callback now returns `isc_result_t` and the value is
  handed to the done callback, so the callers no longer need their own
  result-passing state. :gl:`!12391`

Bug Fixes
~~~~~~~~~

- Dig +yaml producing invalid YAML when a lookup fails. ``65d1776959e``

  When "dig +yaml" was run and no server could be reached, dig printed
  its plain-text startup banner (the "; \<\<\>\> DiG ..." and ";; global
  options" lines) ahead of the machine-readable output, so the result
  was not valid YAML and could not be parsed. dig no longer emits that
  banner in YAML mode. As part of the same change, the banner is now
  built only after the whole command line has been read, so options
  given after the query name (such as +nocmd, +short and +yaml) are
  correctly reflected in it. :gl:`#1230` :gl:`!12430`

- Ensure NSEC authority does not cross zonecut boundary. ``0baaddd096a``

  When using a cached NSEC record to prove that a delegation is
  insecure, we now check that the signer

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 .../0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch     | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.26.bb => bind_9.20.27.bb}                 | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.26.bb => bind_9.20.27.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 4bc8b4630c..30da1e9fd3 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From cf7537b0ddccefd04dcb82ca470262ce61afb252 Mon Sep 17 00:00:00 2001
+From 7682cbc2fa624fbeeb088736e154090d92c8b524 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
index c9dbff3817..f1d8a8e569 100644
--- a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
@@ -1,4 +1,4 @@
-From fa7670386a1643de5b976f6928e42662b968d807 Mon Sep 17 00:00:00 2001
+From a633e336c248ceab41d3182848b65c95e90ef88c Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:33:49 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 740d1e98e2..da4057064e 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 41901eaecf617abf8f2608e07baa775c75436a15 Mon Sep 17 00:00:00 2001
+From 4b870f60338fe45e036b8a76d47f053338920048 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index af020f0..f461229 100644
+index 56bca5b..4fd62ed 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 3c7f09d6bd..9adc101247 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 6a7536c66832e4d99d7d156256b1a98d9497c7de Mon Sep 17 00:00:00 2001
+From f3736e5535236cf978fd368b6905098ff6e4fd84 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f47ce7b..af020f0 100644
+index c06a0d7..56bca5b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -872,7 +872,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index 8e82c57035..803456c0b3 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 352339af9e6cd9fc03caff09a1b295f26dfadc32 Mon Sep 17 00:00:00 2001
+From 450187e8feac041de02afd4c0c9039cc41e04cb9 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index 73e39002ca..a2c1fbb8f7 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 75923521847618392e20fd9abd3245618b77c8f7 Mon Sep 17 00:00:00 2001
+From 582334d31432969be7e10906de7540f1dc64b17e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 568e4f2e59..dc1f8f5a9a 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From 0224516d7bd100b6ea7b4fafdd07b42aa96cb0ba Mon Sep 17 00:00:00 2001
+From 50601a7ee8fd19ddbe9a592c57ae6197782d4c2f Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.26.bb b/meta/recipes-connectivity/bind/bind_9.20.27.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.26.bb
rename to meta/recipes-connectivity/bind/bind_9.20.27.bb
index 21ffad7bad..e915161d8c 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.26.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.27.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
 
-SRC_URI[sha256sum] = "55248def0f870c4c46b3de72978ea972615131516663188a4564dca1d20bf350"
+SRC_URI[sha256sum] = "145ab7a50b33a06d9d488b5e668c887e754f42acf8954e2b5dc7e238b080e4a0"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.47.1


--===============7370903965217890959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccc-9.20.26.so /usr/lib/libns-9.20.26.so /usr/lib/libdns-9.20.26.so /usr/lib/libisc-9.20.26.so /usr/lib/libisccfg-9.20.26.so", added "/usr/lib/libisccfg-9.20.27.so /usr/lib/libns-9.20.27.so /usr/lib/libdns-9.20.27.so /usr/lib/libisccc-9.20.27.so /usr/lib/libisc-9.20.27.so"
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.26.so to libdns-9.20.27.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.26.so to libisccc-9.20.27.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.26.so to libisccfg-9.20.27.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.26.so to libisc-9.20.27.so
  /usr/lib/libns.so changed symlink target from libns-9.20.26.so to libns-9.20.27.so
  /usr/lib/libdns-9.20.26.so moved to /usr/lib/libdns-9.20.27.so
  /usr/lib/libisc-9.20.26.so moved to /usr/lib/libisc-9.20.27.so
  /usr/lib/libisccc-9.20.26.so moved to /usr/lib/libisccc-9.20.27.so
  /usr/lib/libisccfg-9.20.26.so moved to /usr/lib/libisccfg-9.20.27.so
  /usr/lib/libns-9.20.26.so moved to /usr/lib/libns-9.20.27.so

--===============7370903965217890959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bind-changelog.txt"

Changelog for bind: 9.20.26 -> 9.20.27
Source: doc/changelog/changelog-9.20.27.rst

BIND 9.20.27
------------

New Features
~~~~~~~~~~~~

- Disclose active Negative Trust Anchors with Extended DNS Error 33.
  ``566e7018278``

  A Negative Trust Anchor (RFC 7646) turns off DNSSEC validation for a
  domain, so a name that would normally fail validation resolves
  instead. named now marks such answers with Extended DNS Error code 33,
  "Negative Trust Anchor", so operators can see at a glance when a
  response came back only because an NTA was in effect. :gl:`#6268`
  :gl:`!12426`

- Add development guidance for AI coding agents under .agents/skills/
  ``ef651c93709``

  This adds a set of skill documents that give AI coding agents the
  project's established practices up front instead of having them
  rediscovered (or gotten wrong) in every session: the canonical build
  and test invocations, the memory-allocator contract, the disciplines
  for RCU mutation, per-loop sharded structures, struct-layout work, and
  flight-recorder debugging of concurrency bugs, plus the commit and
  merge-request conventions. :gl:`!12401`

- Add more unit tests for isc_time API. ``9d6855ef735``

  While working on internal 64-bit time for BIND 9, the unit test suite
  for isc_time API has been extended.

  Backport the unit tests from 64-bit time branch to the main branch.
  This should make the unit tests for isc_time API (mostly) complete.

  Related to #2959 :gl:`!12432`

Feature Changes
~~~~~~~~~~~~~~~

- Batch qp transaction for RPZ updates. ``cb40fb91fa2``

  RPZ was built around fine-grained locking, but that forces the use of
  many small qp transactions. With this MR, we switch qp transaction to
  handle the full update to the rpz summary structure. While this
  serializes the RPZ updates, the reduced overhead from batching qp
  transactions more than compensates for it and results in improvements
  for big RPZ zones. :gl:`#5787`, #6270 :gl:`!12493`

- Pass the work callback result to the done callback. ``65cdb7c7613``

  The `isc_work` callback now returns `isc_result_t` and the value is
  handed to the done callback, so the callers no longer need their own
  result-passing state. :gl:`!12391`

Bug Fixes
~~~~~~~~~

- Dig +yaml producing invalid YAML when a lookup fails. ``65d1776959e``

  When "dig +yaml" was run and no server could be reached, dig printed
  its plain-text startup banner (the "; \<\<\>\> DiG ..." and ";; global
  options" lines) ahead of the machine-readable output, so the result
  was not valid YAML and could not be parsed. dig no longer emits that
  banner in YAML mode. As part of the same change, the banner is now
  built only after the whole command line has been read, so options
  given after the query name (such as +nocmd, +short and +yaml) are
  correctly reflected in it. :gl:`#1230` :gl:`!12430`

- Ensure NSEC authority does not cross zonecut boundary. ``0baaddd096a``

  When using a cached NSEC record to prove that a delegation is
  insecure, we now check that the signer name in the corresponding RRSIG
  is not above a known secure delegation point. This prevents a signed
  namespace from being downgraded to insecure using an NSEC record from
  the grandparent zone. :gl:`#5967` :gl:`!12394`

- Treat non canonical RPZ prefixes as any other failure. ``17f0828b460``

  RPZ prefixes that were not encoded in canonical form do not work.
  Treat them as any other encoding error. :gl:`#6043` :gl:`!12482`

- Properly prevent TSIG generation command line injection attacks.
  ``f777451d261``

  When key names are generated with `rndc-confgen`, `tsig-keygen` and
  `ddns-confgen`, special characters must be escaped to ensure the
  configuration is parsed correctly. :gl:`#6071` :gl:`!12396`

- Dig with IDN output could leak memory on ISC_R_NOSPACE  retry.
  ``c4e53b59b2e``

  The IDN to text display call back could leak the memory holding the
  converted name if it did not fit into the buffer.  This has been
  fixed. :gl:`#6073` :gl:`!12483`

- Dnssec-signzone had a potential heap bounds overflow write.
  ``994c3bd4323``

  It was possible for `dnssec-signzone` to overflow array bounds while
  signing.  This has been fixed. :gl:`#6076` :gl:`!12503`

- Restore SMF support on Solaris and illumos. ``8bde9318f63``

  SMF support on Solaris and illumos was silently dropped by a build
  system rewrite in 2018; it is now detected and enabled again.
  :gl:`#6096` :gl:`!12456`

- Fix NULL pointer dereference in dnstap-read. ``9c459b1854d``

  It was possible to dereference a NULL pointer in dnstap-read causing
  it to exit on a malformed DNSTAP file.  This has been fixed.
  :gl:`#6124` :gl:`!12494`

- Change catz coo locking. ``78265c8f6fc``

  Catalog zones might need to inspect the change-of-ownership records of
  other catalog zones, which required to release the lock in the middle
  of certain operations, leading to possible race conditions.

  Since the operations on change-of-ownership records are limited, we
  can instead use a design with a second lock protecting the
  change-of-ownership records on read. We structure the API so that
  holding two change-of-ownership locks at the same time is impossible.
  :gl:`#6131` :gl:`!12410`

- Treat an unusable NSEC3 chain as a verification failure.
  ``879a383ef16``

  When transferring in a mirror zone, DNSSEC verification could
  incorrectly succeed when the zone had an invalid `NSEC3PARAM` record,
  leading to subsequent validation failures. This has been fixed.
  :gl:`#6136` :gl:`!12431`

- Unterminated OpenSSL private-key `Label:` field can be read past its
  parser buffer. ``932581b74bd``

  Check that the string encoded in the Label: field of the .private file
  of a key pair is NUL terminated and the correct length.  Reject the
  .private file if it is not. :gl:`#6193` :gl:`!12417`

- Negative caching stopped working with stale-answer-client-timeout 0.
  ``2687d16ed2f``

  With "stale-answer-client-timeout 0" configured, every client query
  for a name cached as NXDOMAIN or NODATA was sent on to the
  authoritative servers, even while the cached negative answer was still
  within its TTL, so the resolver effectively lost negative caching.
  Negative answers are now refreshed only once they have actually gone
  stale. :gl:`#6245` :gl:`!12384`

- MacOS byte swapping macros already defined. ``5c1d3df49c0``

  Don't redefine them if the development environment already defines
  them. :gl:`#6250` :gl:`!12406`

- Use memmove in isc_sockaddr_fromin/isc_sockaddr_fromin6.
  ``3f3c82292c9``

  Use memmove instead of direct assignment from the source pointer
  because the source pointer is not guaranteed to be correctly aligned.
  :gl:`#6260` :gl:`!12449`

- Fix compilation on GNU/Hurd. ``20f5580e017``

  Fix compilation issues on GNU/Hurd. :gl:`#6285` :gl:`!12496`

- Restore arc4random() detection dropped in the v9.21.14 merge.
  ``86ad6866eeb``

  Commit 4db9e5d90e2 ("Use arc4random for CSPRNG when available", part
  of the CVE-2025-40780 fix) guarded the arc4random() code paths in
  lib/isc/random.h and lib/isc/random.c with HAVE_ARC4RANDOM and added
  the corresponding function check to meson.build.  The manual conflict
  resolution in merge c2a672bbaef ("Merge tag 'v9.21.14'") kept the code
  changes but dropped the meson.build hunk, so HAVE_ARC4RANDOM was never
  defined and platforms with arc4random() (macOS and the BSDs) silently
  fell back to the internal ChaCha-based CSPRNG.  Restore the check.

  Assisted-by: Claude:claude-fable-5 :gl:`!12452`

--===============7370903965217890959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/bind/bind-dbg: PV changed from "9.20.26" to "9.20.27"
packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGV changed from 9.20.26 [default] to 9.20.27 [default]
packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGSIZE changed from 16155312 to 16186496 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libdns-9.20.26.so /usr/lib/.debug/libisc-9.20.26.so /usr/lib/.debug/libisccfg-9.20.26.so /usr/lib/.debug/libisccc-9.20.26.so /usr/lib/.debug/libns-9.20.26.so", added "/usr/lib/.debug/libisccfg-9.20.27.so /usr/lib/.debug/libdns-9.20.27.so /usr/lib/.debug/libisc-9.20.27.so /usr/lib/.debug/libns-9.20.27.so /usr/lib/.debug/libisccc-9.20.27.so"
packages/x86-64-v3-poky-linux/bind/bind-dev: PV changed from "9.20.26" to "9.20.27"
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGV changed from 9.20.26 [default] to 9.20.27 [default]
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGSIZE changed from 1606807 to 1607845 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-doc: PV changed from "9.20.26" to "9.20.27"
packages/x86-64-v3-poky-linux/bind/bind-doc: PKGV changed from 9.20.26 [default] to 9.20.27 [default]
packages/x86-64-v3-poky-linux/bind/bind-libs: PV changed from "9.20.26" to "9.20.27"
packages/x86-64-v3-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.20.26.so", added "/usr/lib/*-9.20.27.so"
packages/x86-64-v3-poky-linux/bind/bind-libs: PKGV changed from 9.20.26 [default] to 9.20.27 [default]
packages/x86-64-v3-poky-linux/bind/bind-libs: PKGSIZE changed from 3684232 to 3688328 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libdns-9.20.26.so /usr/lib/libisccfg-9.20.26.so /usr/lib/libisccc-9.20.26.so /usr/lib/libns-9.20.26.so /usr/lib/libisc-9.20.26.so", added "/usr/lib/libdns-9.20.27.so /usr/lib/libisccc-9.20.27.so /usr/lib/libisccfg-9.20.27.so /usr/lib/libns-9.20.27.so /usr/lib/libisc-9.20.27.so"
packages/x86-64-v3-poky-linux/bind/bind-locale: PV changed from "9.20.26" to "9.20.27"
packages/x86-64-v3-poky-linux/bind/bind-locale: PKGV changed from 9.20.26 [default] to 9.20.27 [default]
packages/x86-64-v3-poky-linux/bind/bind-src: PV changed from "9.20.26" to "9.20.27"
packages/x86-64-v3-poky-linux/bind/bind-src: PKGV changed from 9.20.26 [default] to 9.20.27 [default]
packages/x86-64-v3-poky-linux/bind/bind-src: PKGSIZE changed from 10131969 to 10144096 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-src: FILELIST: directory renamed /usr/src/debug/bind/9.20.26/lib/dns/include/dns -> /usr/src/debug/bind/9.20.27/lib/dns/include/dns, directory renamed /usr/src/debug/bind/9.20.26/bin/plugins -> /usr/src/debug/bind/9.20.27/bin/plugins, directory renamed /usr/src/debug/bind/9.20.26/bin/tools -> /usr/src/debug/bind/9.20.27/bin/tools, directory renamed /usr/src/debug/bind/9.20.26/bin/named -> /usr/src/debug/bind/9.20.27/bin/named, directory renamed /usr/src/debug/bind/9.20.26/lib/dns/rdata/hs_4 -> /usr/src/debug/bind/9.20.27/lib/dns/rdata/hs_4, directory renamed /usr/src/debug/bind/9.20.26/lib/dns -> /usr/src/debug/bind/9.20.27/lib/dns, directory renamed /usr/src/debug/bind/9.20.26/lib/dns/include/irs -> /usr/src/debug/bind/9.20.27/lib/dns/include/irs, directory renamed /usr/src/debug/bind/9.20.26/lib/isc/include/isc -> /usr/src/debug/bind/9.20.27/lib/isc/include/isc, directory renamed /usr/src/debug/bind/9.20.26/lib/ns -> /usr/src/debug/bind/9.20.
 27/lib/ns, directory renamed /usr/src/debug/bind/9.20.26/bin/nsupdate -> /usr/src/debug/bind/9.20.27/bin/nsupdate, directory renamed /usr/src/debug/bind/9.20.26/lib/dns/rdata/generic -> /usr/src/debug/bind/9.20.27/lib/dns/rdata/generic, directory renamed /usr/src/debug/bind/9.20.26/lib/dns/include/dst -> /usr/src/debug/bind/9.20.27/lib/dns/include/dst, directory renamed /usr/src/debug/bind/9.20.26/bin/named/include/named -> /usr/src/debug/bind/9.20.27/bin/named/include/named, directory renamed /usr/src/debug/bind/9.20.26/lib/isccfg/include/isccfg -> /usr/src/debug/bind/9.20.27/lib/isccfg/include/isccfg, directory renamed /usr/src/debug/bind/9.20.26/bin/rndc -> /usr/src/debug/bind/9.20.27/bin/rndc, directory renamed /usr/src/debug/bind/9.20.26/bin/check -> /usr/src/debug/bind/9.20.27/bin/check, directory renamed /usr/src/debug/bind/9.20.26/lib/isc/netmgr -> /usr/src/debug/bind/9.20.27/lib/isc/netmgr, directory renamed /usr/src/debug/bind/9.20.26/bin/confgen/include/confgen -> /usr/sr
 c/debug/bind/9.20.27/bin/confgen/include/confgen, directory renamed /usr/src/debug/bind/9.20.26/bin/dnssec -> /usr/src/debug/bind/9.20.27/bin/dnssec, directory renamed /usr/src/debug/bind/9.20.26/lib/isccc -> /usr/src/debug/bind/9.20.27/lib/isccc, directory renamed /usr/src/debug/bind/9.20.26/bin/named/include/dlz -> /usr/src/debug/bind/9.20.27/bin/named/include/dlz, directory renamed /usr/src/debug/bind/9.20.26/lib/dns/rdata/ch_3 -> /usr/src/debug/bind/9.20.27/lib/dns/rdata/ch_3, directory renamed /usr/src/debug/bind/9.20.26/bin/confgen -> /usr/src/debug/bind/9.20.27/bin/confgen, directory renamed /usr/src/debug/bind/9.20.26/bin/dig -> /usr/src/debug/bind/9.20.27/bin/dig, directory renamed /usr/src/debug/bind/9.20.26/lib/dns/rdata/in_1 -> /usr/src/debug/bind/9.20.27/lib/dns/rdata/in_1, directory renamed /usr/src/debug/bind/9.20.26/lib/isccc/include/isccc -> /usr/src/debug/bind/9.20.27/lib/isccc/include/isccc, directory renamed /usr/src/debug/bind/9.20.26/bin/delv -> /usr/src/debug/
 bind/9.20.27/bin/delv, directory renamed /usr/src/debug/bind/9.20.26/lib/isc -> /usr/src/debug/bind/9.20.27/lib/isc, directory renamed /usr/src/debug/bind/9.20.26/lib/isccfg -> /usr/src/debug/bind/9.20.27/lib/isccfg, directory renamed /usr/src/debug/bind/9.20.26/lib/dns/rdata/any_255 -> /usr/src/debug/bind/9.20.27/lib/dns/rdata/any_255, directory renamed /usr/src/debug/bind/9.20.26/lib/ns/include/ns -> /usr/src/debug/bind/9.20.27/lib/ns/include/ns
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PV changed from "9.20.26" to "9.20.27"
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PKGV changed from 9.20.26 [default] to 9.20.27 [default]
packages/x86-64-v3-poky-linux/bind/bind-utils: PV changed from "9.20.26" to "9.20.27"
packages/x86-64-v3-poky-linux/bind/bind-utils: PKGV changed from 9.20.26 [default] to 9.20.27 [default]
packages/x86-64-v3-poky-linux/bind/bind: PV changed from "9.20.26" to "9.20.27"
packages/x86-64-v3-poky-linux/bind/bind: PKGV changed from 9.20.26 [default] to 9.20.27 [default]
packages/x86-64-v3-poky-linux/bind/bind: PKGSIZE changed from 1330785 to 1334881 (+0%)
packages/x86-64-v3-poky-linux/bind: PV changed from "9.20.26" to "9.20.27"
packages/x86-64-v3-poky-linux/bind: PKGV changed from 9.20.26 [default] to 9.20.27 [default]
packages/x86-64-v3-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.20.26/bind-9.20.26.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch" to "https://ftp.isc.org/isc/bind9/9.20.27/bind-9.20.27.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch file://0001-m4-Backport-ax_prog_cc_f
 or_build.m4-macros.patch"
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.26.so to libdns-9.20.27.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.26.so to libisccc-9.20.27.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.26.so to libisccfg-9.20.27.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.26.so to libisc-9.20.27.so
  /usr/lib/libns.so changed symlink target from libns-9.20.26.so to libns-9.20.27.so
  /usr/lib/libdns-9.20.26.so moved to /usr/lib/libdns-9.20.27.so
  /usr/lib/libisc-9.20.26.so moved to /usr/lib/libisc-9.20.27.so
  /usr/lib/libisccc-9.20.26.so moved to /usr/lib/libisccc-9.20.27.so
  /usr/lib/libisccfg-9.20.26.so moved to /usr/lib/libisccfg-9.20.27.so
  /usr/lib/libns-9.20.26.so moved to /usr/lib/libns-9.20.27.so

--===============7370903965217890959==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.20.26-9.20.27.patch"

RnJvbSA4Y2NjMjEyYTA1MDk4MTEwMjcyMGIzZTZlYjUzZTQ4NWJlYjJjMDdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjAgQXVnIDIwMjYgMDU6MDk6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
aW5kOiB1cGdyYWRlIDkuMjAuMjYgLT4gOS4yMC4yNwoKU291cmNlOiBkb2MvY2hhbmdlbG9nL2No
YW5nZWxvZy05LjIwLjI3LnJzdAoKQklORCA5LjIwLjI3Ci0tLS0tLS0tLS0tLQoKTmV3IEZlYXR1
cmVzCn5+fn5+fn5+fn5+fgoKLSBEaXNjbG9zZSBhY3RpdmUgTmVnYXRpdmUgVHJ1c3QgQW5jaG9y
cyB3aXRoIEV4dGVuZGVkIEROUyBFcnJvciAzMy4KICBgYDU2NmU3MDE4Mjc4YGAKCiAgQSBOZWdh
dGl2ZSBUcnVzdCBBbmNob3IgKFJGQyA3NjQ2KSB0dXJucyBvZmYgRE5TU0VDIHZhbGlkYXRpb24g
Zm9yIGEKICBkb21haW4sIHNvIGEgbmFtZSB0aGF0IHdvdWxkIG5vcm1hbGx5IGZhaWwgdmFsaWRh
dGlvbiByZXNvbHZlcwogIGluc3RlYWQuIG5hbWVkIG5vdyBtYXJrcyBzdWNoIGFuc3dlcnMgd2l0
aCBFeHRlbmRlZCBETlMgRXJyb3IgY29kZSAzMywKICAiTmVnYXRpdmUgVHJ1c3QgQW5jaG9yIiwg
c28gb3BlcmF0b3JzIGNhbiBzZWUgYXQgYSBnbGFuY2Ugd2hlbiBhCiAgcmVzcG9uc2UgY2FtZSBi
YWNrIG9ubHkgYmVjYXVzZSBhbiBOVEEgd2FzIGluIGVmZmVjdC4gOmdsOmAjNjI2OGAKICA6Z2w6
YCExMjQyNmAKCi0gQWRkIGRldmVsb3BtZW50IGd1aWRhbmNlIGZvciBBSSBjb2RpbmcgYWdlbnRz
IHVuZGVyIC5hZ2VudHMvc2tpbGxzLwogIGBgZWY2NTFjOTM3MDlgYAoKICBUaGlzIGFkZHMgYSBz
ZXQgb2Ygc2tpbGwgZG9jdW1lbnRzIHRoYXQgZ2l2ZSBBSSBjb2RpbmcgYWdlbnRzIHRoZQogIHBy
b2plY3QncyBlc3RhYmxpc2hlZCBwcmFjdGljZXMgdXAgZnJvbnQgaW5zdGVhZCBvZiBoYXZpbmcg
dGhlbQogIHJlZGlzY292ZXJlZCAob3IgZ290dGVuIHdyb25nKSBpbiBldmVyeSBzZXNzaW9uOiB0
aGUgY2Fub25pY2FsIGJ1aWxkCiAgYW5kIHRlc3QgaW52b2NhdGlvbnMsIHRoZSBtZW1vcnktYWxs
b2NhdG9yIGNvbnRyYWN0LCB0aGUgZGlzY2lwbGluZXMKICBmb3IgUkNVIG11dGF0aW9uLCBwZXIt
bG9vcCBzaGFyZGVkIHN0cnVjdHVyZXMsIHN0cnVjdC1sYXlvdXQgd29yaywgYW5kCiAgZmxpZ2h0
LXJlY29yZGVyIGRlYnVnZ2luZyBvZiBjb25jdXJyZW5jeSBidWdzLCBwbHVzIHRoZSBjb21taXQg
YW5kCiAgbWVyZ2UtcmVxdWVzdCBjb252ZW50aW9ucy4gOmdsOmAhMTI0MDFgCgotIEFkZCBtb3Jl
IHVuaXQgdGVzdHMgZm9yIGlzY190aW1lIEFQSS4gYGA5ZDY4NTVlZjczNWBgCgogIFdoaWxlIHdv
cmtpbmcgb24gaW50ZXJuYWwgNjQtYml0IHRpbWUgZm9yIEJJTkQgOSwgdGhlIHVuaXQgdGVzdCBz
dWl0ZQogIGZvciBpc2NfdGltZSBBUEkgaGFzIGJlZW4gZXh0ZW5kZWQuCgogIEJhY2twb3J0IHRo
ZSB1bml0IHRlc3RzIGZyb20gNjQtYml0IHRpbWUgYnJhbmNoIHRvIHRoZSBtYWluIGJyYW5jaC4K
ICBUaGlzIHNob3VsZCBtYWtlIHRoZSB1bml0IHRlc3RzIGZvciBpc2NfdGltZSBBUEkgKG1vc3Rs
eSkgY29tcGxldGUuCgogIFJlbGF0ZWQgdG8gIzI5NTkgOmdsOmAhMTI0MzJgCgpGZWF0dXJlIENo
YW5nZXMKfn5+fn5+fn5+fn5+fn5+CgotIEJhdGNoIHFwIHRyYW5zYWN0aW9uIGZvciBSUFogdXBk
YXRlcy4gYGBjYjQwZmI5MWZhMmBgCgogIFJQWiB3YXMgYnVpbHQgYXJvdW5kIGZpbmUtZ3JhaW5l
ZCBsb2NraW5nLCBidXQgdGhhdCBmb3JjZXMgdGhlIHVzZSBvZgogIG1hbnkgc21hbGwgcXAgdHJh
bnNhY3Rpb25zLiBXaXRoIHRoaXMgTVIsIHdlIHN3aXRjaCBxcCB0cmFuc2FjdGlvbiB0bwogIGhh
bmRsZSB0aGUgZnVsbCB1cGRhdGUgdG8gdGhlIHJweiBzdW1tYXJ5IHN0cnVjdHVyZS4gV2hpbGUg
dGhpcwogIHNlcmlhbGl6ZXMgdGhlIFJQWiB1cGRhdGVzLCB0aGUgcmVkdWNlZCBvdmVyaGVhZCBm
cm9tIGJhdGNoaW5nIHFwCiAgdHJhbnNhY3Rpb25zIG1vcmUgdGhhbiBjb21wZW5zYXRlcyBmb3Ig
aXQgYW5kIHJlc3VsdHMgaW4gaW1wcm92ZW1lbnRzCiAgZm9yIGJpZyBSUFogem9uZXMuIDpnbDpg
IzU3ODdgLCAjNjI3MCA6Z2w6YCExMjQ5M2AKCi0gUGFzcyB0aGUgd29yayBjYWxsYmFjayByZXN1
bHQgdG8gdGhlIGRvbmUgY2FsbGJhY2suIGBgNjVjZGI3Yzc2MTNgYAoKICBUaGUgYGlzY193b3Jr
YCBjYWxsYmFjayBub3cgcmV0dXJucyBgaXNjX3Jlc3VsdF90YCBhbmQgdGhlIHZhbHVlIGlzCiAg
aGFuZGVkIHRvIHRoZSBkb25lIGNhbGxiYWNrLCBzbyB0aGUgY2FsbGVycyBubyBsb25nZXIgbmVl
ZCB0aGVpciBvd24KICByZXN1bHQtcGFzc2luZyBzdGF0ZS4gOmdsOmAhMTIzOTFgCgpCdWcgRml4
ZXMKfn5+fn5+fn5+CgotIERpZyAreWFtbCBwcm9kdWNpbmcgaW52YWxpZCBZQU1MIHdoZW4gYSBs
b29rdXAgZmFpbHMuIGBgNjVkMTc3Njk1OWVgYAoKICBXaGVuICJkaWcgK3lhbWwiIHdhcyBydW4g
YW5kIG5vIHNlcnZlciBjb3VsZCBiZSByZWFjaGVkLCBkaWcgcHJpbnRlZAogIGl0cyBwbGFpbi10
ZXh0IHN0YXJ0dXAgYmFubmVyICh0aGUgIjsgXDxcPFw+XD4gRGlHIC4uLiIgYW5kICI7OyBnbG9i
YWwKICBvcHRpb25zIiBsaW5lcykgYWhlYWQgb2YgdGhlIG1hY2hpbmUtcmVhZGFibGUgb3V0cHV0
LCBzbyB0aGUgcmVzdWx0CiAgd2FzIG5vdCB2YWxpZCBZQU1MIGFuZCBjb3VsZCBub3QgYmUgcGFy
c2VkLiBkaWcgbm8gbG9uZ2VyIGVtaXRzIHRoYXQKICBiYW5uZXIgaW4gWUFNTCBtb2RlLiBBcyBw
YXJ0IG9mIHRoZSBzYW1lIGNoYW5nZSwgdGhlIGJhbm5lciBpcyBub3cKICBidWlsdCBvbmx5IGFm
dGVyIHRoZSB3aG9sZSBjb21tYW5kIGxpbmUgaGFzIGJlZW4gcmVhZCwgc28gb3B0aW9ucwogIGdp
dmVuIGFmdGVyIHRoZSBxdWVyeSBuYW1lIChzdWNoIGFzICtub2NtZCwgK3Nob3J0IGFuZCAreWFt
bCkgYXJlCiAgY29ycmVjdGx5IHJlZmxlY3RlZCBpbiBpdC4gOmdsOmAjMTIzMGAgOmdsOmAhMTI0
MzBgCgotIEVuc3VyZSBOU0VDIGF1dGhvcml0eSBkb2VzIG5vdCBjcm9zcyB6b25lY3V0IGJvdW5k
YXJ5LiBgYDBiYWFkZGQwOTZhYGAKCiAgV2hlbiB1c2luZyBhIGNhY2hlZCBOU0VDIHJlY29yZCB0
byBwcm92ZSB0aGF0IGEgZGVsZWdhdGlvbiBpcwogIGluc2VjdXJlLCB3ZSBub3cgY2hlY2sgdGhh
dCB0aGUgc2lnbmVyCgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBhcyBpdCBleGNlZWRzIDMwMDAgY2hh
cmFjdGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBmb3VuZCBpbiBhbiBhdHRhY2htZW50
IHRvIHRoZSBBVUggZW1haWxdCi0tLQogLi4uL2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZh
aWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2ggICB8IDIgKy0KIC4uLi8wMDAxLW00LUJhY2twb3J0
LWF4X3Byb2dfY2NfZm9yX2J1aWxkLm00LW1hY3Jvcy5wYXRjaCAgICAgfCAyICstCiAuLi4wMDAx
LW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoIHwg
NCArKy0tCiAuLi5iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hl
cy1zeXNyLnBhdGNoIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmlu
ZC9jb25mLnBhdGNoICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL2JpbmQvYmluZC9pbml0LmQt
YWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2ggICB8IDIgKy0KIC4uLi9iaW5k
L2JpbmQvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2ggICAgICAgICAgICAgfCAy
ICstCiAuLi4vYmluZC97YmluZF85LjIwLjI2LmJiID0+IGJpbmRfOS4yMC4yNy5iYn0gICAgICAg
ICAgICAgICAgIHwgMiArLQogOCBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQve2JpbmRf
OS4yMC4yNi5iYiA9PiBiaW5kXzkuMjAuMjcuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdp
dGgtYmluZC11c2VyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQv
MDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoCmluZGV4IDRiYzhi
NDYzMGMuLjMwZGExZTlmZDMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC9iaW5kLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0
LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGNmNzUz
N2IwZGRjY2VmZDA0ZGNiODJjYTQ3MDI2MmNlNjFhZmIyNTIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDc2ODJjYmMyZmE2MjRmYmVlYjA4ODczNmUxNTQwOTBkOTJjOGI1MjQgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+
CiBEYXRlOiBNb24sIDE1IE9jdCAyMDE4IDE2OjU1OjA5ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGF2b2lkIHN0YXJ0IGZhaWx1cmUgd2l0aCBiaW5kIHVzZXIKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbTQtQmFja3BvcnQtYXhfcHJvZ19jY19m
b3JfYnVpbGQubTQtbWFjcm9zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5k
L2JpbmQvMDAwMS1tNC1CYWNrcG9ydC1heF9wcm9nX2NjX2Zvcl9idWlsZC5tNC1tYWNyb3MucGF0
Y2gKaW5kZXggYzlkYmZmMzgxNy4uZjFkOGE4ZTU2OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1tNC1CYWNrcG9ydC1heF9wcm9nX2NjX2Zvcl9i
dWlsZC5tNC1tYWNyb3MucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5k
L2JpbmQvMDAwMS1tNC1CYWNrcG9ydC1heF9wcm9nX2NjX2Zvcl9idWlsZC5tNC1tYWNyb3MucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGZhNzY3MDM4NmExNjQzZGU1Yjk3NmY2OTI4ZTQyNjYy
Yjk2OGQ4MDcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGE2MzNlMzM2YzI0OGNlYWI0
MWQzMTgyODQ4YjY1Yzk1ZTkwZWY4OGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBL
aGVtIFJhaiA8a2hlbS5yYWpAb3NzLnF1YWxjb21tLmNvbT4KIERhdGU6IEZyaSwgMTAgQXByIDIw
MjYgMjM6MzM6NDkgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gbTQ6IEJhY2twb3J0IGF4X3Byb2df
Y2NfZm9yX2J1aWxkLm00IG1hY3JvcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVp
bGQtb3B0aW9ucy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAw
MDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2gK
aW5kZXggNzQwZDFlOThlMi4uZGE0MDU3MDY0ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhp
ZGUtYnVpbGQtb3B0aW9ucy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRp
b25zLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0MTkwMWVhZWNmNjE3YWJmOGYyNjA4ZTA3
YmFhNzc1Yzc1NDM2YTE1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0Yjg3MGY2MDMz
OGZlNDVlMDM2YjhhNzZkNDdmMDUzMzM4OTIwMDQ4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCAy
NyBBdWcgMjAxOCAyMToyNDoyMCArMDgwMAogU3ViamVjdDogW1BBVENIXSBgbmFtZWQvbHdyZXNk
IC1WJyBhbmQgc3RhcnQgbG9nIGhpZGUgYnVpbGQgb3B0aW9ucwpAQCAtMjAsNyArMjAsNyBAQCBT
aWduZWQtb2ZmLWJ5OiBBcm1pbiBLdXN0ZXIgPGFrdXN0ZXJAbXZpc3RhLmNvbT4KICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2Nv
bmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggYWYwMjBmMC4uZjQ2MTIyOSAxMDA2NDQK
K2luZGV4IDU2YmNhNWIuLjRmZDYyZWQgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBi
L2NvbmZpZ3VyZS5hYwogQEAgLTM1LDcgKzM1LDcgQEAgQUNfREVGSU5FKFtQQUNLQUdFX1ZFUlNJ
T05fRVhUUkFdLCBbIl1bYmluZF9WRVJTSU9OX0VYVFJBXVsiXSwgW0JJTkQgOSBFeHRyYSBwYXIK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2JpbmQtZW5z
dXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9y
LWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoCmluZGV4IDNjN2YwOWQ2YmQuLjlhZGMx
MDEyNDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2Jp
bmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvYmluZC1lbnN1cmUtc2Vh
cmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gNmE3NTM2YzY2ODMyZTRkOTlkN2QxNTYyNTZiMWE5OGQ5NDk3YzdkZSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjM3MzZlNTUzNTIzNmNmOTc4ZmQzNjhiNjkwNTA5OGZm
NmU0ZmQ4NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBhdWwgR29ydG1ha2VyIDxw
YXVsLmdvcnRtYWtlckB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCA5IEp1biAyMDE1IDExOjIy
OjAwIC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGJpbmQ6IGVuc3VyZSBzZWFyY2hpbmcgZm9yIGpz
b24gaGVhZGVycyBzZWFyY2hlcyBzeXNyb290CkBAIC0zMiw3ICszMiw3IEBAIFNpZ25lZC1vZmYt
Ynk6IFBhdWwgR29ydG1ha2VyIDxwYXVsLmdvcnRtYWtlckB3aW5kcml2ZXIuY29tPgogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEv
Y29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCBmNDdjZTdiLi5hZjAyMGYwIDEwMDY0
NAoraW5kZXggYzA2YTBkNy4uNTZiY2E1YiAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysr
IGIvY29uZmlndXJlLmFjCiBAQCAtODcyLDcgKzg3Miw3IEBAIEFTX0NBU0UoWyR3aXRoX2xtZGJd
LApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvY29uZi5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0Y2gKaW5k
ZXggOGU4MmM1NzAzNS4uODAzNDU2YzBiMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9iaW5kL2JpbmQvY29uZi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JpbmQvYmluZC9jb25mLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzNTIzMzlhZjll
NmNkOWZjMDNjYWZmMDlhMWIyOTVmMjZkZmFkYzMyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSA0NTAxODdlOGZlYWMwNDFkZTAyYWZkNGMwYzkwMzljYzQxZTA0Y2I5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogUWluZyBIZSA8cWluZy5oZUBpbnRlbC5jb20+CiBEYXRlOiBU
dWUsIDMwIE5vdiAyMDEwIDEzOjM1OjQyICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGJpbmQ6IGFk
ZCBuZXcgcmVjaXBlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJl
YWQtb25seS1yb290ZnMucGF0Y2gKaW5kZXggNzNlMzkwMDJjYS4uYTJjMWZiYjhmNyAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBw
b3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzU5MjM1MjE4NDc2MTgzOTJlMjBmZDlhYmQzMjQ1
NjE4Yjc3YzhmNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTgyMzM0ZDMxNDMyOTY5
YmU3ZTEwOTA2ZGU3NTQwZjFkYzY0YjE3ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMjcgTWFyIDIwMTQg
MDI6MzQ6NDEgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gaW5pdC5kOiBhZGQgc3VwcG9ydCBmb3Ig
cmVhZC1vbmx5IHJvb3RmcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
aW5kL2JpbmQvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5w
YXRjaAppbmRleCA1NjhlNGYyZTU5Li5kYzFmOGY1YTlhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1p
bml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDIyNDUxNmQ3
YmQxMDBiNmVhN2I0ZmFmZGQwN2I0MmFhOTZjYjBiYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gNTA2MDFhN2VlOGZkMTlkZGJlOWE1OTJjNTdhZTYxOTc3ODJkNGMyZiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IFJveSBMaSA8cm9uZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4K
IERhdGU6IFRodSwgMTUgTm92IDIwMTIgMDI6Mjc6NTQgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0g
YmluZDogbWFrZSAiL2V0Yy9pbml0LmQvYmluZCBzdG9wIiB3b3JrCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjI2LmJiIGIvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC4yNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjI2LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjI3LmJi
CmluZGV4IDIxZmZhZDdiYWQuLmU5MTUxNjFkOGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAuMjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9iaW5kL2JpbmRfOS4yMC4yNy5iYgpAQCAtMjEsNyArMjEsNyBAQCBTUkNfVVJJID0g
Imh0dHBzOi8vZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LyR7UFZ9LyR7QlBOfS0ke1BWfS50YXIueHog
XAogICAgICAgICAgICBmaWxlOi8vMDAwMS1tNC1CYWNrcG9ydC1heF9wcm9nX2NjX2Zvcl9idWls
ZC5tNC1tYWNyb3MucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICI1NTI0OGRlZjBmODcwYzRjNDZiM2RlNzI5NzhlYTk3MjYxNTEzMTUxNjY2MzE4OGE0NTY0ZGNh
MWQyMGJmMzUwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE0NWFiN2E1MGIzM2EwNmQ5ZDQ4OGI1
ZTY2OGM4ODdlNzU0ZjQyYWNmODk1NGUyYjVkYzdlMjM4YjA4MGU0YTAiCiAKIFVQU1RSRUFNX0NI
RUNLX1VSSSA9ICJodHRwczovL2Z0cC5pc2Mub3JnL2lzYy9iaW5kOS8iCiAjIGZvbGxvdyB0aGUg
RVNWIHZlcnNpb25zIGRpdmlzaWJsZSBieSAyCi0tIAoyLjQ3LjEKCg==

--===============7370903965217890959==--

