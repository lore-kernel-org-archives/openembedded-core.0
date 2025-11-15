Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E24ECEB2F7
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:40 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12111.1763224713655876063
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=wyy5gQfG;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=MeBwdsUk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019a886205c6-7c422d8b-5832-4e96-89a9-212badb9ab2d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/616DICSHU5L5jrDqEj1YiU5Tba0+gG3bJ0Qt3rm6Qw=;
	b=wyy5gQfGkSvDQcF+2sB9et0CAaqF0snhfBUo7SchlyO4ktEPO4uXP2Vau4RXnFD0
	mEXDRHo5DoaZ/nsvk7bBOFVmoNNJdk335TlffS7yrKzsk2gf584GKMOw4kS4TBbmUwv
	YxN5tTo08MjnbHZxPi/upt/UZzLKdoMCQm37Ye8A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/616DICSHU5L5jrDqEj1YiU5Tba0+gG3bJ0Qt3rm6Qw=;
	b=MeBwdsUkpFAm0lmtH7pc6iAODh48NUjamg9vDvN/xWlDtEZTyVsz9rcIffR13jk1
	zY4pqVWnFyfUe6RIaViu2QWLHW2JqjcjaIZnzmcF2P7TAI99JhOiQh5WZZRlkBHblDM
	7fYtqlnbqQi/sRgXKwxLXCDi30akgUNcEnf3YnlM=
Content-Type: multipart/mixed; boundary="===============0350678863360210189=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ttyrun: upgrading to 2.39.0 SUCCEEDED
Message-ID: <0101019a886205c6-7c422d8b-5832-4e96-89a9-212badb9ab2d-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226326

--===============0350678863360210189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ttyrun* to *2.39.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ttyrun-upgrade-2.38.0-2.39.0.patch
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
From 9abeb5b7f5005ae7655e945275973466c2c91525 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 08:40:35 +0000
Subject: [PATCH] ttyrun: upgrade 2.38.0 -> 2.39.0

---
 meta/recipes-core/ttyrun/{ttyrun_2.38.0.bb => ttyrun_2.39.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.38.0.bb => ttyrun_2.39.0.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.38.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.39.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.38.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.39.0.bb
index 90380e51ea..c7ca8f3ec3 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.38.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.39.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "660bab6e68fded26b2117e1dcec0844549a22fed"
+SRCREV = "940ce6790021816f280fab66f443e4721d527833"
 
 CVE_PRODUCT = "s390-tools"
 
-- 
2.47.1


--===============0350678863360210189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/ttyrun: PV changed from "2.38.0" to "2.39.0"
packages/x86-64-v3-poky-linux/ttyrun: SRC_URI changed from "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v2.38.0" to "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v2.39.0"
packages/x86-64-v3-poky-linux/ttyrun: PKGV changed from 2.38.0 [default] to 2.39.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dbg: PV changed from "2.38.0" to "2.39.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dbg: PKGV changed from 2.38.0 [default] to 2.39.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dev: PV changed from "2.38.0" to "2.39.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-dev: PKGV changed from 2.38.0 [default] to 2.39.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-doc: PV changed from "2.38.0" to "2.39.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-doc: PKGV changed from 2.38.0 [default] to 2.39.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-locale: PV changed from "2.38.0" to "2.39.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-locale: PKGV changed from 2.38.0 [default] to 2.39.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: PV changed from "2.38.0" to "2.39.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-src: PKGV changed from 2.38.0 [default] to 2.39.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-staticdev: PV changed from "2.38.0" to "2.39.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun-staticdev: PKGV changed from 2.38.0 [default] to 2.39.0 [default]
packages/x86-64-v3-poky-linux/ttyrun/ttyrun: PV changed from "2.38.0" to "2.39.0"
packages/x86-64-v3-poky-linux/ttyrun/ttyrun: PKGV changed from 2.38.0 [default] to 2.39.0 [default]

--===============0350678863360210189==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ttyrun-upgrade-2.38.0-2.39.0.patch"

RnJvbSA5YWJlYjViN2Y1MDA1YWU3NjU1ZTk0NTI3NTk3MzQ2NmMyYzkxNTI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDg6NDA6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
dHlydW46IHVwZ3JhZGUgMi4zOC4wIC0+IDIuMzkuMAoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS90
dHlydW4ve3R0eXJ1bl8yLjM4LjAuYmIgPT4gdHR5cnVuXzIuMzkuMC5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29yZS90dHlydW4ve3R0eXJ1bl8yLjM4LjAuYmIgPT4gdHR5cnVuXzIuMzkuMC5iYn0g
KDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMzgu
MC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5fMi4zOS4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3R0eXJ1bi90dHlydW5f
Mi4zOC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMzku
MC5iYgppbmRleCA5MDM4MGU1MWVhLi5jN2NhOGYzZWMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS90dHlydW4vdHR5cnVuXzIuMzguMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS90
dHlydW4vdHR5cnVuXzIuMzkuMC5iYgpAQCAtNyw3ICs3LDcgQEAgTElDRU5TRSA9ICJNSVQiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mNTExOGYxNjdiMDU1YmZkN2Mz
NDUwODAzZjE4NDdhZiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2libS1zMzkwLWxp
bnV4L3MzOTAtdG9vbHM7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3Rlcjt0YWc9diR7UFZ9Igot
U1JDUkVWID0gIjY2MGJhYjZlNjhmZGVkMjZiMjExN2UxZGNlYzA4NDQ1NDlhMjJmZWQiCitTUkNS
RVYgPSAiOTQwY2U2NzkwMDIxODE2ZjI4MGZhYjY2ZjQ0M2U0NzIxZDUyNzgzMyIKIAogQ1ZFX1BS
T0RVQ1QgPSAiczM5MC10b29scyIKIAotLSAKMi40Ny4xCgo=

--===============0350678863360210189==--

