Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6935CAC589
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:54 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.89805.1756850194378468698
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=l/Pqk6dA;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=bruPEKJa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101990c6eadaf-50ddfa9a-79c7-4edf-9d49-00f2ed04acf0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850204;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7zZId3qYfFoAp6hroDqWMl91DW9ETz2zvf+SJwFhSFk=;
	b=l/Pqk6dAoY0Eav5WwbmbKoUiINoP5Nthjcem8aF6C9pWITL618vO4Is1Oyy/ft1/
	iSPmUzSKgxve6GxXmLznoKq1cYC6fI5FsPZPckci4ka8CGLt7KliGUtC3VvknSBD6DT
	/FoT7EDp9bSyVmfoRoBRZ4bntKd/AavRBZH0CkLs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850204;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7zZId3qYfFoAp6hroDqWMl91DW9ETz2zvf+SJwFhSFk=;
	b=bruPEKJaV2hgyC1+/lEZkAFHuqAr4SXRYrTY41QtzAh5DfyydNESTvv2/2C5I1J5
	wmgoAzGBYzCo37Uf6w+eKBoF4xf3Swx0Iz6ZHUqPpV9XJIrngYUu9yBa76nUSHAqgUA
	X1wP/gh/o91vapulMGkL8nUpCDkLQigNrgfcNeMM=
Content-Type: multipart/mixed; boundary="===============5138260834549417162=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hiago.franco@toradex.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.399 SUCCEEDED
Message-ID: <010101990c6eadaf-50ddfa9a-79c7-4edf-9d49-00f2ed04acf0-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222827

--===============5138260834549417162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwdata* to *0.399* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.397-0.399.patch
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
From c565bc42421931b9877e52703113195933ea0692 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 21:40:43 +0000
Subject: [PATCH] hwdata: upgrade 0.397 -> 0.399

---
 .../recipes-support/hwdata/{hwdata_0.397.bb => hwdata_0.399.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.397.bb => hwdata_0.399.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.397.bb b/meta/recipes-support/hwdata/hwdata_0.399.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.397.bb
rename to meta/recipes-support/hwdata/hwdata_0.399.bb
index bd985c2a14..81dede96ea 100644
--- a/meta/recipes-support/hwdata/hwdata_0.397.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.399.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "e4423c783ca7db5c9d6d4881985272849f4892cf"
+SRCREV = "7ba0e54565843faee300ca885699e4c42ed674b2"
 
 inherit allarch
 
-- 
2.47.1


--===============5138260834549417162==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.397-0.399.patch"

RnJvbSBjNTY1YmM0MjQyMTkzMWI5ODc3ZTUyNzAzMTEzMTk1OTMzZWEwNjkyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAyMTo0MDo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGh3
ZGF0YTogdXBncmFkZSAwLjM5NyAtPiAwLjM5OQoKLS0tCiAuLi4vcmVjaXBlcy1zdXBwb3J0L2h3
ZGF0YS97aHdkYXRhXzAuMzk3LmJiID0+IGh3ZGF0YV8wLjM5OS5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9od2RhdGEve2h3ZGF0YV8wLjM5Ny5iYiA9PiBod2RhdGFfMC4zOTkuYmJ9ICg5
MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjM5
Ny5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC4zOTkuYmIKc2ltaWxh
cml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3
ZGF0YV8wLjM5Ny5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0
YV8wLjM5OS5iYgppbmRleCBiZDk4NWMyYTE0Li44MWRlZGU5NmVhIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuMzk3LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC4zOTkuYmIKQEAgLTgsNyArOCw3IEBAIExJQ0VOU0Ug
PSAiR1BMLTIuMC1vci1sYXRlciB8IFgxMSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0U7bWQ1PTE1NTY1NDc3MTFlODI0Njk5MmI5OTllZGQ5NDQ1YTU3IgogCiBTUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vdmNyaG9uZWsvJHtCUE59LmdpdDticmFuY2g9bWFzdGVyO3Byb3Rv
Y29sPWh0dHBzO3RhZz12JHtQVn0iCi1TUkNSRVYgPSAiZTQ0MjNjNzgzY2E3ZGI1YzlkNmQ0ODgx
OTg1MjcyODQ5ZjQ4OTJjZiIKK1NSQ1JFViA9ICI3YmEwZTU0NTY1ODQzZmFlZTMwMGNhODg1Njk5
ZTRjNDJlZDY3NGIyIgogCiBpbmhlcml0IGFsbGFyY2gKIAotLSAKMi40Ny4xCgo=

--===============5138260834549417162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.397 [default] to 0.399 [default]
packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.397" to "0.399"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.397 [default] to 0.399 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.397" to "0.399"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.397 [default] to 0.399 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.397" to "0.399"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.397 [default] to 0.399 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.397" to "0.399"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.397 [default] to 0.399 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.397" to "0.399"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.397 [default] to 0.399 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.397" to "0.399"
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.397 [default] to 0.399 [default]
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.397" to "0.399"
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 10005374 to 10041198 (+0%)
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.397" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.399"
packages/all-poky-linux/hwdata: PKGV changed from 0.397 [default] to 0.399 [default]
packages/all-poky-linux/hwdata: PV changed from "0.397" to "0.399"

--===============5138260834549417162==--

