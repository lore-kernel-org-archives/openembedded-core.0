Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC43C982D4
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 07:10:08 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33964.1789629007950627574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 00:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fE5vXw8f;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Q7tTrqtz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a0ae33845a-81b05745-7d91-4949-b0ca-58cd1fa428b1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789629007;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=kU5WwJA/8Hx7uFkn2Fhi4tzBuy2nqvTr16lbOG4eF2M=;
	b=fE5vXw8f/8aHiC841QzuUOpwcX6Ke7g7Ik0EdAFV6td3h/6wuaJBPvUNbMyDfsnq
	yIDQfOWU2/EAkkhFEm65jAEaG+dF/7P7RO8gnMauxg/Jm3iToVW3f9VcK5SBe7Y0V1F
	a93ffDQV0ssLyMuLByBmfwr1MaArzvNhdEzQTJiA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789629007;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=kU5WwJA/8Hx7uFkn2Fhi4tzBuy2nqvTr16lbOG4eF2M=;
	b=Q7tTrqtzoWvTcFKC2IfFDy3JPK+K7xQADDAvYszYwfOiGsPdctQEjVjvNEGrDtOe
	tRw12zsy26kOdw1Ext1K5di9P5qRRd/xxR0g4n4f42BLpt/8p8iU6PT1yrxLsbSmkbh
	FVc0fJpVHgGojWHspYGShzHg7tYOaQ2YWFlMJ3tU=
Content-Type: multipart/mixed; boundary="===============3276852547314484277=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] bind: upgrading to 9.20.29 SUCCEEDED
Message-ID: <010101a0ae33845a-81b05745-7d91-4949-b0ca-58cd1fa428b1-000000@us-west-2.amazonses.com>
Date: Thu, 17 Sep 2026 07:10:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.17-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 07:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246030

--===============3276852547314484277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bind* to *9.20.29* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bind-upgrade-9.20.27-9.20.29.patch
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
From 64cefd8c4db9e91b9782d04d85d1e6c1d578ea9e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 17 Sep 2026 05:32:24 +0000
Subject: [PATCH] bind: upgrade 9.20.27 -> 9.20.29

Source: doc/changelog/changelog-9.20.28.rst, doc/changelog/changelog-9.20.29.rst

BIND 9.20.28
------------

.. note::

   The BIND 9.20.28 release was withdrawn after the discovery of a
   regression in it during pre-release testing.

BIND 9.20.29
------------

Security Fixes
~~~~~~~~~~~~~~

- [CVE-2026-19668] Prevent excessive CPU use validating crafted DNSSEC
  responses. ``a0a61dba9e``

  A malicious authoritative server could serve a securely delegated zone
  whose DS and DNSKEY records carry many distinct key tags but no valid
  match, forcing a validating resolver into excessive key-tag matching
  and high CPU use for every query. BIND now bounds this work with the
  per-query validation limit (max-validations-per-fetch). :gl:`#5349`

- [CVE-2026-19033] Require a TSIG on every message of incoming zone
  transfers. ``9404cd2b8c``

  BIND 9 used to accept TSIG-signed zone transfers in which some
  messages were unsigned, and processed those messages before the next
  signature could vouch for them. It now requires a TSIG on every
  message of an incoming AXFR or IXFR; all modern nameserver already
  sign every message, so no change is expected in practice. :gl:`#6062`

- [CVE-2026-77119] Prevent a DNSSEC downgrade of secure delegations via
  unrelated NSEC3. ``3bed9c8e9e``

  A validating resolver could be tricked into treating a secure
  delegation as unsigned and accepting forged answers for names beneath
  it, if an attacker could inject responses to its queries. Such forged
  proofs are now rejected. :gl:`#6234`

- [CVE-2026-19941] Prevent forged DNSSEC-validated NXDOMAIN responses.
  ``a36bf58daf``

  A validating resolver could accept a signed NSEC record from an
  unrelated zone as proof that a wildcard did not exist. An on-path
  attacker or malicious forwarder controlling a signed zone could
  therefore forge an authenticated NXDOMAIN response for a name that
  should resolve through a wildcard. BIND now requires the
  wildcard-denial and name-nonexistence proofs to be signed by the same
  zone. :gl:`#6253`

- [CVE-2026-19666] DNS64 with break-dnssec could cause an assertion
  failure. ``4cec4965c4``

  When a "dns64" statement is configured with "break-dnssec yes" and its
  "exclude" list matches some but not all of the addresses in an AAAA
  RRset, named removes the excluded addresses from the answer instead of
  synthesizing new ones. If the answer being filtered had been cached
  together with a proof that the queried name does not exist -- which is
  what a wildcard match produces -- named terminated with an assertion
  failure.

  Only recursive resolvers are affected, and only when "break-dnssec
  yes" is in use; the answer has to come from the cache, so a server
  that is only authoritative cannot reach this. :gl:`#6301`

- [CVE-2026-19667] Reject negative cache records that do not fit in a
  dns_rdata_t. ``dbf08c8581``

  A single crafted response from a server could make a resolver cache a
  malformed negative entry and th

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
 .../bind/{bind_9.20.27.bb => bind_9.20.29.bb}                 | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.27.bb => bind_9.20.29.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
index 30da1e9fd3..15796a15fb 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bind-user.patch
@@ -1,4 +1,4 @@
-From 7682cbc2fa624fbeeb088736e154090d92c8b524 Mon Sep 17 00:00:00 2001
+From 95141cf9494292fc5645165ef3d5e9e2ed2208c6 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
index f1d8a8e569..99e781799d 100644
--- a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
@@ -1,4 +1,4 @@
-From a633e336c248ceab41d3182848b65c95e90ef88c Mon Sep 17 00:00:00 2001
+From 06e9624eb7e474a08ed7e1a456bfe9759ba211da Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:33:49 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
index da4057064e..80a4f2abde 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 4b870f60338fe45e036b8a76d47f053338920048 Mon Sep 17 00:00:00 2001
+From f28920a59b658fcda24efde1c45322f785a0b0fe Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 56bca5b..4fd62ed 100644
+index 0bc3965..e1c2b12 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTRA]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
index 9adc101247..323985a402 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
@@ -1,4 +1,4 @@
-From f3736e5535236cf978fd368b6905098ff6e4fd84 Mon Sep 17 00:00:00 2001
+From f003f396067e6cc1e2ec609b296bb642b8ddf47b Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c06a0d7..56bca5b 100644
+index 26c442a..0bc3965 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -872,7 +872,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index 803456c0b3..28ee4ae74d 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 450187e8feac041de02afd4c0c9039cc41e04cb9 Mon Sep 17 00:00:00 2001
+From 5fc3dfd3f994b5fd97e97837eee2ad808cd8af93 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
index a2c1fbb8f7..b373251c47 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-rootfs.patch
@@ -1,4 +1,4 @@
-From 582334d31432969be7e10906de7540f1dc64b17e Mon Sep 17 00:00:00 2001
+From 42c109317070d19fda70635b7043cbc6f9ec36ef Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
index dc1f8f5a9a..74cf947787 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
@@ -1,4 +1,4 @@
-From 50601a7ee8fd19ddbe9a592c57ae6197782d4c2f Mon Sep 17 00:00:00 2001
+From 2e1314f2e71be15704ba18756250185b36a5c0da Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.27.bb b/meta/recipes-connectivity/bind/bind_9.20.29.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.27.bb
rename to meta/recipes-connectivity/bind/bind_9.20.29.bb
index e915161d8c..c280d5b98d 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.27.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.29.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
 
-SRC_URI[sha256sum] = "145ab7a50b33a06d9d488b5e668c887e754f42acf8954e2b5dc7e238b080e4a0"
+SRC_URI[sha256sum] = "587029508b3b1b43229fae416c97e5543aba45809cefaca98a5004a02a5736c1"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.47.1


--===============3276852547314484277==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bind-upgrade-9.20.27-9.20.29.patch"

RnJvbSA2NGNlZmQ4YzRkYjllOTFiOTc4MmQwNGQ4NWQxZTZjMWQ1NzhlYTllIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTcgU2VwIDIwMjYgMDU6MzI6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
aW5kOiB1cGdyYWRlIDkuMjAuMjcgLT4gOS4yMC4yOQoKU291cmNlOiBkb2MvY2hhbmdlbG9nL2No
YW5nZWxvZy05LjIwLjI4LnJzdCwgZG9jL2NoYW5nZWxvZy9jaGFuZ2Vsb2ctOS4yMC4yOS5yc3QK
CkJJTkQgOS4yMC4yOAotLS0tLS0tLS0tLS0KCi4uIG5vdGU6OgoKICAgVGhlIEJJTkQgOS4yMC4y
OCByZWxlYXNlIHdhcyB3aXRoZHJhd24gYWZ0ZXIgdGhlIGRpc2NvdmVyeSBvZiBhCiAgIHJlZ3Jl
c3Npb24gaW4gaXQgZHVyaW5nIHByZS1yZWxlYXNlIHRlc3RpbmcuCgpCSU5EIDkuMjAuMjkKLS0t
LS0tLS0tLS0tCgpTZWN1cml0eSBGaXhlcwp+fn5+fn5+fn5+fn5+fgoKLSBbQ1ZFLTIwMjYtMTk2
NjhdIFByZXZlbnQgZXhjZXNzaXZlIENQVSB1c2UgdmFsaWRhdGluZyBjcmFmdGVkIEROU1NFQwog
IHJlc3BvbnNlcy4gYGBhMGE2MWRiYTllYGAKCiAgQSBtYWxpY2lvdXMgYXV0aG9yaXRhdGl2ZSBz
ZXJ2ZXIgY291bGQgc2VydmUgYSBzZWN1cmVseSBkZWxlZ2F0ZWQgem9uZQogIHdob3NlIERTIGFu
ZCBETlNLRVkgcmVjb3JkcyBjYXJyeSBtYW55IGRpc3RpbmN0IGtleSB0YWdzIGJ1dCBubyB2YWxp
ZAogIG1hdGNoLCBmb3JjaW5nIGEgdmFsaWRhdGluZyByZXNvbHZlciBpbnRvIGV4Y2Vzc2l2ZSBr
ZXktdGFnIG1hdGNoaW5nCiAgYW5kIGhpZ2ggQ1BVIHVzZSBmb3IgZXZlcnkgcXVlcnkuIEJJTkQg
bm93IGJvdW5kcyB0aGlzIHdvcmsgd2l0aCB0aGUKICBwZXItcXVlcnkgdmFsaWRhdGlvbiBsaW1p
dCAobWF4LXZhbGlkYXRpb25zLXBlci1mZXRjaCkuIDpnbDpgIzUzNDlgCgotIFtDVkUtMjAyNi0x
OTAzM10gUmVxdWlyZSBhIFRTSUcgb24gZXZlcnkgbWVzc2FnZSBvZiBpbmNvbWluZyB6b25lCiAg
dHJhbnNmZXJzLiBgYDk0MDRjZDJiOGNgYAoKICBCSU5EIDkgdXNlZCB0byBhY2NlcHQgVFNJRy1z
aWduZWQgem9uZSB0cmFuc2ZlcnMgaW4gd2hpY2ggc29tZQogIG1lc3NhZ2VzIHdlcmUgdW5zaWdu
ZWQsIGFuZCBwcm9jZXNzZWQgdGhvc2UgbWVzc2FnZXMgYmVmb3JlIHRoZSBuZXh0CiAgc2lnbmF0
dXJlIGNvdWxkIHZvdWNoIGZvciB0aGVtLiBJdCBub3cgcmVxdWlyZXMgYSBUU0lHIG9uIGV2ZXJ5
CiAgbWVzc2FnZSBvZiBhbiBpbmNvbWluZyBBWEZSIG9yIElYRlI7IGFsbCBtb2Rlcm4gbmFtZXNl
cnZlciBhbHJlYWR5CiAgc2lnbiBldmVyeSBtZXNzYWdlLCBzbyBubyBjaGFuZ2UgaXMgZXhwZWN0
ZWQgaW4gcHJhY3RpY2UuIDpnbDpgIzYwNjJgCgotIFtDVkUtMjAyNi03NzExOV0gUHJldmVudCBh
IEROU1NFQyBkb3duZ3JhZGUgb2Ygc2VjdXJlIGRlbGVnYXRpb25zIHZpYQogIHVucmVsYXRlZCBO
U0VDMy4gYGAzYmVkOWM4ZTllYGAKCiAgQSB2YWxpZGF0aW5nIHJlc29sdmVyIGNvdWxkIGJlIHRy
aWNrZWQgaW50byB0cmVhdGluZyBhIHNlY3VyZQogIGRlbGVnYXRpb24gYXMgdW5zaWduZWQgYW5k
IGFjY2VwdGluZyBmb3JnZWQgYW5zd2VycyBmb3IgbmFtZXMgYmVuZWF0aAogIGl0LCBpZiBhbiBh
dHRhY2tlciBjb3VsZCBpbmplY3QgcmVzcG9uc2VzIHRvIGl0cyBxdWVyaWVzLiBTdWNoIGZvcmdl
ZAogIHByb29mcyBhcmUgbm93IHJlamVjdGVkLiA6Z2w6YCM2MjM0YAoKLSBbQ1ZFLTIwMjYtMTk5
NDFdIFByZXZlbnQgZm9yZ2VkIEROU1NFQy12YWxpZGF0ZWQgTlhET01BSU4gcmVzcG9uc2VzLgog
IGBgYTM2YmY1OGRhZmBgCgogIEEgdmFsaWRhdGluZyByZXNvbHZlciBjb3VsZCBhY2NlcHQgYSBz
aWduZWQgTlNFQyByZWNvcmQgZnJvbSBhbgogIHVucmVsYXRlZCB6b25lIGFzIHByb29mIHRoYXQg
YSB3aWxkY2FyZCBkaWQgbm90IGV4aXN0LiBBbiBvbi1wYXRoCiAgYXR0YWNrZXIgb3IgbWFsaWNp
b3VzIGZvcndhcmRlciBjb250cm9sbGluZyBhIHNpZ25lZCB6b25lIGNvdWxkCiAgdGhlcmVmb3Jl
IGZvcmdlIGFuIGF1dGhlbnRpY2F0ZWQgTlhET01BSU4gcmVzcG9uc2UgZm9yIGEgbmFtZSB0aGF0
CiAgc2hvdWxkIHJlc29sdmUgdGhyb3VnaCBhIHdpbGRjYXJkLiBCSU5EIG5vdyByZXF1aXJlcyB0
aGUKICB3aWxkY2FyZC1kZW5pYWwgYW5kIG5hbWUtbm9uZXhpc3RlbmNlIHByb29mcyB0byBiZSBz
aWduZWQgYnkgdGhlIHNhbWUKICB6b25lLiA6Z2w6YCM2MjUzYAoKLSBbQ1ZFLTIwMjYtMTk2NjZd
IEROUzY0IHdpdGggYnJlYWstZG5zc2VjIGNvdWxkIGNhdXNlIGFuIGFzc2VydGlvbgogIGZhaWx1
cmUuIGBgNGNlYzQ5NjVjNGBgCgogIFdoZW4gYSAiZG5zNjQiIHN0YXRlbWVudCBpcyBjb25maWd1
cmVkIHdpdGggImJyZWFrLWRuc3NlYyB5ZXMiIGFuZCBpdHMKICAiZXhjbHVkZSIgbGlzdCBtYXRj
aGVzIHNvbWUgYnV0IG5vdCBhbGwgb2YgdGhlIGFkZHJlc3NlcyBpbiBhbiBBQUFBCiAgUlJzZXQs
IG5hbWVkIHJlbW92ZXMgdGhlIGV4Y2x1ZGVkIGFkZHJlc3NlcyBmcm9tIHRoZSBhbnN3ZXIgaW5z
dGVhZCBvZgogIHN5bnRoZXNpemluZyBuZXcgb25lcy4gSWYgdGhlIGFuc3dlciBiZWluZyBmaWx0
ZXJlZCBoYWQgYmVlbiBjYWNoZWQKICB0b2dldGhlciB3aXRoIGEgcHJvb2YgdGhhdCB0aGUgcXVl
cmllZCBuYW1lIGRvZXMgbm90IGV4aXN0IC0tIHdoaWNoIGlzCiAgd2hhdCBhIHdpbGRjYXJkIG1h
dGNoIHByb2R1Y2VzIC0tIG5hbWVkIHRlcm1pbmF0ZWQgd2l0aCBhbiBhc3NlcnRpb24KICBmYWls
dXJlLgoKICBPbmx5IHJlY3Vyc2l2ZSByZXNvbHZlcnMgYXJlIGFmZmVjdGVkLCBhbmQgb25seSB3
aGVuICJicmVhay1kbnNzZWMKICB5ZXMiIGlzIGluIHVzZTsgdGhlIGFuc3dlciBoYXMgdG8gY29t
ZSBmcm9tIHRoZSBjYWNoZSwgc28gYSBzZXJ2ZXIKICB0aGF0IGlzIG9ubHkgYXV0aG9yaXRhdGl2
ZSBjYW5ub3QgcmVhY2ggdGhpcy4gOmdsOmAjNjMwMWAKCi0gW0NWRS0yMDI2LTE5NjY3XSBSZWpl
Y3QgbmVnYXRpdmUgY2FjaGUgcmVjb3JkcyB0aGF0IGRvIG5vdCBmaXQgaW4gYQogIGRuc19yZGF0
YV90LiBgYGRiZjA4Yzg1ODFgYAoKICBBIHNpbmdsZSBjcmFmdGVkIHJlc3BvbnNlIGZyb20gYSBz
ZXJ2ZXIgY291bGQgbWFrZSBhIHJlc29sdmVyIGNhY2hlIGEKICBtYWxmb3JtZWQgbmVnYXRpdmUg
ZW50cnkgYW5kIHRoCgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBhcyBpdCBleGNlZWRzIDMwMDAgY2hh
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
ICstCiAuLi4vYmluZC97YmluZF85LjIwLjI3LmJiID0+IGJpbmRfOS4yMC4yOS5iYn0gICAgICAg
ICAgICAgICAgIHwgMiArLQogOCBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQve2JpbmRf
OS4yMC4yNy5iYiA9PiBiaW5kXzkuMjAuMjkuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdp
dGgtYmluZC11c2VyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQv
MDAwMS1hdm9pZC1zdGFydC1mYWlsdXJlLXdpdGgtYmluZC11c2VyLnBhdGNoCmluZGV4IDMwZGEx
ZTlmZDMuLjE1Nzk2YTE1ZmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
YmluZC9iaW5kLzAwMDEtYXZvaWQtc3RhcnQtZmFpbHVyZS13aXRoLWJpbmQtdXNlci5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC8wMDAxLWF2b2lkLXN0YXJ0
LWZhaWx1cmUtd2l0aC1iaW5kLXVzZXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDc2ODJj
YmMyZmE2MjRmYmVlYjA4ODczNmUxNTQwOTBkOTJjOGI1MjQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDk1MTQxY2Y5NDk0MjkyZmM1NjQ1MTY1ZWYzZDVlOWUyZWQyMjA4YzYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+
CiBEYXRlOiBNb24sIDE1IE9jdCAyMDE4IDE2OjU1OjA5ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hd
IGF2b2lkIHN0YXJ0IGZhaWx1cmUgd2l0aCBiaW5kIHVzZXIKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAwMDEtbTQtQmFja3BvcnQtYXhfcHJvZ19jY19m
b3JfYnVpbGQubTQtbWFjcm9zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5k
L2JpbmQvMDAwMS1tNC1CYWNrcG9ydC1heF9wcm9nX2NjX2Zvcl9idWlsZC5tNC1tYWNyb3MucGF0
Y2gKaW5kZXggZjFkOGE4ZTU2OS4uOTllNzgxNzk5ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1tNC1CYWNrcG9ydC1heF9wcm9nX2NjX2Zvcl9i
dWlsZC5tNC1tYWNyb3MucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5k
L2JpbmQvMDAwMS1tNC1CYWNrcG9ydC1heF9wcm9nX2NjX2Zvcl9idWlsZC5tNC1tYWNyb3MucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGE2MzNlMzM2YzI0OGNlYWI0MWQzMTgyODQ4YjY1Yzk1
ZTkwZWY4OGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDA2ZTk2MjRlYjdlNDc0YTA4
ZWQ3ZTFhNDU2YmZlOTc1OWJhMjExZGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBL
aGVtIFJhaiA8a2hlbS5yYWpAb3NzLnF1YWxjb21tLmNvbT4KIERhdGU6IEZyaSwgMTAgQXByIDIw
MjYgMjM6MzM6NDkgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gbTQ6IEJhY2twb3J0IGF4X3Byb2df
Y2NfZm9yX2J1aWxkLm00IG1hY3JvcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9iaW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhpZGUtYnVp
bGQtb3B0aW9ucy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kLzAw
MDEtbmFtZWQtbHdyZXNkLVYtYW5kLXN0YXJ0LWxvZy1oaWRlLWJ1aWxkLW9wdGlvbnMucGF0Y2gK
aW5kZXggZGE0MDU3MDY0ZS4uODBhNGYyYWJkZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9iaW5kL2JpbmQvMDAwMS1uYW1lZC1sd3Jlc2QtVi1hbmQtc3RhcnQtbG9nLWhp
ZGUtYnVpbGQtb3B0aW9ucy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2Jp
bmQvYmluZC8wMDAxLW5hbWVkLWx3cmVzZC1WLWFuZC1zdGFydC1sb2ctaGlkZS1idWlsZC1vcHRp
b25zLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0Yjg3MGY2MDMzOGZlNDVlMDM2YjhhNzZk
NDdmMDUzMzM4OTIwMDQ4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmMjg5MjBhNTli
NjU4ZmNkYTI0ZWZkZTFjNDUzMjJmNzg1YTBiMGZlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCAy
NyBBdWcgMjAxOCAyMToyNDoyMCArMDgwMAogU3ViamVjdDogW1BBVENIXSBgbmFtZWQvbHdyZXNk
IC1WJyBhbmQgc3RhcnQgbG9nIGhpZGUgYnVpbGQgb3B0aW9ucwpAQCAtMjAsNyArMjAsNyBAQCBT
aWduZWQtb2ZmLWJ5OiBBcm1pbiBLdXN0ZXIgPGFrdXN0ZXJAbXZpc3RhLmNvbT4KICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2Nv
bmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggNTZiY2E1Yi4uNGZkNjJlZCAxMDA2NDQK
K2luZGV4IDBiYzM5NjUuLmUxYzJiMTIgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBi
L2NvbmZpZ3VyZS5hYwogQEAgLTM1LDcgKzM1LDcgQEAgQUNfREVGSU5FKFtQQUNLQUdFX1ZFUlNJ
T05fRVhUUkFdLCBbIl1bYmluZF9WRVJTSU9OX0VYVFJBXVsiXSwgW0JJTkQgOSBFeHRyYSBwYXIK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2JpbmQtZW5z
dXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9iaW5kLWVuc3VyZS1zZWFyY2hpbmctZm9y
LWpzb24taGVhZGVycy1zZWFyY2hlcy1zeXNyLnBhdGNoCmluZGV4IDlhZGMxMDEyNDcuLjMyMzk4
NWE0MDIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2Jp
bmQtZW5zdXJlLXNlYXJjaGluZy1mb3ItanNvbi1oZWFkZXJzLXNlYXJjaGVzLXN5c3IucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvYmluZC1lbnN1cmUtc2Vh
cmNoaW5nLWZvci1qc29uLWhlYWRlcnMtc2VhcmNoZXMtc3lzci5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gZjM3MzZlNTUzNTIzNmNmOTc4ZmQzNjhiNjkwNTA5OGZmNmU0ZmQ4NCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjAwM2YzOTYwNjdlNmNjMWUyZWM2MDliMjk2YmI2NDJi
OGRkZjQ3YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFBhdWwgR29ydG1ha2VyIDxw
YXVsLmdvcnRtYWtlckB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCA5IEp1biAyMDE1IDExOjIy
OjAwIC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGJpbmQ6IGVuc3VyZSBzZWFyY2hpbmcgZm9yIGpz
b24gaGVhZGVycyBzZWFyY2hlcyBzeXNyb290CkBAIC0zMiw3ICszMiw3IEBAIFNpZ25lZC1vZmYt
Ynk6IFBhdWwgR29ydG1ha2VyIDxwYXVsLmdvcnRtYWtlckB3aW5kcml2ZXIuY29tPgogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEv
Y29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCBjMDZhMGQ3Li41NmJjYTViIDEwMDY0
NAoraW5kZXggMjZjNDQyYS4uMGJjMzk2NSAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysr
IGIvY29uZmlndXJlLmFjCiBAQCAtODcyLDcgKzg3Miw3IEBAIEFTX0NBU0UoWyR3aXRoX2xtZGJd
LApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvY29uZi5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmluZC9iaW5kL2NvbmYucGF0Y2gKaW5k
ZXggODAzNDU2YzBiMy4uMjhlZTRhZTc0ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9iaW5kL2JpbmQvY29uZi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JpbmQvYmluZC9jb25mLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0NTAxODdlOGZl
YWMwNDFkZTAyYWZkNGMwYzkwMzljYzQxZTA0Y2I5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSA1ZmMzZGZkM2Y5OTRiNWZkOTdlOTc4MzdlZWUyYWQ4MDhjZDhhZjkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogUWluZyBIZSA8cWluZy5oZUBpbnRlbC5jb20+CiBEYXRlOiBU
dWUsIDMwIE5vdiAyMDEwIDEzOjM1OjQyICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGJpbmQ6IGFk
ZCBuZXcgcmVjaXBlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQv
YmluZC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJlYWQtb25seS1yb290ZnMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9pbml0LmQtYWRkLXN1cHBvcnQtZm9yLXJl
YWQtb25seS1yb290ZnMucGF0Y2gKaW5kZXggYTJjMWZiYjhmNy4uYjM3MzI1MWM0NyAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9iaW5kL2JpbmQvaW5pdC5kLWFkZC1zdXBw
b3J0LWZvci1yZWFkLW9ubHktcm9vdGZzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvYmluZC9iaW5kL2luaXQuZC1hZGQtc3VwcG9ydC1mb3ItcmVhZC1vbmx5LXJvb3Rmcy5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTgyMzM0ZDMxNDMyOTY5YmU3ZTEwOTA2ZGU3NTQw
ZjFkYzY0YjE3ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDJjMTA5MzE3MDcwZDE5
ZmRhNzA2MzViNzA0M2NiYzZmOWVjMzZlZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMjcgTWFyIDIwMTQg
MDI6MzQ6NDEgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gaW5pdC5kOiBhZGQgc3VwcG9ydCBmb3Ig
cmVhZC1vbmx5IHJvb3RmcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
aW5kL2JpbmQvbWFrZS1ldGMtaW5pdGQtYmluZC1zdG9wLXdvcmsucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5w
YXRjaAppbmRleCBkYzFmOGY1YTlhLi43NGNmOTQ3Nzg3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1pbml0ZC1iaW5kLXN0b3Atd29yay5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZC9tYWtlLWV0Yy1p
bml0ZC1iaW5kLXN0b3Atd29yay5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTA2MDFhN2Vl
OGZkMTlkZGJlOWE1OTJjNTdhZTYxOTc3ODJkNGMyZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gMmUxMzE0ZjJlNzFiZTE1NzA0YmExODc1NjI1MDE4NWIzNmE1YzBkYSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IFJveSBMaSA8cm9uZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4K
IERhdGU6IFRodSwgMTUgTm92IDIwMTIgMDI6Mjc6NTQgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0g
YmluZDogbWFrZSAiL2V0Yy9pbml0LmQvYmluZCBzdG9wIiB3b3JrCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjI3LmJiIGIvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9iaW5kL2JpbmRfOS4yMC4yOS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjI3LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjIwLjI5LmJi
CmluZGV4IGU5MTUxNjFkOGMuLmMyODBkNWI5OGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvYmluZC9iaW5kXzkuMjAuMjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9iaW5kL2JpbmRfOS4yMC4yOS5iYgpAQCAtMjEsNyArMjEsNyBAQCBTUkNfVVJJID0g
Imh0dHBzOi8vZnRwLmlzYy5vcmcvaXNjL2JpbmQ5LyR7UFZ9LyR7QlBOfS0ke1BWfS50YXIueHog
XAogICAgICAgICAgICBmaWxlOi8vMDAwMS1tNC1CYWNrcG9ydC1heF9wcm9nX2NjX2Zvcl9idWls
ZC5tNC1tYWNyb3MucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICIxNDVhYjdhNTBiMzNhMDZkOWQ0ODhiNWU2NjhjODg3ZTc1NGY0MmFjZjg5NTRlMmI1ZGM3ZTIz
OGIwODBlNGEwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU4NzAyOTUwOGIzYjFiNDMyMjlmYWU0
MTZjOTdlNTU0M2FiYTQ1ODA5Y2VmYWNhOThhNTAwNGEwMmE1NzM2YzEiCiAKIFVQU1RSRUFNX0NI
RUNLX1VSSSA9ICJodHRwczovL2Z0cC5pc2Mub3JnL2lzYy9iaW5kOS8iCiAjIGZvbGxvdyB0aGUg
RVNWIHZlcnNpb25zIGRpdmlzaWJsZSBieSAyCi0tIAoyLjQ3LjEKCg==

--===============3276852547314484277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccfg-9.20.27.so /usr/lib/libdns-9.20.27.so /usr/lib/libisc-9.20.27.so /usr/lib/libisccc-9.20.27.so /usr/lib/libns-9.20.27.so", added "/usr/lib/libdns-9.20.29.so /usr/lib/libisc-9.20.29.so /usr/lib/libisccc-9.20.29.so /usr/lib/libisccfg-9.20.29.so /usr/lib/libns-9.20.29.so"
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.27.so to libdns-9.20.29.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.27.so to libisccc-9.20.29.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.27.so to libisccfg-9.20.29.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.27.so to libisc-9.20.29.so
  /usr/lib/libns.so changed symlink target from libns-9.20.27.so to libns-9.20.29.so
  /usr/lib/libdns-9.20.27.so moved to /usr/lib/libdns-9.20.29.so
  /usr/lib/libisc-9.20.27.so moved to /usr/lib/libisc-9.20.29.so
  /usr/lib/libisccc-9.20.27.so moved to /usr/lib/libisccc-9.20.29.so
  /usr/lib/libisccfg-9.20.27.so moved to /usr/lib/libisccfg-9.20.29.so
  /usr/lib/libns-9.20.27.so moved to /usr/lib/libns-9.20.29.so

--===============3276852547314484277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="bind-changelog.txt"

Q2hhbmdlbG9nIGZvciBiaW5kOiA5LjIwLjI3IC0+IDkuMjAuMjkKU291cmNlOiBkb2MvY2hhbmdl
bG9nL2NoYW5nZWxvZy05LjIwLjI4LnJzdCwgZG9jL2NoYW5nZWxvZy9jaGFuZ2Vsb2ctOS4yMC4y
OS5yc3QKCkJJTkQgOS4yMC4yOAotLS0tLS0tLS0tLS0KCi4uIG5vdGU6OgoKICAgVGhlIEJJTkQg
OS4yMC4yOCByZWxlYXNlIHdhcyB3aXRoZHJhd24gYWZ0ZXIgdGhlIGRpc2NvdmVyeSBvZiBhCiAg
IHJlZ3Jlc3Npb24gaW4gaXQgZHVyaW5nIHByZS1yZWxlYXNlIHRlc3RpbmcuCgpCSU5EIDkuMjAu
MjkKLS0tLS0tLS0tLS0tCgpTZWN1cml0eSBGaXhlcwp+fn5+fn5+fn5+fn5+fgoKLSBbQ1ZFLTIw
MjYtMTk2NjhdIFByZXZlbnQgZXhjZXNzaXZlIENQVSB1c2UgdmFsaWRhdGluZyBjcmFmdGVkIERO
U1NFQwogIHJlc3BvbnNlcy4gYGBhMGE2MWRiYTllYGAKCiAgQSBtYWxpY2lvdXMgYXV0aG9yaXRh
dGl2ZSBzZXJ2ZXIgY291bGQgc2VydmUgYSBzZWN1cmVseSBkZWxlZ2F0ZWQgem9uZQogIHdob3Nl
IERTIGFuZCBETlNLRVkgcmVjb3JkcyBjYXJyeSBtYW55IGRpc3RpbmN0IGtleSB0YWdzIGJ1dCBu
byB2YWxpZAogIG1hdGNoLCBmb3JjaW5nIGEgdmFsaWRhdGluZyByZXNvbHZlciBpbnRvIGV4Y2Vz
c2l2ZSBrZXktdGFnIG1hdGNoaW5nCiAgYW5kIGhpZ2ggQ1BVIHVzZSBmb3IgZXZlcnkgcXVlcnku
IEJJTkQgbm93IGJvdW5kcyB0aGlzIHdvcmsgd2l0aCB0aGUKICBwZXItcXVlcnkgdmFsaWRhdGlv
biBsaW1pdCAobWF4LXZhbGlkYXRpb25zLXBlci1mZXRjaCkuIDpnbDpgIzUzNDlgCgotIFtDVkUt
MjAyNi0xOTAzM10gUmVxdWlyZSBhIFRTSUcgb24gZXZlcnkgbWVzc2FnZSBvZiBpbmNvbWluZyB6
b25lCiAgdHJhbnNmZXJzLiBgYDk0MDRjZDJiOGNgYAoKICBCSU5EIDkgdXNlZCB0byBhY2NlcHQg
VFNJRy1zaWduZWQgem9uZSB0cmFuc2ZlcnMgaW4gd2hpY2ggc29tZQogIG1lc3NhZ2VzIHdlcmUg
dW5zaWduZWQsIGFuZCBwcm9jZXNzZWQgdGhvc2UgbWVzc2FnZXMgYmVmb3JlIHRoZSBuZXh0CiAg
c2lnbmF0dXJlIGNvdWxkIHZvdWNoIGZvciB0aGVtLiBJdCBub3cgcmVxdWlyZXMgYSBUU0lHIG9u
IGV2ZXJ5CiAgbWVzc2FnZSBvZiBhbiBpbmNvbWluZyBBWEZSIG9yIElYRlI7IGFsbCBtb2Rlcm4g
bmFtZXNlcnZlciBhbHJlYWR5CiAgc2lnbiBldmVyeSBtZXNzYWdlLCBzbyBubyBjaGFuZ2UgaXMg
ZXhwZWN0ZWQgaW4gcHJhY3RpY2UuIDpnbDpgIzYwNjJgCgotIFtDVkUtMjAyNi03NzExOV0gUHJl
dmVudCBhIEROU1NFQyBkb3duZ3JhZGUgb2Ygc2VjdXJlIGRlbGVnYXRpb25zIHZpYQogIHVucmVs
YXRlZCBOU0VDMy4gYGAzYmVkOWM4ZTllYGAKCiAgQSB2YWxpZGF0aW5nIHJlc29sdmVyIGNvdWxk
IGJlIHRyaWNrZWQgaW50byB0cmVhdGluZyBhIHNlY3VyZQogIGRlbGVnYXRpb24gYXMgdW5zaWdu
ZWQgYW5kIGFjY2VwdGluZyBmb3JnZWQgYW5zd2VycyBmb3IgbmFtZXMgYmVuZWF0aAogIGl0LCBp
ZiBhbiBhdHRhY2tlciBjb3VsZCBpbmplY3QgcmVzcG9uc2VzIHRvIGl0cyBxdWVyaWVzLiBTdWNo
IGZvcmdlZAogIHByb29mcyBhcmUgbm93IHJlamVjdGVkLiA6Z2w6YCM2MjM0YAoKLSBbQ1ZFLTIw
MjYtMTk5NDFdIFByZXZlbnQgZm9yZ2VkIEROU1NFQy12YWxpZGF0ZWQgTlhET01BSU4gcmVzcG9u
c2VzLgogIGBgYTM2YmY1OGRhZmBgCgogIEEgdmFsaWRhdGluZyByZXNvbHZlciBjb3VsZCBhY2Nl
cHQgYSBzaWduZWQgTlNFQyByZWNvcmQgZnJvbSBhbgogIHVucmVsYXRlZCB6b25lIGFzIHByb29m
IHRoYXQgYSB3aWxkY2FyZCBkaWQgbm90IGV4aXN0LiBBbiBvbi1wYXRoCiAgYXR0YWNrZXIgb3Ig
bWFsaWNpb3VzIGZvcndhcmRlciBjb250cm9sbGluZyBhIHNpZ25lZCB6b25lIGNvdWxkCiAgdGhl
cmVmb3JlIGZvcmdlIGFuIGF1dGhlbnRpY2F0ZWQgTlhET01BSU4gcmVzcG9uc2UgZm9yIGEgbmFt
ZSB0aGF0CiAgc2hvdWxkIHJlc29sdmUgdGhyb3VnaCBhIHdpbGRjYXJkLiBCSU5EIG5vdyByZXF1
aXJlcyB0aGUKICB3aWxkY2FyZC1kZW5pYWwgYW5kIG5hbWUtbm9uZXhpc3RlbmNlIHByb29mcyB0
byBiZSBzaWduZWQgYnkgdGhlIHNhbWUKICB6b25lLiA6Z2w6YCM2MjUzYAoKLSBbQ1ZFLTIwMjYt
MTk2NjZdIEROUzY0IHdpdGggYnJlYWstZG5zc2VjIGNvdWxkIGNhdXNlIGFuIGFzc2VydGlvbgog
IGZhaWx1cmUuIGBgNGNlYzQ5NjVjNGBgCgogIFdoZW4gYSAiZG5zNjQiIHN0YXRlbWVudCBpcyBj
b25maWd1cmVkIHdpdGggImJyZWFrLWRuc3NlYyB5ZXMiIGFuZCBpdHMKICAiZXhjbHVkZSIgbGlz
dCBtYXRjaGVzIHNvbWUgYnV0IG5vdCBhbGwgb2YgdGhlIGFkZHJlc3NlcyBpbiBhbiBBQUFBCiAg
UlJzZXQsIG5hbWVkIHJlbW92ZXMgdGhlIGV4Y2x1ZGVkIGFkZHJlc3NlcyBmcm9tIHRoZSBhbnN3
ZXIgaW5zdGVhZCBvZgogIHN5bnRoZXNpemluZyBuZXcgb25lcy4gSWYgdGhlIGFuc3dlciBiZWlu
ZyBmaWx0ZXJlZCBoYWQgYmVlbiBjYWNoZWQKICB0b2dldGhlciB3aXRoIGEgcHJvb2YgdGhhdCB0
aGUgcXVlcmllZCBuYW1lIGRvZXMgbm90IGV4aXN0IC0tIHdoaWNoIGlzCiAgd2hhdCBhIHdpbGRj
YXJkIG1hdGNoIHByb2R1Y2VzIC0tIG5hbWVkIHRlcm1pbmF0ZWQgd2l0aCBhbiBhc3NlcnRpb24K
ICBmYWlsdXJlLgoKICBPbmx5IHJlY3Vyc2l2ZSByZXNvbHZlcnMgYXJlIGFmZmVjdGVkLCBhbmQg
b25seSB3aGVuICJicmVhay1kbnNzZWMKICB5ZXMiIGlzIGluIHVzZTsgdGhlIGFuc3dlciBoYXMg
dG8gY29tZSBmcm9tIHRoZSBjYWNoZSwgc28gYSBzZXJ2ZXIKICB0aGF0IGlzIG9ubHkgYXV0aG9y
aXRhdGl2ZSBjYW5ub3QgcmVhY2ggdGhpcy4gOmdsOmAjNjMwMWAKCi0gW0NWRS0yMDI2LTE5NjY3
XSBSZWplY3QgbmVnYXRpdmUgY2FjaGUgcmVjb3JkcyB0aGF0IGRvIG5vdCBmaXQgaW4gYQogIGRu
c19yZGF0YV90LiBgYGRiZjA4Yzg1ODFgYAoKICBBIHNpbmdsZSBjcmFmdGVkIHJlc3BvbnNlIGZy
b20gYSBzZXJ2ZXIgY291bGQgbWFrZSBhIHJlc29sdmVyIGNhY2hlIGEKICBtYWxmb3JtZWQgbmVn
YXRpdmUgZW50cnkgYW5kIHRoZW4gdGVybWluYXRlIHdpdGggYW4gYXNzZXJ0aW9uIGZhaWx1cmUK
ICB3aGVuIHJlYWRpbmcgaXQgYmFjay4gT25seSByZWN1cnNpdmUgcmVzb2x2ZXJzIGFyZSBhZmZl
Y3RlZCwgb24gYQogIGRlZmF1bHQgY29uZmlndXJhdGlvbi4gOmdsOmAjNjMwMmAKCi0gW0NWRS0y
MDI2LTE5NjYyXSBQcmV2ZW50IHJlc29sdmVyIGNyYXNoIHdpdGggY2FjaGVkIEROU1NFQyBwcm9v
ZnMuCiAgYGBjODg0Y2MxYmEwYGAKCiAgVW5kZXIgY2VydGFpbiB0aW1pbmcgY29uZGl0aW9ucywg
Y29uY3VycmVudCByZWN1cnNpdmUgcXVlcmllcyBjb3VsZAogIGNhdXNlIG5hbWVkIHRvIGNyYXNo
IHdoZW4gY2FjaGVkIEROU1NFQyBOT1FOQU1FIHByb29mIGRhdGEgd2FzCiAgcmVwbGFjZWQgd2hp
bGUgc3RpbGwgaW4gdXNlLiBDYWNoZWQgcHJvb2YgZGF0YSBpcyBub3cgcmV0YWluZWQgdW50aWwK
ICBhbGwgcXVlcmllcyB1c2luZyBpdCBoYXZlIGNvbXBsZXRlZC4gOmdsOmAjNjMzM2AKCi0gW0NW
RS0yMDI2LTc1MDI5XSBEaXNjYXJkIHJlcGVhdGVkIFNPQSwgQ05BTUUsIGFuZCBETkFNRSByZWNv
cmRzIHdoZW4KICBwYXJzaW5nIEROUyBtZXNzYWdlcy4gYGAwZDYzMDc1OGMyYGAKCiAgQSBETlMg
bWVzc2FnZSBjb3VsZCBjYXJyeSB0aGUgc2FtZSBTT0EsIENOQU1FLCBvciBETkFNRSByZWNvcmQg
bWFueQogIHRpbWVzLCBhbmQgbmFtZWQga2VwdCBldmVyeSBjb3B5IHdoaWxlIHBhcnNpbmcgaXQu
IFdpdGggbmFtZQogIGNvbXByZXNzaW9uIHRob3NlIGNvcGllcyB0b29rIHVwIGZhciBtb3JlIG1l
bW9yeSBpbnRlcm5hbGx5IHRoYW4gaW4KICB0aGUgbWVzc2FnZSBpdHNlbGYsIGFuZCBldmVyeSBs
YXRlciBwcm9jZXNzaW5nIHN0ZXAgaGFkIHRvIGhhbmRsZSBhbGwKICBvZiB0aGVtLiBuYW1lZCBu
b3cga2VlcHMgdGhlIGZpcnN0IGNvcHkgb2Ygc3VjaCBhIHJlY29yZCBhbmQgZGlzY2FyZHMKICBp
ZGVudGljYWwgcmVwZWF0cy4gOmdsOmAjNjMzNWAKCi0gW0NWRS0yMDI2LTc3NjkyXSBGaXggYW4g
dW5hdXRoZW50aWNhdGVkIGNyYXNoIG9uIEhUVFBTIHVzaW5nIFNJRygwKQogIGBgNWEyNDQwMWM1
Y2BgCgogIEEgc3BlY2lmaWNhbGx5IGNyYWZ0ZWQgSFRUUFMgcXVlcnkgdXNpbmcgU0lHKDApIGFz
IGF1dGhlbnRpY2F0aW9uCiAgY291bGQgY3Jhc2ggbmFtZWQgaWYgdGhlIGNsaWVudCBjbG9zZXMg
dGhlIGNvbm5lY3Rpb24gYmVmb3JlIG5hbWVkCiAgYWN0dWFsbHkgdmVyaWZpZXMgdGhlIHNpZ25h
dHVyZS4gVGhpcyBpcyBub3cgZml4ZWQuIDpnbDpgIzYzNDNgCgotIFtDVkUtMjAyNi04MTczNl0g
Q2FjaGVkIEhUVFBTL1NWQ0IgYWxpYXNlcyBjb3VsZCBleGhhdXN0IHJlc29sdmVyIENQVS4KICBg
YDIwYmJiMTYzOWFgYAoKICBBIHJlY3Vyc2l2ZSByZXNvbHZlciB0aGF0IGhhZCBjYWNoZWQgYSBs
YXJnZSBzZXQgb2YgaW50ZXJsaW5rZWQgSFRUUFMKICBvciBTVkNCIHJlY29yZHMgaW4gYWxpYXMg
Zm9ybSBjb3VsZCBiZSBkcml2ZW4gdG8gZG8gYW4gZXhjZXNzaXZlCiAgYW1vdW50IG9mIHdvcmsg
YXNzZW1ibGluZyBhIHNpbmdsZSByZXNwb25zZSwgYmVjYXVzZSBpdCBmb2xsb3dlZCBldmVyeQog
IGNhY2hlZCBhbGlhcyB0YXJnZXQgd2hlbiBidWlsZGluZyB0aGUgYWRkaXRpb25hbCBzZWN0aW9u
LiBBIGNsaWVudAogIHBlcm1pdHRlZCB0byB1c2UgcmVjdXJzaW9uLCB0b2dldGhlciB3aXRoIGFu
IGF0dGFja2VyLWNvbnRyb2xsZWQgem9uZQogIHVzZWQgdG8gcGxhbnQgdGhlIHJlY29yZHMsIGNv
dWxkIHJlcGVhdCBzbWFsbCBxdWVyaWVzIHRvIGNvbnN1bWUKICBlbm91Z2ggQ1BVIHRvIGRlbGF5
IG9yIGRlbnkgc2VydmljZSB0byBvdGhlciBjbGllbnRzLiBUaGUgYW1vdW50IG9mCiAgYWRkaXRp
b25hbCBwcm9jZXNzaW5nIGRvbmUgZm9yIG9uZSBxdWVyeSBpcyBub3cgYm91bmRlZC4gOmdsOmAj
NjM0N2AKCi0gW0NWRS0yMDI2LTc2MTYzXSBQcmV2ZW50IFRLRVkgcXVlcmllcyBmcm9tIHRlcm1p
bmF0aW5nIG5hbWVkIHdpdGhvdXQKICBnbG9iYWwgb3B0aW9ucy4gYGA3NjQ1MTM4NTM4YGAKCiAg
bmFtZWQgY291bGQgdGVybWluYXRlIHVuZXhwZWN0ZWRseSB3aGVuIGEgcmVtb3RlIGNsaWVudCBz
ZW50IGEgVEtFWQogIHF1ZXJ5IGlmIHRoZSBjb25maWd1cmF0aW9uIGRpZCBub3QgaW5jbHVkZSBh
IGdsb2JhbCBvcHRpb25zIHN0YXRlbWVudC4KICBUaGlzIGhhcyBiZWVuIGZpeGVkLgoKICBJU0Mg
dGhhbmtzIE93YWlzIExvbmUgKHRoZXNlY2d1eSkgZm9yIHJlcG9ydGluZyB0aGUgaXNzdWUuIDpn
bDpgIzYzNTdgCgotIFtDVkUtMjAyNi03ODMwMV0gT3V0LW9mLXpvbmUgcmVjb3JkcyBpbiBhIHpv
bmUgZGF0YWJhc2UgY291bGQgYmUKICBzZXJ2ZWQgYXMgYXV0aG9yaXRhdGl2ZS4gYGA3MmExMGMz
YTBiYGAKCiAgV2hlbiBhIHpvbmUgZGF0YWJhc2UgY29udGFpbmVkIHJlY29yZHMgZm9yIG5hbWVz
IG91dHNpZGUgdGhlIHpvbmUg4oCUCiAgc3VjaCBhcyBhIGRlbGVnYXRpb24gYWJvdmUgdGhlIHpv
bmUgYXBleCwgbGVmdCBiZWhpbmQgYnkgYSBzZWNvbmRhcnkKICB0aGF0IGhhZCBhY2NlcHRlZCBv
dXQtb2Ytem9uZSBkYXRhIGZyb20gaXRzIHByaW1hcnkg4oCUIHRoZSBzZXJ2ZXIgY291bGQKICB0
cmVhdCB0aGVtIGFzIGF1dGhvcml0YXRpdmUgYW5kIGFuc3dlciBxdWVyaWVzIGZvciBuYW1lcyBp
bnNpZGUgdGhlCiAgem9uZSB3aXRoIHRoYXQgb3V0LW9mLXpvbmUgZGF0YSBpbnN0ZWFkIG9mIHRo
ZSB6b25lJ3Mgb3duLiBBIHNlcnZlcgogIHRoYXQgd2FzIGFsc28gYSByZXNvbHZlciBjb3VsZCBm
b2xsb3cgc3VjaCBhIGRlbGVnYXRpb24gYW5kIGNhY2hlIHRoZQogIGFuc3dlcnMgb2YgdGhlIHNl
cnZlciBpdCBuYW1lZCwgYWZmZWN0aW5nIG5hbWVzIG91dHNpZGUgdGhlIGNvbmZpZ3VyZWQKICB6
b25lLiBab25lIGRhdGFiYXNlIGxvb2t1cHMgYXJlIG5vdyBjb25maW5lZCB0byBuYW1lcyBhdCBv
ciBiZWxvdyB0aGUKICB6b25lJ3Mgb3JpZ2luLgoKICBJU0Mgd291bGQgbGlrZSB0byB0aGFuayBI
ZW5yaXF1ZSBQZXJlaXJhIGZvciByZXBvcnRpbmcgdGhlIGlzc3VlLgogIDpnbDpgIzYzNjFgCgot
IFtDVkUtMjAyNi04MDI3NF0gQ3Jhc2ggb24gd2lsZGNhcmQgYW5zd2VycyBjYXJyeWluZyBib3Ro
IE5TRUMgYW5kCiAgTlNFQzMgcHJvb2ZzLiBgYDBlNDQ0NTFiMWFgYAoKICBXaGVuIGEgd2lsZGNh
cmQgYW5zd2VyIGFycml2ZWQgd2l0aCBib3RoIE5TRUMgYW5kIE5TRUMzIHJlY29yZHMgYXQgdGhl
CiAgbmFtZSBwcm92aW5nIHRoYXQgdGhlIHF1ZXJpZWQgbmFtZSBkb2VzIG5vdCBleGlzdCwgdGhl
IHJlc29sdmVyIGNvdWxkCiAgcGljayBkaWZmZXJlbnQgcmVjb3JkcyB3aGVuIGNhY2hpbmcgdGhl
IGFuc3dlciBhbmQgd2hlbiByZXRyaWV2aW5nIHRoZQogIHByb29mLCBkZXBlbmRpbmcgb24gdGhl
IG9yZGVyIGluIHdoaWNoIHRoZSBhdXRob3JpdGF0aXZlIHNlcnZlciBzZW50CiAgdGhlbS4gVGhp
cyBjb3VsZCB0ZXJtaW5hdGUgbmFtZWQgd2l0aCBhbiBhc3NlcnRpb24gZmFpbHVyZSwgZmFpbCB0
aGUKICBxdWVyeSB3aXRoIFNFUlZGQUlMLCBvciBzZXJ2ZSBhIGRlbmlhbCByZWNvcmQgb3RoZXIg
dGhhbiB0aGUgb25lIHRoYXQKICBoYWQgYmVlbiB2ZXJpZmllZC4gVGhlIHJlc29sdmVyIG5vdyBj
YWNoZXMgYW5kIHNlcnZlcyB0aGUgc2FtZSBkZW5pYWwKICByZWNvcmQgaXQgYWNjZXB0ZWQgd2hl
biB0aGUgYW5zd2VyIHdhcyByZWNlaXZlZC4KCiAgSVNDIHdvdWxkIGxpa2UgdG8gdGhhbmsgaHl0
aHl0IGZvciByZXBvcnRpbmcgdGhlIGlzc3VlLiA6Z2w6YCM2MzY5YAoKLSBbQ1ZFLTIwMjYtODE1
NjNdIEZvbGxvd2luZyBIVFRQUy9TVkNCIGFsaWFzZXMgY291bGQgbGVhayByZXNvbHZlcgogIGNh
Y2hlIG1lbW9yeS4gYGAzMTYyZGYzNjllYGAKCiAgV2hlbiBhIHJlY3Vyc2l2ZSBzZXJ2ZXIgYW5z
d2VyZWQgYSBxdWVyeSBmb3IgYW4gSFRUUFMgb3IgU1ZDQiByZWNvcmQKICBpbiBhbGlhcyBmb3Jt
IGFuZCB0aGUgYWxpYXMgdGFyZ2V0IGhhZCBtb3JlIHRoYW4gMTMgcmVjb3JkcywgdGhlCiAgdGFy
Z2V0IHJlY29yZHMgd2VyZSBwaW5uZWQgaW4gdGhlIGNhY2hlIHBlcm1hbmVudGx5IGluc3RlYWQg
b2YgYmVpbmcKICByZWxlYXNlZCBvbmNlIHRoZSBhbnN3ZXIgd2FzIHNlbnQuIEEgcmVtb3RlIHBh
cnR5IHdobyBjb3VsZCBtYWtlIHRoZQogIHNlcnZlciBmb2xsb3cgc3VjaCBhbGlhc2VzIHRvIGEg
c3RlYWR5IHN0cmVhbSBvZiBmcmVzaCBuYW1lcyBjb3VsZAogIGdyb3cgdGhlIGNhY2hlIGJleW9u
ZCB0aGUgY29uZmlndXJlZCBtYXgtY2FjaGUtc2l6ZSB1bnRpbCB0aGUgc2VydmVyCiAgd2FzIHVu
YWJsZSB0byByZXNvbHZlIHVucmVsYXRlZCBuYW1lcy4gVGhlIHJlY29yZHMgYXJlIG5vdyByZWxl
YXNlZAogIGNvcnJlY3RseS4KCiAgSVNDIHdvdWxkIGxpa2UgdG8gdGhhbmsgU2FteSBNZWRqYWhl
ZC9BcDRzaCBmb3IgcmVwb3J0aW5nIHRoZSBpc3N1ZS4KICA6Z2w6YCM2Mzc0YAoKTmV3IEZlYXR1
cmVzCn5+fn5+fn5+fn5+fgoKLSBBZGQgYW4gYWdlbnQgc2tpbGwgZm9yIHRoZSBpc2Nfam9iL2lz
Y19hc3luYy9pc2Nfd29yayBBUElzLgogIGBgZmUzMjk5MGIwNmBgCgogIERvY3VtZW50cyB3aGVu
IHRvIHVzZSBpc2Nfam9iX3J1bigpLCBpc2NfYXN5bmNfcnVuKCkgb3IKICBpc2Nfd29ya19lbnF1
ZXVlKCksIGFuZCB0aGUgY29udHJhY3QgZWFjaCBvbmUgaW1wb3Nlcy4gTm8gZnVuY3Rpb25hbAog
IGNoYW5nZS4gOmdsOmAhMTI1NjFgCgpSZW1vdmVkIEZlYXR1cmVzCn5+fn5+fn5+fn5+fn5+fn4K
Ci0gUmVtb3ZlIHVudXNlZCBjbG9zZXN0IGVuY2xvc2VyIHByb29mIGNhY2hpbmcuIGBgYWJkOGI1
YmZkOGBgCgogIEJJTkQgdXNlZCB0byBjYWNoZSBhbiBOU0VDMyBjbG9zZXN0IGVuY2xvc2VyIHBy
b29mIGFsb25nc2lkZSBwb3NpdGl2ZQogIHdpbGRjYXJkIGFuc3dlcnMgc28gdGhhdCBhIHJlc29s
dmVyIGNvdWxkIHJlLXNlbmQgaXQgd2hlbiBhbnN3ZXJpbmcKICBmcm9tIGl0cyBjYWNoZS4gVGhh
dCBzdG9wcGVkIGJlaW5nIHVzZWQgaW4gQklORCA5LjkgKDIwMTEpLCB3aGVuCiAgcG9zaXRpdmUg
d2lsZGNhcmQgcmVzcG9uc2VzIHdlcmUgY2hhbmdlZCB0byBvbWl0IHRoYXQgTlNFQzMgcmVjb3Jk
IOKAlAogIFJGQyA1MTU1IHJlcXVpcmVzIG9ubHkgdGhlIG5leHQgY2xvc2VyIG5hbWUgcHJvb2Yg
4oCUIGFuZCB0aGUgY2xvc2VzdAogIGVuY2xvc2VyIGNhbWUgdG8gYmUgIGRlcml2ZWQgZHVyaW5n
IHZhbGlkYXRpb24gaW5zdGVhZC4gVGhlIGNhY2hpbmcKICBjb2RlIGhhcyBiZWVuIHVucmVhY2hh
YmxlIGV2ZXIgc2luY2UsIHNvIHRoaXMgcmVtb3ZlcyBpdCB3aXRoIG5vCiAgY2hhbmdlIGluIGJl
aGF2aW91ci4gOmdsOmAjNTgwM2AgOmdsOmAhMTI2NjBgCgpGZWF0dXJlIENoYW5nZXMKfn5+fn5+
fn5+fn5+fn5+CgotIFJlamVjdCBvdmVyc2l6ZWQgYW5kIG1hbGZvcm1lZCBETlNLRVkgcmVjb3Jk
cyB1cCBmcm9udC4gYGA2YzIyMTA5OTI0YGAKCiAgT3ZlcnNpemVkIFJTQSBrZXkgbWF0ZXJpYWwg
aW4gYSBETlNLRVkgcmVjb3JkIHdhcyBvbmx5IHJlamVjdGVkIGFmdGVyCiAgaXQgaGFkIGJlZW4g
Y29udmVydGVkLCBhbGxvY2F0aW5nIG1lbW9yeSBwcm9wb3J0aW9uYWwgdG8gdGhlIHJlY29yZAog
IHNpemUuIFN1Y2ggcmVjb3JkcyBhcmUgbm93IHJlamVjdGVkIGJlZm9yZSBjb252ZXJzaW9uLCBh
cyBhcmUgRWQyNTUxOQogIGFuZCBFZDQ0OCBrZXlzIHdpdGggdHJhaWxpbmcgYnl0ZXMgdGhhdCB3
ZXJlIHByZXZpb3VzbHkgc2lsZW50bHkKICBpZ25vcmVkLiA6Z2w6YCM0NTM3YCA6Z2w6YCExMjU2
MGAKCkJ1ZyBGaXhlcwp+fn5+fn5+fn4KCi0gUHJldmVudCBhIGNyYXNoIHdoZW4gdXNpbmcgYm90
aCBkbnM2NCBhbmQgZmlsdGVyLWEuIGBgYmNlNWQxMGQxOGBgCgogIEFuIGFzc2VydGlvbiBmYWls
dXJlIHdhcyBwb3NzaWJsZSB3aGVuIHVzaW5nIGJvdGggYGRuczY0YCBhbmQgdGhlCiAgYGZpbHRl
ci1hYCBwbHVnaW4gc2ltdWx0YW5lb3VzbHk7IHRoaXMgaGFzIGJlZW4gZml4ZWQuIDpnbDpgIzU5
NzlgCiAgOmdsOmAhMTI2NjNgCgotIEZpeCB1cGRhdGUtcG9saWN5IGdyYW50IGV4dGVybmFsIGFk
ZHJlc3MgcGFzc2luZy4gYGBiMWU5NTVjMzI2YGAKCiAgT25seSBUQ1AgY2xpZW50IGFkZHJlc3Nl
cyBhcmUgc3VwcG9zZWQgdG8gYmUgcGFzc2VkIHRvIGFuIGBleHRlcm5hbGAKICBoYW5kbGVyIGZv
ciB0aGUgYXNzb2NpYXRlZCBgdXBkYXRlLXBvbGljeWAgcnVsZSwgYnV0IFVEUCBjbGllbnQKICBh
ZGRyZXNzZXMgd2VyZSBhbHNvIGJlaW5nIHBhc3NlZC4gIFRoaXMgY291bGQgaGF2ZSBjYXVzZWQg
dGhlIGV4dGVybmFsCiAgaGFuZGxlciB0byByZXR1cm4gYSByZXN1bHQgaXQgb3RoZXJ3aXNlIHdv
dWxkbid0LiBUaGlzIGhhcyBiZWVuIGZpeGVkLgogIDpnbDpgIzYwNjFgIDpnbDpgITEyNTU1YAoK
LSBNaXNzaW5nIHJlcXVpcmVkIE5TRUMzIGZvciBkZWxlZ2F0aW9uIG5vdCBkZXRlY3RlZC4gYGBl
ODRlZDJlOWQ3YGAKCiAgQSBtaXNzaW5nIHJlcXVpcmVkIE5TRUMzIHJlY29yZCBmb3IgYW4gaW5z
ZWN1cmUgZGVsZWdhdGlvbiBpbiBhIG5vbgogIE9QVE9VVCByYW5nZSB3YXMgbm90IGJlaW5nIGRl
dGVjdGVkLiAgVGhpcyBoYXMgYmVlbiBmaXhlZC4gOmdsOmAjNjA2M2AKICA6Z2w6YCExMjYxMWAK
Ci0gVGlnaHRlbiBFVUk0OCBhbmQgRVVJNDggdGV4dCBwYXJzaW5nLiBgYGZmNTBmMmNkZjFgYAoK
ICBNYWxmb3JtZWQgRVVJNDggYW5kIEVVSTY0IHJlY29yZHMgY291bGQgYmUgYWNjZXB0ZWQuICBU
aGlzIGhhcyBiZWVuCiAgZml4ZWQuIDpnbDpgIzYwODJgIDpnbDpgITEyNTIxYAoKLSBHZW9JUCBB
Q0wgc3RhdGUgY2FuIGJlIHN0YWxlIG9yIHdyb25nIGFmdGVyIHJlbG9hZC4gYGA2M2JhZjQyNWIz
YGAKCiAgYG5hbWVkYCBjYWNoZXMgR2VvSVAgaW5mb3JtYXRpb24gYWZ0ZXIgbG9va2luZyBpdCB1
cCwgYnV0IHRoZSBjYWNoZWQKICBpbmZvcm1hdGlvbiB3YXMgbm90IGludmFsaWRhdGVkIHdoZW4g
dGhlIEdlb0lQIGRhdGFiYXNlIHdhcyByZWxvYWRlZCwKICBzbyBpdCBjb3VsZCBjb250aW51ZSB0
byBiZSB1c2VkLiAgV2Ugbm93IGludmFsaWRhdGUgZXhpc3RpbmcgY2FjaGVkCiAgR2VvSVAgaW5m
b3JtYXRpb24gYXMgcGFydCBvZiB0aGUgcmVsb2FkaW5nIHByb2Nlc3MuIDpnbDpgIzYwODNgCiAg
OmdsOmAhMTI2NjJgCgotIEhvbm9yIEROU1NFQyBwb2xpY3kga2V5IHRhZyByYW5nZXMuIGBgYjgy
ZTU4MzRiN2BgCgogIFdoZW4gYSBETlNTRUMgcG9saWN5IGNvbmZpZ3VyZWQgYSBub24tZGVmYXVs
dCB0YWctcmFuZ2UsIGRuc3NlYy1rZXlnZW4KICBhbmQgZG5zc2VjLWtzciBjb3VsZCBhY2NlcHQg
Z2VuZXJhdGVkIGtleXMgb3V0c2lkZSB0aGF0IHJhbmdlLiBCb3RoCiAgdG9vbHMgbm93IGhvbm9y
IHRoZSBjb25maWd1cmVkIG1pbmltdW0gYW5kIG1heGltdW0ga2V5IHRhZ3MuCiAgOmdsOmAjNjA5
MWAgOmdsOmAhMTI1NDlgCgotIEZpeCBkb3VibGUgZnJlZSBpbiBtZGlnIHdoZW4gRUROUyBvcHRp
b25zIGFyZSBzcGVjaWZpZWQuCiAgYGBhZjViZDBiMGZmYGAKCiAgV2hlbiB0aGUgZGVmYXVsdF9x
dWVyeSBpcyBjbG9uZWQgdGhlIEVETlMgb3B0aW9ucyBuZWVkIHRvIGJlIGNsb25lZAogIHJhdGhl
ciB0aGFuIHRoZSBwb2ludGVyIGNvcGllZC4gIFRoZSBvbGQgYmVoYXZpb3VyIHJlc3VsdHMgaW4g
YSBkb3VibGUKICBmcmVlIG9mIHRoZSBvcHRpb25zLiAgVGhpcyBoYXMgYmVlbiBmaXhlZC4gOmds
OmAjNjA5NWAgOmdsOmAhMTI2NjFgCgotIEZpeCBhIGNyYXNoIHdoZW4gYW4gSVhGUiBmYWxscyBi
YWNrIHRvIEFYRlIgd2l0aCB1cGRhdGVzIHN0aWxsCiAgcGVuZGluZy4gYGBlMzQwNjJiYzdlYGAK
CiAgV2hlbiBhIHNlY29uZGFyeSB6b25lIHJlY2VpdmVkIGFuIGluY3JlbWVudGFsIHRyYW5zZmVy
IChJWEZSKSBhbmQgdGhlCiAgcHJpbWFyeSB0aGVuIGNhdXNlZCBuYW1lZCB0byBmYWxsIGJhY2sg
dG8gYSBmdWxsIHRyYW5zZmVyIChBWEZSKSB3aGlsZQogIHNvbWUgb2YgdGhlIGFscmVhZHktcmVj
ZWl2ZWQgaW5jcmVtZW50YWwgY2hhbmdlcyB3ZXJlIHN0aWxsIHdhaXRpbmcgdG8KICBiZSBhcHBs
aWVkLCBuYW1lZCBjb3VsZCBsYXRlciBjcmFzaCB3aGVuIHRoYXQgdHJhbnNmZXIgZmluaXNoZWQu
IFRoZQogIHBlbmRpbmcgY2hhbmdlcyBhcmUgbm93IGRpc2NhcmRlZCBjb3JyZWN0bHkgYmVmb3Jl
IHRoZSBBWEZSIHJldHJ5LgogIDpnbDpgIzYxMTRgIDpnbDpgITEyNjI0YAoKLSBGaXggRFMgcmVx
dWVzdHMgdG8gcGFyZW50YWwgYWdlbnRzIG92ZXIgVExTLiBgYDU1ODMwZDMwZjZgYAoKICBUTFMg
Y29uZmlndXJhdGlvbiBmb3IgcGFyZW50YWwgYWdlbnRzIHdhcyBiZWluZyBpZ25vcmVkIHdoZW4g
c2VuZGluZwogIERTIHJlcXVlc3RzLiBUaGlzIGhhcyBiZWVuIGZpeGVkLiA6Z2w6YCM2MTM1YCA6
Z2w6YCExMjYxM2AKCi0gRml4IGEgY3Jhc2ggd2hlbiByZXNvbHZpbmcgbmFtZXMgYmVsb3cgYSBj
YWNoZWQgRE5BTUUuIGBgYjk0ZTk0MGY1MmBgCgogIEEgcmVjdXJzaXZlIHJlc29sdmVyIGNvdWxk
IGNyYXNoIHdoZW4gaXQgYW5zd2VyZWQgYSBxdWVyeSBmb3IgYSBuYW1lCiAgYmVuZWF0aCBhIGNh
Y2hlZCBETkFNRSB3aGlsZSB0aGF0IHNhbWUgRE5BTUUgcmVjb3JkIHdhcyBjb25jdXJyZW50bHkK
ICByZWZyZXNoZWQgb3IgZXZpY3RlZCBmcm9tIHRoZSBjYWNoZS4gOmdsOmAjNjE4MmAgOmdsOmAh
MTI1OTNgCgotIFJuZGMtY29uZmdlbiBgLXFgIChxdWlldCkgb3B0aW9uIGlzIGRvY3VtZW50ZWQg
YnV0IGRvZXNuJ3Qgd29yay4KICBgYDdlNGE3Y2ExYTdgYAoKICBUaGUgY29tbWFuZCBsaW5lIHBh
cnNpbmcgaW4gcm5kYy1jb25mZ2VuIHdhcyBicm9rZW4gc28gIGBybmRjLWNvbmZnZW4KICAtcWAg
ZGlkIG5vdCB3b3JrLiAgVGhpcyBoYXMgYmVlbiBmaXhlZC4gOmdsOmAjNjE4N2AgOmdsOmAhMTI1
NzVgCgotIEVuZm9yY2UgcXVlcnkgQUNMcyBmb3IgcmVkaXJlY3Qgem9uZXMgYW5kIHNlYXJjaGVk
IERMWnMuCiAgYGBiYzY5ODc2YjJlYGAKCiAgUXVlcmllcyBhbnN3ZXJlZCBmcm9tIHJlZGlyZWN0
IHpvbmVzIG9yIHNlYXJjaGVkIERMWiBkYXRhYmFzZXMgZGlkIG5vdAogIGNvbnNpc3RlbnRseSBo
b25vciBgYWxsb3ctcXVlcnlgIGFuZCBgYWxsb3ctcXVlcnktb25gLCBwb3RlbnRpYWxseQogIGV4
cG9zaW5nIHJlc3RyaWN0ZWQgRE5TIGRhdGEgdG8gZXhjbHVkZWQgY2xpZW50cyBvciB0aHJvdWdo
IGV4Y2x1ZGVkCiAgbGlzdGVuaW5nIGFkZHJlc3Nlcy4gVGhlc2UgQUNMcyBhcmUgbm93IGVuZm9y
Y2VkIGJlZm9yZSByZWRpcmVjdCBvcgogIERMWiBkYXRhIGlzIHJldHVybmVkLiA6Z2w6YCM2MjUx
YCwgIzYyNTIgOmdsOmAhMTI2NDZgCgotIENoZWNrICJhc251bSIgdmFsaWRpdHkgaW4gR2VvSVAg
QUNMcy4gYGAyOGMyYmZkYzdiYGAKCiAgV2Ugbm93IGNoZWNrIHRoZSB2YWxpZGl0eSBvZiBhdXRv
bm9tb3VzIHN5c3RlbSAoQVMpIG51bWJlcnMgd2hlbgogIHBhcnNpbmcgR2VvSVAgQUNMcyB0aGF0
IHVzZSBgYXNudW1gIGVsZW1lbnRzIGF0IGNvbmZpZ3VyYXRpb24gdGltZS4KCiAgYGFzbnVtYCB2
YWx1ZXMgc3RhcnQgd2l0aCBhbiBvcHRpb25hbCBjYXNlLWluc2Vuc2l0aXZlICJBUyIgcHJlZml4
LAogIGZvbGxvd2VkIG9ubHkgYnkgZGVjaW1hbCBkaWdpdHMsIHdpdGggbm8gc3BhY2VzIG9yIG90
aGVyIGV4dHJhbmVvdXMKICBjaGFyYWN0ZXJzLiBUaGUgdmFsdWUgcmVwcmVzZW50ZWQgY2Fubm90
IGV4Y2VlZCAyXjMyLiA6Z2w6YCM2MjU1YAogIDpnbDpgITEyNTExYAoKLSBQcmV2ZW50IGNyYXNo
ZXMgd2hpbGUgcmVwb3J0aW5nIEROU1NFQyBzaWduaW5nIHN0YXRpc3RpY3MuCiAgYGBjMTkwNTE0
ZjBhYGAKCiAgU2VydmVycyB3aXRoIHpvbmUtc3RhdGlzdGljcyBmdWxsIGNvdWxkIHRlcm1pbmF0
ZSB3aGlsZSByZXBvcnRpbmcKICBETlNTRUMgc2lnbmluZyBzdGF0aXN0aWNzIGZvciBhIHpvbmUg
dHJhY2tpbmcgYWRkaW5nIG1vcmUgdGhhbiBmb3VyCiAgc2lnbmluZyBrZXlzLiA6Z2w6YCM2MjU2
YCA6Z2w6YCExMjY3NGAKCi0gRml4IHZhcmlvdXMgbml0cyBpbiB0aGUgbmV0bWdyIGNvZGUuIGBg
YzI4Y2RhZDUxYmBgCgogIFRoZSBNUiBjb25zaXN0cyBvZiBjb3VwbGUgb2Ygc21hbGwgZml4ZXMg
YW5kIHVuY2F1Z2h0IGVycm9ycyBpbiB0aGUKICBOZXR3b3JrIE1hbmFnZXIuIDpnbDpgIzYyNTdg
IDpnbDpgITEyNTc2YAoKLSBGaXggYSBjcmFzaCBvbiByZW1vdGUtc2VydmVycyBsaXN0cyB0aGF0
IHJlZmVyZW5jZSB0aGVtc2VsdmVzLgogIGBgYWFhZTYxNGY5ZGBgCgogIFNpbmNlIDkuMjEuMTYg
YW5kIDkuMjAuMTcsIGEgcmVtb3RlLXNlcnZlcnMsIHByaW1hcmllcywgbWFzdGVycywgb3IKICBw
YXJlbnRhbC1hZ2VudHMgbGlzdCB0aGF0IHJlZmVyZW5jZWQgaXRzZWxmLCBkaXJlY3RseSBvciB0
aHJvdWdoCiAgYW5vdGhlciBsaXN0LCBtYWRlIG5hbWVkIGNyYXNoIG9uIHN0YXJ0dXAgb3IgcmVj
b25maWd1cmF0aW9uLiBTdWNoCiAgcmVmZXJlbmNlcyBhcmUgYWdhaW4gc2tpcHBlZCBhbmQgdGhl
IHJlbWFpbmluZyBlbnRyaWVzIGluIHRoZSBsaXN0IGFyZQogIHVzZWQsIGFzIGluIGVhcmxpZXIg
dmVyc2lvbnMuIDpnbDpgIzYyODdgIDpnbDpgITEyNjA0YAoKLSBBIHJlY29yZCBmcm9tIG91dHNp
ZGUgYSByZXNwb25zZSBwb2xpY3kgem9uZSBjb3VsZCBzdG9wIG5hbWVkLgogIGBgZDEzNTUxM2Iz
N2BgCgogIEEgcmVzcG9uc2UgcG9saWN5IHpvbmUgdHJhbnNmZXJyZWQgZnJvbSBhIHByaW1hcnkg
Y2FuIGNvbnRhaW4gYSByZWNvcmQKICB3aG9zZSBuYW1lIGxpZXMgb3V0c2lkZSB0aGUgem9uZS4g
U3VjaCBhIHJlY29yZCBjb3VsZCBzdG9wIG5hbWVkLCBib3RoCiAgd2hlbiBpdCBhcnJpdmVkIGFu
ZCBhZ2FpbiBhdCBldmVyeSBzdGFydHVwIGFmdGVyd2FyZHMsIGJlY2F1c2UgYQogIHNlY29uZGFy
eSBrZWVwcyBpdCBpbiBpdHMgb3duIGNvcHkgb2YgdGhlIHpvbmUuIFJlY29yZHMgbGlrZSB0aGlz
IGFyZQogIG5vdyByZWplY3RlZCBhbmQgbG9nZ2VkOyBwcmV2aW91c2x5IG9uZSBjb3VsZCBhbHNv
IHNpbGVudGx5IGNyZWF0ZSBhCiAgcG9saWN5IGVudHJ5IGZvciBhbiB1bnJlbGF0ZWQgbmFtZS4g
OmdsOmAjNjMwNGAgOmdsOmAhMTI1NDNgCgotICJybmRjIGZsdXNodHJlZSAuIiBmYWlsZWQgdG8g
Zmx1c2ggdGhlIGNhY2hlLiBgYDk2ZThiNTg1ZWRgYAoKICBgcm5kYyBmbHVzaHRyZWVgIGZsdXNo
ZXMgY2FjaGUgZGF0YSBiZWxvdyBhIHNwZWNpZmllZCBuYW1lLiBJZiB0aGUKICBuYW1lIHNwZWNp
ZmllZCBpcyB0aGUgRE5TIHJvb3QsIGl0IHNob3VsZCBmdWxseSBlbXB0eSB0aGUgY2FjaGUsIHRo
ZQogIHNhbWUgYXMgYHJuZGMgZmx1c2hgLiAgSG93ZXZlciwgdGhlcmUgd2FzIGEgYnVnIGNhdXNp
bmcgdGhlIGNvbW1hbmQsCiAgaW4gdGhhdCBjYXNlLCB0byBoYXZlIG5vIGVmZmVjdCBvbiB0aGUg
Y2FjaGUgYXQgYWxsOyB0aGlzIGhhcyBiZWVuCiAgZml4ZWQuIDpnbDpgIzYzMDhgIDpnbDpgITEy
NTgyYAoKLSBJbnZhbGlkIGtleS1zdG9yZSBjb25maWd1cmF0aW9uIGNvdWxkIGFib3J0IHRoZSBE
TlNTRUMgdG9vbHMuCiAgYGAxZDc5NmFiMDcyYGAKCiAgSW52YWxpZCBjb25maWd1cmVkIGtleS1z
dG9yZXMgbmFtZWQgImtleS1kaXJlY3RvcnkiIGluIGNvbmZpZ3VyYXRpb24KICBmaWxlcyBjb3Vs
ZCBhYm9ydCB0aGUgRE5TU0VDIHRvb2xzLiBUaGlzIGhhcyBiZWVuIGZpeGVkLiA6Z2w6YCM2MzEz
YAogIDpnbDpgITEyNjUzYAoKLSBOU0VDIHNpZ25hdHVyZSBzZXQgY291bGQgYnlwYXNzIHRoZSBz
ZWN1cmUtZGVsZWdhdGlvbiBjaGVjay4KICBgYGM5NjYxNzdmNmNgYAoKICBXaGVuIHByb3Zpbmcg
dGhhdCBhIGRlbGVnYXRpb24gaXMgaW5zZWN1cmUsIHRoZSB2YWxpZGF0b3IgYm91bmRlZCBhbgog
IE5TRUMgcmVjb3JkJ3MgYXV0aG9yaXR5IGJ5IHRoZSBzaWduZXIgb2Ygd2hpY2hldmVyIFJSU0lH
IGhhcHBlbmVkIHRvCiAgY29tZSBmaXJzdCBpbiB0aGUgcmVjb3JkJ3Mgc2lnbmF0dXJlIHNldCwg
cmF0aGVyIHRoYW4gdGhlIHNpZ25hdHVyZQogIHRoYXQgYWN0dWFsbHkgdmVyaWZpZWQuIEEgZ3Jh
bmRwYXJlbnQgTlNFQyBwYWRkZWQgd2l0aCBhbiBleHRyYSwKICB1bnZlcmlmaWFibGUgc2lnbmF0
dXJlIGNvdWxkIHRoZXJlZm9yZSBwYXNzIHRoZSBjaGVjayB0aGF0IGtlZXBzIHN1Y2gKICBwcm9v
ZnMgZnJvbSByZWFjaGluZyBiZWxvdyBhIHNpZ25lZCBjaGlsZCB6b25lLiBUaGUgdmFsaWRhdG9y
IG5vdwogIHJlcXVpcmVzIGV2ZXJ5IHNpZ25hdHVyZSBvbiB0aGUgTlNFQyB0byBuYW1lIHRoZSBz
YW1lIHNpZ25lciBhbmQKICByZWZ1c2VzIHByb29mcyB3aG9zZSBzaWduYXR1cmUgc2V0IGlzIG1h
bGZvcm1lZCBvciBsYXJnZXIgdGhhbgogIG1heC12YWxpZGF0aW9ucy1wZXItZmV0Y2ggYWxsb3dz
LiA6Z2w6YCM2MzIxYAoKLSBGaXggYSBwb3NzaWJsZSBuc3VwZGF0ZSBpc3N1ZSB3aGVuIHVzaW5n
IEdTUy1UU0lHLiBgYDRkZGNhYjJkM2NgYAoKICBUaGUgOmlzY21hbjpgbnN1cGRhdGVgIHByb2Nl
c3MgY291bGQgdGVybWluYXRlIHVuZXhwZWN0ZWRseSB3aGVuIHVzaW5nCiAgdGhlIEdTUy1UU0lH
IG1vZGUgZXhlY3V0ZWQgd2l0aCB0aGUgOm9wdGlvbjpgbnN1cGRhdGUgLWdgIG9wdGlvbi4gVGhp
cwogIGhhcyBiZWVuIGZpeGVkLiA6Z2w6YCM2MzI1YCA6Z2w6YCExMjU4OGAKCi0gRml4IGlzY2Nj
X2FsaXN0X2RlZmluZSBlcnJvciBwYXRocy4gYGBhZjEzNDk1NTJhYGAKCiAgSWYgdGhlcmUgaXMg
YW4gb3V0IG9mIG1lbW9yeSBlcnJvciBpbiBpc2NjY19hbGlzdF9kZWZpbmUgYSBtZW1vcnkgbGVh
awogICh0aGUgc2V4cHIgaG9sZGluZyB0aGUga2V5IG5hbWUpIG9yIGEgZG91YmxlIGZyZWUgKHZh
bHVlKSBjb3VsZCBvY2N1ci4KICBUaGlzIGhhcyBiZWVuIGZpeGVkLiA6Z2w6YCM2MzI5YCA6Z2w6
YCExMjYzNmAKCi0gQ2hlY2sgZm9yIGVtcHR5ICdlbmRwb2ludHMnIGxpc3QuIGBgMjNmNThhZjQ0
M2BgCgogIENvbmZpZ3VyaW5nIGFuIGBodHRwYCBibG9jayB3aXRoIGBlbmRwb2ludHMge307YCBw
cmV2aW91c2x5IGNhdXNlZCBhCiAgY3Jhc2ggaW4gYG5hbWVkYC4gVGhpcyBpcyBub3cgcmVqZWN0
ZWQgZWFybGllciBieSB0aGUgY29uZmlndXJhdGlvbgogIGNoZWNrLiA6Z2w6YCM2MzMwYCA6Z2w6
YCExMjU1MmAKCi0gTmFtZWQgY291bGQgY3Jhc2ggd2l0aCBhIHNpbmdsZS1lbGVtZW50IGdlb2lw
IHNvcnRsaXN0LiBgYDBlOTk2YTRkM2JgYAoKICBJZiBgbmFtZWRgIHdhcyBjb25maWd1cmVkIHdp
dGggYSBzaW5nbGUtZWxlbWVudCBzb3J0bGlzdCBjb250YWluaW5nIGEKICBgZ2VvaXBgIEFDTCBl
bGVtZW50LCBhbnkgbWF0Y2hpbmcgcXVlcnkgdHJpZ2dlcmVkIGFuIGFzc2VydGlvbgogIGZhaWx1
cmUuIFRoaXMgaGFzIGJlZW4gZml4ZWQuIDpnbDpgIzYzNDJgIDpnbDpgITEyNTgzYAoKLSBQcmV2
ZW50IG91dC1vZi1iYWlsaXdpY2sgQ05BTUVzIGZyb20gZXZpY3RpbmcgY2FjaGVkIHJlY29yZHMu
CiAgYGBjZGVkZDRhY2Q1YGAKCiAgQSByZWN1cnNpdmUgcmVzb2x2ZXIgY291bGQgcmVtb3ZlIHZh
bGlkIGNhY2hlZCByZWNvcmRzIHdoZW4gYSBETlMKICByZXNwb25zZSBjb250YWluZWQgYW4gb3V0
LW9mLWJhaWxpd2ljayBDTkFNRSB3aXRoIHRoZSBzYW1lIG93bmVyIG5hbWUuCiAgT3V0LW9mLWJh
aWxpd2ljayBkYXRhIGlzIG5vdyBkaXNjYXJkZWQgYmVmb3JlIGl0IGNhbiBtb2RpZnkgdGhlIGNh
Y2hlLgogIDpnbDpgIzYzNDVgIDpnbDpgITEyNjUxYAoKLSBSZXN0b3JlIHBlcmlvZGljIGNsZWFu
dXAgb2Ygc3RhbGUgcmVzb2x2ZXIgYWRkcmVzcyBkYXRhLgogIGBgMzU2ZjQwMTNmOGBgCgogIFN0
YWxlIHJlc29sdmVyIGFkZHJlc3MgZGF0YSBjb3VsZCByZW1haW4gY2FjaGVkIHVudGlsIG1lbW9y
eSBwcmVzc3VyZQogIG9yIGFuIGV4cGxpY2l0IGZsdXNoLiBDb3JyZWN0IHRoZSBjbGVhbnVwIGlu
dGVydmFsIHNvIGl0IGlzIHJlbW92ZWQKICBwZXJpb2RpY2FsbHkuIDpnbDpgIzYzNDZgIDpnbDpg
ITEyNTg5YAoKLSBGaXggbmFtZWQtY2hlY2tjb25mL25hbWVkIGNyYXNoIHdpdGggbWFsZm9ybWVk
IGtleSBuYW1lLgogIGBgOWYyMThmNmFhZmBgCgogIFdoZW4gYSBwcmltYXJ5L3JlbW90ZS1zZXJ2
ZXIga2V5IG5hbWUgd2FzIG1hbGZvcm1lZCwgbmFtZWQtY2hlY2tjb25mCiAgYW5kIG5hbWVkIHdl
cmUgYm90aCBjcmFzaGluZyAoYWZ0ZXIgd2FybmluZyBhYm91dCB0aGUgaW52YWxpZCBrZXkKICBu
YW1lKS4gVGhpcyBpcyBub3cgZml4ZWQuIDpnbDpgIzYzNjJgIDpnbDpgITEyNjM5YAoKLSBGaXgg
LVdmb3JtYXQtdHJ1bmNhdGlvbiB3YXJuaW5nIGluIHRvdGV4dF9pbl93a3MoKSBgYGY5N2MyYmVh
NDBgYAoKICBCSU5EIDkgZmFpbGVkIHRvIGJ1aWxkIHdpdGggR0NDIDE2IGF0IC1PMzogcmVuZGVy
aW5nIGEgV0tTIHJlY29yZCBhcwogIHRleHQgdHJpZ2dlcmVkIGEgLVdmb3JtYXQtdHJ1bmNhdGlv
biBlcnJvciwgd2hpY2ggaXMgZmF0YWwgaW4KICBkZXZlbG9wZXIgYnVpbGRzLiBUaGUgcG9ydCBu
dW1iZXIgaXMgbm93IHByaW50ZWQgd2l0aCBhIDE2LWJpdCBmb3JtYXQKICBzcGVjaWZpZXIsIHNv
IHRoZSBjb21waWxlciBjYW4gc2VlIGl0IGFsd2F5cyBmaXRzIHRoZSBvdXRwdXQgYnVmZmVyLgog
IDpnbDpgITEyNTQyYAoKLSBGaXggb2ZmLWJ5LW9uZSBlcnJvcnMgY2F1c2VkIGJ5IG1hZ2ljIGhh
cmRjb2RlZCB2YWx1ZXMuIGBgNzI2YzZjYjc5NWBgCgogIEZpeCBvZmYtYnktb25lIGNvbXBhcmlu
c29uIGVycm9yczogIm5hbWVkIC1wIGh0dHA9IiBkcm9wcGVkIHRoZSBmaXJzdAogIGRpZ2l0IG9m
IHRoZSBnaXZlbiBwb3J0IChmb3IgZXhhbXBsZSwgImh0dHA9ODA4MCIgc2VsZWN0ZWQgcG9ydCA4
MCkKICBhbmQgbm93IHVzZXMgdGhlIHBvcnQgYXMgZ2l2ZW4sIGFuZCAibmFtZWQtcnJjaGVja2Vy
IC1DIiBjb21wYXJlZCBvbmx5CiAgcGFydCBvZiB0aGUgIkNMQVNTIiBwcmVmaXggd2hlbiBmaWx0
ZXJpbmcgZ2VuZXJpYyBjbGFzcyBuYW1lcywgd2hpY2gKICB3YXMgaGFybWxlc3MgaW4gcHJhY3Rp
Y2UgYnV0IGlzIG5vdyBjb3JyZWN0ZWQuIDpnbDpgITEyNjE2YAoKLSBIbWFjX3ZlcmlmeSgpIG5v
dyBhY2NlcHRzIHRydW5jYXRlZCBITUFDcyBvbmx5IHdoZW4gcmVxdWVzdGVkLgogIGBgYzgxYjEx
MTQ5NmBgCgogIFRoZSBobWFjX3ZlcmlmeSgpIGZ1bmN0aW9uIGluY29ycmVjdGx5IGNvbXBhcmVz
IG9ubHkgdXAgdG8KICAnc2lnLT5sZW5ndGgnIGJ5dGVzLCBidXQgdGhlIHNpZ25hdHVyZSBhbmQg
aXRzIGxlbmd0aCBzaG91bGQgbm90IGJlCiAgdHJ1c3RlZCwgZS5nLiBpbiBjYXNlIGlmIGl0IGNv
bWVzIGZyb20gYSB1c2VyIHF1ZXJ5LgoKICBEb24ndCBhY2NlcHQgc2lnbmF0dXJlcyB3aGljaCBs
ZW5ndGggaXNuJ3QgZXF1YWwgdG8gdGhlIGV4cGVjdGVkCiAgY2FsY3VsYXRlZCBITUFDIGxlbmd0
aCB1bmxlc3MgaXQgaXMgZXhwbGljaXRseSByZXF1ZXN0ZWQgYnkgdGhlCiAgY2FsbGVyLCBlLmcu
IGZvciB0cnVuY2F0ZWQgVFNJRyBbMV0gc3VwcG9ydC4KCiAgWzFdIGh0dHBzOi8vZGF0YXRyYWNr
ZXIuaWV0Zi5vcmcvZG9jL2h0bWwvcmZjODk0NSNuYW1lLXRzaWctdHJ1bmNhdGlvbgogIC1wb2xp
Y3kgOmdsOmAhMTI2MjlgCgotIFByZXZlbnQgcmVzb2x2ZXIgY3Jhc2hlcyB3aGlsZSBwcm9jZXNz
aW5nIEROUyBvdmVyIFRDUC4gYGA4MWIzYjZkODlmYGAKCiAgUmVjdXJzaXZlIHJlc29sdmVycyBj
b3VsZCB0ZXJtaW5hdGUgd2l0aCBhbiBhc3NlcnRpb24gZmFpbHVyZSB3aGlsZQogIHByb2Nlc3Np
bmcgRE5TIHJlc3BvbnNlcyBvdmVyIFRDUCB1bmRlciBzdXN0YWluZWQgdHJhZmZpYy4gVGhlIGZh
aWx1cmUKICB3YXMgb2JzZXJ2ZWQgb24gcmVzb2x2ZXJzIGNvbmZpZ3VyZWQgZ2xvYmFsbHkgd2l0
aCBmb3J3YXJkIG9ubHk7IHRoZQogIHNhbWUgdHJhbnNwb3J0IHBhdGggaXMgYWxzbyB1c2VkIGJ5
IGl0ZXJhdGl2ZSByZXNvbHV0aW9uLiAgVGhpcyBoYXMKICBiZWVuIGZpeGVkLiA6Z2w6YCExMjUz
N2AK

--===============3276852547314484277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/bind/bind-dbg: PV changed from "9.20.27" to "9.20.29"
packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGSIZE changed from 16186376 to 16217712 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-dbg: PKGV changed from 9.20.27 [default] to 9.20.29 [default]
packages/x86-64-v3-poky-linux/bind/bind-dbg: FILELIST: removed "/usr/lib/.debug/libns-9.20.27.so /usr/lib/.debug/libisccc-9.20.27.so /usr/lib/.debug/libisccfg-9.20.27.so /usr/lib/.debug/libisc-9.20.27.so /usr/lib/.debug/libdns-9.20.27.so", added "/usr/lib/.debug/libisccfg-9.20.29.so /usr/lib/.debug/libns-9.20.29.so /usr/lib/.debug/libdns-9.20.29.so /usr/lib/.debug/libisc-9.20.29.so /usr/lib/.debug/libisccc-9.20.29.so"
packages/x86-64-v3-poky-linux/bind/bind-dev: PV changed from "9.20.27" to "9.20.29"
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGSIZE changed from 1607845 to 1607498 (-0%)
packages/x86-64-v3-poky-linux/bind/bind-dev: PKGV changed from 9.20.27 [default] to 9.20.29 [default]
packages/x86-64-v3-poky-linux/bind/bind-doc: PV changed from "9.20.27" to "9.20.29"
packages/x86-64-v3-poky-linux/bind/bind-doc: PKGV changed from 9.20.27 [default] to 9.20.29 [default]
packages/x86-64-v3-poky-linux/bind/bind-libs: PV changed from "9.20.27" to "9.20.29"
packages/x86-64-v3-poky-linux/bind/bind-libs: FILES: removed "/usr/lib/*-9.20.27.so", added "/usr/lib/*-9.20.29.so"
packages/x86-64-v3-poky-linux/bind/bind-libs: PKGSIZE changed from 3688328 to 3692392 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-libs: PKGV changed from 9.20.27 [default] to 9.20.29 [default]
packages/x86-64-v3-poky-linux/bind/bind-libs: FILELIST: removed "/usr/lib/libisccc-9.20.27.so /usr/lib/libdns-9.20.27.so /usr/lib/libisc-9.20.27.so /usr/lib/libisccfg-9.20.27.so /usr/lib/libns-9.20.27.so", added "/usr/lib/libisccc-9.20.29.so /usr/lib/libdns-9.20.29.so /usr/lib/libisc-9.20.29.so /usr/lib/libisccfg-9.20.29.so /usr/lib/libns-9.20.29.so"
packages/x86-64-v3-poky-linux/bind/bind-locale: PV changed from "9.20.27" to "9.20.29"
packages/x86-64-v3-poky-linux/bind/bind-locale: PKGV changed from 9.20.27 [default] to 9.20.29 [default]
packages/x86-64-v3-poky-linux/bind/bind-src: PV changed from "9.20.27" to "9.20.29"
packages/x86-64-v3-poky-linux/bind/bind-src: PKGSIZE changed from 10144096 to 10155703 (+0%)
packages/x86-64-v3-poky-linux/bind/bind-src: PKGV changed from 9.20.27 [default] to 9.20.29 [default]
packages/x86-64-v3-poky-linux/bind/bind-src: FILELIST: directory renamed /usr/src/debug/bind/9.20.27/lib/isccc -> /usr/src/debug/bind/9.20.29/lib/isccc, directory renamed /usr/src/debug/bind/9.20.27/lib/dns/include/dst -> /usr/src/debug/bind/9.20.29/lib/dns/include/dst, directory renamed /usr/src/debug/bind/9.20.27/lib/isccc/include/isccc -> /usr/src/debug/bind/9.20.29/lib/isccc/include/isccc, directory renamed /usr/src/debug/bind/9.20.27/bin/plugins -> /usr/src/debug/bind/9.20.29/bin/plugins, directory renamed /usr/src/debug/bind/9.20.27/lib/isccfg/include/isccfg -> /usr/src/debug/bind/9.20.29/lib/isccfg/include/isccfg, directory renamed /usr/src/debug/bind/9.20.27/bin/dig -> /usr/src/debug/bind/9.20.29/bin/dig, directory renamed /usr/src/debug/bind/9.20.27/bin/named/include/dlz -> /usr/src/debug/bind/9.20.29/bin/named/include/dlz, directory renamed /usr/src/debug/bind/9.20.27/bin/dnssec -> /usr/src/debug/bind/9.20.29/bin/dnssec, directory renamed /usr/src/debug/bind/9.20.27/lib/isc
  -> /usr/src/debug/bind/9.20.29/lib/isc, directory renamed /usr/src/debug/bind/9.20.27/lib/dns/include/irs -> /usr/src/debug/bind/9.20.29/lib/dns/include/irs, directory renamed /usr/src/debug/bind/9.20.27/lib/dns/rdata/ch_3 -> /usr/src/debug/bind/9.20.29/lib/dns/rdata/ch_3, directory renamed /usr/src/debug/bind/9.20.27/lib/dns/rdata/any_255 -> /usr/src/debug/bind/9.20.29/lib/dns/rdata/any_255, directory renamed /usr/src/debug/bind/9.20.27/bin/rndc -> /usr/src/debug/bind/9.20.29/bin/rndc, directory renamed /usr/src/debug/bind/9.20.27/lib/ns/include/ns -> /usr/src/debug/bind/9.20.29/lib/ns/include/ns, directory renamed /usr/src/debug/bind/9.20.27/lib/dns/rdata/in_1 -> /usr/src/debug/bind/9.20.29/lib/dns/rdata/in_1, directory renamed /usr/src/debug/bind/9.20.27/bin/nsupdate -> /usr/src/debug/bind/9.20.29/bin/nsupdate, directory renamed /usr/src/debug/bind/9.20.27/lib/isccfg -> /usr/src/debug/bind/9.20.29/lib/isccfg, directory renamed /usr/src/debug/bind/9.20.27/lib/isc/include/isc -> /
 usr/src/debug/bind/9.20.29/lib/isc/include/isc, directory renamed /usr/src/debug/bind/9.20.27/lib/isc/netmgr -> /usr/src/debug/bind/9.20.29/lib/isc/netmgr, directory renamed /usr/src/debug/bind/9.20.27/bin/confgen/include/confgen -> /usr/src/debug/bind/9.20.29/bin/confgen/include/confgen, directory renamed /usr/src/debug/bind/9.20.27/bin/tools -> /usr/src/debug/bind/9.20.29/bin/tools, directory renamed /usr/src/debug/bind/9.20.27/bin/delv -> /usr/src/debug/bind/9.20.29/bin/delv, directory renamed /usr/src/debug/bind/9.20.27/bin/named/include/named -> /usr/src/debug/bind/9.20.29/bin/named/include/named, directory renamed /usr/src/debug/bind/9.20.27/bin/confgen -> /usr/src/debug/bind/9.20.29/bin/confgen, directory renamed /usr/src/debug/bind/9.20.27/lib/dns/include/dns -> /usr/src/debug/bind/9.20.29/lib/dns/include/dns, directory renamed /usr/src/debug/bind/9.20.27/lib/dns -> /usr/src/debug/bind/9.20.29/lib/dns, directory renamed /usr/src/debug/bind/9.20.27/lib/ns -> /usr/src/debug/bi
 nd/9.20.29/lib/ns, directory renamed /usr/src/debug/bind/9.20.27/lib/dns/rdata/hs_4 -> /usr/src/debug/bind/9.20.29/lib/dns/rdata/hs_4, directory renamed /usr/src/debug/bind/9.20.27/bin/named -> /usr/src/debug/bind/9.20.29/bin/named, directory renamed /usr/src/debug/bind/9.20.27/lib/dns/rdata/generic -> /usr/src/debug/bind/9.20.29/lib/dns/rdata/generic, directory renamed /usr/src/debug/bind/9.20.27/bin/check -> /usr/src/debug/bind/9.20.29/bin/check
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PV changed from "9.20.27" to "9.20.29"
packages/x86-64-v3-poky-linux/bind/bind-staticdev: PKGV changed from 9.20.27 [default] to 9.20.29 [default]
packages/x86-64-v3-poky-linux/bind/bind-utils: PV changed from "9.20.27" to "9.20.29"
packages/x86-64-v3-poky-linux/bind/bind-utils: PKGV changed from 9.20.27 [default] to 9.20.29 [default]
packages/x86-64-v3-poky-linux/bind/bind: PV changed from "9.20.27" to "9.20.29"
packages/x86-64-v3-poky-linux/bind/bind: PKGSIZE changed from 1334881 to 1338969 (+0%)
packages/x86-64-v3-poky-linux/bind/bind: PKGV changed from 9.20.27 [default] to 9.20.29 [default]
packages/x86-64-v3-poky-linux/bind: SRC_URI changed from "https://ftp.isc.org/isc/bind9/9.20.27/bind-9.20.27.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch" to "https://ftp.isc.org/isc/bind9/9.20.29/bind-9.20.29.tar.xz file://conf.patch file://named.service file://bind9 file://generate-rndc-key.sh file://make-etc-initd-bind-stop-work.patch file://init.d-add-support-for-read-only-rootfs.patch file://bind-ensure-searching-for-json-headers-searches-sysr.patch file://0001-named-lwresd-V-and-start-log-hide-build-options.patch file://0001-avoid-start-failure-with-bind-user.patch file://0001-m4-Backport-ax_prog_cc_f
 or_build.m4-macros.patch"
packages/x86-64-v3-poky-linux/bind: PKGV changed from 9.20.27 [default] to 9.20.29 [default]
packages/x86-64-v3-poky-linux/bind: PV changed from "9.20.27" to "9.20.29"
Changes to packages/x86-64-v3-poky-linux/bind (sysroot):
  /usr/lib/libdns.so changed symlink target from libdns-9.20.27.so to libdns-9.20.29.so
  /usr/lib/libisccc.so changed symlink target from libisccc-9.20.27.so to libisccc-9.20.29.so
  /usr/lib/libisccfg.so changed symlink target from libisccfg-9.20.27.so to libisccfg-9.20.29.so
  /usr/lib/libisc.so changed symlink target from libisc-9.20.27.so to libisc-9.20.29.so
  /usr/lib/libns.so changed symlink target from libns-9.20.27.so to libns-9.20.29.so
  /usr/lib/libdns-9.20.27.so moved to /usr/lib/libdns-9.20.29.so
  /usr/lib/libisc-9.20.27.so moved to /usr/lib/libisc-9.20.29.so
  /usr/lib/libisccc-9.20.27.so moved to /usr/lib/libisccc-9.20.29.so
  /usr/lib/libisccfg-9.20.27.so moved to /usr/lib/libisccfg-9.20.29.so
  /usr/lib/libns-9.20.27.so moved to /usr/lib/libns-9.20.29.so

--===============3276852547314484277==--

