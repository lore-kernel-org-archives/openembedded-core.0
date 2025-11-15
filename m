Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1A4CEBF71
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:40 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12106.1763224707847198131
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XwFCPidA;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=BGKiT7OL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019a8861f8b3-382d1ce1-5509-48ba-9158-32b784a93998-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224713;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=woIMwBVXv556U9mzTL9zVUgDp0nYC27FCY8YgHDpuW0=;
	b=XwFCPidA/uCrwOLwZR9yzbZRCwMb8+aLpMY79s8hRlZXpOAAsCqnko3ueaho+fDe
	weWIMN60nwCmRm3xIyyhdHJKHWMZK0bENfUwrVpQ1ioxcttptO8kNxthpgUF4qSk0Ai
	E9QCpnmnS8xfD3OPd0kjpoOEbkdc+Ffjg9RdThMk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224713;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=woIMwBVXv556U9mzTL9zVUgDp0nYC27FCY8YgHDpuW0=;
	b=BGKiT7OLus6IQN0b0TmXySJX/wL7lHuDwqk0fXrCWawwosI5HwOoGF4/tv5XHXH4
	Z3/g3sFpJ8alLcdsWfS1MgqkM2VhG8HNnxoDZaC+99yVgDDKc0F/lov5Gm4gc1eV6u3
	q6iOLR44oeJn/8py9O9jPiqUReigV8xYwdiZ/bmA=
Content-Type: multipart/mixed; boundary="===============6982767526409036957=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2025.11.0 SUCCEEDED
Message-ID: <0101019a8861f8b3-382d1ce1-5509-48ba-9158-32b784a93998-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226313

--===============6982767526409036957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2025.11.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2025.09.0-2025.11.0.patch
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
From be5b2ff7b08f6b1f7b8d2a41121bea2ef5588f82 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 07:40:04 +0000
Subject: [PATCH] barebox-tools: upgrade 2025.09.0 -> 2025.11.0

---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index e41d0858fd..0ad9166aa2 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.09.0"
+PV = "2025.11.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "7df1aa47bb7bf1763a729137ac773e69a4052812af094475d739fc63a9295f0d"
+SRC_URI[sha256sum] = "6a487eb975169ef4ecc912d3e1044fb9ee4aa164c21d4db960a384a60d0914f6"
-- 
2.47.1


--===============6982767526409036957==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2025.09.0-2025.11.0.patch"

RnJvbSBiZTViMmZmN2IwOGY2YjFmN2I4ZDJhNDExMjFiZWEyZWY1NTg4ZjgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDc6NDA6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YXJlYm94LXRvb2xzOiB1cGdyYWRlIDIwMjUuMDkuMCAtPiAyMDI1LjExLjAKCi0tLQogbWV0YS9y
ZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYyB8IDQgKystLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jIGIvbWV0YS9yZWNpcGVzLWJz
cC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYwppbmRleCBlNDFkMDg1OGZkLi4wYWQ5MTY2YWEy
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMKQEAgLTMs
NiArMyw2IEBAIFNFQ1RJT04gPSAiYm9vdGxvYWRlcnMiCiAKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PWY1MTI1ZDEzZTAwMGI5Y2ExZjBkMzM2NDI4NmM0MTkyIgogCi1Q
ViA9ICIyMDI1LjA5LjAiCitQViA9ICIyMDI1LjExLjAiCiBTUkNfVVJJID0gImh0dHBzOi8vYmFy
ZWJveC5vcmcvZG93bmxvYWQvYmFyZWJveC0ke1BWfS50YXIuYnoyIgotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjdkZjFhYTQ3YmI3YmYxNzYzYTcyOTEzN2FjNzczZTY5YTQwNTI4MTJhZjA5NDQ3NWQ3
MzlmYzYzYTkyOTVmMGQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmE0ODdlYjk3NTE2OWVmNGVj
YzkxMmQzZTEwNDRmYjllZTRhYTE2NGMyMWQ0ZGI5NjBhMzg0YTYwZDA5MTRmNiIKLS0gCjIuNDcu
MQoK

--===============6982767526409036957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2025.09.0" to "2025.11.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2025.09.0 [default] to 2025.11.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PKGSIZE changed from 135112 to 135176 (+0%)
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2025.09.0" to "2025.11.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2025.09.0 [default] to 2025.11.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2025.09.0" to "2025.11.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2025.09.0 [default] to 2025.11.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2025.09.0" to "2025.11.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2025.09.0 [default] to 2025.11.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2025.09.0" to "2025.11.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2025.09.0 [default] to 2025.11.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2025.09.0" to "2025.11.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2025.09.0 [default] to 2025.11.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PV changed from "2025.09.0" to "2025.11.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2025.09.0 [default] to 2025.11.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools: PV changed from "2025.09.0" to "2025.11.0"
packages/x86-64-v3-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2025.09.0.tar.bz2" to "https://barebox.org/download/barebox-2025.11.0.tar.bz2"
packages/x86-64-v3-poky-linux/barebox-tools: PKGV changed from 2025.09.0 [default] to 2025.11.0 [default]

--===============6982767526409036957==--

