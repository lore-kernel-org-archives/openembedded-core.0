Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F559C3600B
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:43 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.10328.1742048293317838247
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=J9GIj8aO;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=F15jIu9W;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101959a2bd147-2b230009-5b88-4ff1-b1f1-9948c0b6c9b8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048317;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=g+QtW6MhwUQoS1JwmhLzBz+ckUUS+6emtKYP8b3CSK4=;
	b=J9GIj8aONPrfGisXwyxyyjiumMQhyze8MMWGI/EO6DCPQ1xD6VDSiMklcrnfEgmZ
	pLMdjmWI1G4R+SkF/fAHCqaOBSla1T9xbtpeuCsfdAAo52IRPRSh403jpgYxfJgg5uW
	/tCV06D2qTIfBBWuOXqz+MKyAZbDOKPZEOmn0cUo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048317;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=g+QtW6MhwUQoS1JwmhLzBz+ckUUS+6emtKYP8b3CSK4=;
	b=F15jIu9W//TOELmuyXS+xh6jNrX9BksxzoM5AZRtyUlJwIEYdnVjtGfjQTlVuaiL
	9IvyyxF+q/elZ397KHhYNyqiOuHri8or6maMEK1Zbgk8Rpvfh7PVuQieWnsPyEw1yeM
	fwsCBlHOK74qfHrR1+8cqjJuMjMKe6SLsOypvtfk=
Content-Type: multipart/mixed; boundary="===============5372365808131559658=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hiago.franco@toradex.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.393 SUCCEEDED
Message-ID: <010101959a2bd147-2b230009-5b88-4ff1-b1f1-9948c0b6c9b8-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212972

--===============5372365808131559658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwdata* to *0.393* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.392-0.393.patch
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
From 853f068e7aaf8e1dc8a174996118093148df3ad5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 13:57:47 +0000
Subject: [PATCH] hwdata: upgrade 0.392 -> 0.393

---
 .../recipes-support/hwdata/{hwdata_0.392.bb => hwdata_0.393.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.392.bb => hwdata_0.393.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.392.bb b/meta/recipes-support/hwdata/hwdata_0.393.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.392.bb
rename to meta/recipes-support/hwdata/hwdata_0.393.bb
index e0a1a7fbb2..1517a1d35f 100644
--- a/meta/recipes-support/hwdata/hwdata_0.392.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.393.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
-SRCREV = "e3aac7f6bed87ca6d701bb5ad30f29a8df857f66"
+SRCREV = "2b7f8370a5b3b1552d8264b8665ed99ddfea0b57"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============5372365808131559658==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.392-0.393.patch"

RnJvbSA4NTNmMDY4ZTdhYWY4ZTFkYzhhMTc0OTk2MTE4MDkzMTQ4ZGYzYWQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMTM6NTc6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
d2RhdGE6IHVwZ3JhZGUgMC4zOTIgLT4gMC4zOTMKCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC9o
d2RhdGEve2h3ZGF0YV8wLjM5Mi5iYiA9PiBod2RhdGFfMC4zOTMuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvaHdkYXRhL3tod2RhdGFfMC4zOTIuYmIgPT4gaHdkYXRhXzAuMzkzLmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC4z
OTIuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuMzkzLmJiCnNpbWls
YXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9o
d2RhdGFfMC4zOTIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2Rh
dGFfMC4zOTMuYmIKaW5kZXggZTBhMWE3ZmJiMi4uMTUxN2ExZDM1ZiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjM5Mi5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuMzkzLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb3ItbGF0ZXIgfCBYMTEiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT0xNTU2NTQ3NzExZTgyNDY5OTJiOTk5ZWRkOTQ0NWE1NyIKIAogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL3ZjcmhvbmVrLyR7QlBOfS5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90
b2NvbD1odHRwcyIKLVNSQ1JFViA9ICJlM2FhYzdmNmJlZDg3Y2E2ZDcwMWJiNWFkMzBmMjlhOGRm
ODU3ZjY2IgorU1JDUkVWID0gIjJiN2Y4MzcwYTViM2IxNTUyZDgyNjRiODY2NWVkOTlkZGZlYTBi
NTciCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuNDQuMQoK

--===============5372365808131559658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.392 [default] to 0.393 [default]
packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.392" to "0.393"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.392 [default] to 0.393 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.392" to "0.393"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.392 [default] to 0.393 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.392" to "0.393"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.392 [default] to 0.393 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.392" to "0.393"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.392 [default] to 0.393 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.392" to "0.393"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.392 [default] to 0.393 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.392" to "0.393"
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.392 [default] to 0.393 [default]
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 9845922 to 9869650 (+0%)
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.392" to "0.393"
packages/all-poky-linux/hwdata: PKGV changed from 0.392 [default] to 0.393 [default]
packages/all-poky-linux/hwdata: PV changed from "0.392" to "0.393"

--===============5372365808131559658==--

