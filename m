Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691C2C982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 07:10:08 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33828.1789629007829378235
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 00:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=pM0AxEg0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=P1uLEyHU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a0ae3383f8-4170c7d7-9b47-45f8-bbb1-0835bd0e850e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789629007;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7pbPt6V8Fgwe+gwSRQO7eGVuxDlodEe1hgmLxczQRt8=;
	b=pM0AxEg0aRNfBzs2SrHsV9qm47QS2ajD5m+xg1epgwn6Iu8T+2Aqw/T2fDUrsDr3
	Im4jORA9855+FgrV9R0Fo7LgmrjCCmkakiRbqmR4qJapuOEtPejdUtP2RLp5JNyHQok
	C5OXc2tBOBg690TszuZ6HxuEwfudl17f5lmrtRpw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789629007;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7pbPt6V8Fgwe+gwSRQO7eGVuxDlodEe1hgmLxczQRt8=;
	b=P1uLEyHUlCYcI70R83+muYk/mPp64O04CmIAuigxeXkPr5mEOqmp0PRLL9JV7Of6
	VjSl3inPHvKaORJRW6Ci6tGvW4/FUd22loWMweGwiBTg1qWRypybg/VFqerrboA4gnW
	XXrdpj97Lc7/tV10AIYK/Bdokq7RgvhwTx0LOKvY=
Content-Type: multipart/mixed; boundary="===============4076814166188256156=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2026.09.0 SUCCEEDED
Message-ID: <010101a0ae3383f8-4170c7d7-9b47-45f8-bbb1-0835bd0e850e-000000@us-west-2.amazonses.com>
Date: Thu, 17 Sep 2026 07:10:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.17-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 07:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246028

--===============4076814166188256156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2026.09.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2026.08.0-2026.09.0.patch
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
From a95e5df7d06ab855edca881af16656a6d79374bb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 17 Sep 2026 05:27:17 +0000
Subject: [PATCH] barebox-tools: upgrade 2026.08.0 -> 2026.09.0

Source: Documentation/migration-guides/migration-2026.08.0.rst, Documentation/migration-guides/migration-2026.09.0.rst

Release v2026.08.0
==================

global.partitions.first_usable_lba removed
------------------------------------------

The ``global.partitions.first_usable_lba`` variable has been removed.
Use ``global.partitions.first_partition_offset`` instead.

The new variable is a byte offset used by free-space searches for new
partitions, for example ``parted mkpart_size``. The default is
``8388608`` bytes (8 MiB). To keep an old configuration, multiply the
old ``first_usable_lba`` value by 512.

ARCH=arm64
----------

Use of ``ARCH=arm`` for 64-bit ARM builds is deprecated and now emits
a warning. Users should change build scripts to use ``ARCH=arm64``
instead when targetting ARMv8.

Removal of deprecated CONFIG_BOOTM_OPTEE
----------------------------------------

The support for late loading of OP-TEE had been deprecated and ultimately
removed as it greatly increased the attack surface and was only supported
on 32-bit ARM systems.

OP-TEE loading is now only supported
:ref:`in the prebootloader <optee_early_loading>`.

For i.MX6 boards, this can be enabled by enabling
``CONFIG_FIRMWARE_IMX6_OPTEE``.

sha1 no longer accepted for secure boot
---------------------------------------

FIT images using sha1 are no longer accepted as secure boot images. sha1 has
been proven insecure in 2017.
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index a9f0593e27..d94798193b 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2026.08.0"
+PV = "2026.09.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "5b270cbde7f2fc6a78ff6e748eef788bbc04571682e2f2e964cd15a2e009774c"
+SRC_URI[sha256sum] = "491b504c8a79b5a4e30c419b824916b7329bad8abfe34987ba066bafa1fbcfc5"
-- 
2.47.1


--===============4076814166188256156==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2026.08.0-2026.09.0.patch"

RnJvbSBhOTVlNWRmN2QwNmFiODU1ZWRjYTg4MWFmMTY2NTZhNmQ3OTM3NGJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTcgU2VwIDIwMjYgMDU6Mjc6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YXJlYm94LXRvb2xzOiB1cGdyYWRlIDIwMjYuMDguMCAtPiAyMDI2LjA5LjAKClNvdXJjZTogRG9j
dW1lbnRhdGlvbi9taWdyYXRpb24tZ3VpZGVzL21pZ3JhdGlvbi0yMDI2LjA4LjAucnN0LCBEb2N1
bWVudGF0aW9uL21pZ3JhdGlvbi1ndWlkZXMvbWlncmF0aW9uLTIwMjYuMDkuMC5yc3QKClJlbGVh
c2UgdjIwMjYuMDguMAo9PT09PT09PT09PT09PT09PT0KCmdsb2JhbC5wYXJ0aXRpb25zLmZpcnN0
X3VzYWJsZV9sYmEgcmVtb3ZlZAotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KClRoZSBgYGdsb2JhbC5wYXJ0aXRpb25zLmZpcnN0X3VzYWJsZV9sYmFgYCB2YXJpYWJs
ZSBoYXMgYmVlbiByZW1vdmVkLgpVc2UgYGBnbG9iYWwucGFydGl0aW9ucy5maXJzdF9wYXJ0aXRp
b25fb2Zmc2V0YGAgaW5zdGVhZC4KClRoZSBuZXcgdmFyaWFibGUgaXMgYSBieXRlIG9mZnNldCB1
c2VkIGJ5IGZyZWUtc3BhY2Ugc2VhcmNoZXMgZm9yIG5ldwpwYXJ0aXRpb25zLCBmb3IgZXhhbXBs
ZSBgYHBhcnRlZCBta3BhcnRfc2l6ZWBgLiBUaGUgZGVmYXVsdCBpcwpgYDgzODg2MDhgYCBieXRl
cyAoOCBNaUIpLiBUbyBrZWVwIGFuIG9sZCBjb25maWd1cmF0aW9uLCBtdWx0aXBseSB0aGUKb2xk
IGBgZmlyc3RfdXNhYmxlX2xiYWBgIHZhbHVlIGJ5IDUxMi4KCkFSQ0g9YXJtNjQKLS0tLS0tLS0t
LQoKVXNlIG9mIGBgQVJDSD1hcm1gYCBmb3IgNjQtYml0IEFSTSBidWlsZHMgaXMgZGVwcmVjYXRl
ZCBhbmQgbm93IGVtaXRzCmEgd2FybmluZy4gVXNlcnMgc2hvdWxkIGNoYW5nZSBidWlsZCBzY3Jp
cHRzIHRvIHVzZSBgYEFSQ0g9YXJtNjRgYAppbnN0ZWFkIHdoZW4gdGFyZ2V0dGluZyBBUk12OC4K
ClJlbW92YWwgb2YgZGVwcmVjYXRlZCBDT05GSUdfQk9PVE1fT1BURUUKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKVGhlIHN1cHBvcnQgZm9yIGxhdGUgbG9hZGluZyBv
ZiBPUC1URUUgaGFkIGJlZW4gZGVwcmVjYXRlZCBhbmQgdWx0aW1hdGVseQpyZW1vdmVkIGFzIGl0
IGdyZWF0bHkgaW5jcmVhc2VkIHRoZSBhdHRhY2sgc3VyZmFjZSBhbmQgd2FzIG9ubHkgc3VwcG9y
dGVkCm9uIDMyLWJpdCBBUk0gc3lzdGVtcy4KCk9QLVRFRSBsb2FkaW5nIGlzIG5vdyBvbmx5IHN1
cHBvcnRlZAo6cmVmOmBpbiB0aGUgcHJlYm9vdGxvYWRlciA8b3B0ZWVfZWFybHlfbG9hZGluZz5g
LgoKRm9yIGkuTVg2IGJvYXJkcywgdGhpcyBjYW4gYmUgZW5hYmxlZCBieSBlbmFibGluZwpgYENP
TkZJR19GSVJNV0FSRV9JTVg2X09QVEVFYGAuCgpzaGExIG5vIGxvbmdlciBhY2NlcHRlZCBmb3Ig
c2VjdXJlIGJvb3QKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpGSVQg
aW1hZ2VzIHVzaW5nIHNoYTEgYXJlIG5vIGxvbmdlciBhY2NlcHRlZCBhcyBzZWN1cmUgYm9vdCBp
bWFnZXMuIHNoYTEgaGFzCmJlZW4gcHJvdmVuIGluc2VjdXJlIGluIDIwMTcuCi0tLQogbWV0YS9y
ZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYyB8IDQgKystLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jIGIvbWV0YS9yZWNpcGVzLWJz
cC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYwppbmRleCBhOWYwNTkzZTI3Li5kOTQ3OTgxOTNi
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMKQEAgLTMs
NiArMyw2IEBAIFNFQ1RJT04gPSAiYm9vdGxvYWRlcnMiCiAKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PWY1MTI1ZDEzZTAwMGI5Y2ExZjBkMzM2NDI4NmM0MTkyIgogCi1Q
ViA9ICIyMDI2LjA4LjAiCitQViA9ICIyMDI2LjA5LjAiCiBTUkNfVVJJID0gImh0dHBzOi8vYmFy
ZWJveC5vcmcvZG93bmxvYWQvYmFyZWJveC0ke1BWfS50YXIuYnoyIgotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjViMjcwY2JkZTdmMmZjNmE3OGZmNmU3NDhlZWY3ODhiYmMwNDU3MTY4MmUyZjJlOTY0
Y2QxNWEyZTAwOTc3NGMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDkxYjUwNGM4YTc5YjVhNGUz
MGM0MTliODI0OTE2YjczMjliYWQ4YWJmZTM0OTg3YmEwNjZiYWZhMWZiY2ZjNSIKLS0gCjIuNDcu
MQoK

--===============4076814166188256156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="barebox-tools-changelog.txt"

Changelog for barebox-tools: 2026.08.0 -> 2026.09.0
Source: Documentation/migration-guides/migration-2026.08.0.rst, Documentation/migration-guides/migration-2026.09.0.rst

Release v2026.08.0
==================

global.partitions.first_usable_lba removed
------------------------------------------

The ``global.partitions.first_usable_lba`` variable has been removed.
Use ``global.partitions.first_partition_offset`` instead.

The new variable is a byte offset used by free-space searches for new
partitions, for example ``parted mkpart_size``. The default is
``8388608`` bytes (8 MiB). To keep an old configuration, multiply the
old ``first_usable_lba`` value by 512.

ARCH=arm64
----------

Use of ``ARCH=arm`` for 64-bit ARM builds is deprecated and now emits
a warning. Users should change build scripts to use ``ARCH=arm64``
instead when targetting ARMv8.

Removal of deprecated CONFIG_BOOTM_OPTEE
----------------------------------------

The support for late loading of OP-TEE had been deprecated and ultimately
removed as it greatly increased the attack surface and was only supported
on 32-bit ARM systems.

OP-TEE loading is now only supported
:ref:`in the prebootloader <optee_early_loading>`.

For i.MX6 boards, this can be enabled by enabling
``CONFIG_FIRMWARE_IMX6_OPTEE``.

sha1 no longer accepted for secure boot
---------------------------------------

FIT images using sha1 are no longer accepted as secure boot images. sha1 has
been proven insecure in 2017.

--===============4076814166188256156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2026.08.0" to "2026.09.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2026.08.0 [default] to 2026.09.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2026.08.0" to "2026.09.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2026.08.0 [default] to 2026.09.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2026.08.0" to "2026.09.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2026.08.0 [default] to 2026.09.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2026.08.0" to "2026.09.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2026.08.0 [default] to 2026.09.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2026.08.0" to "2026.09.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2026.08.0 [default] to 2026.09.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2026.08.0" to "2026.09.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2026.08.0 [default] to 2026.09.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PV changed from "2026.08.0" to "2026.09.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2026.08.0 [default] to 2026.09.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools: PV changed from "2026.08.0" to "2026.09.0"
packages/x86-64-v3-poky-linux/barebox-tools: PKGV changed from 2026.08.0 [default] to 2026.09.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2026.08.0.tar.bz2" to "https://barebox.org/download/barebox-2026.09.0.tar.bz2"

--===============4076814166188256156==--

