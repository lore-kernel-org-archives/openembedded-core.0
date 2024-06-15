Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4827BC2BC81
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 18:23:24 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.18394.1718475800881715733
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 11:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=O5oZtFHe;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=fJmxzwE7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101901d23bee0-7e972617-5d3b-42b3-8787-4b9b5c525c3c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6g+ZRrFGpxdRF19z9JIYvbOpZj+UNNmfGC0cKj5ayFc=;
	b=O5oZtFHeGoRY3OZ2ZMugLGpFZ8GvxbrjkL+zRztnS79LIWFTuPvPZtprZQ0S5Cit
	HFDlR8qDpbzYlQWiLtBydm7RTf1IS2hZhMQkmVPn0v9confLmOkSyFFo3ZESmuLPhXE
	/ZcP0zIW1WcSgLB/LTr1p4nMnT+V0oCHF76hj+5A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1718475800;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6g+ZRrFGpxdRF19z9JIYvbOpZj+UNNmfGC0cKj5ayFc=;
	b=fJmxzwE72fs7W/EEmpnHpYeGtIjpB7i2lHbR9oSp8nLAa72VYOF0zql6VcsWEcKG
	Z6BxSvb9yeAjHj395XwmZ+3qaJeQKgf2GM8SxYC/Zrt4jROfcmtFT3OwYZQmi0npDqz
	KKydMhFORUHaBRVZbIZI6exzxJe5unBmEdIgyFyU=
Content-Type: multipart/mixed; boundary="===============4275343253416840059=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwlatdetect: upgrading to 2.7 SUCCEEDED
Message-ID: <010101901d23bee0-7e972617-5d3b-42b3-8787-4b9b5c525c3c-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jun 2024 18:23:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.06.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 18:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200756

--===============4275343253416840059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *hwlatdetect* to *2.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwlatdetect-upgrade-2.6-2.7.patch
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
From 60f8a913c8702dc077bf479e3d284bec51998b68 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jun 2024 16:04:50 +0000
Subject: [PATCH] hwlatdetect: upgrade 2.6 -> 2.7

---
 meta/recipes-rt/rt-tests/rt-tests.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 70315c4694..3fbdfa2038 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
-SRCREV = "217cd8518c5f7777d490892aa9c765a6b2782cb5"
-PV = "2.6"
+SRCREV = "5bd94923ffda2ab326d081926dbfc6775fb5050b"
+PV = "2.7"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main;protocol=https"
-- 
2.44.0


--===============4275343253416840059==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwlatdetect-upgrade-2.6-2.7.patch"

RnJvbSA2MGY4YTkxM2M4NzAyZGMwNzdiZjQ3OWUzZDI4NGJlYzUxOTk4YjY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVuIDIwMjQgMTY6MDQ6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
d2xhdGRldGVjdDogdXBncmFkZSAyLjYgLT4gMi43CgotLS0KIG1ldGEvcmVjaXBlcy1ydC9ydC10
ZXN0cy9ydC10ZXN0cy5pbmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXJ0L3J0LXRlc3Rz
L3J0LXRlc3RzLmluYyBiL21ldGEvcmVjaXBlcy1ydC9ydC10ZXN0cy9ydC10ZXN0cy5pbmMKaW5k
ZXggNzAzMTVjNDY5NC4uM2ZiZGZhMjAzOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXJ0L3J0
LXRlc3RzL3J0LXRlc3RzLmluYworKysgYi9tZXRhL3JlY2lwZXMtcnQvcnQtdGVzdHMvcnQtdGVz
dHMuaW5jCkBAIC0xLDUgKzEsNSBAQAotU1JDUkVWID0gIjIxN2NkODUxOGM1Zjc3NzdkNDkwODky
YWE5Yzc2NWE2YjI3ODJjYjUiCi1QViA9ICIyLjYiCitTUkNSRVYgPSAiNWJkOTQ5MjNmZmRhMmFi
MzI2ZDA4MTkyNmRiZmM2Nzc1ZmI1MDUwYiIKK1BWID0gIjIuNyIKIFBFID0gIjEiCiAKIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS91dGlscy9ydC10ZXN0cy9ydC10ZXN0
cy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMiCi0tIAoyLjQ0LjAKCg==

--===============4275343253416840059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-dbg: PV changed from "2.6" to "2.7"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-dbg: PKGV changed from 2.6 [default] to 2.7 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-dev: PV changed from "2.6" to "2.7"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-dev: PKGV changed from 2.6 [default] to 2.7 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-doc: PV changed from "2.6" to "2.7"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-doc: PKGV changed from 2.6 [default] to 2.7 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-locale: PV changed from "2.6" to "2.7"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-locale: PKGV changed from 2.6 [default] to 2.7 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-src: PV changed from "2.6" to "2.7"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-src: PKGV changed from 2.6 [default] to 2.7 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-staticdev: PV changed from "2.6" to "2.7"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect-staticdev: PKGV changed from 2.6 [default] to 2.7 [default]
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect: PV changed from "2.6" to "2.7"
packages/core2-64-poky-linux/hwlatdetect/hwlatdetect: PKGV changed from 2.6 [default] to 2.7 [default]
packages/core2-64-poky-linux/hwlatdetect: PV changed from "2.6" to "2.7"
packages/core2-64-poky-linux/hwlatdetect: PKGV changed from 2.6 [default] to 2.7 [default]

--===============4275343253416840059==--

