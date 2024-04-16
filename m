Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47059C25B7B
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:09 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.13583.1713248037832778467
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bJJ3dfKm;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=DU2HGPC7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018ee58a68a0-9e2c050a-a5c6-49d9-93a7-fc050b520c58-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248037;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Wof8O6F6zdhAAwUo43NQGgu243IhYzbTapUGIUDIfSM=;
	b=bJJ3dfKmt844Z/Gex4o27DD6l+cxCzcZzQ5ueDxYMnjfUl/t81CNBUUdkFTR7s4Z
	z0OWvZPuvb1w81s9rA7RXJK+GBJJn07zvhiCupnEaJrATWj7Q0Rankf4HpM4P9lA6Ly
	flJg239iwqsE49YbXelNBBsx1LvXH8HUNMp5DNOM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248037;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Wof8O6F6zdhAAwUo43NQGgu243IhYzbTapUGIUDIfSM=;
	b=DU2HGPC7oUVInzNX8jBKDQW6AmF8qtroDtzkLFJtYxQoWESckj4AW4JkSmEbYsrX
	Yt4cUsfC5dFK168cwfeeRGFLloxsGoodbtkpS/s0hAkwghuDvgAIl9gQPCyAy9ETbv4
	Xk9ylTCt3tV85QlK0OrZmHbpDQa+mlTSKj6tFzto=
Content-Type: multipart/mixed; boundary="===============6463062189009338630=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ttyrun: upgrading to 2.32.0 SUCCEEDED
Message-ID: <0101018ee58a68a0-9e2c050a-a5c6-49d9-93a7-fc050b520c58-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:57 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198260

--===============6463062189009338630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ttyrun* to *2.32.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ttyrun-upgrade-2.31.0-2.32.0.patch
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
From bd98ec037d6a2445cf7d50caefa28e21710c5715 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 18:08:24 +0000
Subject: [PATCH] ttyrun: upgrade 2.31.0 -> 2.32.0

---
 meta/recipes-core/ttyrun/{ttyrun_2.31.0.bb => ttyrun_2.32.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.31.0.bb => ttyrun_2.32.0.bb} (93%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.31.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.32.0.bb
similarity index 93%
rename from meta/recipes-core/ttyrun/ttyrun_2.31.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.32.0.bb
index 122dd9d8e7..9a8be15dab 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.31.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.32.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
-SRCREV = "6f15ed326491a17d83ca60cd2bda47fb5e8a0175"
+SRCREV = "9eea78b3ad8ab3710fb3b2d80b9cd058d7c8aba7"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


--===============6463062189009338630==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ttyrun-upgrade-2.31.0-2.32.0.patch"

RnJvbSBiZDk4ZWMwMzdkNmEyNDQ1Y2Y3ZDUwY2FlZmEyOGUyMTcxMGM1NzE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTg6MDg6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
dHlydW46IHVwZ3JhZGUgMi4zMS4wIC0+IDIuMzIuMAoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS90
dHlydW4ve3R0eXJ1bl8yLjMxLjAuYmIgPT4gdHR5cnVuXzIuMzIuMC5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29yZS90dHlydW4ve3R0eXJ1bl8yLjMxLjAuYmIgPT4gdHR5cnVuXzIuMzIuMC5iYn0g
KDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMzEu
MC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi4zMi4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5f
Mi4zMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMzIu
MC5iYgppbmRleCAxMjJkZDlkOGU3Li45YThiZTE1ZGFiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMzEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS90
dHlydW4vdHR5cnVuXzIuMzIuMC5iYgpAQCAtNyw3ICs3LDcgQEAgTElDRU5TRSA9ICJNSVQiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mNTExOGYxNjdiMDU1YmZkN2Mz
NDUwODAzZjE4NDdhZiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2libS1zMzkwLWxp
bnV4L3MzOTAtdG9vbHM7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciIKLVNSQ1JFViA9ICI2
ZjE1ZWQzMjY0OTFhMTdkODNjYTYwY2QyYmRhNDdmYjVlOGEwMTc1IgorU1JDUkVWID0gIjllZWE3
OGIzYWQ4YWIzNzEwZmIzYjJkODBiOWNkMDU4ZDdjOGFiYTciCiAKIFMgPSAiJHtXT1JLRElSfS9n
aXQiCiAKLS0gCjIuNDIuMAoK

--===============6463062189009338630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ttyrun: PV changed from "2.31.0" to "2.32.0"
packages/core2-64-poky-linux/ttyrun: PKGV changed from 2.31.0 [default] to 2.32.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-dbg: PV changed from "2.31.0" to "2.32.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-dbg: PKGV changed from 2.31.0 [default] to 2.32.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-dev: PV changed from "2.31.0" to "2.32.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-dev: PKGV changed from 2.31.0 [default] to 2.32.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-doc: PV changed from "2.31.0" to "2.32.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-doc: PKGV changed from 2.31.0 [default] to 2.32.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-locale: PV changed from "2.31.0" to "2.32.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-locale: PKGV changed from 2.31.0 [default] to 2.32.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-src: PV changed from "2.31.0" to "2.32.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-src: PKGV changed from 2.31.0 [default] to 2.32.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-staticdev: PV changed from "2.31.0" to "2.32.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-staticdev: PKGV changed from 2.31.0 [default] to 2.32.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun: PV changed from "2.31.0" to "2.32.0"
packages/core2-64-poky-linux/ttyrun/ttyrun: PKGV changed from 2.31.0 [default] to 2.32.0 [default]

--===============6463062189009338630==--

