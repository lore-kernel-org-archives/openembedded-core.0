Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D999EFCBC7
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:42:09 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28988.1773582128288394686
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bsMJK23T;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=l5s0x8s3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019cf1bb9230-dd7f8ef9-e0f8-4ccb-91f1-796871621cec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1773582127;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=80R6KikhboCE1f9PcdM5J2B4JLUUophB9OZVBVaLcGY=;
	b=bsMJK23TZcLDLRTb2m7Vsai/CCJASzGSb/zmBZVIxJDj1HPZRkwHNq8KjC5I/kka
	RtXZn3+x9DHobRT533jbesCwbh42mB9rwu9PqdHH94qQKbYFoxlrnXeWMrRe5HKhxet
	cpDB9OxztZPhRVjHq6/iqUEx/WXIzeyt/ouPCUaU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1773582127;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=80R6KikhboCE1f9PcdM5J2B4JLUUophB9OZVBVaLcGY=;
	b=l5s0x8s3mUYYUt+raLfgjcK/o8kKhpa9s4+BbOEpmBwagI10d34Mnt7jdtFu/GyT
	26xcEVu+ts6QuvxhYjTUCTYSmb0PrA64nw7t51G2EzLfBMIBRJTfUBtkbFzRCxNLxhz
	5Zhcovucs0D8jSRJ+/21sF2pOvtoE2ToxcDQwlbI=
Content-Type: multipart/mixed; boundary="===============4823936680068656980=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hfranco@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.405 SUCCEEDED
Message-ID: <0101019cf1bb9230-dd7f8ef9-e0f8-4ccb-91f1-796871621cec-000000@us-west-2.amazonses.com>
Date: Sun, 15 Mar 2026 13:42:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.03.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233191

--===============4823936680068656980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwdata* to *0.405* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.404-0.405.patch
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
From 84089c9df13640b058018252810714723b437199 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Mar 2026 13:08:24 +0000
Subject: [PATCH] hwdata: upgrade 0.404 -> 0.405

---
 .../recipes-support/hwdata/{hwdata_0.404.bb => hwdata_0.405.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.404.bb => hwdata_0.405.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.404.bb b/meta/recipes-support/hwdata/hwdata_0.405.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.404.bb
rename to meta/recipes-support/hwdata/hwdata_0.405.bb
index 04b9da8a40..7247e9f365 100644
--- a/meta/recipes-support/hwdata/hwdata_0.404.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.405.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "428ad3882fff801c553fc575d99bcdb2edbd41f7"
+SRCREV = "be46d7186e918e62eb75de399e800145a781c8db"
 
 inherit allarch
 
-- 
2.47.1


--===============4823936680068656980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.404" to "0.405"
packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.404 [default] to 0.405 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.404" to "0.405"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.404 [default] to 0.405 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.404" to "0.405"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.404 [default] to 0.405 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.404" to "0.405"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.404 [default] to 0.405 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.404" to "0.405"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.404 [default] to 0.405 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.404" to "0.405"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.404 [default] to 0.405 [default]
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 10270183 to 10288972 (+0%)
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.404" to "0.405"
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.404 [default] to 0.405 [default]
packages/all-poky-linux/hwdata: PV changed from "0.404" to "0.405"
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.404" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.405"
packages/all-poky-linux/hwdata: PKGV changed from 0.404 [default] to 0.405 [default]

--===============4823936680068656980==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.404-0.405.patch"

RnJvbSA4NDA4OWM5ZGYxMzY0MGIwNTgwMTgyNTI4MTA3MTQ3MjNiNDM3MTk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTWFyIDIwMjYgMTM6MDg6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
d2RhdGE6IHVwZ3JhZGUgMC40MDQgLT4gMC40MDUKCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC9o
d2RhdGEve2h3ZGF0YV8wLjQwNC5iYiA9PiBod2RhdGFfMC40MDUuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvaHdkYXRhL3tod2RhdGFfMC40MDQuYmIgPT4gaHdkYXRhXzAuNDA1LmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC40
MDQuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuNDA1LmJiCnNpbWls
YXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9o
d2RhdGFfMC40MDQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2Rh
dGFfMC40MDUuYmIKaW5kZXggMDRiOWRhOGE0MC4uNzI0N2U5ZjM2NSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjQwNC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuNDA1LmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb3ItbGF0ZXIgfCBYMTEiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT0xNTU2NTQ3NzExZTgyNDY5OTJiOTk5ZWRkOTQ0NWE1NyIKIAogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL3ZjcmhvbmVrLyR7QlBOfS5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90
b2NvbD1odHRwczt0YWc9diR7UFZ9IgotU1JDUkVWID0gIjQyOGFkMzg4MmZmZjgwMWM1NTNmYzU3
NWQ5OWJjZGIyZWRiZDQxZjciCitTUkNSRVYgPSAiYmU0NmQ3MTg2ZTkxOGU2MmViNzVkZTM5OWU4
MDAxNDVhNzgxYzhkYiIKIAogaW5oZXJpdCBhbGxhcmNoCiAKLS0gCjIuNDcuMQoK

--===============4823936680068656980==--

