Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BCFCD98F6
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:51 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50415.1781195499127124843
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VoQItpwp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IPYtscx1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019eb78663c3-0497cf28-7dc5-428d-8aa0-cfcb98867aa5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195498;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NImODFPZZaZbjmskjZk4do5sjDuR4vyA3guxSPEd940=;
	b=VoQItpwpAKtWSWIN56xTnJO4TX7Ny15oDmkmYp/Ey9zQDVTGfyy9PiRFihiXxHdW
	Lsi5VruD0LCCnD3gNM6N5LeEPYFe2Xfo8ZqwV8LtfOFUjtJNdPvcI9/3qiGHOXiLLUl
	14UPfIRf3B0Uu8dBYgayNhQYQmqK9JC/dNXyMBuY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195498;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NImODFPZZaZbjmskjZk4do5sjDuR4vyA3guxSPEd940=;
	b=IPYtscx10WT2gSsK9iRRPPZfCiLgn/lszrpLVMqcXWWtflnF+7akv2RsQxTzx9ad
	rhrGeBvgjrXT76Bl5XnPTQs1CCFHl30IUPaf40P1bwq8BAGg7/kpYj8htN615stvBwp
	G46hyGibb6JSF4Ns38pYr35zSwZEXBImime3kjRI=
Content-Type: multipart/mixed; boundary="===============5298107565425046165=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2026.06.0 SUCCEEDED
Message-ID: <0101019eb78663c3-0497cf28-7dc5-428d-8aa0-cfcb98867aa5-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238470

--===============5298107565425046165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2026.06.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2026.04.0-2026.06.0.patch
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
From 2061747ad7c9a7fba5a8328dc1b192ef85f45dfc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 08:12:52 +0000
Subject: [PATCH] barebox-tools: upgrade 2026.04.0 -> 2026.06.0

---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index f736ca68e0..6467ed3653 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2026.04.0"
+PV = "2026.06.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "07fd3e3440c23e27d0094432f67827887fcc0e37d5fe24dc257c39b97c4294a0"
+SRC_URI[sha256sum] = "521b427efe4d5199641fd6440ed77226fed3ba7088ee2f6361b510187f700f09"
-- 
2.47.1


--===============5298107565425046165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2026.04.0" to "2026.06.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2026.04.0 [default] to 2026.06.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2026.04.0" to "2026.06.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2026.04.0 [default] to 2026.06.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2026.04.0" to "2026.06.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2026.04.0 [default] to 2026.06.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2026.04.0" to "2026.06.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2026.04.0 [default] to 2026.06.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2026.04.0" to "2026.06.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2026.04.0 [default] to 2026.06.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2026.04.0" to "2026.06.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2026.04.0 [default] to 2026.06.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PV changed from "2026.04.0" to "2026.06.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2026.04.0 [default] to 2026.06.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2026.04.0.tar.bz2" to "https://barebox.org/download/barebox-2026.06.0.tar.bz2"
packages/x86-64-v3-poky-linux/barebox-tools: PV changed from "2026.04.0" to "2026.06.0"
packages/x86-64-v3-poky-linux/barebox-tools: PKGV changed from 2026.04.0 [default] to 2026.06.0 [default]

--===============5298107565425046165==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2026.04.0-2026.06.0.patch"

RnJvbSAyMDYxNzQ3YWQ3YzlhN2ZiYTVhODMyOGRjMWIxOTJlZjg1ZjQ1ZGZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMDg6MTI6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YXJlYm94LXRvb2xzOiB1cGdyYWRlIDIwMjYuMDQuMCAtPiAyMDI2LjA2LjAKCi0tLQogbWV0YS9y
ZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYyB8IDQgKystLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jIGIvbWV0YS9yZWNpcGVzLWJz
cC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYwppbmRleCBmNzM2Y2E2OGUwLi42NDY3ZWQzNjUz
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMKQEAgLTMs
NiArMyw2IEBAIFNFQ1RJT04gPSAiYm9vdGxvYWRlcnMiCiAKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PWY1MTI1ZDEzZTAwMGI5Y2ExZjBkMzM2NDI4NmM0MTkyIgogCi1Q
ViA9ICIyMDI2LjA0LjAiCitQViA9ICIyMDI2LjA2LjAiCiBTUkNfVVJJID0gImh0dHBzOi8vYmFy
ZWJveC5vcmcvZG93bmxvYWQvYmFyZWJveC0ke1BWfS50YXIuYnoyIgotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjA3ZmQzZTM0NDBjMjNlMjdkMDA5NDQzMmY2NzgyNzg4N2ZjYzBlMzdkNWZlMjRkYzI1
N2MzOWI5N2M0Mjk0YTAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTIxYjQyN2VmZTRkNTE5OTY0
MWZkNjQ0MGVkNzcyMjZmZWQzYmE3MDg4ZWUyZjYzNjFiNTEwMTg3ZjcwMGYwOSIKLS0gCjIuNDcu
MQoK

--===============5298107565425046165==--

