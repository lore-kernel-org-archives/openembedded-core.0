Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A97D489AC
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:03 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1483.1768526753666339127
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=E4Cl2eWM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=UzDJ/sCb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019bc468c131-bbb4f79b-6657-4d9f-a9b2-26e9c09df947-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526758;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6NqTI67qNJ8K+6VU+vPWQJvqH2pDnu9Rp4lNgbJKcLs=;
	b=E4Cl2eWMcRIgU4gu0atXoPRQMP0zCW1aGoeRelRG/Rte3dXmoP2RyBia3kD4sbDK
	XqJPQjBY4PMtbsEFI3mXT3MWT38vkAlrDWJyDZYNgbCp2cQ44ZpRPoUz7S1iPWtXs40
	X7ev8mcPQ72klQeOMG+aluwUuiVN9lV6gqLW2uSU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526758;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6NqTI67qNJ8K+6VU+vPWQJvqH2pDnu9Rp4lNgbJKcLs=;
	b=UzDJ/sCbv3bS/r2EeVF2NaSGl+ZZ5SwlUHiHoOP+EiOU6Xx2/rXweNudCBGN/4/F
	6U6OiLGhseb6TlZJtAc5jWxJ+KRQfi9EalZfOx9Xj7h6z/7oAZHpULjQOVcvQe4NT8b
	ydBJe1MV+Y56TixSFcK2fH3rqRxEV+3zmRAbobzc=
Content-Type: multipart/mixed; boundary="===============1852446887093132703=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hfranco@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.403 SUCCEEDED
Message-ID: <0101019bc468c131-bbb4f79b-6657-4d9f-a9b2-26e9c09df947-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229511

--===============1852446887093132703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwdata* to *0.403* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.402-0.403.patch
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
From a283e25edc7ae81b708f7428395f2309f1f481f4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Jan 2026 01:05:06 +0000
Subject: [PATCH] hwdata: upgrade 0.402 -> 0.403

---
 .../recipes-support/hwdata/{hwdata_0.402.bb => hwdata_0.403.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.402.bb => hwdata_0.403.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.402.bb b/meta/recipes-support/hwdata/hwdata_0.403.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.402.bb
rename to meta/recipes-support/hwdata/hwdata_0.403.bb
index 826c9b2e32..f95146648f 100644
--- a/meta/recipes-support/hwdata/hwdata_0.402.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.403.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "d263c183dd429bbe1572a91a8cf180e84b8341c6"
+SRCREV = "bb56be59220b34d79160b73bd24eb36952dc8c63"
 
 inherit allarch
 
-- 
2.47.1


--===============1852446887093132703==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.402-0.403.patch"

RnJvbSBhMjgzZTI1ZWRjN2FlODFiNzA4Zjc0MjgzOTVmMjMwOWYxZjQ4MWY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgSmFuIDIwMjYgMDE6MDU6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
d2RhdGE6IHVwZ3JhZGUgMC40MDIgLT4gMC40MDMKCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC9o
d2RhdGEve2h3ZGF0YV8wLjQwMi5iYiA9PiBod2RhdGFfMC40MDMuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvaHdkYXRhL3tod2RhdGFfMC40MDIuYmIgPT4gaHdkYXRhXzAuNDAzLmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC40
MDIuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuNDAzLmJiCnNpbWls
YXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9o
d2RhdGFfMC40MDIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2Rh
dGFfMC40MDMuYmIKaW5kZXggODI2YzliMmUzMi4uZjk1MTQ2NjQ4ZiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjQwMi5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuNDAzLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb3ItbGF0ZXIgfCBYMTEiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT0xNTU2NTQ3NzExZTgyNDY5OTJiOTk5ZWRkOTQ0NWE1NyIKIAogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL3ZjcmhvbmVrLyR7QlBOfS5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90
b2NvbD1odHRwczt0YWc9diR7UFZ9IgotU1JDUkVWID0gImQyNjNjMTgzZGQ0MjliYmUxNTcyYTkx
YThjZjE4MGU4NGI4MzQxYzYiCitTUkNSRVYgPSAiYmI1NmJlNTkyMjBiMzRkNzkxNjBiNzNiZDI0
ZWIzNjk1MmRjOGM2MyIKIAogaW5oZXJpdCBhbGxhcmNoCiAKLS0gCjIuNDcuMQoK

--===============1852446887093132703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.402" to "0.403"
packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.402 [default] to 0.403 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.402" to "0.403"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.402 [default] to 0.403 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.402" to "0.403"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.402 [default] to 0.403 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.402" to "0.403"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.402 [default] to 0.403 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.402" to "0.403"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.402 [default] to 0.403 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.402" to "0.403"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.402 [default] to 0.403 [default]
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.402" to "0.403"
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.402 [default] to 0.403 [default]
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 10180599 to 10227146 (+0%)
packages/all-poky-linux/hwdata: PV changed from "0.402" to "0.403"
packages/all-poky-linux/hwdata: PKGV changed from 0.402 [default] to 0.403 [default]
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.402" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.403"

--===============1852446887093132703==--

