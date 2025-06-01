Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D07B8C83013
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:56 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.27773.1748786127131277289
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=sG2dTu8j;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=MzUhssrf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101972bc70889-49f4431b-73cd-4843-85b7-a65652d5d106-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=x9BaSccTgzeMkG3c87f6j7Iqo55M2kGl9Q3jl1X60S8=;
	b=sG2dTu8jp2fzVAEapHfCUutMYfX5ktvXGe7vqsLpmyZ/cCzmeggFN/GuVwxQUt9a
	H8xHQFc9YerQch6MWpAnllTH1bnnH7Ofziv6JMSLOpuyisvAa+OSFu+NuX49q6+hAQ8
	YA6nIh2sgySx/NH5pgEKSiep7KC1srJalDuNf0uQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786153;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=x9BaSccTgzeMkG3c87f6j7Iqo55M2kGl9Q3jl1X60S8=;
	b=MzUhssrf+LQphQgtavZ4Scolas195hYyc9WwvA6gbqXAybjeLZIZlxYiM0UCxkN/
	5i73rP2V15P+T54UkWXmLuG2gfVLFNup24W85lTuYcd8fEfkL5xU6N3QwFSSBke3Jda
	ic9hy57/y4Ga9r+5AxskVpJYKTh0ERivRuqKRs1E=
Content-Type: multipart/mixed; boundary="===============6176977460591562720=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hiago.franco@toradex.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.395 SUCCEEDED
Message-ID: <010101972bc70889-49f4431b-73cd-4843-85b7-a65652d5d106-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217665

--===============6176977460591562720==
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
From f27dce1bd3a77706080797ba6bde556e6800fbe1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 13:41:32 +0000
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


--===============6176977460591562720==
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
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 9895745 to 9924813 (+0%)
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.394" to "0.395"
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.394 [default] to 0.395 [default]
packages/all-poky-linux/hwdata: PKGV changed from 0.394 [default] to 0.395 [default]
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.394" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.395"
packages/all-poky-linux/hwdata: PV changed from "0.394" to "0.395"

--===============6176977460591562720==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.394-0.395.patch"

RnJvbSBmMjdkY2UxYmQzYTc3NzA2MDgwNzk3YmE2YmRlNTU2ZTY4MDBmYmUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAxMzo0MTozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGh3
ZGF0YTogdXBncmFkZSAwLjM5NCAtPiAwLjM5NQoKLS0tCiAuLi4vcmVjaXBlcy1zdXBwb3J0L2h3
ZGF0YS97aHdkYXRhXzAuMzk0LmJiID0+IGh3ZGF0YV8wLjM5NS5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9od2RhdGEve2h3ZGF0YV8wLjM5NC5iYiA9PiBod2RhdGFfMC4zOTUuYmJ9ICg5
MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjM5
NC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC4zOTUuYmIKc2ltaWxh
cml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3
ZGF0YV8wLjM5NC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0
YV8wLjM5NS5iYgppbmRleCA1NGVkY2VjYzJjLi43M2I4NDZiMTgxIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuMzk0LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC4zOTUuYmIKQEAgLTgsNyArOCw3IEBAIExJQ0VOU0Ug
PSAiR1BMLTIuMC1vci1sYXRlciB8IFgxMSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0U7bWQ1PTE1NTY1NDc3MTFlODI0Njk5MmI5OTllZGQ5NDQ1YTU3IgogCiBTUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vdmNyaG9uZWsvJHtCUE59LmdpdDticmFuY2g9bWFzdGVyO3Byb3Rv
Y29sPWh0dHBzO3RhZz12JHtQVn0iCi1TUkNSRVYgPSAiZmExY2NmNGU0OTQ0YmRiNDExMDAyNWM1
YzQwZTRmZWU4YzhkZTI5YiIKK1NSQ1JFViA9ICI5NWMxZGU2YzRhMGQ0MDQxNTg2N2IyOWMwNzkx
NDgwZmI4YWQzY2RiIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjQ3LjEKCg==

--===============6176977460591562720==--

