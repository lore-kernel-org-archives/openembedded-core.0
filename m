Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1884C55178
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 06:05:29 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.938.1785564324610622493
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 23:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=g+gAuPOM;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=UAJG+JYb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019fbbed5fc0-e13963ec-31a1-4e5c-a6d1-a575e7526949-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785564323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1xejBbrs1aG71Z0O64laMar1sxu4XMDGGYf3bEHocHM=;
	b=g+gAuPOMM5k9FKkUJiFEurPR9yJ+JpFZlATKJO3ZwOR5p08AVO8vWZ77nmr4M/ZR
	cIKjrwUrA20w66aIyp0h3rtiNv2TcxLcOquIFK/7ndp6hmKh6zI95uOOqkWVM02Q/Vc
	PAvbdXFKayPVfmQqGOVapNC6R1nRkSRG9Looj/lg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785564323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1xejBbrs1aG71Z0O64laMar1sxu4XMDGGYf3bEHocHM=;
	b=UAJG+JYb7BqSyTuoEm+frlv/VPJiQ+pALMOraTo9PD0bDcoHEiNMVCkrxpHUk0a7
	aPxVq200QdO9mbFshzsJFZdM4aSEx3DdbXaiNofHV3vg2l6EICH5nP09IVSG1pVgOEw
	JSIW54x7DqFdFZEztqj03LcAHZJRIuK3P1Ks/dEQ=
Content-Type: multipart/mixed; boundary="===============5529515360352851375=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hfranco@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.410 SUCCEEDED
Message-ID: <0101019fbbed5fc0-e13963ec-31a1-4e5c-a6d1-a575e7526949-000000@us-west-2.amazonses.com>
Date: Sat, 1 Aug 2026 06:05:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 06:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242467

--===============5529515360352851375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwdata* to *0.410* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.409-0.410.patch
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
From 31ead839c9a182984a06938af6c8f00469efea74 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Aug 2026 06:05:15 +0000
Subject: [PATCH] hwdata: upgrade 0.409 -> 0.410

8bb6c48 Update pci and vendor ids
d1f6971 Use -test suffix for --local-only branch names
1e9cfbd Add automatic USB patch regeneration
---
 .../recipes-support/hwdata/{hwdata_0.409.bb => hwdata_0.410.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.409.bb => hwdata_0.410.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.409.bb b/meta/recipes-support/hwdata/hwdata_0.410.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.409.bb
rename to meta/recipes-support/hwdata/hwdata_0.410.bb
index 7117c0857c..a34724abea 100644
--- a/meta/recipes-support/hwdata/hwdata_0.409.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.410.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later OR X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "73fa04de426aefe192505fcbc6c24237a9fd9c9b"
+SRCREV = "8bb6c48dc2e683777e625d1c9ef02c1b25b741cd"
 
 inherit allarch
 
-- 
2.47.1


--===============5529515360352851375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.409 [default] to 0.410 [default]
packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.409" to "0.410"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.409 [default] to 0.410 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.409" to "0.410"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.409 [default] to 0.410 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.409" to "0.410"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.409 [default] to 0.410 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.409" to "0.410"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.409 [default] to 0.410 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.409" to "0.410"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.409 [default] to 0.410 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.409" to "0.410"
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.409 [default] to 0.410 [default]
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 10475262 to 10511826 (+0%)
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.409" to "0.410"
packages/all-poky-linux/hwdata: PKGV changed from 0.409 [default] to 0.410 [default]
packages/all-poky-linux/hwdata: PV changed from "0.409" to "0.410"
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.409" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.410"

--===============5529515360352851375==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.409-0.410.patch"

RnJvbSAzMWVhZDgzOWM5YTE4Mjk4NGEwNjkzOGFmNmM4ZjAwNDY5ZWZlYTc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBdWcgMjAyNiAwNjowNToxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGh3
ZGF0YTogdXBncmFkZSAwLjQwOSAtPiAwLjQxMAoKOGJiNmM0OCBVcGRhdGUgcGNpIGFuZCB2ZW5k
b3IgaWRzCmQxZjY5NzEgVXNlIC10ZXN0IHN1ZmZpeCBmb3IgLS1sb2NhbC1vbmx5IGJyYW5jaCBu
YW1lcwoxZTljZmJkIEFkZCBhdXRvbWF0aWMgVVNCIHBhdGNoIHJlZ2VuZXJhdGlvbgotLS0KIC4u
Li9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL3tod2RhdGFfMC40MDkuYmIgPT4gaHdkYXRhXzAuNDEw
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS97aHdkYXRhXzAuNDA5LmJiID0+
IGh3ZGF0YV8wLjQxMC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9od2RhdGEvaHdkYXRhXzAuNDA5LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3
ZGF0YV8wLjQxMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuNDA5LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuNDEwLmJiCmluZGV4IDcxMTdjMDg1N2MuLmEzNDcyNGFi
ZWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC40MDku
YmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjQxMC5iYgpAQCAt
OCw3ICs4LDcgQEAgTElDRU5TRSA9ICJHUEwtMi4wLW9yLWxhdGVyIE9SIFgxMSIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTE1NTY1NDc3MTFlODI0Njk5MmI5OTllZGQ5
NDQ1YTU3IgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vdmNyaG9uZWsvJHtCUE59Lmdp
dDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzO3RhZz12JHtQVn0iCi1TUkNSRVYgPSAiNzNm
YTA0ZGU0MjZhZWZlMTkyNTA1ZmNiYzZjMjQyMzdhOWZkOWM5YiIKK1NSQ1JFViA9ICI4YmI2YzQ4
ZGMyZTY4Mzc3N2U2MjVkMWM5ZWYwMmMxYjI1Yjc0MWNkIgogCiBpbmhlcml0IGFsbGFyY2gKIAot
LSAKMi40Ny4xCgo=

--===============5529515360352851375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="hwdata-changelog.txt"

Changelog for hwdata: 0.409 -> 0.410

8bb6c48 Update pci and vendor ids
d1f6971 Use -test suffix for --local-only branch names
1e9cfbd Add automatic USB patch regeneration

--===============5529515360352851375==--

