Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE82C531D0
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 05:45:06 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5342.1785390302592268290
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 22:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ExIHV8NA;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Sf4mrHDq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019fb18e088d-ec9bdb74-9a0a-41aa-add3-b787830424d2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785390303;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=khOQwVaJH3bFkZLxtnSZJWJpXhgjRmsXB05CxBJHkQ4=;
	b=ExIHV8NANp9ypufNHm5zb56G1yz4mYhf7AukLs486o9mc/WVQ+XnMAVnaBSRCKKk
	/h1HRLmrWnLXiLaaKMDy3L6JrwU9NO6kru0uLSB1I5UTSO8SNzkcd1kpcBfUhZQKywF
	4uOinzyMd6eYH6OS/JGDOYvjNpLi8KKRrkIHQF4Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785390303;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=khOQwVaJH3bFkZLxtnSZJWJpXhgjRmsXB05CxBJHkQ4=;
	b=Sf4mrHDqwKZNb+FaMVYpG95AG075fVIqaw9RG9b/DhapLUsPGXp3ujAvi31QmMm8
	v0yX9+FoKPAwGU8KvJXTqG9W7o0Kfas90RJJK1YM3Hg919bQ31LdMg2/Ehk6M/uhNhf
	C4d1qL74JFMYPass1vcn/R29BtdZEJosLTWCt/2I=
Content-Type: multipart/mixed; boundary="===============0299846050776302988=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2026.07.0 SUCCEEDED
Message-ID: <0101019fb18e088d-ec9bdb74-9a0a-41aa-add3-b787830424d2-000000@us-west-2.amazonses.com>
Date: Thu, 30 Jul 2026 05:45:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.30-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 05:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242315

--===============0299846050776302988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2026.07.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2026.06.1-2026.07.0.patch
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
From 561bbf4e50de50c96a47688fab39b51f3c79e70b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 30 Jul 2026 05:29:10 +0000
Subject: [PATCH] barebox-tools: upgrade 2026.06.1 -> 2026.07.0

Source: Documentation/migration-guides/migration-2026.06.0.rst

Release v2026.06.0
==================

global.linux.bootargs.* appending order
---------------------------------------

If barebox was configured to automatically generate any of the ``root``,
``rootwait``, ``earlycon``, ``systemd.machine_id``, ``systemd.hostname``
or ``barebox.security.policy`` kernel command line options, they will be
appended onto the final kernel command line
:ref:`**after** all other options <bootargs_concat_order>`.

Removal of global.env.autoprobe
-------------------------------

The global.env.autoprobe variable introduced with v2025.02.0 is removed and
now replaced with CONFIG_ENV_HANDLING_AUTOPROBE. It has never worked. If you
want to load a barebox environment based on its partition UUID enable
CONFIG_ENV_HANDLING_AUTOPROBE.
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 2a42c0a266..6bc3fa07fa 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2026.06.1"
+PV = "2026.07.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "8752b3752819ec4aaf848a1d06df05242a64954525fb15b6cf07b3c3dd7ebd7f"
+SRC_URI[sha256sum] = "8b8fb781094cd01c4c5be9d0899d629668cee2b73f1447260851715c4496bd78"
-- 
2.47.1


--===============0299846050776302988==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2026.06.1-2026.07.0.patch"

RnJvbSA1NjFiYmY0ZTUwZGU1MGM5NmE0NzY4OGZhYjM5YjUxZjNjNzllNzBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMzAgSnVsIDIwMjYgMDU6Mjk6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YXJlYm94LXRvb2xzOiB1cGdyYWRlIDIwMjYuMDYuMSAtPiAyMDI2LjA3LjAKClNvdXJjZTogRG9j
dW1lbnRhdGlvbi9taWdyYXRpb24tZ3VpZGVzL21pZ3JhdGlvbi0yMDI2LjA2LjAucnN0CgpSZWxl
YXNlIHYyMDI2LjA2LjAKPT09PT09PT09PT09PT09PT09CgpnbG9iYWwubGludXguYm9vdGFyZ3Mu
KiBhcHBlbmRpbmcgb3JkZXIKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CgpJZiBiYXJlYm94IHdhcyBjb25maWd1cmVkIHRvIGF1dG9tYXRpY2FsbHkgZ2VuZXJhdGUgYW55
IG9mIHRoZSBgYHJvb3RgYCwKYGByb290d2FpdGBgLCBgYGVhcmx5Y29uYGAsIGBgc3lzdGVtZC5t
YWNoaW5lX2lkYGAsIGBgc3lzdGVtZC5ob3N0bmFtZWBgCm9yIGBgYmFyZWJveC5zZWN1cml0eS5w
b2xpY3lgYCBrZXJuZWwgY29tbWFuZCBsaW5lIG9wdGlvbnMsIHRoZXkgd2lsbCBiZQphcHBlbmRl
ZCBvbnRvIHRoZSBmaW5hbCBrZXJuZWwgY29tbWFuZCBsaW5lCjpyZWY6YCoqYWZ0ZXIqKiBhbGwg
b3RoZXIgb3B0aW9ucyA8Ym9vdGFyZ3NfY29uY2F0X29yZGVyPmAuCgpSZW1vdmFsIG9mIGdsb2Jh
bC5lbnYuYXV0b3Byb2JlCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KClRoZSBnbG9i
YWwuZW52LmF1dG9wcm9iZSB2YXJpYWJsZSBpbnRyb2R1Y2VkIHdpdGggdjIwMjUuMDIuMCBpcyBy
ZW1vdmVkIGFuZApub3cgcmVwbGFjZWQgd2l0aCBDT05GSUdfRU5WX0hBTkRMSU5HX0FVVE9QUk9C
RS4gSXQgaGFzIG5ldmVyIHdvcmtlZC4gSWYgeW91CndhbnQgdG8gbG9hZCBhIGJhcmVib3ggZW52
aXJvbm1lbnQgYmFzZWQgb24gaXRzIHBhcnRpdGlvbiBVVUlEIGVuYWJsZQpDT05GSUdfRU5WX0hB
TkRMSU5HX0FVVE9QUk9CRS4KLS0tCiBtZXRhL3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1j
b21tb24uaW5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94
LWNvbW1vbi5pbmMgYi9tZXRhL3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5j
CmluZGV4IDJhNDJjMGEyNjYuLjZiYzNmYTA3ZmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1i
c3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWJzcC9iYXJl
Ym94L2JhcmVib3gtY29tbW9uLmluYwpAQCAtMyw2ICszLDYgQEAgU0VDVElPTiA9ICJib290bG9h
ZGVycyIKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9ZjUxMjVkMTNl
MDAwYjljYTFmMGQzMzY0Mjg2YzQxOTIiCiAKLVBWID0gIjIwMjYuMDYuMSIKK1BWID0gIjIwMjYu
MDcuMCIKIFNSQ19VUkkgPSAiaHR0cHM6Ly9iYXJlYm94Lm9yZy9kb3dubG9hZC9iYXJlYm94LSR7
UFZ9LnRhci5iejIiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODc1MmIzNzUyODE5ZWM0YWFmODQ4
YTFkMDZkZjA1MjQyYTY0OTU0NTI1ZmIxNWI2Y2YwN2IzYzNkZDdlYmQ3ZiIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICI4YjhmYjc4MTA5NGNkMDFjNGM1YmU5ZDA4OTlkNjI5NjY4Y2VlMmI3M2YxNDQ3
MjYwODUxNzE1YzQ0OTZiZDc4IgotLSAKMi40Ny4xCgo=

--===============0299846050776302988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2026.06.1 [default] to 2026.07.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2026.06.1" to "2026.07.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2026.06.1 [default] to 2026.07.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2026.06.1" to "2026.07.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2026.06.1 [default] to 2026.07.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2026.06.1" to "2026.07.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2026.06.1 [default] to 2026.07.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2026.06.1" to "2026.07.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2026.06.1 [default] to 2026.07.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2026.06.1" to "2026.07.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2026.06.1 [default] to 2026.07.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2026.06.1" to "2026.07.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2026.06.1 [default] to 2026.07.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PV changed from "2026.06.1" to "2026.07.0"
packages/x86-64-v3-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2026.06.1.tar.bz2" to "https://barebox.org/download/barebox-2026.07.0.tar.bz2"
packages/x86-64-v3-poky-linux/barebox-tools: PKGV changed from 2026.06.1 [default] to 2026.07.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools: PV changed from "2026.06.1" to "2026.07.0"

--===============0299846050776302988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="barebox-tools-changelog.txt"

Changelog for barebox-tools: 2026.06.1 -> 2026.07.0
Source: Documentation/migration-guides/migration-2026.06.0.rst

Release v2026.06.0
==================

global.linux.bootargs.* appending order
---------------------------------------

If barebox was configured to automatically generate any of the ``root``,
``rootwait``, ``earlycon``, ``systemd.machine_id``, ``systemd.hostname``
or ``barebox.security.policy`` kernel command line options, they will be
appended onto the final kernel command line
:ref:`**after** all other options <bootargs_concat_order>`.

Removal of global.env.autoprobe
-------------------------------

The global.env.autoprobe variable introduced with v2025.02.0 is removed and
now replaced with CONFIG_ENV_HANDLING_AUTOPROBE. It has never worked. If you
want to load a barebox environment based on its partition UUID enable
CONFIG_ENV_HANDLING_AUTOPROBE.

--===============0299846050776302988==--

