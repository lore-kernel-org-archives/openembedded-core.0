Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE65C531F9
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:01 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1428.1771440109058787062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IFhiyQB4;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=GKJli1q8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019c720f07cf-6767e43b-a52b-4d18-98ee-40d76d5fecea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9q/x1vh+HIs62k4hXLDK6W7EMs/1l6n2XpeqcNfBBiQ=;
	b=IFhiyQB4uWat3RzJ28fTpFyk/Dwn4QPGx29EQBw9xNe/B0qP70et8QGQxiZ3bHox
	GjqoZjwPBmj/ezKuMz58XKmMwGWIjtfDLJ9akUyLhj3iJwwxQkwLwpCJRtV8XXRkS7Y
	dpbrIjahj0IC9w1Jea+yyjihafYIAo1nNORsix88=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9q/x1vh+HIs62k4hXLDK6W7EMs/1l6n2XpeqcNfBBiQ=;
	b=GKJli1q8Rd7eeubhDi9UfxJlFipoHY+0sG4+kTlDxTFwdufbRxh2fxdwoDbDVkOP
	wy+gIrWntaP26dsSst5NdPuhK4ddFeEeB4bGseSCar2a8LnY058uqowb4RuDM9J+lBu
	fqtdwm0JN8t9+rBnPchWoYAHYL7nDQPTGEYX3U74=
Content-Type: multipart/mixed; boundary="===============5110385287598101650=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hfranco@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.404 SUCCEEDED
Message-ID: <0101019c720f07cf-6767e43b-a52b-4d18-98ee-40d76d5fecea-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231402

--===============5110385287598101650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwdata* to *0.404* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.403-0.404.patch
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
From cf1624098bf93e64aacc203b37bdde1e7af41080 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 18:11:47 +0000
Subject: [PATCH] hwdata: upgrade 0.403 -> 0.404

---
 .../recipes-support/hwdata/{hwdata_0.403.bb => hwdata_0.404.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.403.bb => hwdata_0.404.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.403.bb b/meta/recipes-support/hwdata/hwdata_0.404.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.403.bb
rename to meta/recipes-support/hwdata/hwdata_0.404.bb
index f95146648f..04b9da8a40 100644
--- a/meta/recipes-support/hwdata/hwdata_0.403.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.404.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "bb56be59220b34d79160b73bd24eb36952dc8c63"
+SRCREV = "428ad3882fff801c553fc575d99bcdb2edbd41f7"
 
 inherit allarch
 
-- 
2.47.1


--===============5110385287598101650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.403 [default] to 0.404 [default]
packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.403" to "0.404"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.403 [default] to 0.404 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.403" to "0.404"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.403 [default] to 0.404 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.403" to "0.404"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.403 [default] to 0.404 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.403" to "0.404"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.403 [default] to 0.404 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.403" to "0.404"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.403 [default] to 0.404 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.403" to "0.404"
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.403 [default] to 0.404 [default]
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 10227146 to 10270183 (+0%)
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.403" to "0.404"
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.403" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.404"
packages/all-poky-linux/hwdata: PKGV changed from 0.403 [default] to 0.404 [default]
packages/all-poky-linux/hwdata: PV changed from "0.403" to "0.404"

--===============5110385287598101650==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.403-0.404.patch"

RnJvbSBjZjE2MjQwOThiZjkzZTY0YWFjYzIwM2IzN2JkZGUxZTdhZjQxMDgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTg6MTE6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
d2RhdGE6IHVwZ3JhZGUgMC40MDMgLT4gMC40MDQKCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC9o
d2RhdGEve2h3ZGF0YV8wLjQwMy5iYiA9PiBod2RhdGFfMC40MDQuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvaHdkYXRhL3tod2RhdGFfMC40MDMuYmIgPT4gaHdkYXRhXzAuNDA0LmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC40
MDMuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuNDA0LmJiCnNpbWls
YXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9o
d2RhdGFfMC40MDMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2Rh
dGFfMC40MDQuYmIKaW5kZXggZjk1MTQ2NjQ4Zi4uMDRiOWRhOGE0MCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjQwMy5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuNDA0LmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb3ItbGF0ZXIgfCBYMTEiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT0xNTU2NTQ3NzExZTgyNDY5OTJiOTk5ZWRkOTQ0NWE1NyIKIAogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL3ZjcmhvbmVrLyR7QlBOfS5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90
b2NvbD1odHRwczt0YWc9diR7UFZ9IgotU1JDUkVWID0gImJiNTZiZTU5MjIwYjM0ZDc5MTYwYjcz
YmQyNGViMzY5NTJkYzhjNjMiCitTUkNSRVYgPSAiNDI4YWQzODgyZmZmODAxYzU1M2ZjNTc1ZDk5
YmNkYjJlZGJkNDFmNyIKIAogaW5oZXJpdCBhbGxhcmNoCiAKLS0gCjIuNDcuMQoK

--===============5110385287598101650==--

