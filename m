Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B19CD4845
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:49 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2382.1762384605995582699
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=F7pTz00+;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=DyJJfIGh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019a564ef136-354dc30d-6fe8-4769-b2fc-0bd581824cc7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384605;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=V/SJ4lT+eCDJFtry9Wj6RVyhKQxYtEM7wa//3gYM9DQ=;
	b=F7pTz00+4yjPitv/t6HK2GJtH707De1ojdyUNb7DNGElrO94/FgUMysyuIvpfhuq
	cOxJ3vzw0mQ1sxlGMyakH7+W5zqoqcJKyyfB/it5xHZtjHmNdA+UFtRXn282ul4+73R
	vmrtgfNkisx/hini2kvdF1T9rsfPLbRRT9xhGuT4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384605;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=V/SJ4lT+eCDJFtry9Wj6RVyhKQxYtEM7wa//3gYM9DQ=;
	b=DyJJfIGh4koGOAsQVvlNP+asY46mFcZnth8e5FAPMx67nxsr6UZmvij07T3+DyeC
	xfsg6BN1USRi2BbcgaJJGTHmu6oWS/9/8AxXpagK0Mf8SLYCDJT0BU20naXggXicyfV
	koh8iuhmjsieTusl+JZ/LOcFBph46wT33/K3tVz0=
Content-Type: multipart/mixed; boundary="===============8118663783867094319=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hiago.franco@toradex.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.401 SUCCEEDED
Message-ID: <0101019a564ef136-354dc30d-6fe8-4769-b2fc-0bd581824cc7-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225916

--===============8118663783867094319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwdata* to *0.401* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.399-0.401.patch
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
From 38cfbb5471394230dda07f39fa615ad20e2cb1e8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 22:32:06 +0000
Subject: [PATCH] hwdata: upgrade 0.399 -> 0.401

---
 .../recipes-support/hwdata/{hwdata_0.399.bb => hwdata_0.401.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.399.bb => hwdata_0.401.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.399.bb b/meta/recipes-support/hwdata/hwdata_0.401.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.399.bb
rename to meta/recipes-support/hwdata/hwdata_0.401.bb
index 81dede96ea..fe4514255e 100644
--- a/meta/recipes-support/hwdata/hwdata_0.399.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.401.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "7ba0e54565843faee300ca885699e4c42ed674b2"
+SRCREV = "aa9d811f543d447a1abb97d1b94c10e212f933c1"
 
 inherit allarch
 
-- 
2.47.1


--===============8118663783867094319==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.399-0.401.patch"

RnJvbSAzOGNmYmI1NDcxMzk0MjMwZGRhMDdmMzlmYTYxNWFkMjBlMmNiMWU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMjozMjowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGh3
ZGF0YTogdXBncmFkZSAwLjM5OSAtPiAwLjQwMQoKLS0tCiAuLi4vcmVjaXBlcy1zdXBwb3J0L2h3
ZGF0YS97aHdkYXRhXzAuMzk5LmJiID0+IGh3ZGF0YV8wLjQwMS5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9od2RhdGEve2h3ZGF0YV8wLjM5OS5iYiA9PiBod2RhdGFfMC40MDEuYmJ9ICg5
MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjM5
OS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC40MDEuYmIKc2ltaWxh
cml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3
ZGF0YV8wLjM5OS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0
YV8wLjQwMS5iYgppbmRleCA4MWRlZGU5NmVhLi5mZTQ1MTQyNTVlIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuMzk5LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC40MDEuYmIKQEAgLTgsNyArOCw3IEBAIExJQ0VOU0Ug
PSAiR1BMLTIuMC1vci1sYXRlciB8IFgxMSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0U7bWQ1PTE1NTY1NDc3MTFlODI0Njk5MmI5OTllZGQ5NDQ1YTU3IgogCiBTUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vdmNyaG9uZWsvJHtCUE59LmdpdDticmFuY2g9bWFzdGVyO3Byb3Rv
Y29sPWh0dHBzO3RhZz12JHtQVn0iCi1TUkNSRVYgPSAiN2JhMGU1NDU2NTg0M2ZhZWUzMDBjYTg4
NTY5OWU0YzQyZWQ2NzRiMiIKK1NSQ1JFViA9ICJhYTlkODExZjU0M2Q0NDdhMWFiYjk3ZDFiOTRj
MTBlMjEyZjkzM2MxIgogCiBpbmhlcml0IGFsbGFyY2gKIAotLSAKMi40Ny4xCgo=

--===============8118663783867094319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.399 [default] to 0.401 [default]
packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.399" to "0.401"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.399 [default] to 0.401 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.399" to "0.401"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.399 [default] to 0.401 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.399" to "0.401"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.399 [default] to 0.401 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.399" to "0.401"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.399 [default] to 0.401 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.399" to "0.401"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.399 [default] to 0.401 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.399" to "0.401"
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 10041198 to 10060807 (+0%)
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.399 [default] to 0.401 [default]
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.399" to "0.401"
packages/all-poky-linux/hwdata: PKGV changed from 0.399 [default] to 0.401 [default]
packages/all-poky-linux/hwdata: PV changed from "0.399" to "0.401"
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.399" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.401"

--===============8118663783867094319==--

