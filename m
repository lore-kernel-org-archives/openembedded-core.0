Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF94ECD5BB6
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:49 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34749.1778851223006143454
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LTpv4qcq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NwHHlum5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e2bcbe1a8-7b90d4b3-77cf-4c7b-b1be-819bc60b0913-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851242;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=J4Q7PLTwyoNQ/AZ3GolZWntCgDUGBZmCl0/NoDbYuKM=;
	b=LTpv4qcqnTExmYjrOUyIN5jco5ACttlq5Fi32EMzGty03I/ZS8O/7zXSJLYUuzQn
	TEk1bNSfbEhlgVThJXikSHwK83veX9VKTv6nuevHuBLNKN2OTcjTZskRogfK6nEXnP9
	dmgHQpFJrYAmei4bTTZQyDZdn+aKUkI7j+BguMCQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851242;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=J4Q7PLTwyoNQ/AZ3GolZWntCgDUGBZmCl0/NoDbYuKM=;
	b=NwHHlum5xnjb5N+in+zDun4wDT/zoZ0fLr11/mGCXhaQOMMF0NB9OJCJXMfti7cS
	2m0pRS22aQ2dASvgasVLPk5T4Lt7O/rkaILJNQohzh/bmVwUQAKmTmt4LBjS+7aVCTv
	cql9II9IBXAE/Ko4qTbXuPafZ2Qavsb9Mwl3sllk=
Content-Type: multipart/mixed; boundary="===============0439675777772303029=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hfranco@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.407 SUCCEEDED
Message-ID: <0101019e2bcbe1a8-7b90d4b3-77cf-4c7b-b1be-819bc60b0913-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237163

--===============0439675777772303029==
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
From 31ad211e933883fed55039cf30c2da6d86b3ce1d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 12:26:03 +0000
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


--===============0439675777772303029==
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
packages/all-poky-linux/hwdata: PKGV changed from 0.406 [default] to 0.407 [default]
packages/all-poky-linux/hwdata: PV changed from "0.406" to "0.407"
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.406" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.407"

--===============0439675777772303029==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.406-0.407.patch"

RnJvbSAzMWFkMjExZTkzMzg4M2ZlZDU1MDM5Y2YzMGMyZGE2ZDg2YjNjZTFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMTI6MjY6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
d2RhdGE6IHVwZ3JhZGUgMC40MDYgLT4gMC40MDcKCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC9o
d2RhdGEve2h3ZGF0YV8wLjQwNi5iYiA9PiBod2RhdGFfMC40MDcuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvaHdkYXRhL3tod2RhdGFfMC40MDYuYmIgPT4gaHdkYXRhXzAuNDA3LmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC40
MDYuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuNDA3LmJiCnNpbWls
YXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9o
d2RhdGFfMC40MDYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2Rh
dGFfMC40MDcuYmIKaW5kZXggNjAyYWI3YzllMi4uZDRlYzY4MGY2ZSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjQwNi5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuNDA3LmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb3ItbGF0ZXIgfCBYMTEiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT0xNTU2NTQ3NzExZTgyNDY5OTJiOTk5ZWRkOTQ0NWE1NyIKIAogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL3ZjcmhvbmVrLyR7QlBOfS5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90
b2NvbD1odHRwczt0YWc9diR7UFZ9IgotU1JDUkVWID0gIjlhZTNiOWRhNWNiYjkzZWVkMzBmODEy
YWE3ZWRiNGI5YWQzZTM4NjgiCitTUkNSRVYgPSAiYTliYmU0ZDg2MTllOWE3M2RjNDMzZGIyZDJh
ZmNlZGE4Y2JlYWUxMCIKIAogaW5oZXJpdCBhbGxhcmNoCiAKLS0gCjIuNDcuMQoK

--===============0439675777772303029==--

