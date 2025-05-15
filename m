Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22460C5479B
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:12 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.11031.1747312308582241436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=t5afmzGU;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RLVRWPk0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010196d3ee3984-696d3f51-3780-42de-b188-59d7871f261a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312327;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QjA4YBYYmlbuzdDJ8cwrshjGZ5gBGp1moFSBSaL85Ws=;
	b=t5afmzGU6q0n4U4Z42MSSwHWNO6UnahAxPKtTS8v7wP9DCYxyCJ4+jn9sXklJuu/
	LOqK5Zo1sKoLNPce2evSgJaVRxf286hvCxtRE3kunKLEV64VVQzCyWnWKqR5NrUoBXZ
	J7iqxZInlh0mfWv06mn4Vf/KqWn88Xpwic2NRTAg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312327;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QjA4YBYYmlbuzdDJ8cwrshjGZ5gBGp1moFSBSaL85Ws=;
	b=RLVRWPk0zqpBJvPH7HYl0AKMV4xz7VAI4XznGBEBBBjKGbFpl+IIlhreV91lJ84C
	lft4K8rTCw8EIjMcf8UlmqJ8P1OJ/R7oVFBldlQP+0QyQmlZbmgrfiZJ6b1Xpou0rUY
	XEfVFLPgIS3Nfuv/YsqvSqBejq0S+DkWTADAxn3M=
Content-Type: multipart/mixed; boundary="===============1106039019170674938=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hiago.franco@toradex.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.395 SUCCEEDED
Message-ID: <01010196d3ee3984-696d3f51-3780-42de-b188-59d7871f261a-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:32:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216659

--===============1106039019170674938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwdata* to *0.395* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.394-0.395.patch
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
From 530f5fb702ec3e934a162ee64724d36a91387391 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 12:11:58 +0000
Subject: [PATCH] hwdata: upgrade 0.394 -> 0.395

---
 .../recipes-support/hwdata/{hwdata_0.394.bb => hwdata_0.395.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.394.bb => hwdata_0.395.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.394.bb b/meta/recipes-support/hwdata/hwdata_0.395.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.394.bb
rename to meta/recipes-support/hwdata/hwdata_0.395.bb
index 54edcecc2c..73b846b181 100644
--- a/meta/recipes-support/hwdata/hwdata_0.394.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.395.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "fa1ccf4e4944bdb4110025c5c40e4fee8c8de29b"
+SRCREV = "95c1de6c4a0d40415867b29c0791480fb8ad3cdb"
 
 S = "${WORKDIR}/git"
 
-- 
2.47.1


--===============1106039019170674938==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.394-0.395.patch"

RnJvbSA1MzBmNWZiNzAyZWMzZTkzNGExNjJlZTY0NzI0ZDM2YTkxMzg3MzkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMTI6MTE6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
d2RhdGE6IHVwZ3JhZGUgMC4zOTQgLT4gMC4zOTUKCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC9o
d2RhdGEve2h3ZGF0YV8wLjM5NC5iYiA9PiBod2RhdGFfMC4zOTUuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvaHdkYXRhL3tod2RhdGFfMC4zOTQuYmIgPT4gaHdkYXRhXzAuMzk1LmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC4z
OTQuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuMzk1LmJiCnNpbWls
YXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9o
d2RhdGFfMC4zOTQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2Rh
dGFfMC4zOTUuYmIKaW5kZXggNTRlZGNlY2MyYy4uNzNiODQ2YjE4MSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjM5NC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuMzk1LmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb3ItbGF0ZXIgfCBYMTEiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT0xNTU2NTQ3NzExZTgyNDY5OTJiOTk5ZWRkOTQ0NWE1NyIKIAogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL3ZjcmhvbmVrLyR7QlBOfS5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90
b2NvbD1odHRwczt0YWc9diR7UFZ9IgotU1JDUkVWID0gImZhMWNjZjRlNDk0NGJkYjQxMTAwMjVj
NWM0MGU0ZmVlOGM4ZGUyOWIiCitTUkNSRVYgPSAiOTVjMWRlNmM0YTBkNDA0MTU4NjdiMjljMDc5
MTQ4MGZiOGFkM2NkYiIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40Ny4xCgo=

--===============1106039019170674938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.394" to "0.395"
packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.394 [default] to 0.395 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.394" to "0.395"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.394 [default] to 0.395 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.394" to "0.395"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.394 [default] to 0.395 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.394" to "0.395"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.394 [default] to 0.395 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.394" to "0.395"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.394 [default] to 0.395 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.394" to "0.395"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.394 [default] to 0.395 [default]
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.394" to "0.395"
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 9895745 to 9924813 (+0%)
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.394 [default] to 0.395 [default]
packages/all-poky-linux/hwdata: PV changed from "0.394" to "0.395"
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.394" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.395"
packages/all-poky-linux/hwdata: PKGV changed from 0.394 [default] to 0.395 [default]

--===============1106039019170674938==--

