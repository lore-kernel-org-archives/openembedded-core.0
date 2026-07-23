Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2DAC531CD
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 05:21:28 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17384.1784784079983933329
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 22:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jNeY557J;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CkfedPaz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019f8d6bc7e3-6cc57616-83f7-43c0-ac92-2aee52c1e164-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784784079;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=z360KM4XoPHRJYRRhDs4HB5v8ZGGtwTP9zWBiZFGPQ8=;
	b=jNeY557JjRLrGWPISPiyPOqN4dHoHAMyGGs5GUvVeKSdwDT6XVFO+83YLpoqZvzY
	RWaGTMDLjCQVnmqa3DScIfTUw1Zx0dwUtjZHaSaGwAPBXt52C6B+i4jyomVIWN6qGaq
	mOCm1s0Y7gdhSNWFK3OGaCXMuDd0Ps6/+k9NREv8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784784079;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=z360KM4XoPHRJYRRhDs4HB5v8ZGGtwTP9zWBiZFGPQ8=;
	b=CkfedPazKyxPO5DJAmw0CFx4VH+iyahn95ELvdY4ltrt0JHtEYXMFEU1Vf/UDFwx
	SEN9NecegN6RKv+N9JaJpGbepOL40wLdtzcjystws8HbXy9p0180/cyuBrqu+rP5EaI
	W7oyLhg6QFiZkZ+ctBBFVuE5yTXG932ELClDtqWQ=
Content-Type: multipart/mixed; boundary="===============8076392047703903342=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.20.26 SUCCEEDED
Message-ID: <0101019f8d6bc7e3-6cc57616-83f7-43c0-ac92-2aee52c1e164-000000@us-west-2.amazonses.com>
Date: Thu, 23 Jul 2026 05:21:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.23-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 05:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241767

--===============8076392047703903342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bind* to *9.20.26* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.20.24-9.20.26.patch
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
From f67c43bdbb20b66c11879e91ac5be89e8f66c725 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 23 Jul 2026 05:12:31 +0000
Subject: [PATCH] bind: upgrade 9.20.24 -> 9.20.26

Source: doc/changelog/changelog-9.20.25.rst, doc/changelog/changelog-9.20.26.rst

BIND 9.20.25
------------

.. note::

   The BIND 9.20.25 release was withdrawn after the discovery of a
   regression in a security fix in it during pre-release testing.

BIND 9.20.26
------------

Security Fixes
~~~~~~~~~~~~~~

- [CVE-2026-11331] Fix handling of rpz CNAME expansion that returns name
  too long. ``b950da5f625``

  Previously, if the expansion of a wildcard CNAME RPZ policy resulted
  in a name that exceeded the length limit, a self referential CNAME and
  the original address record were returned, allowing the policy to be
  bypassed.  In branches up to 9.20, this also left query processing in
  an inconsistent state which could trigger an assertion failure.  We
  now return a YXDOMAIN response, without the address.

  ISC would like to thank Laith Mash'al (0xmshal) for bringing this
  issue to our attention. :gl:`#5856`

- [CVE-2026-11721] Invalid signed wildcard records were being accepted.
  ``249752cd72d``

  Signed wildcard responses in which the Labels field in the `RRSIG`
  record was less than the number of labels in the Signer Name field
  were being incorrectly accepted. This in turn broke
  `synth-from-dnssec`, which depends on such records being correctly
  validated. This has been fixed.

  ISC thanks Qifan Zhang of Palo Alto Networks for bringing this issue
  to our attention. :gl:`#5871`

- [CVE-2026-13321] Fix DNSSEC validation bypass via out-of-zone NSEC
  Next Field. ``6fbc963d4af``

  A malicious zone with out-of-zone NSEC next owner names can cause a
  DNSSEC validating resolver to cache such record and, if
  `synth-from-dnssec` is enabled, to generate negative answers for any
  zone that is covered by the range.

  ISC would like to thank Qifan Zhang of Palo Alto Networks for
  reporting the issue. :gl:`#5873`

- [CVE-2026-10723] Correct verification of NSEC3 signer name.
  ``df3abfc3184``

  BIND 9 accepted child-zone NSEC3 records where the first label equals
  the hash of the parent zone as valid parent-zone closest encloser
  proofs. This has been fixed.

  ISC thanks Qifan Zhang of Palo Alto Networks for reporting the issue.
  :gl:`#5874`

- [CVE-2026-12617] Do no assert for some specifics CNAME and DNAME
  queries. ``d75d1e93958``

  A bug in the resolver's handling of certain cached DNAME and CNAME
  responses could cause named to trigger an assertion failure and exit.
  An attacker controlling a domain name and the authoritative DNS server
  it is hosted on could exploit this behavior to cause a
  denial-of-service. This vulnerability has been fixed.

  ISC thanks Qifan Zhang of Palo Alto Networks for bringing this issue
  to our attention. :gl:`#5946`

- [CVE-2026-10822] Malformed DNSKEY records could trigger an assertion.
  ``a1777ce7ee0``

  Previously, `dns_name_fromwire()` did not honor the record boundary
  when reading names from the wire, allowing malformed records to be
  accepted when they should not have been

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch | 2 +-
 .../0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch   | 2 +-
 ...01-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...nd-ensure-searching-for-json-headers-searches-sysr.patch | 6 +++---
 meta/recipes-connectivity/bind/bind/conf.patch              | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch           | 2 +-
 .../bind/{bind_9.20.24.bb => bind_9.20.26.bb}               | 2 +-
 8 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.24.bb => bind_9.20.26.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 806ca9c5bd..4bc8b4630c 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From e4886a825c82a7d6f4bd6badeeaeea700e429483 Mon Sep 17 00:00:00 2001
+From cf7537b0ddccefd04dcb82ca470262ce61afb252 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
index 9b2870bd38..c9dbff3817 100644
--- a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
@@ -1,4 +1,4 @@
-From e5f31670d79906033209d6b30d925dcd0324c95a Mon Sep 17 00:00:00 2001
+From fa7670386a1643de5b976f6928e42662b968d807 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:33:49 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index 1bbf17b12e..740d1e98e2 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From c18ad4de676ed9350837c4c90a5e53a941712ba4 Mon Sep 17 00:00:00 2001
+From 41901eaecf617abf8f2608e07baa775c75436a15 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c845a8e..d065454 100644
+index af020f0..f461229 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 352a2f1bc1..3c7f09d6bd 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 6f0289bc8ee2c5a6d386d6d6921875219b268951 Mon Sep 17 00:00:00 2001
+From 6a7536c66832e4d99d7d156256b1a98d9497c7de Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,10 +32,10 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 7b9a63b..c845a8e 100644
+index f47ce7b..af020f0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -865,7 +865,7 @@ AS_CASE([$with_lmdb],
+@@ -872,7 +872,7 @@ AS_CASE([$with_lmdb],
  	[no],[],
  	[auto|yes], [PKG_CHECK_MODULES([LMDB], [lmdb],
  				       [ac_lib_lmdb_found=yes],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index c7f6941908..8e82c57035 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From d308d9b835f4ad11e5824e7333668792980c1357 Mon Sep 17 00:00:00 2001
+From 352339af9e6cd9fc03caff09a1b295f26dfadc32 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index ec9eec6d3e..73e39002ca 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 23b997fc6276a527e1cf36312cd121170c15978c Mon Sep 17 00:00:00 2001
+From 75923521847618392e20fd9abd3245618b77c8f7 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index 54d948bb17..568e4f2e59 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From f5932fde97bb5b47144d926219f3903145a71185 Mon Sep 17 00:00:00 2001
+From 0224516d7bd100b6ea7b4fafdd07b42aa96cb0ba Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.24.bb b/meta/recipes-connectivity/bind/bind_9.20.26.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.24.bb
rename to meta/recipes-connectivity/bind/bind_9.20.26.bb
index 3c5acc972b..21ffad7bad 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.24.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.26.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
 
-SRC_URI[sha256sum] = "989fef1fc88ea59d04cd86f854dca5a4616a20a9968bcdde3c1a3668ab36be08"
+SRC_URI[sha256sum] = "55248def0f870c4c46b3de72978ea972615131516663188a4564dca1d20bf350"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.47.1


--===============8076392047703903342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGV changed from 9.20.24 [default] to 9.20.26 [default]
packages/x86-64-v3-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libisccfg-9.20.24.so /usr/lib/.debug/libns-9.20.24.so /usr/lib/.debug/libisccc-9.20.24.so /usr/lib/.debug/libdns-9.20.24.so /usr/lib/.debug/libisc-9.20.24.so", added "/usr/lib/.debug/libns-9.20.26.so /usr/lib/.debug/libisccfg-9.20.26.so /usr/lib/.debug/libisccc-9.20.26.so /usr/lib/.debug/libdns-9.20.26.so /usr/lib/.debug/libisc-9.20.26.so"
packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGSIZE changed from 16132440 to 16160216 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-dbg: PV changed from "9.20.24" to "9.20.26"
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGV changed from 9.20.24 [default] to 9.20.26 [default]
packages/x86-64-v3-poky-linux/bind/bind-dev: FILELIST: removed "/usr/include/isc/helper.h"
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGSIZE changed from 1602531 to 1606807 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-dev: PV changed from "9.20.24" to "9.20.26"
packages/x86-64-v3-poky-linux/bind/bind-doc: PKGV changed from 9.20.24 [default] to 9.20.26 [default]
packages/x86-64-v3-poky-linux/bind/bind-doc: PV changed from "9.20.24" to "9.20.26"
packages/x86-64-v3-poky-linux/bind/bind-libs: PKGV changed from 9.20.24 [default] to 9.20.26 [default]
packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libns-9.20.24.so /usr/lib/libisccc-9.20.24.so /usr/lib/libdns-9.20.24.so /usr/lib/libisc-9.20.24.so /usr/lib/libisccfg-9.20.24.so", added "/usr/lib/libns-9.20.26.so /usr/lib/libisccc-9.20.26.so /usr/lib/libdns-9.20.26.so /usr/lib/libisc-9.20.26.so /usr/lib/libisccfg-9.20.26.so"
packages/x86-64-v3-poky-linux/bind/bind-libs: PKGSIZE changed from 3679976 to 3684232 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-libs: PV changed from "9.20.24" to "9.20.26"
packages/x86-64-v3-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.20.24.so", added "/usr/lib/*-9.20.26.so"
packages/x86-64-v3-poky-linux/bind/bind-locale: PKGV changed from 9.20.24 [default] to 9.20.26 [default]
packages/x86-64-v3-poky-linux/bind/bind-locale: PV changed from "9.20.24" to "9.20.26"
packages/x86-64-v3-poky-linux/bind/bind-src: PKGV changed from 9.20.24 [default] to 9.20.26 [default]
packages/x86-64-v3-poky-linux/bind/bind-src: FILELIST: directory renamed /usr/src/debug/bind/9.20.24/bin/rndc -> /usr/src/debug/bind/9.20.26/bin/rndc, directory renamed /usr/src/debug/bind/9.20.24/lib/dns/rdata/any_255 -> /usr/src/debug/bind/9.20.26/lib/dns/rdata/any_255, directory renamed /usr/src/debug/bind/9.20.24/lib/dns/rdata/ch_3 -> /usr/src/debug/bind/9.20.26/lib/dns/rdata/ch_3, directory renamed /usr/src/debug/bind/9.20.24/lib/isccc -> /usr/src/debug/bind/9.20.26/lib/isccc, directory renamed /usr/src/debug/bind/9.20.24/lib/isccc/include/isccc -> /usr/src/debug/bind/9.20.26/lib/isccc/include/isccc, directory renamed /usr/src/debug/bind/9.20.24/bin/plugins -> /usr/src/debug/bind/9.20.26/bin/plugins, directory renamed /usr/src/debug/bind/9.20.24/bin/nsupdate -> /usr/src/debug/bind/9.20.26/bin/nsupdate, directory renamed /usr/src/debug/bind/9.20.24/bin/named/include/dlz -> /usr/src/debug/bind/9.20.26/bin/named/include/dlz, directory renamed /usr/src/debug/bind/9.20.24/lib/dns -> 
 /usr/src/debug/bind/9.20.26/lib/dns, directory renamed /usr/src/debug/bind/9.20.24/bin/confgen/include/confgen -> /usr/src/debug/bind/9.20.26/bin/confgen/include/confgen, directory renamed /usr/src/debug/bind/9.20.24/bin/tools -> /usr/src/debug/bind/9.20.26/bin/tools, directory renamed /usr/src/debug/bind/9.20.24/bin/named -> /usr/src/debug/bind/9.20.26/bin/named, directory renamed /usr/src/debug/bind/9.20.24/lib/dns/rdata/in_1 -> /usr/src/debug/bind/9.20.26/lib/dns/rdata/in_1, directory renamed /usr/src/debug/bind/9.20.24/lib/dns/include/dst -> /usr/src/debug/bind/9.20.26/lib/dns/include/dst, directory renamed /usr/src/debug/bind/9.20.24/lib/isc/netmgr -> /usr/src/debug/bind/9.20.26/lib/isc/netmgr, directory renamed /usr/src/debug/bind/9.20.24/lib/dns/rdata/generic -> /usr/src/debug/bind/9.20.26/lib/dns/rdata/generic, directory renamed /usr/src/debug/bind/9.20.24/lib/dns/include/dns -> /usr/src/debug/bind/9.20.26/lib/dns/include/dns, directory renamed /usr/src/debug/bind/9.20.24/li
 b/dns/rdata/hs_4 -> /usr/src/debug/bind/9.20.26/lib/dns/rdata/hs_4, directory renamed /usr/src/debug/bind/9.20.24/lib/ns -> /usr/src/debug/bind/9.20.26/lib/ns, directory renamed /usr/src/debug/bind/9.20.24/lib/isccfg/include/isccfg -> /usr/src/debug/bind/9.20.26/lib/isccfg/include/isccfg, directory renamed /usr/src/debug/bind/9.20.24/bin/named/include/named -> /usr/src/debug/bind/9.20.26/bin/named/include/named, directory renamed /usr/src/debug/bind/9.20.24/bin/dnssec -> /usr/src/debug/bind/9.20.26/bin/dnssec, directory renamed /usr/src/debug/bind/9.20.24/lib/ns/include/ns -> /usr/src/debug/bind/9.20.26/lib/ns/include/ns, directory renamed /usr/src/debug/bind/9.20.24/bin/confgen -> /usr/src/debug/bind/9.20.26/bin/confgen, directory renamed /usr/src/debug/bind/9.20.24/bin/dig -> /usr/src/debug/bind/9.20.26/bin/dig, directory renamed /usr/src/debug/bind/9.20.24/lib/isccfg -> /usr/src/debug/bind/9.20.26/lib/isccfg, directory renamed /usr/src/debug/bind/9.20.24/bin/delv -> /usr/src/debu
 g/bind/9.20.26/bin/delv, directory renamed /usr/src/debug/bind/9.20.24/lib/dns/include/irs -> /usr/src/debug/bind/9.20.26/lib/dns/include/irs, directory renamed /usr/src/debug/bind/9.20.24/bin/check -> /usr/src/debug/bind/9.20.26/bin/check, removed "/usr/src/debug/bind/9.20.24/lib/isc/picohttpparser.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/dir.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/thread.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/counter.h /usr/src/debug/bind/9.20.24/lib/isc/picohttpparser.h /usr/src/debug/bind/9.20.24/lib/isc/condition.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/symtab.h /usr/src/debug/bind/9.20.24/lib/isc/dir.c /usr/src/debug/bind/9.20.24/lib/isc/hex.c /usr/src/debug/bind/9.20.24/lib/isc/job.c /usr/src/debug/bind/9.20.24/lib/isc/lex.c /usr/src/debug/bind/9.20.24/lib/isc/lib.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/fips.h /usr/src/debug/bind/9.20.24/lib/isc/log.c /usr/src/debug/bind/9.20.24/lib/isc/mem.c /usr/src/debug/bin
 d/9.20.24/lib/isc/net.c /usr/src/debug/bind/9.20.24/lib/isc/tid.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/portset.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/sockaddr.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/hmac.h /usr/src/debug/bind/9.20.24/lib/isc/syslog.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/helper.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/uv.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/quota.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/backtrace.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/once.h /usr/src/debug/bind/9.20.24/lib/isc/mutex.c /usr/src/debug/bind/9.20.24/lib/isc/radix.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/serial.h /usr/src/debug/bind/9.20.24/lib/isc/regex.c /usr/src/debug/bind/9.20.24/lib/isc/sockaddr.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/safe.h /usr/src/debug/bind/9.20.24/lib/isc/loop_p.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/assertions.h /usr/src/debug/bind/9.20.24/lib/isc/
 include/isc/barrier.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/buffer.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/commandline.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/magic.h /usr/src/debug/bind/9.20.24/lib/isc/os.c /usr/src/debug/bind/9.20.24/lib/isc/async.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/mutex.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/siphash.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/dnsstream.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/refcount.h /usr/src/debug/bind/9.20.24/lib/isc/tm.c /usr/src/debug/bind/9.20.24/lib/isc/base64.c /usr/src/debug/bind/9.20.24/lib/isc/getaddresses.c /usr/src/debug/bind/9.20.24/lib/isc/quota.c /usr/src/debug/bind/9.20.24/lib/isc/md.c /usr/src/debug/bind/9.20.24/lib/isc/httpd.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/tid.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/net.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/ht.h /usr/src/debug/bind/9.20.24/lib/isc/parseint.c /usr/src
 /debug/bind/9.20.24/lib/isc/stdtime.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/histo.h /usr/src/debug/bind/9.20.24/lib/isc/ascii.c /usr/src/debug/bind/9.20.24/lib/isc/errno2result.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/meminfo.h /usr/src/debug/bind/9.20.24/lib/isc/errno2result.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/parseint.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/ratelimiter.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/types.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/random.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/queue.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/radix.h /usr/src/debug/bind/9.20.24/lib/isc/errno.c /usr/src/debug/bind/9.20.24/lib/isc/histo.c /usr/src/debug/bind/9.20.24/lib/isc/stdio.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/proxy2.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/tls.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/error.h /usr/src/debug/bind/9.20.24/lib/isc/hmac.c /usr/src/de
 bug/bind/9.20.24/lib/isc/ht.c /usr/src/debug/bind/9.20.24/lib/isc/ratelimiter.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/base32.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/tm.h /usr/src/debug/bind/9.20.24/lib/isc/hashmap.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/nonce.h /usr/src/debug/bind/9.20.24/lib/isc/uv.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/stats.h /usr/src/debug/bind/9.20.24/lib/isc/portset.c /usr/src/debug/bind/9.20.24/lib/isc/counter.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/hash.h /usr/src/debug/bind/9.20.24/lib/isc/tls.c /usr/src/debug/bind/9.20.24/lib/isc/url.c /usr/src/debug/bind/9.20.24/lib/isc/xml.c /usr/src/debug/bind/9.20.24/lib/isc/crc64.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/base64.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/loop.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/ascii.h /usr/src/debug/bind/9.20.24/lib/isc/async_p.h /usr/src/debug/bind/9.20.24/lib/isc/jemalloc_shim.h /usr/src/debug/bind/9.20.
 24/lib/isc/include/isc/regex.h /usr/src/debug/bind/9.20.24/lib/isc/commandline.c /usr/src/debug/bind/9.20.24/lib/isc/netaddr.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/errno.h /usr/src/debug/bind/9.20.24/lib/isc/meminfo.c /usr/src/debug/bind/9.20.24/lib/isc/job_p.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/async.h /usr/src/debug/bind/9.20.24/lib/isc/mem_p.h /usr/src/debug/bind/9.20.24/lib/isc/helper.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/os.h /usr/src/debug/bind/9.20.24/lib/isc/serial.c /usr/src/debug/bind/9.20.24/lib/isc/signal.c /usr/src/debug/bind/9.20.24/lib/isc/rwlock.c /usr/src/debug/bind/9.20.24/lib/isc/result.c /usr/src/debug/bind/9.20.24/lib/isc/proxy2.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/interfaceiter.h /usr/src/debug/bind/9.20.24/lib/isc/interfaceiter.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/managers.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/syslog.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/iterated_hash.h /usr/
 src/debug/bind/9.20.24/lib/isc/include/isc/time.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/lex.h /usr/src/debug/bind/9.20.24/lib/isc/error.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/string.h /usr/src/debug/bind/9.20.24/lib/isc/managers.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/stdtime.h /usr/src/debug/bind/9.20.24/lib/isc/timer.c /usr/src/debug/bind/9.20.24/lib/isc/random.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/heap.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/netmgr.h /usr/src/debug/bind/9.20.24/lib/isc/backtrace.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/md.h /usr/src/debug/bind/9.20.24/lib/isc/symtab.c /usr/src/debug/bind/9.20.24/lib/isc/utf8.c /usr/src/debug/bind/9.20.24/lib/isc/loop.c /usr/src/debug/bind/9.20.24/lib/isc/safe.c /usr/src/debug/bind/9.20.24/lib/isc/time.c /usr/src/debug/bind/9.20.24/lib/isc/work.c /usr/src/debug/bind/9.20.24/lib/isc/file.c /usr/src/debug/bind/9.20.24/lib/isc/fips.c /usr/src/debug/bind/9.20.24/lib/isc/inc
 lude/isc/netscope.h /usr/src/debug/bind/9.20.24/lib/isc/hash.c /usr/src/debug/bind/9.20.24/lib/isc/heap.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/getaddresses.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/fuzz.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/region.h /usr/src/debug/bind/9.20.24/lib/isc/base32.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/netaddr.h /usr/src/debug/bind/9.20.24/lib/isc/os_p.h /usr/src/debug/bind/9.20.24/lib/isc/assertions.c /usr/src/debug/bind/9.20.24/lib/isc/iterated_hash.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/httpd.h /usr/src/debug/bind/9.20.24/lib/isc/mutex_p.h /usr/src/debug/bind/9.20.24/lib/isc/netscope.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/log.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/result.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/url.h /usr/src/debug/bind/9.20.24/lib/isc/thread.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/rwlock.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/work.
 h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/hex.h /usr/src/debug/bind/9.20.24/lib/isc/stats.c /usr/src/debug/bind/9.20.24/lib/isc/mutexblock.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/mem.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/file.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/stdio.h /usr/src/debug/bind/9.20.24/lib/isc/region.c /usr/src/debug/bind/9.20.24/lib/isc/include/isc/signal.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/timer.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/xml.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/hashmap.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/job.h /usr/src/debug/bind/9.20.24/lib/isc/include/isc/utf8.h /usr/src/debug/bind/9.20.24/lib/isc/string.c", added "/usr/src/debug/bind/9.20.26/lib/isc/picohttpparser.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/dir.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/thread.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/counter.h /usr/src/debug/bind/9.20.26/
 lib/isc/picohttpparser.h /usr/src/debug/bind/9.20.26/lib/isc/condition.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/symtab.h /usr/src/debug/bind/9.20.26/lib/isc/dir.c /usr/src/debug/bind/9.20.26/lib/isc/hex.c /usr/src/debug/bind/9.20.26/lib/isc/job.c /usr/src/debug/bind/9.20.26/lib/isc/lex.c /usr/src/debug/bind/9.20.26/lib/isc/lib.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/fips.h /usr/src/debug/bind/9.20.26/lib/isc/log.c /usr/src/debug/bind/9.20.26/lib/isc/mem.c /usr/src/debug/bind/9.20.26/lib/isc/net.c /usr/src/debug/bind/9.20.26/lib/isc/tid.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/portset.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/sockaddr.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/hmac.h /usr/src/debug/bind/9.20.26/lib/isc/syslog.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/uv.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/quota.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/backtrace.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/
 once.h /usr/src/debug/bind/9.20.26/lib/isc/mutex.c /usr/src/debug/bind/9.20.26/lib/isc/radix.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/serial.h /usr/src/debug/bind/9.20.26/lib/isc/regex.c /usr/src/debug/bind/9.20.26/lib/isc/sockaddr.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/safe.h /usr/src/debug/bind/9.20.26/lib/isc/loop_p.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/assertions.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/barrier.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/buffer.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/commandline.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/magic.h /usr/src/debug/bind/9.20.26/lib/isc/os.c /usr/src/debug/bind/9.20.26/lib/isc/async.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/mutex.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/siphash.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/dnsstream.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/refcount.h /usr/src/debug/bind/9.20.26/lib/isc/tm.c /
 usr/src/debug/bind/9.20.26/lib/isc/base64.c /usr/src/debug/bind/9.20.26/lib/isc/getaddresses.c /usr/src/debug/bind/9.20.26/lib/isc/quota.c /usr/src/debug/bind/9.20.26/lib/isc/md.c /usr/src/debug/bind/9.20.26/lib/isc/httpd.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/tid.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/net.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/ht.h /usr/src/debug/bind/9.20.26/lib/isc/parseint.c /usr/src/debug/bind/9.20.26/lib/isc/stdtime.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/histo.h /usr/src/debug/bind/9.20.26/lib/isc/ascii.c /usr/src/debug/bind/9.20.26/lib/isc/errno2result.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/meminfo.h /usr/src/debug/bind/9.20.26/lib/isc/errno2result.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/parseint.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/ratelimiter.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/types.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/random.h /usr/src/debug/bind/9.20.
 26/lib/isc/include/isc/queue.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/radix.h /usr/src/debug/bind/9.20.26/lib/isc/errno.c /usr/src/debug/bind/9.20.26/lib/isc/histo.c /usr/src/debug/bind/9.20.26/lib/isc/stdio.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/proxy2.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/tls.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/error.h /usr/src/debug/bind/9.20.26/lib/isc/hmac.c /usr/src/debug/bind/9.20.26/lib/isc/ht.c /usr/src/debug/bind/9.20.26/lib/isc/ratelimiter.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/base32.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/tm.h /usr/src/debug/bind/9.20.26/lib/isc/hashmap.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/nonce.h /usr/src/debug/bind/9.20.26/lib/isc/uv.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/stats.h /usr/src/debug/bind/9.20.26/lib/isc/portset.c /usr/src/debug/bind/9.20.26/lib/isc/counter.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/hash.h /usr/src/debug/bind/9
 .20.26/lib/isc/tls.c /usr/src/debug/bind/9.20.26/lib/isc/url.c /usr/src/debug/bind/9.20.26/lib/isc/xml.c /usr/src/debug/bind/9.20.26/lib/isc/crc64.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/base64.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/loop.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/ascii.h /usr/src/debug/bind/9.20.26/lib/isc/async_p.h /usr/src/debug/bind/9.20.26/lib/isc/jemalloc_shim.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/regex.h /usr/src/debug/bind/9.20.26/lib/isc/commandline.c /usr/src/debug/bind/9.20.26/lib/isc/netaddr.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/errno.h /usr/src/debug/bind/9.20.26/lib/isc/meminfo.c /usr/src/debug/bind/9.20.26/lib/isc/job_p.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/async.h /usr/src/debug/bind/9.20.26/lib/isc/mem_p.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/os.h /usr/src/debug/bind/9.20.26/lib/isc/serial.c /usr/src/debug/bind/9.20.26/lib/isc/signal.c /usr/src/debug/bind/9.20.26/lib/isc/rwloc
 k.c /usr/src/debug/bind/9.20.26/lib/isc/result.c /usr/src/debug/bind/9.20.26/lib/isc/proxy2.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/interfaceiter.h /usr/src/debug/bind/9.20.26/lib/isc/interfaceiter.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/managers.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/syslog.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/iterated_hash.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/time.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/lex.h /usr/src/debug/bind/9.20.26/lib/isc/error.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/string.h /usr/src/debug/bind/9.20.26/lib/isc/managers.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/stdtime.h /usr/src/debug/bind/9.20.26/lib/isc/timer.c /usr/src/debug/bind/9.20.26/lib/isc/random.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/heap.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/netmgr.h /usr/src/debug/bind/9.20.26/lib/isc/backtrace.c /usr/src/debug/bind/9.20.26/lib/isc/include
 /isc/md.h /usr/src/debug/bind/9.20.26/lib/isc/symtab.c /usr/src/debug/bind/9.20.26/lib/isc/utf8.c /usr/src/debug/bind/9.20.26/lib/isc/work.c /usr/src/debug/bind/9.20.26/lib/isc/loop.c /usr/src/debug/bind/9.20.26/lib/isc/safe.c /usr/src/debug/bind/9.20.26/lib/isc/time.c /usr/src/debug/bind/9.20.26/lib/isc/file.c /usr/src/debug/bind/9.20.26/lib/isc/fips.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/netscope.h /usr/src/debug/bind/9.20.26/lib/isc/hash.c /usr/src/debug/bind/9.20.26/lib/isc/heap.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/getaddresses.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/fuzz.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/region.h /usr/src/debug/bind/9.20.26/lib/isc/base32.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/netaddr.h /usr/src/debug/bind/9.20.26/lib/isc/os_p.h /usr/src/debug/bind/9.20.26/lib/isc/assertions.c /usr/src/debug/bind/9.20.26/lib/isc/iterated_hash.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/httpd.h /usr/src/debug/bin
 d/9.20.26/lib/isc/mutex_p.h /usr/src/debug/bind/9.20.26/lib/isc/netscope.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/log.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/result.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/url.h /usr/src/debug/bind/9.20.26/lib/isc/thread.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/rwlock.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/work.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/hex.h /usr/src/debug/bind/9.20.26/lib/isc/stats.c /usr/src/debug/bind/9.20.26/lib/isc/mutexblock.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/mem.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/file.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/stdio.h /usr/src/debug/bind/9.20.26/lib/isc/region.c /usr/src/debug/bind/9.20.26/lib/isc/include/isc/signal.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/timer.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/xml.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/hashmap.h /usr/src/debug/bin
 d/9.20.26/lib/isc/include/isc/job.h /usr/src/debug/bind/9.20.26/lib/isc/include/isc/utf8.h /usr/src/debug/bind/9.20.26/lib/isc/string.c"
packages/x86-64-v3-poky-linux/bind/bind-src: PKGSIZE changed from 10095910 to 10131969 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-src: PV changed from "9.20.24" to "9.20.26"
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PKGV changed from 9.20.24 [default] to 9.20.26 [default]
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PV changed from "9.20.24" to "9.20.26"
packages/x86-64-v3-poky-linux/bind/bind-utils: PKGV changed from 9.20.24 [default] to 9.20.26 [default]
packages/x86-64-v3-poky-linux/bind/bind-utils: PV changed from "9.20.24" to "9.20.26"
packages/x86-64-v3-poky-linux/bind/bind: PKGV changed from 9.20.24 [default] to 9.20.26 [default]
packages/x86-64-v3-poky-linux/bind/bind: PV changed from "9.20.24" to "9.20.26"
packages/x86-64-v3-poky-linux/bind: PKGV changed from 9.20.24 [default] to 9.20.26 [default]
packages/x86-64-v3-poky-linux/bind: PV changed from "9.20.24" to "9.20.26"
packages/x86-64-v3-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.20.24/bind-9.20.24.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch" to "https://ftp.isc.org/isc/bind9/9.20.26/bind-9.20.26.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch file://0001-m4-Backport-ax_prog_cc_f
 or_build.m4-macros.patch"
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.24.so to libdns-9.20.26.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.24.so to libisccc-9.20.26.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.24.so to libisccfg-9.20.26.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.24.so to libisc-9.20.26.so
  /usr/lib/libns.so changed symlink target from libns-9.20.24.so to libns-9.20.26.so
  /usr/lib/libdns-9.20.24.so moved to /usr/lib/libdns-9.20.26.so
  /usr/lib/libisc-9.20.24.so moved to /usr/lib/libisc-9.20.26.so
  /usr/lib/libisccc-9.20.24.so moved to /usr/lib/libisccc-9.20.26.so
  /usr/lib/libisccfg-9.20.24.so moved to /usr/lib/libisccfg-9.20.26.so
  /usr/lib/libns-9.20.24.so moved to /usr/lib/libns-9.20.26.so
  /usr/include/isc/helper.h was removed

--===============8076392047703903342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/bind/bind-dev: FILELIST: removed "/usr/include/isc/helper.h"
packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libdns-9.20.24.so /usr/lib/libisc-9.20.24.so /usr/lib/libns-9.20.24.so /usr/lib/libisccc-9.20.24.so /usr/lib/libisccfg-9.20.24.so", added "/usr/lib/libdns-9.20.26.so /usr/lib/libisc-9.20.26.so /usr/lib/libns-9.20.26.so /usr/lib/libisccfg-9.20.26.so /usr/lib/libisccc-9.20.26.so"
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.24.so to libdns-9.20.26.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.24.so to libisccc-9.20.26.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.24.so to libisccfg-9.20.26.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.24.so to libisc-9.20.26.so
  /usr/lib/libns.so changed symlink target from libns-9.20.24.so to libns-9.20.26.so
  /usr/lib/libdns-9.20.24.so moved to /usr/lib/libdns-9.20.26.so
  /usr/lib/libisc-9.20.24.so moved to /usr/lib/libisc-9.20.26.so
  /usr/lib/libisccc-9.20.24.so moved to /usr/lib/libisccc-9.20.26.so
  /usr/lib/libisccfg-9.20.24.so moved to /usr/lib/libisccfg-9.20.26.so
  /usr/lib/libns-9.20.24.so moved to /usr/lib/libns-9.20.26.so
  /usr/include/isc/helper.h was removed

--===============8076392047703903342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="bind-changelog.txt"

Q2hhbmdlbG9nIGZvciBiaW5kOiA5LjIwLjI0IC0+IDkuMjAuMjYKU291cmNlOiBkb2MvY2hhbmdl
bG9nL2NoYW5nZWxvZy05LjIwLjI1LnJzdCwgZG9jL2NoYW5nZWxvZy9jaGFuZ2Vsb2ctOS4yMC4y
Ni5yc3QKCkJJTkQgOS4yMC4yNQotLS0tLS0tLS0tLS0KCi4uIG5vdGU6OgoKICAgVGhlIEJJTkQg
OS4yMC4yNSByZWxlYXNlIHdhcyB3aXRoZHJhd24gYWZ0ZXIgdGhlIGRpc2NvdmVyeSBvZiBhCiAg
IHJlZ3Jlc3Npb24gaW4gYSBzZWN1cml0eSBmaXggaW4gaXQgZHVyaW5nIHByZS1yZWxlYXNlIHRl
c3RpbmcuCgpCSU5EIDkuMjAuMjYKLS0tLS0tLS0tLS0tCgpTZWN1cml0eSBGaXhlcwp+fn5+fn5+
fn5+fn5+fgoKLSBbQ1ZFLTIwMjYtMTEzMzFdIEZpeCBoYW5kbGluZyBvZiBycHogQ05BTUUgZXhw
YW5zaW9uIHRoYXQgcmV0dXJucyBuYW1lCiAgdG9vIGxvbmcuIGBgYjk1MGRhNWY2MjVgYAoKICBQ
cmV2aW91c2x5LCBpZiB0aGUgZXhwYW5zaW9uIG9mIGEgd2lsZGNhcmQgQ05BTUUgUlBaIHBvbGlj
eSByZXN1bHRlZAogIGluIGEgbmFtZSB0aGF0IGV4Y2VlZGVkIHRoZSBsZW5ndGggbGltaXQsIGEg
c2VsZiByZWZlcmVudGlhbCBDTkFNRSBhbmQKICB0aGUgb3JpZ2luYWwgYWRkcmVzcyByZWNvcmQg
d2VyZSByZXR1cm5lZCwgYWxsb3dpbmcgdGhlIHBvbGljeSB0byBiZQogIGJ5cGFzc2VkLiAgSW4g
YnJhbmNoZXMgdXAgdG8gOS4yMCwgdGhpcyBhbHNvIGxlZnQgcXVlcnkgcHJvY2Vzc2luZyBpbgog
IGFuIGluY29uc2lzdGVudCBzdGF0ZSB3aGljaCBjb3VsZCB0cmlnZ2VyIGFuIGFzc2VydGlvbiBm
YWlsdXJlLiAgV2UKICBub3cgcmV0dXJuIGEgWVhET01BSU4gcmVzcG9uc2UsIHdpdGhvdXQgdGhl
IGFkZHJlc3MuCgogIElTQyB3b3VsZCBsaWtlIHRvIHRoYW5rIExhaXRoIE1hc2gnYWwgKDB4bXNo
YWwpIGZvciBicmluZ2luZyB0aGlzCiAgaXNzdWUgdG8gb3VyIGF0dGVudGlvbi4gOmdsOmAjNTg1
NmAKCi0gW0NWRS0yMDI2LTExNzIxXSBJbnZhbGlkIHNpZ25lZCB3aWxkY2FyZCByZWNvcmRzIHdl
cmUgYmVpbmcgYWNjZXB0ZWQuCiAgYGAyNDk3NTJjZDcyZGBgCgogIFNpZ25lZCB3aWxkY2FyZCBy
ZXNwb25zZXMgaW4gd2hpY2ggdGhlIExhYmVscyBmaWVsZCBpbiB0aGUgYFJSU0lHYAogIHJlY29y
ZCB3YXMgbGVzcyB0aGFuIHRoZSBudW1iZXIgb2YgbGFiZWxzIGluIHRoZSBTaWduZXIgTmFtZSBm
aWVsZAogIHdlcmUgYmVpbmcgaW5jb3JyZWN0bHkgYWNjZXB0ZWQuIFRoaXMgaW4gdHVybiBicm9r
ZQogIGBzeW50aC1mcm9tLWRuc3NlY2AsIHdoaWNoIGRlcGVuZHMgb24gc3VjaCByZWNvcmRzIGJl
aW5nIGNvcnJlY3RseQogIHZhbGlkYXRlZC4gVGhpcyBoYXMgYmVlbiBmaXhlZC4KCiAgSVNDIHRo
YW5rcyBRaWZhbiBaaGFuZyBvZiBQYWxvIEFsdG8gTmV0d29ya3MgZm9yIGJyaW5naW5nIHRoaXMg
aXNzdWUKICB0byBvdXIgYXR0ZW50aW9uLiA6Z2w6YCM1ODcxYAoKLSBbQ1ZFLTIwMjYtMTMzMjFd
IEZpeCBETlNTRUMgdmFsaWRhdGlvbiBieXBhc3MgdmlhIG91dC1vZi16b25lIE5TRUMKICBOZXh0
IEZpZWxkLiBgYDZmYmM5NjNkNGFmYGAKCiAgQSBtYWxpY2lvdXMgem9uZSB3aXRoIG91dC1vZi16
b25lIE5TRUMgbmV4dCBvd25lciBuYW1lcyBjYW4gY2F1c2UgYQogIEROU1NFQyB2YWxpZGF0aW5n
IHJlc29sdmVyIHRvIGNhY2hlIHN1Y2ggcmVjb3JkIGFuZCwgaWYKICBgc3ludGgtZnJvbS1kbnNz
ZWNgIGlzIGVuYWJsZWQsIHRvIGdlbmVyYXRlIG5lZ2F0aXZlIGFuc3dlcnMgZm9yIGFueQogIHpv
bmUgdGhhdCBpcyBjb3ZlcmVkIGJ5IHRoZSByYW5nZS4KCiAgSVNDIHdvdWxkIGxpa2UgdG8gdGhh
bmsgUWlmYW4gWmhhbmcgb2YgUGFsbyBBbHRvIE5ldHdvcmtzIGZvcgogIHJlcG9ydGluZyB0aGUg
aXNzdWUuIDpnbDpgIzU4NzNgCgotIFtDVkUtMjAyNi0xMDcyM10gQ29ycmVjdCB2ZXJpZmljYXRp
b24gb2YgTlNFQzMgc2lnbmVyIG5hbWUuCiAgYGBkZjNhYmZjMzE4NGBgCgogIEJJTkQgOSBhY2Nl
cHRlZCBjaGlsZC16b25lIE5TRUMzIHJlY29yZHMgd2hlcmUgdGhlIGZpcnN0IGxhYmVsIGVxdWFs
cwogIHRoZSBoYXNoIG9mIHRoZSBwYXJlbnQgem9uZSBhcyB2YWxpZCBwYXJlbnQtem9uZSBjbG9z
ZXN0IGVuY2xvc2VyCiAgcHJvb2ZzLiBUaGlzIGhhcyBiZWVuIGZpeGVkLgoKICBJU0MgdGhhbmtz
IFFpZmFuIFpoYW5nIG9mIFBhbG8gQWx0byBOZXR3b3JrcyBmb3IgcmVwb3J0aW5nIHRoZSBpc3N1
ZS4KICA6Z2w6YCM1ODc0YAoKLSBbQ1ZFLTIwMjYtMTI2MTddIERvIG5vIGFzc2VydCBmb3Igc29t
ZSBzcGVjaWZpY3MgQ05BTUUgYW5kIEROQU1FCiAgcXVlcmllcy4gYGBkNzVkMWU5Mzk1OGBgCgog
IEEgYnVnIGluIHRoZSByZXNvbHZlcidzIGhhbmRsaW5nIG9mIGNlcnRhaW4gY2FjaGVkIEROQU1F
IGFuZCBDTkFNRQogIHJlc3BvbnNlcyBjb3VsZCBjYXVzZSBuYW1lZCB0byB0cmlnZ2VyIGFuIGFz
c2VydGlvbiBmYWlsdXJlIGFuZCBleGl0LgogIEFuIGF0dGFja2VyIGNvbnRyb2xsaW5nIGEgZG9t
YWluIG5hbWUgYW5kIHRoZSBhdXRob3JpdGF0aXZlIEROUyBzZXJ2ZXIKICBpdCBpcyBob3N0ZWQg
b24gY291bGQgZXhwbG9pdCB0aGlzIGJlaGF2aW9yIHRvIGNhdXNlIGEKICBkZW5pYWwtb2Ytc2Vy
dmljZS4gVGhpcyB2dWxuZXJhYmlsaXR5IGhhcyBiZWVuIGZpeGVkLgoKICBJU0MgdGhhbmtzIFFp
ZmFuIFpoYW5nIG9mIFBhbG8gQWx0byBOZXR3b3JrcyBmb3IgYnJpbmdpbmcgdGhpcyBpc3N1ZQog
IHRvIG91ciBhdHRlbnRpb24uIDpnbDpgIzU5NDZgCgotIFtDVkUtMjAyNi0xMDgyMl0gTWFsZm9y
bWVkIEROU0tFWSByZWNvcmRzIGNvdWxkIHRyaWdnZXIgYW4gYXNzZXJ0aW9uLgogIGBgYTE3Nzdj
ZTdlZTBgYAoKICBQcmV2aW91c2x5LCBgZG5zX25hbWVfZnJvbXdpcmUoKWAgZGlkIG5vdCBob25v
ciB0aGUgcmVjb3JkIGJvdW5kYXJ5CiAgd2hlbiByZWFkaW5nIG5hbWVzIGZyb20gdGhlIHdpcmUs
IGFsbG93aW5nIG1hbGZvcm1lZCByZWNvcmRzIHRvIGJlCiAgYWNjZXB0ZWQgd2hlbiB0aGV5IHNo
b3VsZCBub3QgaGF2ZSBiZWVuLiBJbiBwYXJ0aWN1bGFyLCBtYWxmb3JtZWQKICBETlNLRVkgcmVj
b3JkcyBjb3VsZCB0cmlnZ2VyIGFuIGFzc2VydGlvbiBmYWlsdXJlIHdoZW4gYmVpbmcgcHJpbnRl
ZC4KICBUaGlzIGhhcyBiZWVuIGZpeGVkLiA6Z2w6YCM2MDA0YAoKLSBSZWNsYWltIG1lbW9yeSBw
cm9tcHRseSB3aGVuIEROU1NFQyB2YWxpZGF0aW9ucyBhcmUgY2FuY2VsZWQuCiAgYGBiOGY5ZDc2
NTdhY2BgCgogIFdoZW4gYSByZXNvbHZlciBpcyBmbG9vZGVkIHdpdGggcXVlcmllcyB0aGF0IHJl
cXVpcmUgRE5TU0VDIHZhbGlkYXRpb24KICDigJQgZm9yIGV4YW1wbGUgZHVyaW5nIGEgcmFuZG9t
LXN1YmRvbWFpbiBhdHRhY2sg4oCUIG1hbnkgb2YgdGhvc2UKICB2YWxpZGF0aW9ucyBhcmUgY2Fu
Y2VsZWQgYmVmb3JlIHRoZXkgY29tcGxldGUuIFByZXZpb3VzbHkgYSBjYW5jZWxlZAogIHZhbGlk
YXRpb24gc3RpbGwga2VwdCBpdHMgcGxhY2UgaW4gdGhlIGludGVybmFsIHdvcmsgcXVldWUgYW5k
IGhlbGQKICB0aGUgYXNzb2NpYXRlZCByZXNwb25zZSBpbiBtZW1vcnkgdW50aWwgdGhhdCBxdWV1
ZWQgd29yayBldmVudHVhbGx5CiAgcmFuLCBzbyBtZW1vcnkgY291bGQgY2xpbWIgc2hhcnBseSB1
bmRlciBzdXN0YWluZWQgbG9hZC4gVGhlIGNhbmNlbGVkCiAgd29yayBpcyBub3cgZHJvcHBlZCBh
cyBzb29uIGFzIHRoZSB2YWxpZGF0aW9uIGlzIGNhbmNlbGVkLCByZWxlYXNpbmcKICB0aGUgbWVt
b3J5IGl0IHdhcyBob2xkaW5nLgoKLSBbQ1ZFLTIwMjYtMTE2MDVdIFByZXZlbnQgZXhjZXNzaXZl
IHZhbGlkYXRpb24gd29yayBmcm9tIGNyYWZ0ZWQKICBuZWdhdGl2ZSByZXNwb25zZXMuIGBgNWYx
YmIwYWFkMDlgYAoKICBBIHZhbGlkYXRpbmcgcmVzb2x2ZXIgY291bGQgYmUgbWFkZSB0byBwZXJm
b3JtIGEgbGFyZ2UgYW1vdW50IG9mCiAgRE5TU0VDIHZhbGlkYXRpb24gd29yayBpbiByZXNwb25z
ZSB0byBhIHNpbmdsZSBhbnN3ZXIsIGNvbnN1bWluZwogIGV4Y2Vzc2l2ZSBDUFUuIEEgbWFsaWNp
b3VzIGF1dGhvcml0YXRpdmUgc2VydmVyIHRyaWdnZXJzIHRoaXMgYnkKICByZXR1cm5pbmcgYSBz
aWduZWQgbmVnYXRpdmUgYW5zd2VyIChOWERPTUFJTiBvciBOT0RBVEEpIHBhZGRlZCB3aXRoCiAg
bWFueSBkZW5pYWwtb2YtZXhpc3RlbmNlIHByb29mIHJlY29yZHMsIHdoaWNoIHRoZSByZXNvbHZl
ciBjb250aW51ZWQKICB0byB2ZXJpZnkgYmV5b25kIGl0cyBwZXItcXVlcnkgdmFsaWRhdGlvbiBs
aW1pdC4gSXQgbm93IGVuZm9yY2VzIHRoYXQKICBsaW1pdCBvbiBuZWdhdGl2ZSBhbnN3ZXJzIGFu
ZCByZXR1cm5zIFNFUlZGQUlMIG9uY2UgdGhlIGxpbWl0IGlzCiAgcmVhY2hlZC4KCiAgQ2xvc2Vz
OiBodHRwczovL2dpdGxhYi5pc2Mub3JnL2lzYy1wcm9qZWN0cy9iaW5kOS8tL3dvcmtfaXRlbXMv
NDQ2MwoKLSBbQ1ZFLTIwMjYtMTE2MjJdIFByZXZlbnQgY2FjaGUgZXhoYXVzdGlvbiB1bmRlciBz
dXN0YWluZWQgYXR0YWNrLgogIGBgNDEwYWEyMTVlYWJgYAoKICBUaGUgY2FjaGUgbWVtb3J5IGNh
biBiZWNvbWUgZXhoYXVzdGVkIHdpdGggZXhwaXJlZCBlbnRyaWVzIHdob3NlCiAgbWVtb3J5IGlz
IG5vdCByZWxlYXNlZCBkdWUgdG8gYSBzdXN0YWluZWQgYXR0YWNrIG9uIHRoZSBzYW1lIEROUyBu
YW1lCiAgdGhhdCBwcmV2ZW50cyB0aGUgY2xlYW51cC4gVGhpcyBoYXMgYmVlbiBmaXhlZC4KCiAg
Q2xvc2VzOiBodHRwczovL2dpdGxhYi5pc2Mub3JnL2lzYy1wcm9qZWN0cy9iaW5kOS8tL3dvcmtf
aXRlbXMvNDc2MAoKTmV3IEZlYXR1cmVzCn5+fn5+fn5+fn5+fgoKLSBQcmludCBPUyBwbGF0Zm9y
bSBpbiAibmFtZWQgLVYiIGBgNWJiMzBiMWY5OTNgYAoKICBUaGUgInJ1bm5pbmcgb24iIGxpbmUg
ZW1pdHRlZCBieSBgbmFtZWQgLVZgIChhcyB3ZWxsIGFzIHRoZSBzdGFydHVwCiAgbG9nIGFuZCBg
cm5kYyBzdGF0dXNgLCB3aGljaCBzaGFyZSB0aGUgc2FtZSBzb3VyY2UpIG5vdyBhcHBlbmRzIHRo
ZQogIFBSRVRUWV9OQU1FIHZhbHVlIGZyb20gL2V0Yy9vcy1yZWxlYXNlIGluIHBhcmVudGhlc2Vz
IGFmdGVyIHRoZSB1bmFtZQogIG91dHB1dCwgZS5nLjoKCiAgcnVubmluZyBvbiBMaW51eCB4ODZf
NjQgNi4xOS4xNC0uLi4gKEZlZG9yYSBMaW51eCA0MiAoV29ya3N0YXRpb24KICBFZGl0aW9uKSkK
CiAgVGhpcyBoZWxwcyBkaXNhbWJpZ3VhdGUgZW52aXJvbm1lbnRzIHdoZXJlIHRoZSBrZXJuZWwg
c3RyaW5nIGlzIG5vdCBhCiAgcmVsaWFibGUgaW5kaWNhdG9yIG9mIHRoZSB1c2Vyc3BhY2UsIHN1
Y2ggYXMgUkhFTCBjbG9uZXMgYW5kCiAgY29udGFpbmVycyB3aG9zZSBrZXJuZWwgZG9lcyBub3Qg
bWF0Y2ggdGhlIGhvc3QgT1MuCgogIFdoZW4gL2V0Yy9vcy1yZWxlYXNlIGlzIGFic2VudCwgL3Vz
ci9saWIvb3MtcmVsZWFzZSBpcyB0cmllZCBhcyBhCiAgZmFsbGJhY2sgcGVyIHRoZSBzeXN0ZW1k
IG9zLXJlbGVhc2UoNSkgc3BlY2lmaWNhdGlvbi4gV2hlbiBuZWl0aGVyIGlzCiAgYXZhaWxhYmxl
IG9yIG5vIFBSRVRUWV9OQU1FIGlzIGZvdW5kLCB0aGUgb3V0cHV0IGlzIHVuY2hhbmdlZC4KCiAg
QXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy00LTcgOmdsOmAjNTMzNGAgOmdsOmAhMTIz
MTlgCgpSZW1vdmVkIEZlYXR1cmVzCn5+fn5+fn5+fn5+fn5+fn4KCi0gUmVtb3ZlIHRoZSBzZWNv
bmRhcnkgdmFsaWRhdG9yIGluIHF1ZXJ5LmMuIGBgMTY4N2EzZDBiODVgYAoKICBQcmV2aW91c2x5
LCB3aGVuIHRoZSBhZGRpdGlvbmFsIHNlY3Rpb24gb2YgYSByZXNwb25zZSB3YXMgYmVpbmcKICBw
b3B1bGF0ZWQsIGlmIGNhY2hlZCBkYXRhIHdhcyBmb3VuZCB3aXRoIHBlbmRpbmcgdHJ1c3QsIGl0
IHdvdWxkIGJlCiAgb3Bwb3J0dW5pc3RpY2FsbHkgdmFsaWRhdGVkLiBUaGUgY29kZSBpbXBsZW1l
bnRpbmcgdGhpcyB2YWxpZGF0aW9uIHdhcwogIG5vdCBxdWl0ZSBmb3JtYWxseSBjb3JyZWN0LiBS
YXRoZXIgdGhhbiBmaXhpbmcgaXQsIHRoZSBjb2RlIGhhcyBiZWVuCiAgcmVtb3ZlZDogUlJzZXRz
IHdpdGggcGVuZGluZyB0cnVzdCBhcmUgbm93IG9taXR0ZWQgZnJvbSByZXNwb25zZXMuCiAgOmds
OmAjNTk2NmAgOmdsOmAjNTk2OGAgOmdsOmAjNTk3MmAgOmdsOmAhMTIyNThgCgpGZWF0dXJlIENo
YW5nZXMKfn5+fn5+fn5+fn5+fn5+CgotIFJld29yayBpc2Nfd29yayBhcyBwZXItbG9vcCwgcGVy
LWxhbmUgY2FuY2VsYWJsZSB3b3JrZXIgdGhyZWFkcy4KICBgYDUxZDY3YzE3M2U5YGAKCiAgRm9s
ZCB0aGUgbGlidXYgdGhyZWFkIHBvb2wgYW5kIHRoZSBwZXItbG9vcCBpc2NfaGVscGVyIHRocmVh
ZHMgaW50byBhCiAgc2luZ2xlIGlzY193b3JrIHBvb2wuIEVhY2ggKGxvb3AsIGxhbmUpIGdldHMg
aXRzIG93biBTUFNDIHF1ZXVlIGFuZAogIHdvcmtlciwgd2hpY2ggZHJvcHMgdGhlIHNoYXJlZC1x
dWV1ZSBjb250ZW50aW9uLCBhbmQgdGhlIEZBU1QvU0xPVwogIGxhbmVzIGtlZXAgc2hvcnQgY3J5
cHRvIHRhc2tzIG9mZiB0aGUgbG9uZyBibG9ja2luZyBvbmVzICh6b25lCiAgZHVtcC9sb2FkLCB4
ZnJpbikuIGlzY193b3JrIGpvYnMgYXJlIG5vdyBjYW5jZWxhYmxlOiBpc2Nfd29ya19jYW5jZWwo
KQogIHRvbWJzdG9uZXMgYSBzdGlsbC1xdWV1ZWQgam9iIGFuZCBpdHMgYWZ0ZXJfY2IgZmlyZXMg
d2l0aAogIElTQ19SX0NBTkNFTEVELCBzbyBhYmFuZG9uZWQgd29yayBjYW4gYmUgZHJvcHBlZCBp
bnN0ZWFkIG9mIHJ1biB0bwogIGNvbXBsZXRpb24uIDpnbDpgITEyMjY3YAoKLSBTeW5jIHBpY29o
dHRwcGFyc2VyLmMgd2l0aCB1cHN0cmVhbSBjb21taXQgYTg3NWEwMS4gYGA3YjI0OWExMWUzNGBg
CgogIFN5bmNlZCB3aXRoIHRoZSBoMm8vcGljb2h0dHBwYXJzZXIgdXBzdHJlYW0gcmVwb3NpdG9y
eSB1cCB0byBjb21taXQKICBmNGQ5NGI0OGIzMWUwYWJhZTAyOWViZWFmY2ZkOWNhMDY4MGVkZTU4
LgoKICBUaGlzIGNvbW1pdCBpcyBqdXN0IGh5Z2llbmUgYW5kIGNvbnNpc3RlbmN5IGJ5IGtlZXBp
bmcgdGhlIHZlbmRvcmVkCiAgY29weSBjdXJyZW50LiA6Z2w6YCExMjI3M2AKCkJ1ZyBGaXhlcwp+
fn5+fn5+fn4KCi0gRml4IGEgYnVnIGluIEROUyBVUERBVEUgcHJvY2Vzc2luZyB3aXRoIGlubGlu
ZS1zaWduaW5nIGVuYWJsZWQuCiAgYGBhZDQ2NTBjNzhmYWBgCgogIEluIHJhcmUgY2FzZXMgdGhl
IDppc2NtYW46YG5hbWVkYCBwcm9jZXNzIGNvdWxkIHRlcm1pbmF0ZSB1bmV4cGVjdGVkbHkKICB3
aGVuIHByb2Nlc3NpbmcgYXV0aG9yaXplZCBETlMgVVBEQVRFIG1lc3NhZ2VzIGluIHF1aWNrIHBy
b2Nlc3Npb24KICB3aGljaCBhcmUgdXBkYXRpbmcgYSB6b25lIHdpdGggaW5saW5lLXNpZ25pbmcg
ZW5hYmxlZC4gVGhpcyBoYXMgYmVlbgogIGZpeGVkLiA6Z2w6YCM1ODE2YCA6Z2w6YCExMjMwMGAK
Ci0gUHJvcGVybHkgZGV0ZWN0IHByaXZhdGUgcmVjb3JkcyBiZWZvcmUgY29weWluZy4gYGA1YzE1
M2I4NWU1NGBgCgogIFdlIHdlcmUgdHJpZ2dlcmluZyBhbiBhc3NlcnRpb24gd2hlbiB0cnlpbmcg
dG8gY29weSBhIHByaXZhdGUgcmVjb3JkCiAgdG8gYSBidWZmZXIgZm9yIG1vZGlmeWluZy4gIEV4
dGVuZCB0aGUgcHJpdmF0ZSB0eXBlIGRldGVjdGlvbiBhbmQgY29weQogIHRoZSBjb250ZW50cyBh
ZnRlciB3ZSBoYXZlIHJlamVjdGVkIGludmFsaWQgcHJpdmF0ZSByZWNvcmRzLgogIDpnbDpgIzU4
NTdgIDpnbDpgITEyMzQwYAoKLSBUaWdodGVuICByZWZlcnJhbCBEUyBhY2NlcHRhbmNlLiBgYGVk
MjdmYjk1MjRmYGAKCiAgTmFtZWQgd2FzIGFjY2VwdGluZyBEUyByZWNvcmRzIGZvciBzaWJsaW5n
IHpvbmVzIHdoZW4gaXQgc2hvdWxkbid0CiAgaGF2ZS4gIFRoaXMgaGFzIGJlZW4gZml4ZWQuIDpn
bDpgIzU4NzBgIDpnbDpgITEyMzI1YAoKLSBEb24ndCBzeW50aGVzaXplIG5lZ2F0aXZlIHJlc3Bv
bnNlcyB3aXRoIHBlbmRpbmcgTlNFQy4gYGA4NmI4N2RmZDI5MGBgCgogIElmIGFuIE5TRUMgcmVj
b3JkIGhhcyBub3QgeWV0IGJlZW4gdmFsaWRhdGVkIGFuZCBpcyBjYWNoZWQgd2l0aCB0cnVzdAog
IHBlbmRpbmcsIGRvbid0IHVzZSBpdCB0byBzeW50aGVzaXplIG5lZ2F0aXZlIHJlc3BvbnNlcy4g
OmdsOmAjNTg3MmAKICA6Z2w6YCM1ODg3YCAgOmdsOmAjNTk3N2AgOmdsOmAhMTIzNjhgCgotIENo
ZWNrIHRoYXQgYW4gTlNFQyBzaWduZXIgaXMgYXQgb3IgYWJvdmUgdGhlIG5hbWUgdG8gYmUgdmFs
aWRhdGVkLgogIGBgMmFmY2E4MzQxNDFgYAoKICBBZGQgYSBjaGVjayB0aGF0IGFuIE5TRUMgcmVj
b3JkIGJlaW5nIHVzZWQgYXMgYSBwcm9vZiBvZiBub25leGlzdGVuY2UKICBmb3IgYSBnaXZlbiBu
YW1lIGlzIG5vdCBzaWduZWQgYnkgYSBuYW1lIGxvd2VyIGluIHRoZSBETlMgaGllcmFyY2h5CiAg
dGhhbiB0aGUgb25lIGluIHF1ZXN0aW9uLiA6Z2w6YCM1ODc2YCA6Z2w6YCExMjMyNGAKCi0gRG9u
J3QgZXZpY3QgRE5TU0VDLXZhbGlkYXRlZCBjYWNoZSBkYXRhIG9uIGEgQ0Q9MSBOWERPTUFJTi4K
ICBgYDNlNmNlZjJhYzY2YGAKCiAgV2hlbiBhIGNsaWVudCBzZW50IGEgcXVlcnkgd2l0aCB0aGUg
Y2hlY2tpbmctZGlzYWJsZWQgKENEKSBiaXQgc2V0IGFuZAogIHRoZSBhbnN3ZXIgd2FzIE5YRE9N
QUlOLCB0aGUgcmVzb2x2ZXIgY2FjaGVkIHRoYXQgdW52YWxpZGF0ZWQgbmVnYXRpdmUKICByZXNw
b25zZSBhbmQgZGlzY2FyZGVkIGFueSBETlNTRUMtdmFsaWRhdGVkIHJlY29yZHMgaXQgYWxyZWFk
eSBoZWxkCiAgZm9yIHRoZSBzYW1lIG5hbWUsIGV2ZW4gdGhvdWdoIHRoZSB2YWxpZGF0ZWQgZGF0
YSB3YXMgbW9yZQogIHRydXN0d29ydGh5LiBBIHNpbmdsZSBzdWNoIHJlc3BvbnNlIC0gaW5jbHVk
aW5nIGEgZm9yZ2VkIG9uZSAtIGNvdWxkCiAgZmx1c2ggdmFsaWRhdGVkIHJlY29yZHMgZnJvbSB0
aGUgY2FjaGUgYW5kIGZvcmNlIHRoZSByZXNvbHZlciB0byBmZXRjaAogIHRoZW0gYWdhaW4uIFRo
ZSByZXNvbHZlciBub3cgY2hlY2tzIHRoZSB0cnVzdCBsZXZlbCBvZiB0aGUgZXhpc3RpbmcKICBk
YXRhIGZpcnN0IGFuZCBsZWF2ZXMgdGhlIGNhY2hlIHVuY2hhbmdlZCB3aGVuIGl0IGlzIGFscmVh
ZHkKICB2YWxpZGF0ZWQuIDpnbDpgIzU4NzdgIDpnbDpgITEyMzQ0YAoKLSBGaXggYSAnZGVueS1h
bnN3ZXItYWxpYXNlcycgY29uZmlndXJhdGlvbiBieXBhc3MgaXNzdWUuCiAgYGA0N2QzNzViOWU2
M2BgCgogIEl0IHdhcyBwb3NzaWJsZSB0byB1c2UgYSBtYWxpY2lvdXNseSBjcmFmdGVkIGF1dGhv
cml0YXRpdmUgem9uZSB0bwogIG1ha2UgOmlzY21hbjpgbmFtZWRgIHJlc29sdmVyIHN5bnRoZXNp
emUgYSBgYEROQU1FYGAgImFsaWFzIiB0aGF0CiAgc2hvdWxkIGhhdmUgYmVlbiByZWplY3RlZCBi
eSB0aGUgY29uZmlndXJlZCA6YW55OmBkZW55LWFuc3dlci1hbGlhc2VzYAogIG9wdGlvbi4gVGhp
cyBoYXMgYmVlbiBmaXhlZC4gOmdsOmAjNTkzMGAgOmdsOmAhMTIyNDVgCgotIFJlamVjdCBleHRl
cm5hbCByZWZlcnJhbHMgZnJvbSBmb3J3YXJkZXJzLiBgYGNkYmM1YmU4YjBjYGAKCiAgVW5kZXIg
YGZvcndhcmQtZmlyc3RgIHBvbGljeSBpbiBhIGZvcndhcmRpbmcgem9uZSBCSU5EIGNvdWxkIGFj
Y2VwdCBOUwogIGFib3ZlIHRoZSBmb3J3YXJkIHpvbmUgYXBleCBmcm9tIG5lZ2F0aXZlIHJlc3Bv
bnNlcy4gVGhpcyBoYXMgYmVlbgogIGZpeGVkLgoKICBJU0Mgd291bGQgbGlrZSB0byB0aGFuayBR
aWZhbiBaaGFuZywgb2YgUGFsbyBBbHRvIE5ldHdvcmtzLCBmb3IgdGhlCiAgcmVwb3J0LiA6Z2w6
YCM1OTM3YCA6Z2w6YCExMjI3OGAKCi0gRml4IGEgem9uZSB0cmFuc2ZlciBvdmVyIFRMUyAoWG9U
KSBpc3N1ZSB3aGVuIHVzaW5nIHRoZSBvcHBvcnR1bmlzdGljCiAgVExTIG1vZGUuIGBgNDBiNjRk
MTM4NjJgYAoKICBUaGUgOmlzY21hbjpgbmFtZWRgIHByb2Nlc3MsIHJ1bm5pbmcgYXMgc2Vjb25k
YXJ5IEROUyBzZXJ2ZXIsCiAgY29uZmlndXJlZCB0byB0cmFuc2ZlciBhIHpvbmUgZnJvbSBhIHBy
aW1hcnkgc2VydmVyIHVzaW5nIGFuIGVuY3J5cHRlZAogIFhvVCB0cmFuc3BvcnQgaW4gb3Bwb3J0
dW5pc3RpYyBUTFMgbW9kZSAoaS5lLiB3aXRob3V0IHBlZXIKICBjZXJ0aWZpY2F0ZS9ob3N0bmFt
ZSB2YWxpZGF0aW9uKSBjb3VsZCB0ZXJtaW5hdGUgdW5leHBlY3RlZGx5IHdoZW4gdGhlCiAgVExT
IEFMUE4gbmVnb3RpYXRpb24gd2l0aCBwcmltYXJ5IHNlcnZlciB3YXMgdW5zdWNjZXNzZnVsLiBU
aGlzIGhhcwogIGJlZW4gZml4ZWQuIDpnbDpgIzU5NTdgIDpnbDpgITEyMjQyYAoKLSBVbnZhbGlk
YXRlZCBvcHQtb3V0IE5TRUMzIGNvdWxkIGJlIGFjY2VwdGVkIGluIGluc2VjdXJpdHkgcHJvb2Yu
CiAgYGBjMzczM2UxMmY5ZWBgCgogIFdoZW4gZGV0ZXJtaW5pbmcgd2hldGhlciBhbiBpbnNlY3Vy
ZSBkZWxlZ2F0aW9uIGlzIGxlZ2l0aW1hdGUsIE5TRUMzCiAgb3B0LW91dCByZWNvcmRzIHdoaWNo
IGhhZCBub3QgeWV0IHBhc3NlZCB2YWxpZGF0aW9uIGNvdWxkIGJlIHVzZWQuCiAgVGhpcyBoYXMg
YmVlbiBmaXhlZC4gOmdsOmAjNTk3MGAgOmdsOmAhMTIzNThgCgotIENoZWNrIHdpbGRjYXJkIHNp
Z25lciBhbmQgTk9RTkFNRSBzaWduZXIgbWF0Y2guIGBgMzYyMWM4MTY5YmZgYAoKICBBIHBvc2l0
aXZlIHdpbGRjYXJkIGFuc3dlciwgYW5kIHRoZSBOU0VDMyBwcm9vZiB0aGF0IHRoZSByZXF1ZXN0
ZWQKICBuYW1lIGRvZXNuJ3QgZXhpc3QgaW4gdGhlIHpvbmUsIG11c3QgYm90aCBiZSBmcm9tIHRo
ZSBzYW1lIHpvbmUuCiAgT3RoZXJ3aXNlLCBhbiBOU0VDMyBmcm9tIGFuIGFuY2VzdG9yIHpvbmUg
Y291bGQgYmUgdXNlZCB0byBpbnRlcmZlcmUKICB3aXRoIHZhbGlkYXRpb24uCgogIFdlIG5vdyBy
ZXRyaWV2ZSB0aGUgc2lnbmVyIG5hbWUgZnJvbSBhIHdpbGRjYXJkIHJlc3BvbnNlJ3Mgc2lnbmF0
dXJlLgogIEFuIE5TRUMzIHJlY29yZCBjYW5ub3QgYmUgdXNlZCBhcyBhIE5PUU5BTUUgcHJvb2Yg
Zm9yIHRoZSB3aWxkY2FyZAogIHVubGVzcyBpdCBleGFjdGx5IG1hdGNoZXMgdGhlIG5hbWUgb25l
IGxldmVsIGFib3ZlIHRoZSBOU0VDMy4KICA6Z2w6YCM1OTcxYCA6Z2w6YCExMjI3OWAKCi0gUmVx
dWlyZSBzZWN1cmUgdHJ1c3QgZm9yIGNvdmVyaW5nIE5TRUMgaW4gdGhlIFJCVCBjYWNoZS4KICBg
YGI2YmZhNDQ0ZTViYGAKCiAgVGhlIGd1YXJkIGFnYWluc3Qgc3ludGhlc2l6aW5nIG5lZ2F0aXZl
IGFuc3dlcnMgZnJvbSBhIHBlbmRpbmcgTlNFQwogICgjNTk3Nykgd2FzIG9ubHkgYWRkZWQgdG8g
dGhlIFFQIGNhY2hlJ3MgZmluZF9jb3ZlcmluZ25zZWMoKTsgdGhlIFJCVAogIGNhY2hlIGRhdGFi
YXNlIGtlcHQgYmluZGluZyBhbnkgY292ZXJpbmcgTlNFQyByZWdhcmRsZXNzIG9mIHRydXN0LiAg
T24KICBidWlsZHMgY29uZmlndXJlZCB3aXRoIC0td2l0aC1jYWNoZWRiPXJidCB0aGlzIGxldHMg
YSBwaWdneS1iYWNrZWQsCiAgdW52YWxpZGF0ZWQgTlNFQyBkcml2ZSBhIHN5bnRoZXNpemVkIE5Y
RE9NQUlOLCByZXZpdmluZyB0aGUgY2FjaGUKICBwb2lzb25pbmcgdGhhdCB3YXMgZml4ZWQgZm9y
IHRoZSBkZWZhdWx0IGNhY2hlLgoKICBxdWVyeV9jb3ZlcmluZ25zZWMoKSBvbmx5IHZlcmlmaWVz
IHRoZSBjb3ZlcmluZyBOU0VDJ3MgdHJ1c3Qgb24gaXRzCiAgTk9EQVRBIHBhdGg7IHRoZSBOWERP
TUFJTiBwYXRoIHJlbGllcyBvbiB0aGUgZGF0YWJhc2UgcmV0dXJuaW5nIGEKICBzZWN1cmUgcmVj
b3JkLiAgUmVxdWlyZSB0aGUgTlNFQyBhbmQgaXRzIFJSU0lHIHRvIGJlIGRuc190cnVzdF9zZWN1
cmUKICBpbiBmaW5kX2NvdmVyaW5nbnNlYygpLCBtYXRjaGluZyB0aGUgUVAgY2FjaGUuIDpnbDpg
IzU5NzdgCiAgOmdsOmAhMTIzNzRgCgotIENoZWNrIGRuc19yZGF0YV9mcm9tc3RydWN0KCkgcmV0
dXJuIHZhbHVlcy4gYGA0MTZiMDgxN2QxYmBgCgogIEluIHNvbWUgZnVuY3Rpb25zIGltcGxlbWVu
dGluZyBSRkMgNTAxMSBrZXkgbWFpbnRlbmFuY2UsIHRoZSByZXN1bHRzCiAgb2YgYGRuc19yZGF0
YV9mcm9tc3RydWN0KClgIHdlcmUgbm90IGNoZWNrZWQuIFRoaXMgaGFzIGJlZW4gZml4ZWQuCiAg
OmdsOmAjNTk4MmAgOmdsOmAhMTIxODNgCgotIEZpeCBDTkFNRSByZXNvbHV0aW9uIGZhaWx1cmUg
Y2F1c2VkIGJ5IGEgY2FjaGVkIFNFUlZGQUlMIHJlc3BvbnNlLgogIGBgYjFlMGE1OGY0ZjJgYAoK
ICBVbmRlciBjZXJ0YWluIGNpcmN1bXN0YW5jZXMsIGEgY2FjaGVkIFNFUlZGQUlMIHJlc3BvbnNl
IGNvdWxkCiAgaW5jb3JyZWN0bHkgcHJldmVudCBzdWNjZXNzZnVsIHJlc29sdXRpb24gb2YgYSBD
TkFNRSB0YXJnZXQuIFRoaXMKICBjb3VsZCBjYXVzZSByZXNvbHV0aW9uIGZhaWx1cmVzIHRvIHBl
cnNpc3QgdW50aWwgdGhlIGNhY2hlZCBTRVJWRkFJTAogIGVudHJ5IGV4cGlyZWQsIGV2ZW4gd2hl
biB0aGUgQ05BTUUgdGFyZ2V0IGl0c2VsZiB3YXMgb3RoZXJ3aXNlCiAgcmVzb2x2YWJsZS4gVGhp
cyBpc3N1ZSBoYXMgYmVlbiBmaXhlZC4gOmdsOmAjNTk4M2AgOmdsOmAhMTIyNTlgCgotIFtDVkUt
MjAyNi0xMzIwNF0gUHJldmVudCBjcmFzaCBmcm9tIG1hbGZvcm1lZCBOU0VDL05TRUMzIHJlc3Bv
bnNlLgogIGBgYWQzOTNiMDkyMzJgYAoKICBBbiBhc3NlcnRpb24gY291bGQgYmUgdHJpZ2dlcmVk
IGJ5IGFuIGltcHJvcGVybHkgc2lnbmVkIE5PUU5BTUUgcHJvb2YuCiAgVGhpcyBoYXMgYmVlbiBm
aXhlZC4KCiAgSVNDIHRoYW5rcyBRaWZhbiBaaGFuZyBvZiBQYWxvIEFsdG8gTmV0d29ya3MgZm9y
IHJlcG9ydGluZyB0aGUgaXNzdWUuCiAgOmdsOmAjNTk4NWAKCi0gUmVqZWN0IHVuc3VwcG9ydGVk
IFJTQSBETlNLRVkgc2hhcGVzIGR1cmluZyBETlNTRUMgdmFsaWRhdGlvbi4KICBgYGVhOTE1NzA0
OTJjYGAKCiAgQW4gYXV0aG9yaXRhdGl2ZSBzZXJ2ZXIgcHVibGlzaGluZyBhbiBSU0EgRE5TS0VZ
IHdpdGggYW4gdW51c3VhbGx5CiAgbGFyZ2UgbW9kdWx1cyBvciBhbiBleG90aWMgcHVibGljIGV4
cG9uZW50IGNvdWxkIG1ha2UgZWFjaCBETlNTRUMKICBzaWduYXR1cmUgY2hlY2sgb24gYSB2YWxp
ZGF0aW5nIHJlY3Vyc2l2ZSByZXNvbHZlciBub3RpY2VhYmx5IG1vcmUKICBleHBlbnNpdmUgdGhh
biBmb3IgYSBub3JtYWxseSBzaXplZCBrZXkuICBTdWNoIEROU0tFWXMgYXJlIG5vdyB0cmVhdGVk
CiAgYXMgaW52YWxpZC4gOmdsOmAjNjAwOGAgOmdsOmAhMTIyMDdgCgotIEZpeCBhIGJ1ZyBpbiBH
ZW9JUDIgc3RyaW5nIG1hdGNoaW5nLiBgYGY4ZjVlNmE5ZDc3YGAKCiAgV2hlbiB1c2luZyBHZW9J
UDIgQUNMcyAoc2VlIDphbnk6YGFjbGApLCA6aXNjbWFuOmBuYW1lZGAgY291bGQKICBpbmNvcnJl
Y3RseSBtYXRjaCBhIG5hbWUgdXNpbmcgYSBzdWItc3RyaW5nIGluc3RlYWQgb2YgdGhlIGZ1bGwg
bmFtZQogIG1hdGNoLiBUaGlzIGhhcyBiZWVuIGZpeGVkLiA6Z2w6YCM2MDE5YCA6Z2w6YCExMjIz
NWAKCi0gRml4IEROUy1vdmVyLUhUVFBTIChEb0gpIHF1b3RhIGNvbmZpZ3VyYXRpb24gaXNzdWUu
IGBgNzJkNTM4ZmUyNjlgYAoKICBUaGUgOmFueTpgaHR0cC1saXN0ZW5lci1jbGllbnRzYCBhbmQK
ICA6YW55OmBodHRwLXN0cmVhbXMtcGVyLWNvbm5lY3Rpb25gIGNvbmZpZ3VyYXRpb24gb3B0aW9u
cyBjb3VsZCBiZQogIHRydW5jYXRlZCB0byBzbWFsbGVyIHZhbHVlcyAob3IgdG8gYGAwYGAsIHdo
aWNoIG1lYW5zIHVubGltaXRlZCkgd2hlbgogIHZlcnkgYmlnIGNvbmZpZ3VyYXRpb24gdmFsdWVz
IHdlcmUgdXNlZCwgd2hpY2ggZXhjZWVkZWQgYGA2NTUzNWBgLiBBcwogIGEgbm90ZSAtIGl0IGlz
IHZlcnkgdW5saWtlbHkgdGhhdCBzdWNoIGJpZyB2YWx1ZXMgYXJlIHVzZWQgaW4KICBwcm9kdWN0
aW9uLCBhbmQgdGhlIGRlZmF1bHQgdmFsdWVzIGZvciB0aGUgYWZmZWN0ZWQgb3B0aW9ucyBhcmUK
ICBgYDMwMGBgIGFuZCBgYDEwMGBgLCBjb3JyZXNwb25kaW5nbHkuIFRoaXMgaGFzIGJlZW4gZml4
ZWQuIDpnbDpgIzYwMjFgCiAgOmdsOmAhMTIyMzFgCgotIEZpeCBpbnZhbGlkIHBvaW50ZXIgcmVs
ZWFzZSBpbiBKU09OIHN0YXRpc3RpY3MtY2hhbm5lbCByZXNwb25zZS4KICBgYDVmZTc0MmUzZmQx
YGAKCiAgRWFjaCByZXNwb25zZSBzZXJ2ZWQgb24gYSBKU09OIHN0YXRpc3RpY3MgZW5kcG9pbnQg
cmVsZWFzZWQgdGhlIHdyb25nCiAgcG9pbnRlciB0byB0aGUgSlNPTiBsaWJyYXJ5IGFmdGVyIHRo
ZSByZXNwb25zZSB3YXMgc2VudDogdGhlIHJlc3BvbnNlCiAgYm9keSBzdHJpbmcgaW5zdGVhZCBv
ZiB0aGUgSlNPTiBkb2N1bWVudC4gIFdpdGggdGhlIGN1cnJlbnQgcmVzcG9uc2VzCiAgdGhpcyBk
b2VzIG5vdCBjcmFzaCBuYW1lZCBpbiBwcmFjdGljZSwgYnV0IHRoZSBjYWxsIGlzIGluY29ycmVj
dCBhbmQKICBjYW4gaW4gcHJpbmNpcGxlIGNvcnJ1cHQgbWVtb3J5LiAgWE1MIHJlc3BvbnNlcyBh
cmUgbm90IGFmZmVjdGVkLgogIDpnbDpgIzYwMjRgIDpnbDpgITEyMjc0YAoKLSBUcnVuY2F0ZWQg
cmVwbHkgdG8gYSBUU0lHIHF1ZXJ5IG5vIGxvbmdlciBzdGFsbHMgdGhlIHJlc29sdmVyLgogIGBg
YzkyMmNhYmQ0NmRgYAoKICBXaGVuIGFuIHVwc3RyZWFtIHNlcnZlciByZXR1cm5lZCBhIHRydW5j
YXRlZCByZXBseSB0byBhIHF1ZXJ5IHRoYXQKICBCSU5EIGhhZCBzaWduZWQgd2l0aCBUU0lHLCB0
aGUgcmVzb2x2ZXIgY291bGQga2VlcCB3YWl0aW5nIGZvciBhCiAgZm9sbG93LXVwIFVEUCBwYWNr
ZXQgdGhhdCBuZXZlciBhcnJpdmVkLCBzbyB0aGUgcXVlcnkgc3RhbGxlZCB1bnRpbCBpdAogIGhp
dCByZXNvbHZlci1xdWVyeS10aW1lb3V0IGFuZCB0aGUgY2xpZW50IHJlY2VpdmVkIG5vIGFuc3dl
ci4gQklORCBub3cKICB0cmVhdHMgYW55IHJlcGx5IGl0IGNhbm5vdCBhdXRoZW50aWNhdGUgYXMg
YW4gaW1tZWRpYXRlIGZhaWx1cmUgYW5kCiAgcmV0dXJucyBTRVJWRkFJTCByaWdodCBhd2F5IGFz
IGEgZGVmZW5zZSBpbiBkZXB0aC4gOmdsOmAjNjAyOGAKICA6Z2w6YCExMjMxMGAKCi0gSWdub3Jl
IHVwZGF0ZXMgcmVtb3ZpbmcgRE5TS0VZIFJSc2V0IHdpdGggY2xhc3MgQU5ZLiBgYDZhNTMzZWM2
MjJjYGAKCiAgV2hlbiBhIER5bmFtaWMgVXBkYXRlIGlzIHJlY2VpdmVkIHRoYXQgcmVtb3ZlcyB0
aGUgYGBETlNLRVlgYCAob3IKICBgYENETlNLRVlgYCwgb3IgYGBDRFNgYCkgUlJzZXQsIHJlbW92
ZSBhbGwgcmVjb3JkcyBleGNlcHQgdGhlIG9uZXMKICB0aGF0IGFyZSBpbiB1c2UgZm9yIHNpZ25p
bmcgZm9yIHRoZSB6b25lLiA6Z2w6YCM2MDQ1YCA6Z2w6YCExMjIzMGAKCi0gRml4IGEgbWVtb3J5
IGxlYWsgd2hlbiB1cGRhdGluZyBhIHpvbmUgd2l0aCBtb3JlIHRoYW4gMzIgRE5TU0VDIGtleXMu
CiAgYGA3MzQ0MDgxNmU0MWBgCgogIEFwcGx5aW5nIGNoYW5nZXMgdG8gYSBzaWduZWQgem9uZSDi
gJQgdmlhIEROUyBVUERBVEUgb3IgdGhlCiAgaW5saW5lLXNpZ25pbmcgcmF3LXRvLXNlY3VyZSBz
eW5jIOKAlCBsZWFrZWQgdGhlIHN1cnBsdXMga2V5cyB3aGVuIHRoZQogIHpvbmUncyBrZXkgZGly
ZWN0b3J5IGhlbGQgbW9yZSB0aGFuIDMyLCBzbG93bHkgZ3Jvd2luZyBuYW1lZCdzIG1lbW9yeQog
IHVzZS4gOmdsOmAjNjA1MWAgOmdsOmAhMTIzMzJgCgotIEZpeCB0aGUgbWVtb3J5IG9yZGVyaW5n
IGluIHRoZSBhZGFwdGl2ZSByZWFkLXdyaXRlIGxvY2suCiAgYGBlZmY5YTMwNmQ4OGBgCgogIE9u
IGhhcmR3YXJlIHdpdGggYSB3ZWFrIG1lbW9yeSBtb2RlbCwgdGhlIGludGVybmFsIHJlYWQtd3Jp
dGUgbG9jawogIGNvdWxkIGJyaWVmbHkgYWRtaXQgYSByZWFkZXIgYW5kIGEgd3JpdGVyIGF0IHRo
ZSBzYW1lIHRpbWUsIHJpc2tpbmcKICBzcG9yYWRpYyBjcmFzaGVzIG9yIGluY29ycmVjdCBkYXRh
LiBUaGUgcmVhZGVyL3dyaXRlciBoYW5kc2hha2Ugbm93CiAgdXNlcyBzZXF1ZW50aWFsbHkgY29u
c2lzdGVudCBvcmRlcmluZyBzbyB0aGUgdHdvIGNhbiBubyBsb25nZXIKICBvdmVybGFwLiA6Z2w6
YCM2MDYwYCA6Z2w6YCExMjIwNWAKCi0gUHJpbnQgdGhlIGZ1bGwgT0lEIGluIFBSSVZBVEVPSUQg
a2V5IGNvbW1lbnRzLiBgYDg3Mzk3YzgyM2RjYGAKCiAgVGhlIE9JRCBpbiB0aGUgIjsgYWxnID0g
Li4uIiBjb21tZW50IG9mIGEgUFJJVkFURU9JRCBrZXkgd2FzIHRydW5jYXRlZAogIHRvIHNpeHRl
ZW4gY2hhcmFjdGVycy4gOmdsOmAjNjA5MmAgOmdsOmAhMTIzNzhgCgotIENvcnJlY3QgbG9jYXRv
ciBkZWNvZGluZyBmb3IgTklELCBMNjQsIGFuZCBMMzIgcmVjb3Jkcy4KICBgYDhhOGNjMzRhNTA0
YGAKCiAgTklELCBMNjQsIGFuZCBMMzIgcmVjb3JkcyB3ZXJlIGRlY29kZWQgaW5jb3JyZWN0bHkg
d2hlbiBjb252ZXJ0ZWQgaW50bwogIHRoZWlyIHBhcnNlZCBzdHJ1Y3R1cmVzLCBiZWNhdXNlIHRo
ZSBwcmVmZXJlbmNlIGZpZWxkIHdhcyBub3Qgc2tpcHBlZAogIGJlZm9yZSB0aGUgbG9jYXRvci4g
OmdsOmAjNjA5N2AgOmdsOmAhMTIzNDlgCgotIEZpeCBhIHBvc3NpYmxlIGNyYXNoIHdoZW4gY2xl
YW5pbmcgdXAgYSB2aWV3J3MgY2FjaGVzLiBgYDUxZDc0NTYzOTlkYGAKCiAgSW4gcmFyZSBjYXNl
cyBuYW1lZCBjb3VsZCBjcmFzaCB3aGlsZSBhIHZpZXcgd2FzIGJlaW5nIHJlbW92ZWQsIGZvcgog
IGV4YW1wbGUgZHVyaW5nIHJlY29uZmlndXJhdGlvbiBvciBzaHV0ZG93biwgYXMgaXRzIGludGVy
bmFsIGNhY2hlcwogIHdlcmUgdG9ybiBkb3duLiBUaGlzIGhhcyBiZWVuIGZpeGVkLiA6Z2w6YCM2
MTE5YCA6Z2w6YCExMjE5MGAKCi0gUHJlc2VydmUgdGhlIHJlcXVlc3QgbWVzc2FnZSBhY3Jvc3Mg
YXN5bmMgU0lHKDApIHByb2Nlc3NpbmcuCiAgYGBkNmE0YWE1Y2U1MGBgCgogIEZvciBTSUcoMCkt
c2lnbmVkIHJlcXVlc3RzLCB2aWV3IG1hdGNoaW5nIGlzIG9mZmxvYWRlZCBhbmQgdGhlIHJlcXVl
c3QKICBpcyBmaW5pc2hlZCBhc3luY2hyb25vdXNseSBmcm9tIG5zX2NsaWVudF9yZXF1ZXN0X2Nv
bnRpbnVlKCksIHdoaWNoCiAgcGFzc2VzIGNsaWVudC0+aW5uZXIuYnVmZmVyIHRvIGRuc19kdF9z
ZW5kKCkuICBUaGF0IGJ1ZmZlciBhbGlhc2VzIHRoZQogIG5ldHdvcmsgbWFuYWdlcidzIHJlY2Vp
dmUgYnVmZmVyLCBvbmx5IHZhbGlkIGR1cmluZyB0aGUgcmVhZCBjYWxsYmFjaywKICBzbyBpdCBt
YXkgYWxyZWFkeSBiZSBmcmVlZCBhbmQgcmV1c2VkLCBwcm9kdWNpbmcgZ2FyYmFnZSBkbnN0YXAg
ZnJhbWVzCiAgKGUuZy4gdGhlICJ1cGZvcndkIiBzaWcwLW92ZXItRG9UIHRlc3QgZmFpbHMgd2l0
aCBVUT0wKS4KCiAgQ29weSB0aGUgcmVxdWVzdCBtZXNzYWdlIHdoZW4gZW50ZXJpbmcgYXN5bmMg
bW9kZSBhbmQgcmVmZXJlbmNlIHRoZQogIGNvcHksIGZyZWVpbmcgaXQgaW4gbnNfX2NsaWVudF9y
ZXNldF9jYigpLgoKICBBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTQtOCA6Z2w6YCM2
MTM5YCA6Z2w6YCExMjIwMGAKCi0gSWdub3JlIDAtYnl0ZSByZWFkcyBpbiB0aGUgVENQIHJlYWQg
Y2FsbGJhY2suIGBgODU4OGZmZWM3ZGVgYAoKICBDYWxsYmFja3MgZm9yIGxpYnV2IHN0cmVhbSBy
ZWFkcyBkbyBub3Qgc2lnbmFsIHplcm8tbGVuZ3RoIHJlYWRzIGFzIGEKICBmYWlsdXJlIHNpZ25h
bCBidXQgcmF0aGVyIGFzIEVBR0FJTi9FV09VTERCTE9DSy4gVGhpcyBjYW4gdHJpZ2dlciBhbgog
IGFzc2VydGlvbiB3aGVuIGEgemVyby1sZW5ndGggcmVhZCBpcyBwdXNoZWQgb250byBhIFBST1hZ
djIgZW5kcG9pbnQKICB0aGF0IGhhcyBub3QgeWV0IHByb2Nlc3NlZCB0aGUgaGVhZGVycyBhcyBp
dCBleHBlY3RzIGEgbm9uLU5VTEwgcmVnaW9uCiAgb2YgcG9zaXRpdmUgbGVuZ3RoLiA6Z2w6YCM2
MTQwYCA6Z2w6YCExMjI5MWAKCi0gSW5jbHVkZSB0aGUgSVB2NiBhZGRyZXNzJ3MgYnJhY2tldHMg
aW4gdGhlIHBhcnNlZCBVUkwvVVJJIGhvc3QuCiAgYGA5YmFhZDQ4YmUwNmBgCgogIFRoZSBicmFj
a2V0cyBhcmUgbm90IGluY2x1ZGVkIGluIHRoZSBob3N0IGNvbXBvbmVudCBvZiB0aGUgcGFyc2Vk
CiAgVVJML1VSSS4gQ2hhbmdlIHRoZSBwYXJzZXIgdG8gaW5jbHVkZSB0aGUgYnJhY2tldHMuIDpn
bDpgIzYxNDdgCiAgOmdsOmAhMTIzNjJgCgotIEltcHJvdmUgdGhlIGlucHV0IHZhbGlkYXRpb24g
b2YgdGhlIGlzY191cmxfcGFyc2UoKSBmdW5jdGlvbi4KICBgYGY0YzhmMDgwNDJhYGAKCiAgVGhl
IGlzY191cmxfcGFyc2UoKSBmdW5jdGlvbiBmYWlsZWQgdG8gY2hlY2sgdGhlIGlucHV0IGJ1ZmZl
cidzIGxlbmd0aAogIGFuZCBhc3N1bWVkIHRoYXQgaXQgY2FuJ3QgYmUgYmlnZ2VyIHRoYW4gVUlO
VDE2X01BWCwgYmVjYXVzZSBib3RoIHRoZQogICdvZmYnIGFuZCAnbGVuJyBmaWVsZHMgb2YgdGhl
ICdpc2NfdXJsX3BhcnNlcl90JyBzdHJ1Y3R1cmUgYXJlCiAgdWludDE2X3QuCgogIEFkZCBhIGNo
ZWNrIHRvIG5vdCBhY2NlcHQgYSBidWZmZXIgbG9uZ2VyIHRoYW4gODE5MiBvY3RldHMuCiAgOmds
OmAjNjE1MGAgOmdsOmAhMTIzNjFgCgotIE9ubHkgcHJpbnQgcGVyIHpvbmUgZ2x1ZSBzdGF0cyB3
aGVuIHF1ZXJ5IHN0YXRpc3RpY3MgaXMgZnVsbC4KICBgYDA5N2U1MzAzNDhmYGAKCiAgVGhlIGNv
ZGUgcHJpbnRpbmcgcXVlcnkgc3RhdGlzdGljcyB3YXMgaWdub3JpbmcgdGhlIHpvbmUtc3RhdGlz
dGljcwogIG9wdGlvbi4gVGhpcyBoYXMgYmVlbiBmaXhlZC4gOmdsOmAjNjE2NGAgOmdsOmAhMTIy
NjNgCgotIENEUy9DRE5TS0VZIHJlY29yZHMgd2VyZSBub3QgcmVtb3ZlZCB3aGVuIHJlLWNvbmZp
Z3VyaW5nIHRoZSBzZXJ2ZXIuCiAgYGAyMGRiMDIxMjFmN2BgCgogIFdoZW4gb24gYW4gYGBybmRj
IHJlY29uZmlnYGAgdGhlIEROU1NFQyBwb2xpY3kgY2hhbmdlcyBzdWNoIHRoYXQgaXQKICBjaGFu
Z2VzIHRoZSBleHBlY3RlZCBgYENETlNLRVlgYCBhbmQvb3IgYGBDRFNgYCByZWNvcmRzIGluIHRo
ZSB6b25lLAogIHRoZSBSUnNldCBzaG91bGQgYmUgdXBkYXRlZCBhY2NvcmRpbmdseS4gVGhpcyBk
aWQgbm90IGhhcHBlbiB3aGVuCiAgcmVtb3ZpbmcgZGlnZXN0cyBmcm9tIHRoZSBjb25maWd1cmF0
aW9uLCBvciBzZXR0aW5nIGBjZG5za2V5IG5vO2AuCiAgVGhpcyBoYXMgYmVlbiBmaXhlZC4gOmds
OmAjNjE2NmAgOmdsOmAhMTIyODRgCgotIEZpeCBhIGNyYXNoIHdoZW4gcXVlcnlpbmcgYW4gZW1w
dHkgbm9uLXRlcm1pbmFsIGluIGEgd2lsZGNhcmQgem9uZSBpbgogIFJCVERCLiBgYGI4ZTU4MDFl
YzVmYGAKCiAgQSBxdWVyeSBmb3IgYW4gZW1wdHkgbm9uLXRlcm1pbmFsIGluIGEgd2lsZGNhcmQg
em9uZSBzZXJ2ZWQgZnJvbSB0aGUKICBSQlQgem9uZSBkYXRhYmFzZSBjb3VsZCBhYm9ydCBuYW1l
ZCB3aXRoIGFuIGFzc2VydGlvbiBmYWlsdXJlLiAgSXQgbm93CiAgcmV0dXJucyB0aGUgY29ycmVj
dCBOT0RBVEEgYW5zd2VyLiA6Z2w6YCM2MTcwYCA6Z2w6YCExMjI5OWAKCi0gU3RvcCByZXVzaW5n
IG91dGdvaW5nIFRDUCBjb25uZWN0aW9ucyB0aGUgcGVlciBoYXMgYWxyZWFkeSBjbG9zZWQuCiAg
YGBmYjBhZThhNWQ2YmBgCgogIGBgbmFtZWRgYCBjb3VsZCBoYW5kIGEgbmV3IHF1ZXJ5IGFuIGlk
bGUgZm9yd2FyZGVyL3Vwc3RyZWFtIFRDUCBvciBUTFMKICBjb25uZWN0aW9uIHRoYXQgdGhlIHBl
ZXIgaGFkIGFscmVhZHkgY2xvc2VkLCBjYXVzaW5nIHRoZSBxdWVyeSB0byBmYWlsCiAgKGFuZCBD
TE9TRS1XQUlUIHNvY2tldHMgdG8gcGlsZSB1cCkuIElkbGUgcmV1c2VkIGNvbm5lY3Rpb25zIGFy
ZSBub3cKICB3YXRjaGVkLCBzbyBhIGNsb3NlIGlzIG5vdGljZWQgYW5kIHRoZSBjb25uZWN0aW9u
IGlzIGRyb3BwZWQgaW5zdGVhZAogIG9mIHJldXNlZC4gQSBuZXcgYGB0Y3AtcmV1c2UtdGltZW91
dGBgIG9wdGlvbiBjb250cm9scyBob3cgbG9uZyBhbgogIGlkbGUgb3V0Z29pbmcgY29ubmVjdGlv
biBpcyBrZXB0IG9wZW4gZm9yIHJldXNlIChkZWZhdWx0IDUgc2Vjb25kcykuCiAgOmdsOmAjNjE3
MWAgOmdsOmAhMTIzMTdgCgotIEZpeCBETlNTRUMgdmFsaWRhdGlvbiBmYWlsdXJlcyBmb3IgbmFt
ZXMgdW5kZXIgYW4gYXBleCBETkFNRS4KICBgYGNkMDA2ZWNmMjM1YGAKCiAgRE5TU0VDIHZhbGlk
YXRpb24gY291bGQgZmFpbCB3aXRoIFNFUlZGQUlMIGZvciBuYW1lcyBjb3ZlcmVkIGJ5IGEKICBE
TkFNRSBhdCB0aGUgYXBleCBvZiBhIHNpZ25lZCB6b25lLCB1bmxlc3MgdGhlIHpvbmUncyBrZXlz
IHdlcmUKICBhbHJlYWR5IHZhbGlkYXRlZCBpbiB0aGUgY2FjaGUuIFRoaXMgcmVncmVzc2lvbiB3
YXMgaW50cm9kdWNlZCBieSB0aGUKICByZWNlbnQgZml4IGZvciByZXNvbHZlciBzdGFsbHMgb24g
Q05BTUUgcmVzcG9uc2VzIHRvIERTIHF1ZXJpZXMuCiAgOmdsOmAjNjE3NmAgOmdsOmAhMTIzNTZg
CgotIEF2b2lkIG5lZWRsZXNzIHF1ZXJpZXMgd2hlbiB0aGUgRE5TU0VDIHZhbGlkYXRpb24gbGlt
aXQgaXMgcmVhY2hlZC4KICBgYDQ1YTNlNWI4NTYxYGAKCiAgQSB2YWxpZGF0aW5nIHJlc29sdmVy
IGNvdWxkIHNlbmQgb25lIG5lZWRsZXNzIHVwc3RyZWFtIHF1ZXJ5IGFmdGVyCiAgcmVhY2hpbmcg
aXRzIHBlci1mZXRjaCBETlNTRUMgdmFsaWRhdGlvbiBsaW1pdC4gSXQgbm93IHN0b3BzCiAgaW1t
ZWRpYXRlbHkuCgotIEF2b2lkIHdyaXRpbmcgdGhyb3VnaCBhIGNvbnN0IHBvaW50ZXIgaW4gcmVu
ZGVyX3hzbCgpIGBgMzQ4ZTVhOWVlNTRgYAoKICByZW5kZXJfeHNsKCkgc2VydmVkIHRoZSBzdGF0
aWMgWFNMIHN0eWxlc2hlZXQgYnkgY2FzdGluZyBhd2F5IHRoZQogIGNvbnN0IHF1YWxpZmllciBv
ZiB4c2xtc2cgYW5kIGhhbmRpbmcgdGhlIHBvaW50ZXIgdG8KICBpc2NfYnVmZmVyX3JlaW5pdCgp
OgoKICBwID0gVU5DT05TVCh4c2xtc2cpOyAgICAgaXNjX2J1ZmZlcl9yZWluaXQoYiwgcCwgc3Ry
bGVuKHhzbG1zZykpOwoKICBpc2NfYnVmZmVyX3JlaW5pdCgpIGNvcGllcyBhbnkgcHJlLWV4aXN0
aW5nIGJ1ZmZlciBjb250ZW50IGludG8gdGhlCiAgbmV3IGJhc2Ugd2l0aCBtZW1tb3ZlKCksIHNv
IHRoZSBjYWxsIHdvdWxkIHdyaXRlIGludG8geHNsbXNnLCB3aGljaCBpcwogIGEgJ2NvbnN0IGNo
YXJbXScgbGl2aW5nIGluIHJlYWQtb25seSBtZW1vcnkuICBUaGlzIGlzIHNhZmUgdG9kYXkgb25s
eQogIGJlY2F1c2UgdGhlIHN1cHBsaWVkIGJvZHlidWZmZXIgaXMgYWx3YXlzIGZyZXNobHkgaW5p
dGlhbGl6ZWQgd2l0aAogIGxlbmd0aCAwLCBzbyB0aGUgbWVtbW92ZSgpIG5ldmVyIHJ1bnMgLS0g
YSBmcmFnaWxlLAogIGFjdGlvbi1hdC1hLWRpc3RhbmNlIGludmFyaWFudCB0aGF0IEdDQydzIC1m
YW5hbHl6ZXIgZmxhZ3MgYXMgYSB3cml0ZQogIHRvIGEgY29uc3Qgb2JqZWN0ICgtV2FuYWx5emVy
LXdyaXRlLXRvLWNvbnN0KS4KCiAgVXNlIGlzY19idWZmZXJfY29uc3Rpbml0KCksIHRoZSBwcmlt
aXRpdmUgaW50ZW5kZWQgZm9yIHBvaW50aW5nIGEKICBidWZmZXIgYXQgY29uc3RhbnQgZGF0YTog
aXQgZ29lcyB0aHJvdWdoIGlzY19idWZmZXJfaW5pdCgpIGFuZCBuZXZlcgogIHdyaXRlcyB0byB0
aGUgYmFzZS4gIFRoaXMgZHJvcHMgdGhlIFVOQ09OU1QgY2FzdCwga2VlcHMgeHNsbXNnIGluCiAg
cmVhZC1vbmx5IG1lbW9yeSwgYW5kIHNpbGVuY2VzIHRoZSBhbmFseXplciB3YXJuaW5nLgoKICBB
c3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTQtOCA6Z2w6YCExMjMwOWAKCi0gRG9uJ3Qg
c2VydmUgYSBzdGFsZSBDTkFNRSBvciByZWNvcmQgd2hlbiBmcmVzaCBkYXRhIG9mIHRoZSBvdGhl
cgogIGV4aXN0cy4gYGAxY2Y2ODM4YzI3MWBgCgogIFdoZW4gYSBjYWNoZWQgbmFtZSBoZWxkIGJv
dGggYSBDTkFNRSBhbmQgcmVjb3JkcyBvZiBhbm90aGVyIHR5cGUg4oCUIG9uZQogIHN0YWxlLCB0
aGUgb3RoZXIgc3RpbGwgZnJlc2gg4oCUIG5hbWVkIHdpdGggc2VydmUtc3RhbGUgY291bGQgcmV0
dXJuIHRoZQogIGV4cGlyZWQgc2V0IGluc3RlYWQgb2YgdGhlIGZyZXNoIG9uZSwgaW4gZWl0aGVy
IGRpcmVjdGlvbi4gSXQgbm93CiAgcHJlZmVycyB3aGljaGV2ZXIgaXMgZnJlc2guIDpnbDpgITEy
MzA1YAoKLSBGaXggY29tcGF0aWJpbGl0eSB3aXRoIE9wZW5TU0wgMS4wLjJ1LiBgYDExZmNkODIw
NmFiYGAKCiAgQklORCBmYWlsZWQgdG8gYnVpbGQgd2l0aCBPcGVuU1NMIDEuMC4ydS4gQWRkIHRo
ZSBtaXNzaW5nIGhlYWRlciBmaWxlCiAgaW5jbHVkZXMuIDpnbDpgITExODk3YAoKLSBPbmx5IHVw
ZGF0ZSB0aGUgZ2xvYmFsIHRpZF9jb3VudCBvbmNlLiBgYDc0NmQ5YmZkM2E4YGAKCiAgU2tpcCB1
cGRhdGluZyB0aGUgYHRpZF9jb3VudGAgdmFsdWUgb24gcmVwZWF0ZWQgY2FsbHMgdG8gcHJldmVu
dAogIFRocmVhZFNhbml0aXplciAnZGF0YSByYWNlJy4gOmdsOmAhMTIxODhgCg==

--===============8076392047703903342==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.20.24-9.20.26.patch"

RnJvbSBmNjdjNDNiZGJiMjBiNjZjMTE4NzllOTFhYzViZTg5ZThmNjZjNzI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjMgSnVsIDIwMjYgMDU6MTI6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
aW5kOiB1cGdyYWRlIDkuMjAuMjQgLT4gOS4yMC4yNgoKU291cmNlOiBkb2MvY2hhbmdlbG9nL2No
YW5nZWxvZy05LjIwLjI1LnJzdCwgZG9jL2NoYW5nZWxvZy9jaGFuZ2Vsb2ctOS4yMC4yNi5yc3QK
CkJJTkQgOS4yMC4yNQotLS0tLS0tLS0tLS0KCi4uIG5vdGU6OgoKICAgVGhlIEJJTkQgOS4yMC4y
NSByZWxlYXNlIHdhcyB3aXRoZHJhd24gYWZ0ZXIgdGhlIGRpc2NvdmVyeSBvZiBhCiAgIHJlZ3Jl
c3Npb24gaW4gYSBzZWN1cml0eSBmaXggaW4gaXQgZHVyaW5nIHByZS1yZWxlYXNlIHRlc3Rpbmcu
CgpCSU5EIDkuMjAuMjYKLS0tLS0tLS0tLS0tCgpTZWN1cml0eSBGaXhlcwp+fn5+fn5+fn5+fn5+
fgoKLSBbQ1ZFLTIwMjYtMTEzMzFdIEZpeCBoYW5kbGluZyBvZiBycHogQ05BTUUgZXhwYW5zaW9u
IHRoYXQgcmV0dXJucyBuYW1lCiAgdG9vIGxvbmcuIGBgYjk1MGRhNWY2MjVgYAoKICBQcmV2aW91
c2x5LCBpZiB0aGUgZXhwYW5zaW9uIG9mIGEgd2lsZGNhcmQgQ05BTUUgUlBaIHBvbGljeSByZXN1
bHRlZAogIGluIGEgbmFtZSB0aGF0IGV4Y2VlZGVkIHRoZSBsZW5ndGggbGltaXQsIGEgc2VsZiBy
ZWZlcmVudGlhbCBDTkFNRSBhbmQKICB0aGUgb3JpZ2luYWwgYWRkcmVzcyByZWNvcmQgd2VyZSBy
ZXR1cm5lZCwgYWxsb3dpbmcgdGhlIHBvbGljeSB0byBiZQogIGJ5cGFzc2VkLiAgSW4gYnJhbmNo
ZXMgdXAgdG8gOS4yMCwgdGhpcyBhbHNvIGxlZnQgcXVlcnkgcHJvY2Vzc2luZyBpbgogIGFuIGlu
Y29uc2lzdGVudCBzdGF0ZSB3aGljaCBjb3VsZCB0cmlnZ2VyIGFuIGFzc2VydGlvbiBmYWlsdXJl
LiAgV2UKICBub3cgcmV0dXJuIGEgWVhET01BSU4gcmVzcG9uc2UsIHdpdGhvdXQgdGhlIGFkZHJl
c3MuCgogIElTQyB3b3VsZCBsaWtlIHRvIHRoYW5rIExhaXRoIE1hc2gnYWwgKDB4bXNoYWwpIGZv
ciBicmluZ2luZyB0aGlzCiAgaXNzdWUgdG8gb3VyIGF0dGVudGlvbi4gOmdsOmAjNTg1NmAKCi0g
W0NWRS0yMDI2LTExNzIxXSBJbnZhbGlkIHNpZ25lZCB3aWxkY2FyZCByZWNvcmRzIHdlcmUgYmVp
bmcgYWNjZXB0ZWQuCiAgYGAyNDk3NTJjZDcyZGBgCgogIFNpZ25lZCB3aWxkY2FyZCByZXNwb25z
ZXMgaW4gd2hpY2ggdGhlIExhYmVscyBmaWVsZCBpbiB0aGUgYFJSU0lHYAogIHJlY29yZCB3YXMg
bGVzcyB0aGFuIHRoZSBudW1iZXIgb2YgbGFiZWxzIGluIHRoZSBTaWduZXIgTmFtZSBmaWVsZAog
IHdlcmUgYmVpbmcgaW5jb3JyZWN0bHkgYWNjZXB0ZWQuIFRoaXMgaW4gdHVybiBicm9rZQogIGBz
eW50aC1mcm9tLWRuc3NlY2AsIHdoaWNoIGRlcGVuZHMgb24gc3VjaCByZWNvcmRzIGJlaW5nIGNv
cnJlY3RseQogIHZhbGlkYXRlZC4gVGhpcyBoYXMgYmVlbiBmaXhlZC4KCiAgSVNDIHRoYW5rcyBR
aWZhbiBaaGFuZyBvZiBQYWxvIEFsdG8gTmV0d29ya3MgZm9yIGJyaW5naW5nIHRoaXMgaXNzdWUK
ICB0byBvdXIgYXR0ZW50aW9uLiA6Z2w6YCM1ODcxYAoKLSBbQ1ZFLTIwMjYtMTMzMjFdIEZpeCBE
TlNTRUMgdmFsaWRhdGlvbiBieXBhc3MgdmlhIG91dC1vZi16b25lIE5TRUMKICBOZXh0IEZpZWxk
LiBgYDZmYmM5NjNkNGFmYGAKCiAgQSBtYWxpY2lvdXMgem9uZSB3aXRoIG91dC1vZi16b25lIE5T
RUMgbmV4dCBvd25lciBuYW1lcyBjYW4gY2F1c2UgYQogIEROU1NFQyB2YWxpZGF0aW5nIHJlc29s
dmVyIHRvIGNhY2hlIHN1Y2ggcmVjb3JkIGFuZCwgaWYKICBgc3ludGgtZnJvbS1kbnNzZWNgIGlz
IGVuYWJsZWQsIHRvIGdlbmVyYXRlIG5lZ2F0aXZlIGFuc3dlcnMgZm9yIGFueQogIHpvbmUgdGhh
dCBpcyBjb3ZlcmVkIGJ5IHRoZSByYW5nZS4KCiAgSVNDIHdvdWxkIGxpa2UgdG8gdGhhbmsgUWlm
YW4gWmhhbmcgb2YgUGFsbyBBbHRvIE5ldHdvcmtzIGZvcgogIHJlcG9ydGluZyB0aGUgaXNzdWUu
IDpnbDpgIzU4NzNgCgotIFtDVkUtMjAyNi0xMDcyM10gQ29ycmVjdCB2ZXJpZmljYXRpb24gb2Yg
TlNFQzMgc2lnbmVyIG5hbWUuCiAgYGBkZjNhYmZjMzE4NGBgCgogIEJJTkQgOSBhY2NlcHRlZCBj
aGlsZC16b25lIE5TRUMzIHJlY29yZHMgd2hlcmUgdGhlIGZpcnN0IGxhYmVsIGVxdWFscwogIHRo
ZSBoYXNoIG9mIHRoZSBwYXJlbnQgem9uZSBhcyB2YWxpZCBwYXJlbnQtem9uZSBjbG9zZXN0IGVu
Y2xvc2VyCiAgcHJvb2ZzLiBUaGlzIGhhcyBiZWVuIGZpeGVkLgoKICBJU0MgdGhhbmtzIFFpZmFu
IFpoYW5nIG9mIFBhbG8gQWx0byBOZXR3b3JrcyBmb3IgcmVwb3J0aW5nIHRoZSBpc3N1ZS4KICA6
Z2w6YCM1ODc0YAoKLSBbQ1ZFLTIwMjYtMTI2MTddIERvIG5vIGFzc2VydCBmb3Igc29tZSBzcGVj
aWZpY3MgQ05BTUUgYW5kIEROQU1FCiAgcXVlcmllcy4gYGBkNzVkMWU5Mzk1OGBgCgogIEEgYnVn
IGluIHRoZSByZXNvbHZlcidzIGhhbmRsaW5nIG9mIGNlcnRhaW4gY2FjaGVkIEROQU1FIGFuZCBD
TkFNRQogIHJlc3BvbnNlcyBjb3VsZCBjYXVzZSBuYW1lZCB0byB0cmlnZ2VyIGFuIGFzc2VydGlv
biBmYWlsdXJlIGFuZCBleGl0LgogIEFuIGF0dGFja2VyIGNvbnRyb2xsaW5nIGEgZG9tYWluIG5h
bWUgYW5kIHRoZSBhdXRob3JpdGF0aXZlIEROUyBzZXJ2ZXIKICBpdCBpcyBob3N0ZWQgb24gY291
bGQgZXhwbG9pdCB0aGlzIGJlaGF2aW9yIHRvIGNhdXNlIGEKICBkZW5pYWwtb2Ytc2VydmljZS4g
VGhpcyB2dWxuZXJhYmlsaXR5IGhhcyBiZWVuIGZpeGVkLgoKICBJU0MgdGhhbmtzIFFpZmFuIFpo
YW5nIG9mIFBhbG8gQWx0byBOZXR3b3JrcyBmb3IgYnJpbmdpbmcgdGhpcyBpc3N1ZQogIHRvIG91
ciBhdHRlbnRpb24uIDpnbDpgIzU5NDZgCgotIFtDVkUtMjAyNi0xMDgyMl0gTWFsZm9ybWVkIERO
U0tFWSByZWNvcmRzIGNvdWxkIHRyaWdnZXIgYW4gYXNzZXJ0aW9uLgogIGBgYTE3NzdjZTdlZTBg
YAoKICBQcmV2aW91c2x5LCBgZG5zX25hbWVfZnJvbXdpcmUoKWAgZGlkIG5vdCBob25vciB0aGUg
cmVjb3JkIGJvdW5kYXJ5CiAgd2hlbiByZWFkaW5nIG5hbWVzIGZyb20gdGhlIHdpcmUsIGFsbG93
aW5nIG1hbGZvcm1lZCByZWNvcmRzIHRvIGJlCiAgYWNjZXB0ZWQgd2hlbiB0aGV5IHNob3VsZCBu
b3QgaGF2ZSBiZWVuCgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBhcyBpdCBleGNlZWRzIDMwMDAgY2hh
cmFjdGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBmb3VuZCBpbiBhbiBhdHRhY2htZW50
IHRvIHRoZSBBVUggZW1haWxdCi0tLQogLi4uL2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0LWZh
aWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2ggfCAyICstCiAuLi4vMDAwMS1tNC1CYWNrcG9ydC1h
eF9wcm9nX2NjX2Zvcl9idWlsZC5tNC1tYWNyb3MucGF0Y2ggICB8IDIgKy0KIC4uLjAxLW5hbWVk
LWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoIHwgNCArKy0t
CiAuLi5uZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5w
YXRjaCB8IDYgKysrLS0tCiBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25m
LnBhdGNoICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBw
b3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoIHwgMiArLQogLi4uL2JpbmQvYmluZC9tYWtl
LWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaCAgICAgICAgICAgfCAyICstCiAuLi4vYmlu
ZC97YmluZF85LjIwLjI0LmJiID0+IGJpbmRfOS4yMC4yNi5iYn0gICAgICAgICAgICAgICB8IDIg
Ky0KIDggZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL3tiaW5kXzkuMjAuMjQuYmIgPT4g
YmluZF85LjIwLjI2LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvYmluZC9iaW5kLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtYXZvaWQtc3Rh
cnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaAppbmRleCA4MDZjYTljNWJkLi40YmM4YjQ2
MzBjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAx
LWF2b2lkLXN0YXJ0LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgt
YmluZC11c2VyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlNDg4NmE4MjVjODJhN2Q2ZjRi
ZDZiYWRlZWFlZWE3MDBlNDI5NDgzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjZjc1
MzdiMGRkY2NlZmQwNGRjYjgyY2E0NzAyNjJjZTYxYWZiMjUyIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCAx
NSBPY3QgMjAxOCAxNjo1NTowOSArMDgwMAogU3ViamVjdDogW1BBVENIXSBhdm9pZCBzdGFydCBm
YWlsdXJlIHdpdGggYmluZCB1c2VyCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JpbmQvYmluZC8wMDAxLW00LUJhY2twb3J0LWF4X3Byb2dfY2NfZm9yX2J1aWxkLm00LW1h
Y3Jvcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbTQt
QmFja3BvcnQtYXhfcHJvZ19jY19mb3JfYnVpbGQubTQtbWFjcm9zLnBhdGNoCmluZGV4IDliMjg3
MGJkMzguLmM5ZGJmZjM4MTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC9iaW5kLzAwMDEtbTQtQmFja3BvcnQtYXhfcHJvZ19jY19mb3JfYnVpbGQubTQtbWFjcm9z
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbTQt
QmFja3BvcnQtYXhfcHJvZ19jY19mb3JfYnVpbGQubTQtbWFjcm9zLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBlNWYzMTY3MGQ3OTkwNjAzMzIwOWQ2YjMwZDkyNWRjZDAzMjRjOTVhIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmYTc2NzAzODZhMTY0M2RlNWI5NzZmNjkyOGU0MjY2
MmI5NjhkODA3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPGtoZW0u
cmFqQG9zcy5xdWFsY29tbS5jb20+CiBEYXRlOiBGcmksIDEwIEFwciAyMDI2IDIzOjMzOjQ5ICsw
MDAwCiBTdWJqZWN0OiBbUEFUQ0hdIG00OiBCYWNrcG9ydCBheF9wcm9nX2NjX2Zvcl9idWlsZC5t
NCBtYWNyb3MKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5k
LzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLW5hbWVkLWx3cmVz
ZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRpb25zLnBhdGNoCmluZGV4IDFiYmYxN2Ix
MmUuLjc0MGQxZTk4ZTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmlu
ZC9iaW5kLzAwMDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlv
bnMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1u
YW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVpbGQtb3B0aW9ucy5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gYzE4YWQ0ZGU2NzZlZDkzNTA4MzdjNGM5MGE1ZTUzYTk0MTcxMmJh
NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDE5MDFlYWVjZjYxN2FiZjhmMjYwOGUw
N2JhYTc3NWM3NTQzNmExNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBK
aWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IE1vbiwgMjcgQXVnIDIwMTggMjE6
MjQ6MjAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gYG5hbWVkL2x3cmVzZCAtVicgYW5kIHN0YXJ0
IGxvZyBoaWRlIGJ1aWxkIG9wdGlvbnMKQEAgLTIwLDcgKzIwLDcgQEAgU2lnbmVkLW9mZi1ieTog
QXJtaW4gS3VzdGVyIDxha3VzdGVyQG12aXN0YS5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9j
b25maWd1cmUuYWMKLWluZGV4IGM4NDVhOGUuLmQwNjU0NTQgMTAwNjQ0CitpbmRleCBhZjAyMGYw
Li5mNDYxMjI5IDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMK
IEBAIC0zNSw3ICszNSw3IEBAIEFDX0RFRklORShbUEFDS0FHRV9WRVJTSU9OX0VYVFJBXSwgWyJd
W2JpbmRfVkVSU0lPTl9FWFRSQV1bIl0sIFtCSU5EIDkgRXh0cmEgcGFyCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9iaW5kLWVuc3VyZS1zZWFyY2hpbmct
Zm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9iaW5kL2JpbmQvYmluZC1lbnN1cmUtc2VhcmNoaW5nLWZvci1qc29uLWhlYWRlcnMt
c2VhcmNoZXMtc3lzci5wYXRjaAppbmRleCAzNTJhMmYxYmMxLi4zYzdmMDlkNmJkIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9iaW5kLWVuc3VyZS1zZWFy
Y2hpbmctZm9yLWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2JpbmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNv
bi1oZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDZmMDI4
OWJjOGVlMmM1YTZkMzg2ZDZkNjkyMTg3NTIxOWIyNjg5NTEgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDZhNzUzNmM2NjgzMmU0ZDk5ZDdkMTU2MjU2YjFhOThkOTQ5N2M3ZGUgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBQYXVsIEdvcnRtYWtlciA8cGF1bC5nb3J0bWFrZXJA
d2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgOSBKdW4gMjAxNSAxMToyMjowMCAtMDQwMAogU3Vi
amVjdDogW1BBVENIXSBiaW5kOiBlbnN1cmUgc2VhcmNoaW5nIGZvciBqc29uIGhlYWRlcnMgc2Vh
cmNoZXMgc3lzcm9vdApAQCAtMzIsMTAgKzMyLDEwIEBAIFNpZ25lZC1vZmYtYnk6IFBhdWwgR29y
dG1ha2VyIDxwYXVsLmdvcnRtYWtlckB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFj
IGIvY29uZmlndXJlLmFjCi1pbmRleCA3YjlhNjNiLi5jODQ1YThlIDEwMDY0NAoraW5kZXggZjQ3
Y2U3Yi4uYWYwMjBmMCAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJl
LmFjCi1AQCAtODY1LDcgKzg2NSw3IEBAIEFTX0NBU0UoWyR3aXRoX2xtZGJdLAorQEAgLTg3Miw3
ICs4NzIsNyBAQCBBU19DQVNFKFskd2l0aF9sbWRiXSwKICAJW25vXSxbXSwKICAJW2F1dG98eWVz
XSwgW1BLR19DSEVDS19NT0RVTEVTKFtMTURCXSwgW2xtZGJdLAogIAkJCQkgICAgICAgW2FjX2xp
Yl9sbWRiX2ZvdW5kPXllc10sCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2JpbmQvYmluZC9jb25mLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2Jp
bmQvY29uZi5wYXRjaAppbmRleCBjN2Y2OTQxOTA4Li44ZTgyYzU3MDM1IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9jb25mLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIGQzMDhkOWI4MzVmNGFkMTFlNTgyNGU3MzMzNjY4NzkyOTgwYzEzNTcgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDM1MjMzOWFmOWU2Y2Q5ZmMwM2NhZmYwOWExYjI5NWYyNmRm
YWRjMzIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBRaW5nIEhlIDxxaW5nLmhlQGlu
dGVsLmNvbT4KIERhdGU6IFR1ZSwgMzAgTm92IDIwMTAgMTM6MzU6NDIgKzA4MDAKIFN1YmplY3Q6
IFtQQVRDSF0gYmluZDogYWRkIG5ldyByZWNpcGUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJv
b3Rmcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2luaXQuZC1h
ZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5wYXRjaAppbmRleCBlYzllZWM2ZDNlLi43
M2UzOTAwMmNhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmlu
ZC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBwb3J0LWZvci1y
ZWFkLW9ubHktcm9vdGZzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyM2I5OTdmYzYyNzZh
NTI3ZTFjZjM2MzEyY2QxMjExNzBjMTU5NzhjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA3NTkyMzUyMTg0NzYxODM5MmUyMGZkOWFiZDMyNDU2MThiNzdjOGY3IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTog
VGh1LCAyNyBNYXIgMjAxNCAwMjozNDo0MSArMDAwMAogU3ViamVjdDogW1BBVENIXSBpbml0LmQ6
IGFkZCBzdXBwb3J0IGZvciByZWFkLW9ubHkgcm9vdGZzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRk
LWJpbmQtc3RvcC13b3JrLnBhdGNoCmluZGV4IDU0ZDk0OGJiMTcuLjU2OGU0ZjJlNTkgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL21ha2UtZXRjLWluaXRk
LWJpbmQtc3RvcC13b3JrLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmlu
ZC9iaW5kL21ha2UtZXRjLWluaXRkLWJpbmQtc3RvcC13b3JrLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSBmNTkzMmZkZTk3YmI1YjQ3MTQ0ZDkyNjIxOWYzOTAzMTQ1YTcxMTg1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwMjI0NTE2ZDdiZDEwMGI2ZWE3YjRmYWZkZDA3YjQyYWE5
NmNiMGJhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm95IExpIDxyb25ncWluZy5s
aUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1LCAxNSBOb3YgMjAxMiAwMjoyNzo1NCArMDAwMAog
U3ViamVjdDogW1BBVENIXSBiaW5kOiBtYWtlICIvZXRjL2luaXQuZC9iaW5kIHN0b3AiIHdvcmsK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAuMjQu
YmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjI2LmJiCnNpbWls
YXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmlu
ZC9iaW5kXzkuMjAuMjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmlu
ZC9iaW5kXzkuMjAuMjYuYmIKaW5kZXggM2M1YWNjOTcyYi4uMjFmZmFkN2JhZCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC4yNC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjI2LmJiCkBAIC0yMSw3ICsy
MSw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9mdHAuaXNjLm9yZy9pc2MvYmluZDkvJHtQVn0vJHtC
UE59LSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLW00LUJhY2twb3J0LWF4
X3Byb2dfY2NfZm9yX2J1aWxkLm00LW1hY3Jvcy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjk4OWZlZjFmYzg4ZWE1OWQwNGNkODZmODU0ZGNhNWE0NjE2YTIw
YTk5NjhiY2RkZTNjMWEzNjY4YWIzNmJlMDgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTUyNDhk
ZWYwZjg3MGM0YzQ2YjNkZTcyOTc4ZWE5NzI2MTUxMzE1MTY2NjMxODhhNDU2NGRjYTFkMjBiZjM1
MCIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vZnRwLmlzYy5vcmcvaXNjL2JpbmQ5
LyIKICMgZm9sbG93IHRoZSBFU1YgdmVyc2lvbnMgZGl2aXNpYmxlIGJ5IDIKLS0gCjIuNDcuMQoK

--===============8076392047703903342==--

