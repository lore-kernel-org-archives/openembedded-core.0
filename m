Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F12AC44511
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 06:12:01 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2993.1783577519002157720
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 23:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jG0CqeBQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=APu8c7E3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019f458124b8-8c0801e0-0cf9-4fe7-9c94-7ceb081bd3a0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783577519;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=5NHq8Bb3zKfGQXCR3oQK1FRuU99PAyzJJwSCKJQco+g=;
	b=jG0CqeBQPBhQtPd5ksXJKlcHlCF48UXp0DkYfJzOHzTQaYmWaHVIst640eQ2zi+t
	vW9y3W+iKYTL8lfurpUi4MRaogc6tgQGgnY/qAofm9PC+5GRJjyVKwzr0nJ2B5EHbt8
	SjFwGzmXLJNTP3lweHrZKqJhMaL0rnAGk4c1gVf4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783577519;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=5NHq8Bb3zKfGQXCR3oQK1FRuU99PAyzJJwSCKJQco+g=;
	b=APu8c7E3hgJ7iQ4sa/JOwB8Xqw8u3g2S7wBwASCu1qsT5pkRKceJgTfRMq8N6Wsp
	RmcwPjEEK1EX+1zWi7pORW2V/Q0WVdMriPNN00+kk2aJcn1Q488Q4stjOwefKsudok9
	kz6ymYaNChafe4p+qwNjVUdYOrFTi7rGmZxkQwfE=
Content-Type: multipart/mixed; boundary="===============2199635810985838833=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libffi: upgrading to 3.7.0 SUCCEEDED
Message-ID: <0101019f458124b8-8c0801e0-0cf9-4fe7-9c94-7ceb081bd3a0-000000@us-west-2.amazonses.com>
Date: Thu, 9 Jul 2026 06:11:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.09-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 06:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240538

--===============2199635810985838833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libffi* to *3.7.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libffi-upgrade-3.5.2-3.7.0.patch
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
From 85131a5da0736233eda05c91415a9f6dc22900b7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 9 Jul 2026 06:11:50 +0000
Subject: [PATCH] libffi: upgrade 3.5.2 -> 3.7.0

---
 .../libffi/libffi/not-win32.patch             |  6 ++---
 .../{libffi_3.5.2.bb => libffi_3.7.0.bb}      | 23 +++++++++++++++++--
 2 files changed, 24 insertions(+), 5 deletions(-)
 rename meta/recipes-support/libffi/{libffi_3.5.2.bb => libffi_3.7.0.bb} (61%)

diff --git a/meta/recipes-support/libffi/libffi/not-win32.patch b/meta/recipes-support/libffi/libffi/not-win32.patch
index ca76fde855..c0d2487bd6 100644
--- a/meta/recipes-support/libffi/libffi/not-win32.patch
+++ b/meta/recipes-support/libffi/libffi/not-win32.patch
@@ -1,4 +1,4 @@
-From 28d0fd6b73163fc2dbc10c7dc838a8222671f88c Mon Sep 17 00:00:00 2001
+From 6b96af34d39eb68b2ac0cbc4b04c2a37a60166d7 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Thu, 4 Feb 2016 16:22:50 +0000
 Subject: [PATCH] libffi: ensure sysroot paths are not in libffi.pc
@@ -20,10 +20,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 258107d..ef1a285 100644
+index d3bc9fc..963c851 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -411,7 +411,7 @@ AC_ARG_ENABLE(multi-os-directory,
+@@ -429,7 +429,7 @@ AC_ARG_ENABLE(multi-os-directory,
  
  # These variables are only ever used when we cross-build to X86_WIN32.
  # And we only support this with GCC, so...
diff --git a/meta/recipes-support/libffi/libffi_3.5.2.bb b/meta/recipes-support/libffi/libffi_3.7.0.bb
similarity index 61%
rename from meta/recipes-support/libffi/libffi_3.5.2.bb
rename to meta/recipes-support/libffi/libffi_3.7.0.bb
index d3aa90d429..cebfbcef74 100644
--- a/meta/recipes-support/libffi/libffi_3.5.2.bb
+++ b/meta/recipes-support/libffi/libffi_3.7.0.bb
@@ -1,3 +1,22 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,4 +1,4 @@
+# -libffi - Copyright (c) 1996-2025  Anthony Green, Red Hat, Inc and others.
+# +libffi - Copyright (c) 1996-2026  Anthony Green, Red Hat, Inc and others.
+#  See source files for details.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining
+# 
+#
+
 SUMMARY = "A portable foreign function interface library"
 HOMEPAGE = "http://sourceware.org/libffi/"
 DESCRIPTION = "The `libffi' library provides a portable, high level programming interface to various calling \
@@ -8,12 +27,12 @@ library really only provides the lowest, machine dependent layer of a fully feat
 A layer must exist above `libffi' that handles type conversions for values passed between the two languages."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ce4763670c5b7756000561f9af1ab178"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5e9a8df556846bb3d1edec0d968a2311"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://not-win32.patch \
            "
-SRC_URI[sha256sum] = "f3a3082a23b37c293a4fcd1053147b371f2ff91fa7ea1b2a52e335676bac82dc"
+SRC_URI[sha256sum] = "2255c5a638dfb51bf67c20a12a7bb70d17feb1e9eababac05f5573146f586436"
 
 EXTRA_OECONF = "--disable-builddir"
 EXTRA_OECONF:class-native += "--with-gcc-arch=generic"
-- 
2.47.1


--===============2199635810985838833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libffi: PKGV changed from 3.5.2 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libffi: SRC_URI changed from "https://github.com/libffi/libffi/releases//download/v3.5.2/libffi-3.5.2.tar.gz file://not-win32.patch" to "https://github.com/libffi/libffi/releases//download/v3.7.0/libffi-3.7.0.tar.gz file://not-win32.patch"
packages/x86-64-v3-poky-linux/libffi: PV changed from "3.5.2" to "3.7.0"
packages/x86-64-v3-poky-linux/libffi/libffi-dbg: PKGV changed from 3.5.2 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-dbg: FILELIST: removed "/usr/lib/.debug/libffi.so.8.2.0", added "/usr/lib/.debug/libffi.so.8.4.0"
packages/x86-64-v3-poky-linux/libffi/libffi-dbg: PKGSIZE changed from 155344 to 194872 (+25%)
packages/x86-64-v3-poky-linux/libffi/libffi-dbg: PV changed from "3.5.2" to "3.7.0"
packages/x86-64-v3-poky-linux/libffi/libffi-dev: PKGV changed from 3.5.2 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-dev: PKGSIZE changed from 20806 to 21967 (+6%)
packages/x86-64-v3-poky-linux/libffi/libffi-dev: PV changed from "3.5.2" to "3.7.0"
packages/x86-64-v3-poky-linux/libffi/libffi-doc: PKGV changed from 3.5.2 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-doc: PKGSIZE changed from 46053 to 49152 (+7%)
packages/x86-64-v3-poky-linux/libffi/libffi-doc: PV changed from "3.5.2" to "3.7.0"
packages/x86-64-v3-poky-linux/libffi/libffi-locale: PKGV changed from 3.5.2 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-locale: PV changed from "3.5.2" to "3.7.0"
packages/x86-64-v3-poky-linux/libffi/libffi-src: PKGV changed from 3.5.2 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-src: FILELIST: directory renamed /usr/src/debug/libffi/3.5.2/include -> /usr/src/debug/libffi/3.7.0/include, directory renamed /usr/src/debug/libffi/3.5.2/src/x86 -> /usr/src/debug/libffi/3.7.0/src/x86, directory renamed /usr/src/debug/libffi/3.5.2/src -> /usr/src/debug/libffi/3.7.0/src
packages/x86-64-v3-poky-linux/libffi/libffi-src: PKGSIZE changed from 320190 to 383273 (+20%)
packages/x86-64-v3-poky-linux/libffi/libffi-src: PV changed from "3.5.2" to "3.7.0"
packages/x86-64-v3-poky-linux/libffi/libffi-staticdev: PKGV changed from 3.5.2 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libffi/libffi-staticdev: PV changed from "3.5.2" to "3.7.0"
packages/x86-64-v3-poky-linux/libffi/libffi: PKGV changed from 3.5.2 [default] to 3.7.0 [default]
packages/x86-64-v3-poky-linux/libffi/libffi: FILELIST: removed "/usr/lib/libffi.so.8.2.0", added "/usr/lib/libffi.so.8.4.0"
packages/x86-64-v3-poky-linux/libffi/libffi: PKGSIZE changed from 59519 to 75903 (+28%)
packages/x86-64-v3-poky-linux/libffi/libffi: PV changed from "3.5.2" to "3.7.0"
Changes to packages/x86-64-v3-poky-linux/libffi (sysroot):
  /usr/lib/libffi.so.8 changed symlink target from libffi.so.8.2.0 to libffi.so.8.4.0
  /usr/lib/libffi.so changed symlink target from libffi.so.8.2.0 to libffi.so.8.4.0
  /usr/lib/libffi.so.8.2.0 moved to /usr/lib/libffi.so.8.4.0
Changes to packages/x86_64-linux/libffi-native (sysroot):
  /usr/lib/libffi.so.8 changed symlink target from libffi.so.8.2.0 to libffi.so.8.4.0
  /usr/lib/libffi.so changed symlink target from libffi.so.8.2.0 to libffi.so.8.4.0
  /usr/lib/libffi.so.8.2.0 moved to /usr/lib/libffi.so.8.4.0

--===============2199635810985838833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libffi/libffi-dbg: PKGSIZE changed from 155344 to 194872 (+25%)
packages/x86-64-v3-poky-linux/libffi/libffi-src: PKGSIZE changed from 320190 to 383273 (+20%)
packages/x86-64-v3-poky-linux/libffi/libffi: FILELIST: removed "/usr/lib/libffi.so.8.2.0", added "/usr/lib/libffi.so.8.4.0"
packages/x86-64-v3-poky-linux/libffi/libffi: PKGSIZE changed from 59519 to 75903 (+28%)
Changes to packages/x86-64-v3-poky-linux/libffi (sysroot):
  /usr/lib/libffi.so.8 changed symlink target from libffi.so.8.2.0 to libffi.so.8.4.0
  /usr/lib/libffi.so changed symlink target from libffi.so.8.2.0 to libffi.so.8.4.0
  /usr/lib/libffi.so.8.2.0 moved to /usr/lib/libffi.so.8.4.0
Changes to packages/x86_64-linux/libffi-native (sysroot):
  /usr/lib/libffi.so.8 changed symlink target from libffi.so.8.2.0 to libffi.so.8.4.0
  /usr/lib/libffi.so changed symlink target from libffi.so.8.2.0 to libffi.so.8.4.0
  /usr/lib/libffi.so.8.2.0 moved to /usr/lib/libffi.so.8.4.0

--===============2199635810985838833==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libffi-upgrade-3.5.2-3.7.0.patch"

RnJvbSA4NTEzMWE1ZGEwNzM2MjMzZWRhMDVjOTE0MTVhOWY2ZGMyMjkwMGI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgOSBKdWwgMjAyNiAwNjoxMTo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmZmaTogdXBncmFkZSAzLjUuMiAtPiAzLjcuMAoKLS0tCiAuLi4vbGliZmZpL2xpYmZmaS9ub3Qt
d2luMzIucGF0Y2ggICAgICAgICAgICAgfCAgNiArKy0tLQogLi4uL3tsaWJmZmlfMy41LjIuYmIg
PT4gbGliZmZpXzMuNy4wLmJifSAgICAgIHwgMjMgKysrKysrKysrKysrKysrKystLQogMiBmaWxl
cyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2xpYmZmaS97bGliZmZpXzMuNS4yLmJiID0+IGxpYmZmaV8zLjcuMC5i
Yn0gKDYxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJmZmkvbGliZmZp
L25vdC13aW4zMi5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmkvbm90
LXdpbjMyLnBhdGNoCmluZGV4IGNhNzZmZGU4NTUuLmMwZDI0ODdiZDYgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmkvbm90LXdpbjMyLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmkvbm90LXdpbjMyLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSAyOGQwZmQ2YjczMTYzZmMyZGJjMTBjN2RjODM4YTgyMjI2NzFmODhjIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2Yjk2YWYzNGQzOWViNjhiMmFjMGNiYzRiMDRj
MmEzN2E2MDE2NmQ3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24g
PHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IFRodSwgNCBGZWIgMjAxNiAxNjoyMjo1MCAr
MDAwMAogU3ViamVjdDogW1BBVENIXSBsaWJmZmk6IGVuc3VyZSBzeXNyb290IHBhdGhzIGFyZSBu
b3QgaW4gbGliZmZpLnBjCkBAIC0yMCwxMCArMjAsMTAgQEAgU2lnbmVkLW9mZi1ieTogUm9zcyBC
dXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZp
Z3VyZS5hYwotaW5kZXggMjU4MTA3ZC4uZWYxYTI4NSAxMDA2NDQKK2luZGV4IGQzYmM5ZmMuLjk2
M2M4NTEgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwotQEAg
LTQxMSw3ICs0MTEsNyBAQCBBQ19BUkdfRU5BQkxFKG11bHRpLW9zLWRpcmVjdG9yeSwKK0BAIC00
MjksNyArNDI5LDcgQEAgQUNfQVJHX0VOQUJMRShtdWx0aS1vcy1kaXJlY3RvcnksCiAgCiAgIyBU
aGVzZSB2YXJpYWJsZXMgYXJlIG9ubHkgZXZlciB1c2VkIHdoZW4gd2UgY3Jvc3MtYnVpbGQgdG8g
WDg2X1dJTjMyLgogICMgQW5kIHdlIG9ubHkgc3VwcG9ydCB0aGlzIHdpdGggR0NDLCBzby4uLgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZmZpL2xpYmZmaV8zLjUuMi5iYiBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmZmaS9saWJmZmlfMy43LjAuYmIKc2ltaWxhcml0eSBp
bmRleCA2MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZmZpL2xpYmZmaV8z
LjUuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliZmZpL2xpYmZmaV8zLjcu
MC5iYgppbmRleCBkM2FhOTBkNDI5Li5jZWJmYmNlZjc0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9saWJmZmkvbGliZmZpXzMuNS4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2xpYmZmaS9saWJmZmlfMy43LjAuYmIKQEAgLTEsMyArMSwyMiBAQAorIyBGSVhNRTogdGhl
IExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVw
Z3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9s
ZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0Ug
dmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21t
aXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vu
c2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoK
KyMKKyMgLS0tIExJQ0VOU0UKKyMgKysrIExJQ0VOU0UKKyMgQEAgLTEsNCArMSw0IEBACisjIC1s
aWJmZmkgLSBDb3B5cmlnaHQgKGMpIDE5OTYtMjAyNSAgQW50aG9ueSBHcmVlbiwgUmVkIEhhdCwg
SW5jIGFuZCBvdGhlcnMuCisjICtsaWJmZmkgLSBDb3B5cmlnaHQgKGMpIDE5OTYtMjAyNiAgQW50
aG9ueSBHcmVlbiwgUmVkIEhhdCwgSW5jIGFuZCBvdGhlcnMuCisjICBTZWUgc291cmNlIGZpbGVz
IGZvciBkZXRhaWxzLgorIyAgCisjICBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVl
IG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcKKyMgCisjCisKIFNVTU1BUlkgPSAi
QSBwb3J0YWJsZSBmb3JlaWduIGZ1bmN0aW9uIGludGVyZmFjZSBsaWJyYXJ5IgogSE9NRVBBR0Ug
PSAiaHR0cDovL3NvdXJjZXdhcmUub3JnL2xpYmZmaS8iCiBERVNDUklQVElPTiA9ICJUaGUgYGxp
YmZmaScgbGlicmFyeSBwcm92aWRlcyBhIHBvcnRhYmxlLCBoaWdoIGxldmVsIHByb2dyYW1taW5n
IGludGVyZmFjZSB0byB2YXJpb3VzIGNhbGxpbmcgXApAQCAtOCwxMiArMjcsMTIgQEAgbGlicmFy
eSByZWFsbHkgb25seSBwcm92aWRlcyB0aGUgbG93ZXN0LCBtYWNoaW5lIGRlcGVuZGVudCBsYXll
ciBvZiBhIGZ1bGx5IGZlYXQKIEEgbGF5ZXIgbXVzdCBleGlzdCBhYm92ZSBgbGliZmZpJyB0aGF0
IGhhbmRsZXMgdHlwZSBjb252ZXJzaW9ucyBmb3IgdmFsdWVzIHBhc3NlZCBiZXR3ZWVuIHRoZSB0
d28gbGFuZ3VhZ2VzLiIKIAogTElDRU5TRSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9MSUNFTlNFO21kNT1jZTQ3NjM2NzBjNWI3NzU2MDAwNTYxZjlhZjFhYjE3OCIKK0xJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTVlOWE4ZGY1NTY4NDZiYjNkMWVkZWMw
ZDk2OGEyMzExIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQ
Vn0vJHtCUE59LSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9ub3Qtd2luMzIucGF0
Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjNhMzA4MmEyM2IzN2My
OTNhNGZjZDEwNTMxNDdiMzcxZjJmZjkxZmE3ZWExYjJhNTJlMzM1Njc2YmFjODJkYyIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICIyMjU1YzVhNjM4ZGZiNTFiZjY3YzIwYTEyYTdiYjcwZDE3ZmViMWU5
ZWFiYWJhYzA1ZjU1NzMxNDZmNTg2NDM2IgogCiBFWFRSQV9PRUNPTkYgPSAiLS1kaXNhYmxlLWJ1
aWxkZGlyIgogRVhUUkFfT0VDT05GOmNsYXNzLW5hdGl2ZSArPSAiLS13aXRoLWdjYy1hcmNoPWdl
bmVyaWMiCi0tIAoyLjQ3LjEKCg==

--===============2199635810985838833==--

