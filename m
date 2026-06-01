Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 737CDCD98CF
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:36:03 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1558.1780328132758483389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hx6MeptJ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pnocdHEy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019e83d3ca51-84901171-83b8-4863-a2dc-d2d01084241f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328155;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aHeF77cT5IJwKMBxyxnePnSSOSuygiiXgSOaqC0hnyc=;
	b=hx6MeptJbM514fPm+kPkOwcFvjIKM3++tXvTyd5I8hlyt57DipfAycxbQaHPHWDd
	1FpykMY4AmA4vT4BBn/x5N8acaxHPpEl7p0Q509ubaY0pKwk6Q2u/f0evIG3P/ldjHJ
	tcUR0A+dIIj2bu8WqkVx5HV+UX7IE27l2QMQ/oM4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328155;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aHeF77cT5IJwKMBxyxnePnSSOSuygiiXgSOaqC0hnyc=;
	b=pnocdHEyC2a/1CMvOmm/Q2tNjgVDALTJMs6ARyoA5ugW35JXtrMvkY6/6YDTF9Gb
	44lDI7+kq1A/ZUp2fEePKXjIJ1xbtkP8+wsz1Eg27mbyBiAzW5LiHO2VEjHGxm0/djg
	X0lTtRUSwPpqNldv6ZT/GnFx5MxSM6Hv9rIpPv3U=
Content-Type: multipart/mixed; boundary="===============5601960893068944166=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hfranco@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.407 SUCCEEDED
Message-ID: <0101019e83d3ca51-84901171-83b8-4863-a2dc-d2d01084241f-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237953

--===============5601960893068944166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwdata* to *0.407* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.406-0.407.patch
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
From 40a8a40791cebdac7490b615dc3ae84fec4cafdc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 14:28:59 +0000
Subject: [PATCH] hwdata: upgrade 0.406 -> 0.407

---
 .../recipes-support/hwdata/{hwdata_0.406.bb => hwdata_0.407.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.406.bb => hwdata_0.407.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.406.bb b/meta/recipes-support/hwdata/hwdata_0.407.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.406.bb
rename to meta/recipes-support/hwdata/hwdata_0.407.bb
index 602ab7c9e2..d4ec680f6e 100644
--- a/meta/recipes-support/hwdata/hwdata_0.406.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.407.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "9ae3b9da5cbb93eed30f812aa7edb4b9ad3e3868"
+SRCREV = "a9bbe4d8619e9a73dc433db2d2afceda8cbeae10"
 
 inherit allarch
 
-- 
2.47.1


--===============5601960893068944166==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.406-0.407.patch"

RnJvbSA0MGE4YTQwNzkxY2ViZGFjNzQ5MGI2MTVkYzNhZTg0ZmVjNGNhZmRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxNDoyODo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGh3
ZGF0YTogdXBncmFkZSAwLjQwNiAtPiAwLjQwNwoKLS0tCiAuLi4vcmVjaXBlcy1zdXBwb3J0L2h3
ZGF0YS97aHdkYXRhXzAuNDA2LmJiID0+IGh3ZGF0YV8wLjQwNy5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9od2RhdGEve2h3ZGF0YV8wLjQwNi5iYiA9PiBod2RhdGFfMC40MDcuYmJ9ICg5
MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjQw
Ni5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC40MDcuYmIKc2ltaWxh
cml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3
ZGF0YV8wLjQwNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0
YV8wLjQwNy5iYgppbmRleCA2MDJhYjdjOWUyLi5kNGVjNjgwZjZlIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuNDA2LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC40MDcuYmIKQEAgLTgsNyArOCw3IEBAIExJQ0VOU0Ug
PSAiR1BMLTIuMC1vci1sYXRlciB8IFgxMSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0U7bWQ1PTE1NTY1NDc3MTFlODI0Njk5MmI5OTllZGQ5NDQ1YTU3IgogCiBTUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vdmNyaG9uZWsvJHtCUE59LmdpdDticmFuY2g9bWFzdGVyO3Byb3Rv
Y29sPWh0dHBzO3RhZz12JHtQVn0iCi1TUkNSRVYgPSAiOWFlM2I5ZGE1Y2JiOTNlZWQzMGY4MTJh
YTdlZGI0YjlhZDNlMzg2OCIKK1NSQ1JFViA9ICJhOWJiZTRkODYxOWU5YTczZGM0MzNkYjJkMmFm
Y2VkYThjYmVhZTEwIgogCiBpbmhlcml0IGFsbGFyY2gKIAotLSAKMi40Ny4xCgo=

--===============5601960893068944166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.406" to "0.407"
packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.406 [default] to 0.407 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.406" to "0.407"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.406 [default] to 0.407 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.406" to "0.407"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.406 [default] to 0.407 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.406" to "0.407"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.406 [default] to 0.407 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.406" to "0.407"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.406 [default] to 0.407 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.406" to "0.407"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.406 [default] to 0.407 [default]
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.406" to "0.407"
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 10329347 to 10373574 (+0%)
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.406 [default] to 0.407 [default]
packages/all-poky-linux/hwdata: PV changed from "0.406" to "0.407"
packages/all-poky-linux/hwdata: PKGV changed from 0.406 [default] to 0.407 [default]
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.406" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.407"

--===============5601960893068944166==--

