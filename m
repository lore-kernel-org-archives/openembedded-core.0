Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD03C2BA15
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:31 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.18367.1718475799068210470
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=S+xDkVdD;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=lTi4B+CR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101901d23b731-5d8117ca-4df5-41c2-ac63-da15686fd13f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475798;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Je8zjQljhQ4fmwD7kRmXgEHJOZnYcGvUMPIook4Eqys=;
	b=S+xDkVdDJQi57s1Tw000iUYSP1jw0IoUHMMEPs+DyV1P++inbOKh+ehG3C23JVJO
	bs0vTfPl+/YFFGxX+pk7Ol+O+NNh5n2SuxzmOK2PPt13uP1tqGrSrZv7KftbEjX3zSN
	e7gqq13l8+zkKLZnXZxIrK75lZ08DnBAEbmdsUT0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475798;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Je8zjQljhQ4fmwD7kRmXgEHJOZnYcGvUMPIook4Eqys=;
	b=lTi4B+CRf/RZr6N4TgTAwRLQaxQbh0KV+RdUg6XF1qb7rallyPtj56YkD7jWJ+Iz
	o021zsKCxo5edkwNc75gsY6VtbJ2lbi/k1cR4IJqG1HjGqnKwgQmPr06bfy4qJ2bex5
	bz3bUpwTxEO8NPTx2HPBzHlmxVkcmO3ROFPP+2eA=
Content-Type: multipart/mixed; boundary="===============3640948204226407990=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ttyrun: upgrading to 2.33.1 SUCCEEDED
Message-ID: <010101901d23b731-5d8117ca-4df5-41c2-ac63-da15686fd13f-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200680

--===============3640948204226407990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ttyrun* to *2.33.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ttyrun-upgrade-2.32.0-2.33.1.patch
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
From 6fa2fa3e55f5c2f36bacf50a8a9ba68eab863cad Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 07:08:42 +0000
Subject: [PATCH] ttyrun: upgrade 2.32.0 -> 2.33.1

---
 meta/recipes-core/ttyrun/{ttyrun_2.32.0.bb => ttyrun_2.33.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.32.0.bb => ttyrun_2.33.1.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.32.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.33.1.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.32.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.33.1.bb
index 815f625a67..ccb7f9b268 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.32.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.33.1.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
-SRCREV = "9eea78b3ad8ab3710fb3b2d80b9cd058d7c8aba7"
+SRCREV = "686262fdcdaed7903ca1720d7dd0b1f9f5621d7b"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.44.0


--===============3640948204226407990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ttyrun: PKGV changed from 2.32.0 [default] to 2.33.1 [default]
packages/core2-64-poky-linux/ttyrun: PV changed from "2.32.0" to "2.33.1"
packages/core2-64-poky-linux/ttyrun/ttyrun-dbg: PKGV changed from 2.32.0 [default] to 2.33.1 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-dbg: PV changed from "2.32.0" to "2.33.1"
packages/core2-64-poky-linux/ttyrun/ttyrun-dev: PKGV changed from 2.32.0 [default] to 2.33.1 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-dev: PV changed from "2.32.0" to "2.33.1"
packages/core2-64-poky-linux/ttyrun/ttyrun-doc: PKGV changed from 2.32.0 [default] to 2.33.1 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-doc: PV changed from "2.32.0" to "2.33.1"
packages/core2-64-poky-linux/ttyrun/ttyrun-locale: PKGV changed from 2.32.0 [default] to 2.33.1 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-locale: PV changed from "2.32.0" to "2.33.1"
packages/core2-64-poky-linux/ttyrun/ttyrun-src: PKGV changed from 2.32.0 [default] to 2.33.1 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-src: PV changed from "2.32.0" to "2.33.1"
packages/core2-64-poky-linux/ttyrun/ttyrun-staticdev: PKGV changed from 2.32.0 [default] to 2.33.1 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-staticdev: PV changed from "2.32.0" to "2.33.1"
packages/core2-64-poky-linux/ttyrun/ttyrun: PKGV changed from 2.32.0 [default] to 2.33.1 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun: PV changed from "2.32.0" to "2.33.1"

--===============3640948204226407990==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ttyrun-upgrade-2.32.0-2.33.1.patch"

RnJvbSA2ZmEyZmEzZTU1ZjVjMmYzNmJhY2Y1MGE4YTliYTY4ZWFiODYzY2FkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMDc6MDg6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
dHlydW46IHVwZ3JhZGUgMi4zMi4wIC0+IDIuMzMuMQoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS90
dHlydW4ve3R0eXJ1bl8yLjMyLjAuYmIgPT4gdHR5cnVuXzIuMzMuMS5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29yZS90dHlydW4ve3R0eXJ1bl8yLjMyLjAuYmIgPT4gdHR5cnVuXzIuMzMuMS5iYn0g
KDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMzIu
MC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi4zMy4xLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5f
Mi4zMi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMzMu
MS5iYgppbmRleCA4MTVmNjI1YTY3Li5jY2I3ZjliMjY4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMzIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS90
dHlydW4vdHR5cnVuXzIuMzMuMS5iYgpAQCAtNyw3ICs3LDcgQEAgTElDRU5TRSA9ICJNSVQiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mNTExOGYxNjdiMDU1YmZkN2Mz
NDUwODAzZjE4NDdhZiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2libS1zMzkwLWxp
bnV4L3MzOTAtdG9vbHM7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciIKLVNSQ1JFViA9ICI5
ZWVhNzhiM2FkOGFiMzcxMGZiM2IyZDgwYjljZDA1OGQ3YzhhYmE3IgorU1JDUkVWID0gIjY4NjI2
MmZkY2RhZWQ3OTAzY2ExNzIwZDdkZDBiMWY5ZjU2MjFkN2IiCiAKIENWRV9QUk9EVUNUID0gInMz
OTAtdG9vbHMiCiAKLS0gCjIuNDQuMAoK

--===============3640948204226407990==--

