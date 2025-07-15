Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A094CA0EDD
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:56:03 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.12182.1752594945194591375
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KsWBr42y;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=BPoXttzO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101980eccbcc7-08d07b9f-05af-4d4a-ad7a-bde7dc295435-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594955;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=V9eC5XUYctbbiMTAXWCF93wM5W1tNtkLlZYl+yW/j2A=;
	b=KsWBr42yooA5SewySCO3bDfgt00JC4a7emO/+h0abwPFC8b5dsqwZxR14pfgX7+p
	P9TaptQOcu4uGynU7Vygwu4b0Wn8WuYIvR653gcOp7as7jAhVymPPx+tG5qkNls6gDm
	k20gpbMk6bK+RKQrGDqWBLDQ0E3KhFRA7AHUXiyI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594955;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=V9eC5XUYctbbiMTAXWCF93wM5W1tNtkLlZYl+yW/j2A=;
	b=BPoXttzOJEqmgnMG468ZPnarFeS4cTNN4PU1ZsqCrBsX9+JxKch9PrFBNv7QqZeS
	QvqA2JhRp7Lp0AeDHIxRBoBMCpeHYR5UjzXlCni3+C7Y8hS/9J6cHEOazPVnPRNZZ1y
	vHH82RtdTE8b9WJHjatzbs2t6Ei1uPL+6vMQWtFw=
Content-Type: multipart/mixed; boundary="===============1471447505737955364=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hiago.franco@toradex.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.397 SUCCEEDED
Message-ID: <010101980eccbcc7-08d07b9f-05af-4d4a-ad7a-bde7dc295435-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220397

--===============1471447505737955364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwdata* to *0.397* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.396-0.397.patch
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
From 201a5a0d5d8f5952424a95a20fa0e66d45ec1dd7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 15:25:04 +0000
Subject: [PATCH] hwdata: upgrade 0.396 -> 0.397

---
 .../recipes-support/hwdata/{hwdata_0.396.bb => hwdata_0.397.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.396.bb => hwdata_0.397.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.396.bb b/meta/recipes-support/hwdata/hwdata_0.397.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.396.bb
rename to meta/recipes-support/hwdata/hwdata_0.397.bb
index bf6dd9889e..bd985c2a14 100644
--- a/meta/recipes-support/hwdata/hwdata_0.396.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.397.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "736513dfc1d44c5fb48bead62af7e91c4e1d1dd2"
+SRCREV = "e4423c783ca7db5c9d6d4881985272849f4892cf"
 
 inherit allarch
 
-- 
2.47.1


--===============1471447505737955364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.396 [default] to 0.397 [default]
packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.396" to "0.397"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.396 [default] to 0.397 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.396" to "0.397"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.396 [default] to 0.397 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.396" to "0.397"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.396 [default] to 0.397 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.396" to "0.397"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.396 [default] to 0.397 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.396" to "0.397"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.396 [default] to 0.397 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.396" to "0.397"
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 9971277 to 10005374 (+0%)
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.396 [default] to 0.397 [default]
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.396" to "0.397"
packages/all-poky-linux/hwdata: PKGV changed from 0.396 [default] to 0.397 [default]
packages/all-poky-linux/hwdata: PV changed from "0.396" to "0.397"
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.396" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.397"

--===============1471447505737955364==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.396-0.397.patch"

RnJvbSAyMDFhNWEwZDVkOGY1OTUyNDI0YTk1YTIwZmEwZTY2ZDQ1ZWMxZGQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTU6MjU6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
d2RhdGE6IHVwZ3JhZGUgMC4zOTYgLT4gMC4zOTcKCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC9o
d2RhdGEve2h3ZGF0YV8wLjM5Ni5iYiA9PiBod2RhdGFfMC4zOTcuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvaHdkYXRhL3tod2RhdGFfMC4zOTYuYmIgPT4gaHdkYXRhXzAuMzk3LmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC4z
OTYuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuMzk3LmJiCnNpbWls
YXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9o
d2RhdGFfMC4zOTYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2Rh
dGFfMC4zOTcuYmIKaW5kZXggYmY2ZGQ5ODg5ZS4uYmQ5ODVjMmExNCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjM5Ni5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuMzk3LmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb3ItbGF0ZXIgfCBYMTEiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT0xNTU2NTQ3NzExZTgyNDY5OTJiOTk5ZWRkOTQ0NWE1NyIKIAogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL3ZjcmhvbmVrLyR7QlBOfS5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90
b2NvbD1odHRwczt0YWc9diR7UFZ9IgotU1JDUkVWID0gIjczNjUxM2RmYzFkNDRjNWZiNDhiZWFk
NjJhZjdlOTFjNGUxZDFkZDIiCitTUkNSRVYgPSAiZTQ0MjNjNzgzY2E3ZGI1YzlkNmQ0ODgxOTg1
MjcyODQ5ZjQ4OTJjZiIKIAogaW5oZXJpdCBhbGxhcmNoCiAKLS0gCjIuNDcuMQoK

--===============1471447505737955364==--

