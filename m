Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F46C54E5A
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:17 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.36626.1709330716537164703
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VlILVZHr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gCGoMLRu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018dfc0cd420-5f260dc9-7f31-4abe-b602-3e00bda0b650-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330715;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WWZHKp0bDm+PdRkq6HTgQal0nKyxYWVhchC/x+qi9t0=;
	b=VlILVZHr62cNqfD11YcQp4MpXerSgaSJ1GV2mBkTMduqTeJPLtMYSoHMS8xCgDRb
	5cuS9aGRTWbi2HhIJQ8QbrqJNEB7Vu7cQ+zBHpkTafiMz5Xd4W1Jx97NzCe0EA02+lS
	tS1/kBw1K2dV2dNOEFhXliA33YTmNYOLREA6YAUI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330715;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WWZHKp0bDm+PdRkq6HTgQal0nKyxYWVhchC/x+qi9t0=;
	b=gCGoMLRuxJnlXieeJNLNhCO1SxYCixtnNdMePdKh4Inw0LEjhEJSgn1nHdyQs42r
	y7/9CBdtszLMHkicWY4NvXLUUZ4OC2+WSs9WfsxY3ibyMZmm8L+DbmGLNxiuh2sVVqB
	z9F3YKDDmt0m1IrooH0sG2TTSChu5ece+s4tAH0g=
Content-Type: multipart/mixed; boundary="===============0808346985580126246=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ttyrun: upgrading to 2.31.0 SUCCEEDED
Message-ID: <0101018dfc0cd420-5f260dc9-7f31-4abe-b602-3e00bda0b650-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196476

--===============0808346985580126246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ttyrun* to *2.31.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ttyrun-upgrade-2.30.0-2.31.0.patch
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
From 5e309fffd5542b4d691e7b39821f07526ced8759 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 11:25:58 +0000
Subject: [PATCH] ttyrun: upgrade 2.30.0 -> 2.31.0

---
 meta/recipes-core/ttyrun/{ttyrun_2.30.0.bb => ttyrun_2.31.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.30.0.bb => ttyrun_2.31.0.bb} (93%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.30.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.31.0.bb
similarity index 93%
rename from meta/recipes-core/ttyrun/ttyrun_2.30.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.31.0.bb
index 73c6c58c9d..122dd9d8e7 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.30.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.31.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
-SRCREV = "c217f6be6addd4d008f110efa53fbec79681dbfd"
+SRCREV = "6f15ed326491a17d83ca60cd2bda47fb5e8a0175"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


--===============0808346985580126246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ttyrun: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-64-poky-linux/ttyrun: PV changed from "2.30.0" to "2.31.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-dbg: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-dbg: PKGSIZE changed from 18256 to 18264 (+0%)
packages/core2-64-poky-linux/ttyrun/ttyrun-dbg: PV changed from "2.30.0" to "2.31.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-dev: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-dev: PV changed from "2.30.0" to "2.31.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-doc: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-doc: PV changed from "2.30.0" to "2.31.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-locale: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-locale: PV changed from "2.30.0" to "2.31.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-src: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-src: PV changed from "2.30.0" to "2.31.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-staticdev: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-staticdev: PV changed from "2.30.0" to "2.31.0"
packages/core2-64-poky-linux/ttyrun/ttyrun: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun: PV changed from "2.30.0" to "2.31.0"

--===============0808346985580126246==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ttyrun-upgrade-2.30.0-2.31.0.patch"

RnJvbSA1ZTMwOWZmZmQ1NTQyYjRkNjkxZTdiMzk4MjFmMDc1MjZjZWQ4NzU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxMToyNTo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHR0
eXJ1bjogdXBncmFkZSAyLjMwLjAgLT4gMi4zMS4wCgotLS0KIG1ldGEvcmVjaXBlcy1jb3JlL3R0
eXJ1bi97dHR5cnVuXzIuMzAuMC5iYiA9PiB0dHlydW5fMi4zMS4wLmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb3JlL3R0eXJ1bi97dHR5cnVuXzIuMzAuMC5iYiA9PiB0dHlydW5fMi4zMS4wLmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi4zMC4w
LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvdHR5cnVuL3R0eXJ1bl8yLjMxLjAuYmIKc2ltaWxhcml0
eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvdHR5cnVuL3R0eXJ1bl8y
LjMwLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi4zMS4w
LmJiCmluZGV4IDczYzZjNThjOWQuLjEyMmRkOWQ4ZTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL3R0eXJ1bi90dHlydW5fMi4zMC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3R0
eXJ1bi90dHlydW5fMi4zMS4wLmJiCkBAIC03LDcgKzcsNyBAQCBMSUNFTlNFID0gIk1JVCIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWY1MTE4ZjE2N2IwNTViZmQ3YzM0
NTA4MDNmMTg0N2FmIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vaWJtLXMzOTAtbGlu
dXgvczM5MC10b29scztwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIgotU1JDUkVWID0gImMy
MTdmNmJlNmFkZGQ0ZDAwOGYxMTBlZmE1M2ZiZWM3OTY4MWRiZmQiCitTUkNSRVYgPSAiNmYxNWVk
MzI2NDkxYTE3ZDgzY2E2MGNkMmJkYTQ3ZmI1ZThhMDE3NSIKIAogUyA9ICIke1dPUktESVJ9L2dp
dCIKIAotLSAKMi40Mi4wCgo=

--===============0808346985580126246==--

