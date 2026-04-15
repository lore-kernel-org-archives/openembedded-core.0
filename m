Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3FDF4383A
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:57 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19750.1776261894376581615
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mY3CbAtf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EO8/4RqL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019d91758ef2-63c4cc41-e452-4e56-adf8-a80c02cb1a38-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZDNgPQHbYGb5kNQWz6SAj5Hr1uVdUXIqwpEqlfXKehI=;
	b=mY3CbAtf6a24k12Um0B3G5GtPC1Vhmxt2HQaiu/gVS0gNlojcbDaDaGu5SauTPpD
	/whalfCSZ+3q55eT1Fr1KpcrJKHEapUY1YmYPAENDw4C5zhEVD5kipZoPTdX3HwloSt
	GqMlHNSn+xYmW5bOpV8AlNVpDYQ3GGBz5+ZsKK0Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261893;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZDNgPQHbYGb5kNQWz6SAj5Hr1uVdUXIqwpEqlfXKehI=;
	b=EO8/4RqLuajvWqQFRWM0Xff+bwmbADP7aRzRsOjTuvG1yHaXGyyTpEpjbzuHi90G
	XGeiEWYNgmqJs+NQNjy9wEUg/927zIQEKxJwjd67aEkWk/EAT8lIQIzLVPku5t4dNVt
	+sl90YTRsuLC9Ipp76LKT4bKe1S+zUnE+iJYjAD4=
Content-Type: multipart/mixed; boundary="===============7024858252860180403=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hfranco@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.406 SUCCEEDED
Message-ID: <0101019d91758ef2-63c4cc41-e452-4e56-adf8-a80c02cb1a38-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235298

--===============7024858252860180403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwdata* to *0.406* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.405-0.406.patch
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
From d28c9acec11ca515089a506098a7a6017fadd6b5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 13:05:07 +0000
Subject: [PATCH] hwdata: upgrade 0.405 -> 0.406

---
 .../recipes-support/hwdata/{hwdata_0.405.bb => hwdata_0.406.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.405.bb => hwdata_0.406.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.405.bb b/meta/recipes-support/hwdata/hwdata_0.406.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.405.bb
rename to meta/recipes-support/hwdata/hwdata_0.406.bb
index 7247e9f365..602ab7c9e2 100644
--- a/meta/recipes-support/hwdata/hwdata_0.405.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.406.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "be46d7186e918e62eb75de399e800145a781c8db"
+SRCREV = "9ae3b9da5cbb93eed30f812aa7edb4b9ad3e3868"
 
 inherit allarch
 
-- 
2.47.1


--===============7024858252860180403==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.405-0.406.patch"

RnJvbSBkMjhjOWFjZWMxMWNhNTE1MDg5YTUwNjA5OGE3YTYwMTdmYWRkNmI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTM6MDU6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
d2RhdGE6IHVwZ3JhZGUgMC40MDUgLT4gMC40MDYKCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC9o
d2RhdGEve2h3ZGF0YV8wLjQwNS5iYiA9PiBod2RhdGFfMC40MDYuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvaHdkYXRhL3tod2RhdGFfMC40MDUuYmIgPT4gaHdkYXRhXzAuNDA2LmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC40
MDUuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuNDA2LmJiCnNpbWls
YXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9o
d2RhdGFfMC40MDUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2Rh
dGFfMC40MDYuYmIKaW5kZXggNzI0N2U5ZjM2NS4uNjAyYWI3YzllMiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjQwNS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuNDA2LmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb3ItbGF0ZXIgfCBYMTEiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT0xNTU2NTQ3NzExZTgyNDY5OTJiOTk5ZWRkOTQ0NWE1NyIKIAogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL3ZjcmhvbmVrLyR7QlBOfS5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90
b2NvbD1odHRwczt0YWc9diR7UFZ9IgotU1JDUkVWID0gImJlNDZkNzE4NmU5MThlNjJlYjc1ZGUz
OTllODAwMTQ1YTc4MWM4ZGIiCitTUkNSRVYgPSAiOWFlM2I5ZGE1Y2JiOTNlZWQzMGY4MTJhYTdl
ZGI0YjlhZDNlMzg2OCIKIAogaW5oZXJpdCBhbGxhcmNoCiAKLS0gCjIuNDcuMQoK

--===============7024858252860180403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.405 [default] to 0.406 [default]
packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.405" to "0.406"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.405 [default] to 0.406 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.405" to "0.406"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.405 [default] to 0.406 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.405" to "0.406"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.405 [default] to 0.406 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.405" to "0.406"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.405 [default] to 0.406 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.405" to "0.406"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.405 [default] to 0.406 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.405" to "0.406"
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.405 [default] to 0.406 [default]
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.405" to "0.406"
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 10288972 to 10329347 (+0%)
packages/all-poky-linux/hwdata: PKGV changed from 0.405 [default] to 0.406 [default]
packages/all-poky-linux/hwdata: PV changed from "0.405" to "0.406"
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.405" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.406"

--===============7024858252860180403==--

