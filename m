Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E38C5B564
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:16 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.14616.1700059029454168216
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OC19jn8c;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oi1LZi+F;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018bd36a2db8-c8c8975c-9f87-4591-aa7b-43a1c14744fb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ISK/V0a2HfDOjQmDamvQ1+aepSU3O+EG+PtEIte4bfQ=;
	b=OC19jn8cB4zKF4qD94l9WVy3HsxeyGPBwZukW2osRS8vqn/sQTzEXPTkLh/j5c0j
	MleRWLh5UhrJ1UDe94RJhIuS69im8AbTrYEx6yGUETnVYOXRCFWxl9b7q/9+S+jmOxh
	zJY8iRyRt8wyPAP1K4e62mPXx57LgVOvGQlwOkHE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ISK/V0a2HfDOjQmDamvQ1+aepSU3O+EG+PtEIte4bfQ=;
	b=oi1LZi+Fm+3Zz0TnRxkJROLEiV5c0/zQyliexp2V24MjiKmeh4Oi7sXDI7j67Pvu
	MXTF9S921ZDLSIdnM1U5hoj4hnR2+rLgUfBdGrTTlU/IOx2OaNBPhvqy/f1DQOgk7Yx
	2o6Gk7MkuLWmyUzLhFZs3mWSp9jfu/NekLLF/q4M=
Content-Type: multipart/mixed; boundary="===============2030102526023064261=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwlatdetect: upgrading to 2.6 SUCCEEDED
Message-ID: <0101018bd36a2db8-c8c8975c-9f87-4591-aa7b-43a1c14744fb-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190708

--===============2030102526023064261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *hwlatdetect* to *2.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwlatdetect-upgrade-2.5-2.6.patch
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
From 5deae0e77bb8c5579e28cfdac43687dc2d35a310 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 13:40:29 +0000
Subject: [PATCH] hwlatdetect: upgrade 2.5 -> 2.6

---
 meta/recipes-rt/rt-tests/rt-tests.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 527e14ad54..70315c4694 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
-SRCREV = "4579b9a6d85ae528f76e92421eb5e7b33cd26b17"
-PV = "2.5"
+SRCREV = "217cd8518c5f7777d490892aa9c765a6b2782cb5"
+PV = "2.6"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main;protocol=https"
-- 
2.39.2


--===============2030102526023064261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-dbg: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-dbg: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-dev: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-dev: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-doc: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-doc: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-locale: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-locale: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-src: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-src: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-staticdev: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-staticdev: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect: PKGSIZE changed from 17162 to 17229 (+0%)
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect: PV changed from "2.5" to "2.6"
packages/core2-64-poky-linux/hwlatdetect: PKGV changed from 2.5 [default] to 2.6 [default]
packages/core2-64-poky-linux/hwlatdetect: PV changed from "2.5" to "2.6"

--===============2030102526023064261==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwlatdetect-upgrade-2.5-2.6.patch"

RnJvbSA1ZGVhZTBlNzdiYjhjNTU3OWUyOGNmZGFjNDM2ODdkYzJkMzVhMzEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMTM6NDA6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
d2xhdGRldGVjdDogdXBncmFkZSAyLjUgLT4gMi42CgotLS0KIG1ldGEvcmVjaXBlcy1ydC9ydC10
ZXN0cy9ydC10ZXN0cy5pbmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXJ0L3J0LXRlc3Rz
L3J0LXRlc3RzLmluYyBiL21ldGEvcmVjaXBlcy1ydC9ydC10ZXN0cy9ydC10ZXN0cy5pbmMKaW5k
ZXggNTI3ZTE0YWQ1NC4uNzAzMTVjNDY5NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXJ0L3J0
LXRlc3RzL3J0LXRlc3RzLmluYworKysgYi9tZXRhL3JlY2lwZXMtcnQvcnQtdGVzdHMvcnQtdGVz
dHMuaW5jCkBAIC0xLDUgKzEsNSBAQAotU1JDUkVWID0gIjQ1NzliOWE2ZDg1YWU1MjhmNzZlOTI0
MjFlYjVlN2IzM2NkMjZiMTciCi1QViA9ICIyLjUiCitTUkNSRVYgPSAiMjE3Y2Q4NTE4YzVmNzc3
N2Q0OTA4OTJhYTljNzY1YTZiMjc4MmNiNSIKK1BWID0gIjIuNiIKIFBFID0gIjEiCiAKIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS91dGlscy9ydC10ZXN0cy9ydC10ZXN0
cy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMiCi0tIAoyLjM5LjIKCg==

--===============2030102526023064261==--

