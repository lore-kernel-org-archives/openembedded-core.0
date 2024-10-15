Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4101D1D88F
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:01 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.11869.1728994557647032112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CEpoCF07;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=bRyHBCQj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010192901b3c92-41237be4-5675-4c86-a139-dbe9536e341c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994557;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WLCo2QNuZRYYtey2u8q/1yVo46kImTB4hyWZ1VFdxQQ=;
	b=CEpoCF07Bc89XhTZzdu9I/U1USUDyYtf8E2ZL/R2FDHGdk3ZTreVZtU3b69vUW5s
	jFj9R+zF3lqukeCiuOs7nOa2e+4d4dcAdtetLp71v1KtmBZhu7tSGupaU9OP3jqx5SZ
	MGELk7vj7Ojg2npRorvhYJ+0cO6w1gyFDjTNY1ng=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994557;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WLCo2QNuZRYYtey2u8q/1yVo46kImTB4hyWZ1VFdxQQ=;
	b=bRyHBCQjVSRGdalJ2aYlBEuBeyIfft9FbPh3vKM/rwLBuvAuaYPRALLJq/T+gRs1
	0see1uJqqMnN5uABF1S3luFdCk52uXKRdDzajcb1YpTPGJJW1tB1qBde2wYvnzJ7/Cp
	x+3viTscWnYA3fQbiFlnULeURTGW9gFE3DE4yGx8=
Content-Type: multipart/mixed; boundary="===============1411490366113060111=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-poetry-core: upgrading to 1.9.1 SUCCEEDED
Message-ID: <01010192901b3c92-41237be4-5675-4c86-a139-dbe9536e341c-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205847

--===============1411490366113060111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-poetry-core* to *1.9.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-poetry-core-upgrade-1.9.0-1.9.1.patch
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
From 0c9c0cabb78560eba3b3dbdb6f85e116debc9d6f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 08:42:33 +0000
Subject: [PATCH] python3-poetry-core: upgrade 1.9.0 -> 1.9.1

---
 ...ython3-poetry-core_1.9.0.bb => python3-poetry-core_1.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_1.9.0.bb => python3-poetry-core_1.9.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb b/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
rename to meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb
index a073f8b069..173c3bdb68 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "fa7a4001eae8aa572ee84f35feb510b321bd652e5cf9293249d62853e1f935a2"
+SRC_URI[sha256sum] = "7a2d49214bf58b4f17f99d6891d947a9836c9899a67a5069f52d7b67217f61b8"
 
 inherit python_poetry_core pypi
 
-- 
2.44.1


--===============1411490366113060111==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-poetry-core-upgrade-1.9.0-1.9.1.patch"

RnJvbSAwYzljMGNhYmI3ODU2MGViYTNiM2RiZGI2Zjg1ZTExNmRlYmM5ZDZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDg6NDI6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBvZXRyeS1jb3JlOiB1cGdyYWRlIDEuOS4wIC0+IDEuOS4xCgotLS0KIC4uLnl0aG9u
My1wb2V0cnktY29yZV8xLjkuMC5iYiA9PiBweXRob24zLXBvZXRyeS1jb3JlXzEuOS4xLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcG9ldHJ5LWNvcmVfMS45
LjAuYmIgPT4gcHl0aG9uMy1wb2V0cnktY29yZV8xLjkuMS5iYn0gKDk0JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMS45LjAu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMS45
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzEuOS4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMS45LjEuYmIKaW5kZXgg
YTA3M2Y4YjA2OS4uMTczYzNiZGI2OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzEuOS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8xLjkuMS5iYgpAQCAtMTUsNyArMTUs
NyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gIlwKICAgICBmaWxlOi8vc3JjL3BvZXRyeS9jb3JlL192
ZW5kb3IvdG9tbGkvTElDRU5TRTttZDU9YWFhYWYwODc5ZDE3ZGYwMTEwZDFhYThjOGM5ZjQ2ZjUg
XAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmE3YTQwMDFlYWU4YWE1NzJlZTg0ZjM1ZmVi
NTEwYjMyMWJkNjUyZTVjZjkyOTMyNDlkNjI4NTNlMWY5MzVhMiIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI3YTJkNDkyMTRiZjU4YjRmMTdmOTlkNjg5MWQ5NDdhOTgzNmM5ODk5YTY3YTUwNjlmNTJk
N2I2NzIxN2Y2MWI4IgogCiBpbmhlcml0IHB5dGhvbl9wb2V0cnlfY29yZSBweXBpCiAKLS0gCjIu
NDQuMQoK

--===============1411490366113060111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.12/site-packages/poetry_core-1.9.0.dist-info moved to /usr/lib/python3.12/site-packages/poetry_core-1.9.1.dist-info
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.12/site-packages/poetry_core-1.9.0.dist-info moved to /usr/lib/python3.12/site-packages/poetry_core-1.9.1.dist-info

--===============1411490366113060111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-poetry-core: PV changed from "1.9.0" to "1.9.1"
packages/core2-64-poky-linux/python3-poetry-core: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/core2-64-poky-linux/python3-poetry-core: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-1.9.0.tar.gz;downloadfilename=poetry_core-1.9.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-1.9.1.tar.gz;downloadfilename=poetry_core-1.9.1.tar.gz"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PV changed from "1.9.0" to "1.9.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-dev: PV changed from "1.9.0" to "1.9.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-dev: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-doc: PV changed from "1.9.0" to "1.9.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-doc: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-locale: PV changed from "1.9.0" to "1.9.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-locale: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-src: PV changed from "1.9.0" to "1.9.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-src: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PV changed from "1.9.0" to "1.9.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core: PV changed from "1.9.0" to "1.9.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core: PKGSIZE changed from 2268455 to 2268550 (+0%)
Changes to packages/core2-64-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.12/site-packages/poetry_core-1.9.0.dist-info moved to /usr/lib/python3.12/site-packages/poetry_core-1.9.1.dist-info
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.12/site-packages/poetry_core-1.9.0.dist-info moved to /usr/lib/python3.12/site-packages/poetry_core-1.9.1.dist-info

--===============1411490366113060111==--

