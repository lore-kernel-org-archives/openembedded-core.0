Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89529C61DB6
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 05:57:05 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15471.1787637418943233285
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 22:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Dev2XFtj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ex4iq3Xu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a0377e4678-131029fd-955f-4081-84a6-09fc9f0b54f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787637418;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qXUVizG7FklQZLX+8yKxPPFA/csdaNyb/5p043Hh5zA=;
	b=Dev2XFtjFrD5zuN47QNe9QhbIVINyTZ/K/KN6txukb+ojlv6V9gdwRogCHp0UqJD
	w6Yf464jiX2k3XaMUvs78DgMLtGz9RFfgPN3+qJ7Y938/T5TJdsmdGsw8jVz9yDiyhM
	3TuEnnyBUhMNXGPKrX+Yu2IBSO5lNfwOjTQMPfWg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787637418;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qXUVizG7FklQZLX+8yKxPPFA/csdaNyb/5p043Hh5zA=;
	b=ex4iq3XucugLzVRJwB6ahTMqASByjAXP1O9Zx4urUFY1iMOHxglMuE+nQa5vGZSD
	hUV+WmgV+tfK7pLoPuAPXtGYKtkc6nSPvb52cgkdIC2RsQTvV/ZPjioVAAtJ6c1gQzZ
	I+E6A6EY7zc2/agSm62jJamCvr0cvJFsupofoHs8=
Content-Type: multipart/mixed; boundary="===============5159294519333586347=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2026.08.0 SUCCEEDED
Message-ID: <010101a0377e4678-131029fd-955f-4081-84a6-09fc9f0b54f5-000000@us-west-2.amazonses.com>
Date: Tue, 25 Aug 2026 05:56:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.25-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 05:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244195

--===============5159294519333586347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2026.08.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2026.07.0-2026.08.0.patch
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
From 30aba845342b35b8d5433e6be8af384f4ef2a209 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 25 Aug 2026 05:13:04 +0000
Subject: [PATCH] barebox-tools: upgrade 2026.07.0 -> 2026.08.0

---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 6bc3fa07fa..a9f0593e27 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2026.07.0"
+PV = "2026.08.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "8b8fb781094cd01c4c5be9d0899d629668cee2b73f1447260851715c4496bd78"
+SRC_URI[sha256sum] = "5b270cbde7f2fc6a78ff6e748eef788bbc04571682e2f2e964cd15a2e009774c"
-- 
2.47.1


--===============5159294519333586347==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2026.07.0-2026.08.0.patch"

RnJvbSAzMGFiYTg0NTM0MmIzNWI4ZDU0MzNlNmJlOGFmMzg0ZjRlZjJhMjA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjUgQXVnIDIwMjYgMDU6MTM6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YXJlYm94LXRvb2xzOiB1cGdyYWRlIDIwMjYuMDcuMCAtPiAyMDI2LjA4LjAKCi0tLQogbWV0YS9y
ZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYyB8IDQgKystLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jIGIvbWV0YS9yZWNpcGVzLWJz
cC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYwppbmRleCA2YmMzZmEwN2ZhLi5hOWYwNTkzZTI3
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMKQEAgLTMs
NiArMyw2IEBAIFNFQ1RJT04gPSAiYm9vdGxvYWRlcnMiCiAKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0NPUFlJTkc7bWQ1PWY1MTI1ZDEzZTAwMGI5Y2ExZjBkMzM2NDI4NmM0MTkyIgogCi1Q
ViA9ICIyMDI2LjA3LjAiCitQViA9ICIyMDI2LjA4LjAiCiBTUkNfVVJJID0gImh0dHBzOi8vYmFy
ZWJveC5vcmcvZG93bmxvYWQvYmFyZWJveC0ke1BWfS50YXIuYnoyIgotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjhiOGZiNzgxMDk0Y2QwMWM0YzViZTlkMDg5OWQ2Mjk2NjhjZWUyYjczZjE0NDcyNjA4
NTE3MTVjNDQ5NmJkNzgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWIyNzBjYmRlN2YyZmM2YTc4
ZmY2ZTc0OGVlZjc4OGJiYzA0NTcxNjgyZTJmMmU5NjRjZDE1YTJlMDA5Nzc0YyIKLS0gCjIuNDcu
MQoK

--===============5159294519333586347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2026.07.0" to "2026.08.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2026.07.0 [default] to 2026.08.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2026.07.0" to "2026.08.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2026.07.0 [default] to 2026.08.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2026.07.0" to "2026.08.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2026.07.0 [default] to 2026.08.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2026.07.0" to "2026.08.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2026.07.0 [default] to 2026.08.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2026.07.0" to "2026.08.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2026.07.0 [default] to 2026.08.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2026.07.0" to "2026.08.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2026.07.0 [default] to 2026.08.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PV changed from "2026.07.0" to "2026.08.0"
packages/x86-64-v3-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2026.07.0 [default] to 2026.08.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools: PV changed from "2026.07.0" to "2026.08.0"
packages/x86-64-v3-poky-linux/barebox-tools: PKGV changed from 2026.07.0 [default] to 2026.08.0 [default]
packages/x86-64-v3-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2026.07.0.tar.bz2" to "https://barebox.org/download/barebox-2026.08.0.tar.bz2"

--===============5159294519333586347==--

