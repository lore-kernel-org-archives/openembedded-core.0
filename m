Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6266C54EF6
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:40 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.20318.1708018343323299541
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Nz+PRL9N;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=fPm+K1OT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018dadd39ed8-4c3fe648-1ef3-4a33-8dd7-8e6f6d1480a6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EQJw5ogxgpC/iz9HalOC/DZXnf1JJ/3pjPRSZx7j5+8=;
	b=Nz+PRL9NZ2g50qpjMgYQP+D4WJieXk1mMv/OuPL+J6jRCCVPoF+ACkpid5vDyUNt
	rD3dIxUb4wdxjiH9+8kmTathlWi8xJobeTlbaT50sltMj1nzNo2D4SQQwhmakqXwM8q
	OwLEBR66H+pyasgESp2OpDHzUc5EzUO+hW6yY4xI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EQJw5ogxgpC/iz9HalOC/DZXnf1JJ/3pjPRSZx7j5+8=;
	b=fPm+K1OTyb9Lk6gHr2wsuiTzFxcFYT7DdKXUUpVOz1K52i0Q0SieJRTTyZQ0rgLa
	R/yrw04XhojefBg41uHxcoWZvG5xBbXEwWKtzOmQzx3+LbCTjkYxEJQ1vtDn/9SHush
	ycPZ1c2db5eFWZuTd/dBsBfQzv7FfCfEc9CfACV4=
Content-Type: multipart/mixed; boundary="===============5336180263131893268=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ttyrun: upgrading to 2.31.0 SUCCEEDED
Message-ID: <0101018dadd39ed8-4c3fe648-1ef3-4a33-8dd7-8e6f6d1480a6-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195564

--===============5336180263131893268==
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
From d429dbcb2ebf56fc89b30dbaa1890e9e213ea25d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 06:34:46 +0000
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


--===============5336180263131893268==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ttyrun-upgrade-2.30.0-2.31.0.patch"

RnJvbSBkNDI5ZGJjYjJlYmY1NmZjODliMzBkYmFhMTg5MGU5ZTIxM2VhMjVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDY6MzQ6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
dHlydW46IHVwZ3JhZGUgMi4zMC4wIC0+IDIuMzEuMAoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS90
dHlydW4ve3R0eXJ1bl8yLjMwLjAuYmIgPT4gdHR5cnVuXzIuMzEuMC5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29yZS90dHlydW4ve3R0eXJ1bl8yLjMwLjAuYmIgPT4gdHR5cnVuXzIuMzEuMC5iYn0g
KDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMzAu
MC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi4zMS4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5f
Mi4zMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMzEu
MC5iYgppbmRleCA3M2M2YzU4YzlkLi4xMjJkZDlkOGU3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMzAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS90
dHlydW4vdHR5cnVuXzIuMzEuMC5iYgpAQCAtNyw3ICs3LDcgQEAgTElDRU5TRSA9ICJNSVQiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mNTExOGYxNjdiMDU1YmZkN2Mz
NDUwODAzZjE4NDdhZiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2libS1zMzkwLWxp
bnV4L3MzOTAtdG9vbHM7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciIKLVNSQ1JFViA9ICJj
MjE3ZjZiZTZhZGRkNGQwMDhmMTEwZWZhNTNmYmVjNzk2ODFkYmZkIgorU1JDUkVWID0gIjZmMTVl
ZDMyNjQ5MWExN2Q4M2NhNjBjZDJiZGE0N2ZiNWU4YTAxNzUiCiAKIFMgPSAiJHtXT1JLRElSfS9n
aXQiCiAKLS0gCjIuNDIuMAoK

--===============5336180263131893268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ttyrun: PV changed from "2.30.0" to "2.31.0"
packages/core2-64-poky-linux/ttyrun: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-dbg: PKGSIZE changed from 18256 to 18264 (+0%)
packages/core2-64-poky-linux/ttyrun/ttyrun-dbg: PV changed from "2.30.0" to "2.31.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-dbg: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-dev: PV changed from "2.30.0" to "2.31.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-dev: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-doc: PV changed from "2.30.0" to "2.31.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-doc: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-locale: PV changed from "2.30.0" to "2.31.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-locale: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-src: PV changed from "2.30.0" to "2.31.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-src: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun-staticdev: PV changed from "2.30.0" to "2.31.0"
packages/core2-64-poky-linux/ttyrun/ttyrun-staticdev: PKGV changed from 2.30.0 [default] to 2.31.0 [default]
packages/core2-64-poky-linux/ttyrun/ttyrun: PV changed from "2.30.0" to "2.31.0"
packages/core2-64-poky-linux/ttyrun/ttyrun: PKGV changed from 2.30.0 [default] to 2.31.0 [default]

--===============5336180263131893268==--

