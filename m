Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59027C83029
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:53 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.8888.1749993282205802143
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OMqN8Mlo;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=tP/FYtcR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019773ba5746-ffff0d73-ff60-41db-ba13-22523b969aea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993281;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TmXn9fz9xj6K/wqE1bJnJJT2GukV+nTSEgZL51iLI0M=;
	b=OMqN8Mlof2Is2cbS24ffTApGawDMt1TqraJ6Bbx4WIv7H7HYlG5k5ViPyFu8mtBF
	wzcT/XGZ5tGVZ1PfIGokKTHfOTu4m5JVmUfwnXUJRktunX//R2pDw2FhlYTrkf9lFnD
	HDyCgVJ26s+5sxf2320LlwyWQpKdAFfRcIyNswwg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993281;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TmXn9fz9xj6K/wqE1bJnJJT2GukV+nTSEgZL51iLI0M=;
	b=tP/FYtcRTxqMYrJD4e8wYcA5m+yjURymlLClJVqESUrQ2DQQT+g8mS3TGxSJhtNV
	Fe5M/mp9YsF5nGlxsg+7OrfjCAMMqBr+7/ldJSsIp/oeI5yT0F5J5O6b4yDWhm/WJ98
	7EipJlNDxviwVpzdIBRq1pysgnBghJi1hcSaN0AI=
Content-Type: multipart/mixed; boundary="===============7172831697339472674=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2025.06.0 SUCCEEDED
Message-ID: <0101019773ba5746-ffff0d73-ff60-41db-ba13-22523b969aea-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218660

--===============7172831697339472674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2025.06.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2025.04.0-2025.06.0.patch
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
From 47da562fbdfd59f98129d99842ea9cf7c27b0bcc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 07:10:39 +0000
Subject: [PATCH] barebox-tools: upgrade 2025.04.0 -> 2025.06.0

---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index d6ea1eedfe..67bc964188 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.04.0"
+PV = "2025.06.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "3124f3c2b69d9ce0512b2d40fa17cace9c356f65f005a63da0474387b8839c41"
+SRC_URI[sha256sum] = "d05bc1f85dc1d95b0b6b6a52cac0a469148fbb8f1edb0d352c3ca3b632426941"
-- 
2.47.1


--===============7172831697339472674==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2025.04.0-2025.06.0.patch"

RnJvbSA0N2RhNTYyZmJkZmQ1OWY5ODEyOWQ5OTg0MmVhOWNmN2MyN2IwYmNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDc6MTA6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YXJlYm94LXRvb2xzOiB1cGdyYWRlIDIwMjUuMDQuMCAtPiAyMDI1LjA2LjAKCi0tLQogbWV0YS9y
ZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYyB8IDQgKystLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jIGIvbWV0YS9yZWNpcGVzLWJz
cC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYwppbmRleCBkNmVhMWVlZGZlLi42N2JjOTY0MTg4
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMKQEAgLTMs
NiArMyw2IEBAIFNFQ1RJT04gPSAiYm9vdGxvYWRlcnMiCiAKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PWY1MTI1ZDEzZTAwMGI5Y2ExZjBkMzM2NDI4NmM0MTkyIgogCi1Q
ViA9ICIyMDI1LjA0LjAiCitQViA9ICIyMDI1LjA2LjAiCiBTUkNfVVJJID0gImh0dHBzOi8vYmFy
ZWJveC5vcmcvZG93bmxvYWQvYmFyZWJveC0ke1BWfS50YXIuYnoyIgotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjMxMjRmM2MyYjY5ZDljZTA1MTJiMmQ0MGZhMTdjYWNlOWMzNTZmNjVmMDA1YTYzZGEw
NDc0Mzg3Yjg4MzljNDEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDA1YmMxZjg1ZGMxZDk1YjBi
NmI2YTUyY2FjMGE0NjkxNDhmYmI4ZjFlZGIwZDM1MmMzY2EzYjYzMjQyNjk0MSIKLS0gCjIuNDcu
MQoK

--===============7172831697339472674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2025.04.0" to "2025.06.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2025.04.0 [default] to 2025.06.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2025.04.0" to "2025.06.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2025.04.0 [default] to 2025.06.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2025.04.0" to "2025.06.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2025.04.0 [default] to 2025.06.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2025.04.0" to "2025.06.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2025.04.0 [default] to 2025.06.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2025.04.0" to "2025.06.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2025.04.0 [default] to 2025.06.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2025.04.0" to "2025.06.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2025.04.0 [default] to 2025.06.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools: PV changed from "2025.04.0" to "2025.06.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2025.04.0 [default] to 2025.06.0 [default]
packages/core2-64-poky-linux/barebox-tools: PV changed from "2025.04.0" to "2025.06.0"
packages/core2-64-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2025.04.0.tar.bz2" to "https://barebox.org/download/barebox-2025.06.0.tar.bz2"
packages/core2-64-poky-linux/barebox-tools: PKGV changed from 2025.04.0 [default] to 2025.06.0 [default]

--===============7172831697339472674==--

