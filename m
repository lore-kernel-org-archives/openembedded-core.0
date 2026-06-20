Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FBFCDB46F
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 05:56:46 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1562.1781935002686079801
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 22:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aQ0NFarn;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jVFw/znk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019ee39a5135-014d9a9b-de91-4db5-ab73-ce962b332aad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781935002;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=O7t40UjHIuRoBhJigk4KHZDUQZu2fvG8BjSmLAu+fds=;
	b=aQ0NFarnZyCdHxIjNz+cKp9nsBBxx6ERkT4eB1mbwaUas9hjvLYHBDHo7cjOM9Sl
	BTfWzVcQuz/yfaYF/Tvb96yveBv/8fut8HMKkxQrlZRrvT+xU9S/RIKi9NtZRdY4NIg
	dofEAQt56ffjSP+pEKgi4sVuA/xBX7/qId+C7f0Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781935002;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=O7t40UjHIuRoBhJigk4KHZDUQZu2fvG8BjSmLAu+fds=;
	b=jVFw/znk0SiwPEgfqKDwHGXEkMfB7pArF1dC3zM4ByaPsqLlisI1xMZDhdMU5JOa
	B4WQB4NmVdcdQMxfSEmj7IDjJccl9TgE6lreYY7wWw+LqHMmJYIcVkPCgFFyOisQnEX
	zKB22IQH3EbBEKNeCIHMsP77y9hQIVx6Sk3Ky0xE=
Content-Type: multipart/mixed; boundary="===============2259477696730367248=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2026.06.1 SUCCEEDED
Message-ID: <0101019ee39a5135-014d9a9b-de91-4db5-ab73-ce962b332aad-000000@us-west-2.amazonses.com>
Date: Sat, 20 Jun 2026 05:56:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.20-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 05:56:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239195

--===============2259477696730367248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2026.06.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2026.06.0-2026.06.1.patch
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
From c40044aa15a88c324c0178c98b067382f2f0eb08 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 20 Jun 2026 05:11:34 +0000
Subject: [PATCH] barebox-tools: upgrade 2026.06.0 -> 2026.06.1

---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 6467ed3653..2a42c0a266 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2026.06.0"
+PV = "2026.06.1"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "521b427efe4d5199641fd6440ed77226fed3ba7088ee2f6361b510187f700f09"
+SRC_URI[sha256sum] = "8752b3752819ec4aaf848a1d06df05242a64954525fb15b6cf07b3c3dd7ebd7f"
-- 
2.47.1


--===============2259477696730367248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2026.06.0 [default] to 2026.06.1 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2026.06.0" to "2026.06.1"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2026.06.0 [default] to 2026.06.1 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2026.06.0" to "2026.06.1"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2026.06.0 [default] to 2026.06.1 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2026.06.0" to "2026.06.1"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2026.06.0 [default] to 2026.06.1 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2026.06.0" to "2026.06.1"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2026.06.0 [default] to 2026.06.1 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2026.06.0" to "2026.06.1"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2026.06.0 [default] to 2026.06.1 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2026.06.0" to "2026.06.1"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2026.06.0 [default] to 2026.06.1 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PV changed from "2026.06.0" to "2026.06.1"
packages/x86-64-v3-poky-linux/barebox-tools: PKGV changed from 2026.06.0 [default] to 2026.06.1 [default]
packages/x86-64-v3-poky-linux/barebox-tools: PV changed from "2026.06.0" to "2026.06.1"
packages/x86-64-v3-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2026.06.0.tar.bz2" to "https://barebox.org/download/barebox-2026.06.1.tar.bz2"

--===============2259477696730367248==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2026.06.0-2026.06.1.patch"

RnJvbSBjNDAwNDRhYTE1YTg4YzMyNGMwMTc4Yzk4YjA2NzM4MmYyZjBlYjA4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjAgSnVuIDIwMjYgMDU6MTE6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YXJlYm94LXRvb2xzOiB1cGdyYWRlIDIwMjYuMDYuMCAtPiAyMDI2LjA2LjEKCi0tLQogbWV0YS9y
ZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYyB8IDQgKystLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jIGIvbWV0YS9yZWNpcGVzLWJz
cC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYwppbmRleCA2NDY3ZWQzNjUzLi4yYTQyYzBhMjY2
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMKQEAgLTMs
NiArMyw2IEBAIFNFQ1RJT04gPSAiYm9vdGxvYWRlcnMiCiAKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PWY1MTI1ZDEzZTAwMGI5Y2ExZjBkMzM2NDI4NmM0MTkyIgogCi1Q
ViA9ICIyMDI2LjA2LjAiCitQViA9ICIyMDI2LjA2LjEiCiBTUkNfVVJJID0gImh0dHBzOi8vYmFy
ZWJveC5vcmcvZG93bmxvYWQvYmFyZWJveC0ke1BWfS50YXIuYnoyIgotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjUyMWI0MjdlZmU0ZDUxOTk2NDFmZDY0NDBlZDc3MjI2ZmVkM2JhNzA4OGVlMmY2MzYx
YjUxMDE4N2Y3MDBmMDkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODc1MmIzNzUyODE5ZWM0YWFm
ODQ4YTFkMDZkZjA1MjQyYTY0OTU0NTI1ZmIxNWI2Y2YwN2IzYzNkZDdlYmQ3ZiIKLS0gCjIuNDcu
MQoK

--===============2259477696730367248==--

