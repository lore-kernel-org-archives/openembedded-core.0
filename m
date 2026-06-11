Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB2CCD98E8
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:08 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50440.1781195523135000520
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DE0CwsOc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=O7U8RZZQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019eb786c235-c3be84cc-b5da-4f93-913a-31d53c97c97e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195522;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gDjPHTAVBXA2OoXUQQYpQ/jMezYS3bJSJQPYdXiwq6Q=;
	b=DE0CwsOcSPTaB7jKNsogNIq1ZirBmWm4E6HCm9wuNdwczAuo05i3ojSOY5Ro4110
	K2b8Zde9PL3YnLEAexit0Oa9ZcMFH79fIUxY0VHeWw1MKEpGUoomHxGKDZrYXJLjlo2
	nIXBrbYLAdPg2NKnh+DyOsXeWlDcZfMP75tgQHDo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195522;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gDjPHTAVBXA2OoXUQQYpQ/jMezYS3bJSJQPYdXiwq6Q=;
	b=O7U8RZZQKxWxmd0pTO41gkyjXnCf+vdwL/wlnJWAG1SGgVW2J1EDJqGv1IXHlXYp
	j3O/hQE9yvwOfJIXbWOJ/A0SoiS9esplZaue8ktN3x8ny0HEV/7QtKus/Hc7VEAhL2G
	Mrjk2LwAy8gKry8CkAWnjpY/jCjC70vGsVNJ0IDU=
Content-Type: multipart/mixed; boundary="===============8352545922524372896=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hfranco@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.408 SUCCEEDED
Message-ID: <0101019eb786c235-c3be84cc-b5da-4f93-913a-31d53c97c97e-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:32:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238568

--===============8352545922524372896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwdata* to *0.408* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.406-0.408.patch
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
From c0d4ce962437efe959df6685c7fcb8e08ed39f69 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 15:19:29 +0000
Subject: [PATCH] hwdata: upgrade 0.406 -> 0.408

---
 .../recipes-support/hwdata/{hwdata_0.406.bb => hwdata_0.408.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.406.bb => hwdata_0.408.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.406.bb b/meta/recipes-support/hwdata/hwdata_0.408.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.406.bb
rename to meta/recipes-support/hwdata/hwdata_0.408.bb
index 602ab7c9e2..5cb082d5c9 100644
--- a/meta/recipes-support/hwdata/hwdata_0.406.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.408.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "9ae3b9da5cbb93eed30f812aa7edb4b9ad3e3868"
+SRCREV = "4456b256a1a5b1d1c1c1a60a9f69c59f7743c522"
 
 inherit allarch
 
-- 
2.47.1


--===============8352545922524372896==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.406-0.408.patch"

RnJvbSBjMGQ0Y2U5NjI0MzdlZmU5NTlkZjY2ODVjN2ZjYjhlMDhlZDM5ZjY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTU6MTk6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
d2RhdGE6IHVwZ3JhZGUgMC40MDYgLT4gMC40MDgKCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC9o
d2RhdGEve2h3ZGF0YV8wLjQwNi5iYiA9PiBod2RhdGFfMC40MDguYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvaHdkYXRhL3tod2RhdGFfMC40MDYuYmIgPT4gaHdkYXRhXzAuNDA4LmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC40
MDYuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuNDA4LmJiCnNpbWls
YXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9o
d2RhdGFfMC40MDYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2Rh
dGFfMC40MDguYmIKaW5kZXggNjAyYWI3YzllMi4uNWNiMDgyZDVjOSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjQwNi5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuNDA4LmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb3ItbGF0ZXIgfCBYMTEiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT0xNTU2NTQ3NzExZTgyNDY5OTJiOTk5ZWRkOTQ0NWE1NyIKIAogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL3ZjcmhvbmVrLyR7QlBOfS5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90
b2NvbD1odHRwczt0YWc9diR7UFZ9IgotU1JDUkVWID0gIjlhZTNiOWRhNWNiYjkzZWVkMzBmODEy
YWE3ZWRiNGI5YWQzZTM4NjgiCitTUkNSRVYgPSAiNDQ1NmIyNTZhMWE1YjFkMWMxYzFhNjBhOWY2
OWM1OWY3NzQzYzUyMiIKIAogaW5oZXJpdCBhbGxhcmNoCiAKLS0gCjIuNDcuMQoK

--===============8352545922524372896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.406 [default] to 0.408 [default]
packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.406" to "0.408"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.406 [default] to 0.408 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.406" to "0.408"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.406 [default] to 0.408 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.406" to "0.408"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.406 [default] to 0.408 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.406" to "0.408"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.406 [default] to 0.408 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.406" to "0.408"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.406 [default] to 0.408 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.406" to "0.408"
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.406 [default] to 0.408 [default]
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 10329347 to 10425035 (+1%)
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.406" to "0.408"
packages/all-poky-linux/hwdata: PKGV changed from 0.406 [default] to 0.408 [default]
packages/all-poky-linux/hwdata: PV changed from "0.406" to "0.408"
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.406" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.408"

--===============8352545922524372896==--

