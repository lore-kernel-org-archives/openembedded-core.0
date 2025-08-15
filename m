Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CEDCA0FF5
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:23 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.11327.1755263222007256629
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=o7Hvnfb1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hTrckTRK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010198add78bd6-2c00d831-02f5-4f66-b132-0e716f3afca6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263241;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QZ/mY/fqP43Io95ZvWohmntE+l8YiPSddib9PsvHUo4=;
	b=o7Hvnfb1IOj0g6gEOwQPTcSzckaohKf/139OfRoZl/YGeIsizM4sxuoF1oAhx8mj
	ykNjI9iDJ+L+shZFyMAHr/xJHXACiK15QsJoO+nPvuWCAjeK6ZZt6buLMCts/QNSHu2
	BayRWmspirzNbjbOSPjFrotNGWmGuQmeRTDPByTQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263241;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QZ/mY/fqP43Io95ZvWohmntE+l8YiPSddib9PsvHUo4=;
	b=hTrckTRKfIQ+7gdf7lp0wXwnjlAaCA7mNLBR90MH2Ck5HitEKeDFemciz+8k1ZMw
	RXC6U2SLRwQWSZwDhpITtgptbOwa5QM6U7a/kmqUbgm54queICJxh8RmULISqetrDLt
	2hXXr97+9FhjPKFWuGN9Au7ZHxokz5fNVOEx4u98=
Content-Type: multipart/mixed; boundary="===============4745440662516904968=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hiago.franco@toradex.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.398 SUCCEEDED
Message-ID: <01010198add78bd6-2c00d831-02f5-4f66-b132-0e716f3afca6-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221960

--===============4745440662516904968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwdata* to *0.398* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.397-0.398.patch
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
From b6d94e27b529b9c018fefba0a2e262c398d1fe4f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 12:50:14 +0000
Subject: [PATCH] hwdata: upgrade 0.397 -> 0.398

---
 .../recipes-support/hwdata/{hwdata_0.397.bb => hwdata_0.398.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.397.bb => hwdata_0.398.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.397.bb b/meta/recipes-support/hwdata/hwdata_0.398.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.397.bb
rename to meta/recipes-support/hwdata/hwdata_0.398.bb
index bd985c2a14..a0abf4c03b 100644
--- a/meta/recipes-support/hwdata/hwdata_0.397.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.398.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "e4423c783ca7db5c9d6d4881985272849f4892cf"
+SRCREV = "4c97c196390e16a84d3394e7e6f0608046f7ba81"
 
 inherit allarch
 
-- 
2.47.1


--===============4745440662516904968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.397 [default] to 0.398 [default]
packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.397" to "0.398"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.397 [default] to 0.398 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.397" to "0.398"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.397 [default] to 0.398 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.397" to "0.398"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.397 [default] to 0.398 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.397" to "0.398"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.397 [default] to 0.398 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.397" to "0.398"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.397 [default] to 0.398 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.397" to "0.398"
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 10005374 to 10041180 (+0%)
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.397 [default] to 0.398 [default]
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.397" to "0.398"
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.397" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.398"
packages/all-poky-linux/hwdata: PKGV changed from 0.397 [default] to 0.398 [default]
packages/all-poky-linux/hwdata: PV changed from "0.397" to "0.398"

--===============4745440662516904968==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.397-0.398.patch"

RnJvbSBiNmQ5NGUyN2I1MjliOWMwMThmZWZiYTBhMmUyNjJjMzk4ZDFmZTRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMTI6NTA6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
d2RhdGE6IHVwZ3JhZGUgMC4zOTcgLT4gMC4zOTgKCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC9o
d2RhdGEve2h3ZGF0YV8wLjM5Ny5iYiA9PiBod2RhdGFfMC4zOTguYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvaHdkYXRhL3tod2RhdGFfMC4zOTcuYmIgPT4gaHdkYXRhXzAuMzk4LmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC4z
OTcuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuMzk4LmJiCnNpbWls
YXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9o
d2RhdGFfMC4zOTcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2Rh
dGFfMC4zOTguYmIKaW5kZXggYmQ5ODVjMmExNC4uYTBhYmY0YzAzYiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjM5Ny5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuMzk4LmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb3ItbGF0ZXIgfCBYMTEiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT0xNTU2NTQ3NzExZTgyNDY5OTJiOTk5ZWRkOTQ0NWE1NyIKIAogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL3ZjcmhvbmVrLyR7QlBOfS5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90
b2NvbD1odHRwczt0YWc9diR7UFZ9IgotU1JDUkVWID0gImU0NDIzYzc4M2NhN2RiNWM5ZDZkNDg4
MTk4NTI3Mjg0OWY0ODkyY2YiCitTUkNSRVYgPSAiNGM5N2MxOTYzOTBlMTZhODRkMzM5NGU3ZTZm
MDYwODA0NmY3YmE4MSIKIAogaW5oZXJpdCBhbGxhcmNoCiAKLS0gCjIuNDcuMQoK

--===============4745440662516904968==--

