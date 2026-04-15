Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D16F428E3
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:52 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19746.1776261886253508270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mGl6jQfH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tjeTbb1p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019d9175764c-ce475fa0-1e15-40ff-a0ff-caca72e8ebc2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261887;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=660W6hhx5axxhrzyc29j0J8xSGsK455se8vO2mVz4Ew=;
	b=mGl6jQfHD5ahjdYCZDvDuN8dWWOmHh8Na9gKa7o9bQ0SG/ZtVjpPbXmMtwTotP5+
	Xum9aOhfP9v7qoyV5TV1nj3YSrNBTFnGqghVmdTbOgxVic+xlUQh366YmMPUzKZ9RR8
	W1jJpZ3QwsI+mjex/QMSiQ1Hco8/tht/vTcaeGFk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261887;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=660W6hhx5axxhrzyc29j0J8xSGsK455se8vO2mVz4Ew=;
	b=tjeTbb1p1iE3cUxfdntd6SBKeevwwmVBKBFpjPEgaeMsFO0isqgmjWhBrXLHHn1g
	rMQYr09FCtmrndQAcjLPAPTlrBdYFk+0z3Pv2RYmpnk5Cr7CfQz14dWMrcHvt0oefdX
	g6bnhsz59N6anZk03jJ+HTC3fpGwwkqAPh4hbySs=
Content-Type: multipart/mixed; boundary="===============2316038555276234237=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lzip: upgrading to 1.26 SUCCEEDED
Message-ID: <0101019d9175764c-ce475fa0-1e15-40ff-a0ff-caca72e8ebc2-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235266

--===============2316038555276234237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lzip* to *1.26* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lzip-upgrade-1.25-1.26.patch
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
From c71f8663821b4035e936a7564e16048e53b931c1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 10:09:56 +0000
Subject: [PATCH] lzip: upgrade 1.25 -> 1.26

---
 meta/recipes-extended/lzip/{lzip_1.25.bb => lzip_1.26.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lzip/{lzip_1.25.bb => lzip_1.26.bb} (93%)

diff --git a/meta/recipes-extended/lzip/lzip_1.25.bb b/meta/recipes-extended/lzip/lzip_1.26.bb
similarity index 93%
rename from meta/recipes-extended/lzip/lzip_1.25.bb
rename to meta/recipes-extended/lzip/lzip_1.26.bb
index 590e35cb75..c087d2ee2e 100644
--- a/meta/recipes-extended/lzip/lzip_1.25.bb
+++ b/meta/recipes-extended/lzip/lzip_1.26.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cca7f74ec83b7a9ce7ccd195aad471bd \
                     "
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
-SRC_URI[sha256sum] = "09418a6d8fb83f5113f5bd856e09703df5d37bae0308c668d0f346e3d3f0a56f"
+SRC_URI[sha256sum] = "641cf30961525cbe3b340cc883436c8854e9f5032f459f444de4782b621e6572"
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
-- 
2.47.1


--===============2316038555276234237==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-lzip-upgrade-1.25-1.26.patch"

RnJvbSBjNzFmODY2MzgyMWI0MDM1ZTkzNmE3NTY0ZTE2MDQ4ZTUzYjkzMWMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTA6MDk6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
emlwOiB1cGdyYWRlIDEuMjUgLT4gMS4yNgoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHpp
cC97bHppcF8xLjI1LmJiID0+IGx6aXBfMS4yNi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvbHppcC97bHppcF8xLjI1LmJiID0+IGx6aXBfMS4yNi5iYn0gKDkzJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbHppcC9semlwXzEuMjUuYmIgYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvbHppcC9semlwXzEuMjYuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x6aXAvbHppcF8xLjI1LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbHppcC9semlwXzEuMjYuYmIKaW5kZXggNTkwZTM1Y2I3NS4uYzA4
N2QyZWUyZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x6aXAvbHppcF8xLjI1
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9semlwL2x6aXBfMS4yNi5iYgpAQCAtOCw3
ICs4LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9Y2NhN2Y3NGVj
ODNiN2E5Y2U3Y2NkMTk1YWFkNDcxYmQgXAogICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19V
UkkgPSAiJHtTQVZBTk5BSF9HTlVfTUlSUk9SfS9semlwL2x6aXAtJHtQVn0udGFyLmd6IgotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjA5NDE4YTZkOGZiODNmNTExM2Y1YmQ4NTZlMDk3MDNkZjVkMzdi
YWUwMzA4YzY2OGQwZjM0NmUzZDNmMGE1NmYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjQxY2Yz
MDk2MTUyNWNiZTNiMzQwY2M4ODM0MzZjODg1NGU5ZjUwMzJmNDU5ZjQ0NGRlNDc4MmI2MjFlNjU3
MiIKIAogQiA9ICIke1dPUktESVJ9L2J1aWxkIgogZG9fY29uZmlndXJlW2NsZWFuZGlyc10gPSAi
JHtCfSIKLS0gCjIuNDcuMQoK

--===============2316038555276234237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/lzip: SRC_URI changed from "https://download.savannah.gnu.org/releases/lzip/lzip-1.25.tar.gz" to "https://download.savannah.gnu.org/releases/lzip/lzip-1.26.tar.gz"
packages/x86-64-v3-poky-linux/lzip: PV changed from "1.25" to "1.26"
packages/x86-64-v3-poky-linux/lzip: PKGV changed from 1.25 [default] to 1.26 [default]
packages/x86-64-v3-poky-linux/lzip/lzip-dbg: PKGSIZE changed from 1057960 to 1062624 (+0%)
packages/x86-64-v3-poky-linux/lzip/lzip-dbg: PV changed from "1.25" to "1.26"
packages/x86-64-v3-poky-linux/lzip/lzip-dbg: PKGV changed from 1.25 [default] to 1.26 [default]
packages/x86-64-v3-poky-linux/lzip/lzip-dev: PV changed from "1.25" to "1.26"
packages/x86-64-v3-poky-linux/lzip/lzip-dev: PKGV changed from 1.25 [default] to 1.26 [default]
packages/x86-64-v3-poky-linux/lzip/lzip-doc: PKGSIZE changed from 74842 to 79052 (+6%)
packages/x86-64-v3-poky-linux/lzip/lzip-doc: PV changed from "1.25" to "1.26"
packages/x86-64-v3-poky-linux/lzip/lzip-doc: PKGV changed from 1.25 [default] to 1.26 [default]
packages/x86-64-v3-poky-linux/lzip/lzip-locale: PV changed from "1.25" to "1.26"
packages/x86-64-v3-poky-linux/lzip/lzip-locale: PKGV changed from 1.25 [default] to 1.26 [default]
packages/x86-64-v3-poky-linux/lzip/lzip-src: PKGSIZE changed from 153625 to 157671 (+3%)
packages/x86-64-v3-poky-linux/lzip/lzip-src: PV changed from "1.25" to "1.26"
packages/x86-64-v3-poky-linux/lzip/lzip-src: FILELIST: directory renamed /usr/src/debug/lzip/1.25 -> /usr/src/debug/lzip/1.26
packages/x86-64-v3-poky-linux/lzip/lzip-src: PKGV changed from 1.25 [default] to 1.26 [default]
packages/x86-64-v3-poky-linux/lzip/lzip-staticdev: PV changed from "1.25" to "1.26"
packages/x86-64-v3-poky-linux/lzip/lzip-staticdev: PKGV changed from 1.25 [default] to 1.26 [default]
packages/x86-64-v3-poky-linux/lzip/lzip: PKGSIZE changed from 134088 to 134112 (+0%)
packages/x86-64-v3-poky-linux/lzip/lzip: PV changed from "1.25" to "1.26"
packages/x86-64-v3-poky-linux/lzip/lzip: PKGV changed from 1.25 [default] to 1.26 [default]

--===============2316038555276234237==--

