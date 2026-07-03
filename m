Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F492C44502
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 05:34:57 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86951.1783056892652185111
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 22:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Es00Wh1/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LKrE//Vv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019f26790931-473e288c-2ed0-4eb7-b757-2a25d4136ae4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783056894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6LZessBtv0+j2RI8KLFBFJJu8SLHXUigxX13Uq5dIp4=;
	b=Es00Wh1/TETsKiTFMiqK3RFZgLT3Ebii1AB5/A7+IOIL5VIP5s8VZX+aQA/SsB1+
	GUQmgBqxoRBhwousKvl86QGIgsXEkk3ZnoK2c30EeYX2/SYjTnd4xwGdOga9BICTjyM
	7aeMcBdYAtR+iQxdXQ+xCXvjzBKZSS1twyxU/OHU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783056894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6LZessBtv0+j2RI8KLFBFJJu8SLHXUigxX13Uq5dIp4=;
	b=LKrE//VvGU9DB/shB4QBXGTiRjBNa9+ch7D0Evgad023OVGgpFHUwJ5jyhLoPKx7
	YDLaSQuiLEwbd8YvQ4GyyjvnBh3A45Uvrete7ZNp5WGyvcbSk7uBQK/u1lVLvJRrt29
	VWNKKim0hwaqS2WthbCG5Dd+7uFHMVJUHgFYbEA0=
Content-Type: multipart/mixed; boundary="===============7601595815284721218=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hfranco@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.409 SUCCEEDED
Message-ID: <0101019f26790931-473e288c-2ed0-4eb7-b757-2a25d4136ae4-000000@us-west-2.amazonses.com>
Date: Fri, 3 Jul 2026 05:34:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.03-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 05:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240075

--===============7601595815284721218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwdata* to *0.409* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.408-0.409.patch
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
From 288779c97cdf893bebbfaed1f1d5fb284922e0b5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Jul 2026 05:34:48 +0000
Subject: [PATCH] hwdata: upgrade 0.408 -> 0.409

---
 .../recipes-support/hwdata/{hwdata_0.408.bb => hwdata_0.409.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.408.bb => hwdata_0.409.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.408.bb b/meta/recipes-support/hwdata/hwdata_0.409.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.408.bb
rename to meta/recipes-support/hwdata/hwdata_0.409.bb
index 5cb082d5c9..543d24dc4e 100644
--- a/meta/recipes-support/hwdata/hwdata_0.408.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.409.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "4456b256a1a5b1d1c1c1a60a9f69c59f7743c522"
+SRCREV = "73fa04de426aefe192505fcbc6c24237a9fd9c9b"
 
 inherit allarch
 
-- 
2.47.1


--===============7601595815284721218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.408 [default] to 0.409 [default]
packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.408" to "0.409"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.408 [default] to 0.409 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.408" to "0.409"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.408 [default] to 0.409 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.408" to "0.409"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.408 [default] to 0.409 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.408" to "0.409"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.408 [default] to 0.409 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.408" to "0.409"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.408 [default] to 0.409 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.408" to "0.409"
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 10425035 to 10475262 (+0%)
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.408 [default] to 0.409 [default]
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.408" to "0.409"
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.408" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.409"
packages/all-poky-linux/hwdata: PKGV changed from 0.408 [default] to 0.409 [default]
packages/all-poky-linux/hwdata: PV changed from "0.408" to "0.409"

--===============7601595815284721218==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.408-0.409.patch"

RnJvbSAyODg3NzljOTdjZGY4OTNiZWJiZmFlZDFmMWQ1ZmIyODQ5MjJlMGI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBKdWwgMjAyNiAwNTozNDo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGh3
ZGF0YTogdXBncmFkZSAwLjQwOCAtPiAwLjQwOQoKLS0tCiAuLi4vcmVjaXBlcy1zdXBwb3J0L2h3
ZGF0YS97aHdkYXRhXzAuNDA4LmJiID0+IGh3ZGF0YV8wLjQwOS5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9od2RhdGEve2h3ZGF0YV8wLjQwOC5iYiA9PiBod2RhdGFfMC40MDkuYmJ9ICg5
MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjQw
OC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC40MDkuYmIKc2ltaWxh
cml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3
ZGF0YV8wLjQwOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0
YV8wLjQwOS5iYgppbmRleCA1Y2IwODJkNWM5Li41NDNkMjRkYzRlIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuNDA4LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC40MDkuYmIKQEAgLTgsNyArOCw3IEBAIExJQ0VOU0Ug
PSAiR1BMLTIuMC1vci1sYXRlciB8IFgxMSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJ
Q0VOU0U7bWQ1PTE1NTY1NDc3MTFlODI0Njk5MmI5OTllZGQ5NDQ1YTU3IgogCiBTUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vdmNyaG9uZWsvJHtCUE59LmdpdDticmFuY2g9bWFzdGVyO3Byb3Rv
Y29sPWh0dHBzO3RhZz12JHtQVn0iCi1TUkNSRVYgPSAiNDQ1NmIyNTZhMWE1YjFkMWMxYzFhNjBh
OWY2OWM1OWY3NzQzYzUyMiIKK1NSQ1JFViA9ICI3M2ZhMDRkZTQyNmFlZmUxOTI1MDVmY2JjNmMy
NDIzN2E5ZmQ5YzliIgogCiBpbmhlcml0IGFsbGFyY2gKIAotLSAKMi40Ny4xCgo=

--===============7601595815284721218==--

