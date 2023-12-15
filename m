Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09254C48BEB
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:54 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.63605.1702649863291914286
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KlgvPNI3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=c/XWulO1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018c6dd718ed-09fb97d2-7fee-4871-82ce-5cb66caf16df-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649862;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wjcvZcbPkLYgJoP86ILKGVVJbtQQcb+aL2TnnuI/yHo=;
	b=KlgvPNI3mHKuBse8T/VujdpPLSy2c2NlbQ3lDvYj978lMDX9JMeW/VOvlZhvQp3O
	IYc10pgoGMVnE0E7SvR3VuvZXfTx/T0dg4NHJDjq6YP+AuGdm0YCjGVeU7niS+yIUmu
	GAoTkOt43R1PvTd75aUD0jaRPgszol+V341B2cY8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649862;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wjcvZcbPkLYgJoP86ILKGVVJbtQQcb+aL2TnnuI/yHo=;
	b=c/XWulO1EP4qHfLd+jMBdTyQU2EewXwFC2XFgUH5bHrrZUZbdRtKE6ev1j1Crzc/
	RVP/A3zzHyPOuPPbmJW/eh+wPvn1nfevAX+BLiiUJL19C/vb3KA/83/Zz+AKDoFhuh7
	COK1hT+EeYcb/EQEaOfP1sPR7rhIg2+FvqyOAVv4=
Content-Type: multipart/mixed; boundary="===============2367939308098175172=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ttyrun: upgrading to 2.30.0 SUCCEEDED
Message-ID: <0101018c6dd718ed-09fb97d2-7fee-4871-82ce-5cb66caf16df-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:42 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192449

--===============2367939308098175172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ttyrun* to *2.30.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ttyrun-upgrade-2.29.0-2.30.0.patch
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
From 2d25fc60df53b37f321cb6247972dd2ef8087dd4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Dec 2023 06:11:18 +0000
Subject: [PATCH] ttyrun: upgrade 2.29.0 -> 2.30.0

---
 meta/recipes-core/ttyrun/{ttyrun_2.29.0.bb => ttyrun_2.30.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.29.0.bb => ttyrun_2.30.0.bb} (93%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.29.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.30.0.bb
similarity index 93%
rename from meta/recipes-core/ttyrun/ttyrun_2.29.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.30.0.bb
index e0956b9ac6..73c6c58c9d 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.29.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.30.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
-SRCREV = "d9ce54dee3ac3827e76624352293a83eb05c727e"
+SRCREV = "c217f6be6addd4d008f110efa53fbec79681dbfd"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


--===============2367939308098175172==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ttyrun-upgrade-2.29.0-2.30.0.patch"

RnJvbSAyZDI1ZmM2MGRmNTNiMzdmMzIxY2I2MjQ3OTcyZGQyZWY4MDg3ZGQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgRGVjIDIwMjMgMDY6MTE6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
dHlydW46IHVwZ3JhZGUgMi4yOS4wIC0+IDIuMzAuMAoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS90
dHlydW4ve3R0eXJ1bl8yLjI5LjAuYmIgPT4gdHR5cnVuXzIuMzAuMC5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29yZS90dHlydW4ve3R0eXJ1bl8yLjI5LjAuYmIgPT4gdHR5cnVuXzIuMzAuMC5iYn0g
KDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMjku
MC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi4zMC4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5f
Mi4yOS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMzAu
MC5iYgppbmRleCBlMDk1NmI5YWM2Li43M2M2YzU4YzlkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMjkuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS90
dHlydW4vdHR5cnVuXzIuMzAuMC5iYgpAQCAtNyw3ICs3LDcgQEAgTElDRU5TRSA9ICJNSVQiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mNTExOGYxNjdiMDU1YmZkN2Mz
NDUwODAzZjE4NDdhZiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2libS1zMzkwLWxp
bnV4L3MzOTAtdG9vbHM7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciIKLVNSQ1JFViA9ICJk
OWNlNTRkZWUzYWMzODI3ZTc2NjI0MzUyMjkzYTgzZWIwNWM3MjdlIgorU1JDUkVWID0gImMyMTdm
NmJlNmFkZGQ0ZDAwOGYxMTBlZmE1M2ZiZWM3OTY4MWRiZmQiCiAKIFMgPSAiJHtXT1JLRElSfS9n
aXQiCiAKLS0gCjIuNDIuMAoK

--===============2367939308098175172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ttyrun: PKGV changed from 2.29.0 [default] to 2.30.0 [default]
packages/core2-64-poky-linux/ttyrun: PV changed from "2.29.0" to "2.30.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-dbg: PKGV changed from 2.29.0 [default] to 2.30.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-dbg: PV changed from "2.29.0" to "2.30.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-dev: PKGV changed from 2.29.0 [default] to 2.30.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-dev: PV changed from "2.29.0" to "2.30.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-doc: PKGV changed from 2.29.0 [default] to 2.30.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-doc: PV changed from "2.29.0" to "2.30.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-locale: PKGV changed from 2.29.0 [default] to 2.30.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-locale: PV changed from "2.29.0" to "2.30.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-src: PKGV changed from 2.29.0 [default] to 2.30.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-src: PV changed from "2.29.0" to "2.30.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-staticdev: PKGV changed from 2.29.0 [default] to 2.30.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-staticdev: PV changed from "2.29.0" to "2.30.0"
packages/core2-64-poky-linux/ttyrun/ttyrun: PKGV changed from 2.29.0 [default] to 2.30.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun: PV changed from "2.29.0" to "2.30.0"

--===============2367939308098175172==--

