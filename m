Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C4CD5C0F4
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:50 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17390.1765872134595423694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=3R5hlwrK;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=G+cuu1Bn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b262eebd2-d12a3a9b-d545-475e-bd77-b4105f03ca1b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=redLk5tvoEkgGPtlCvpzfnSMXDPp2yesSjsK3vuu9NM=;
	b=3R5hlwrKO77//LCnIi0XQWj5BnhetPXg1c6tRfBKa3CECzFC4nRb/FdD1y6JMOAx
	67CoRRao4J6c6qPZ2Jc8XtGs6oS68ALXdSf4NMMxz6+TcXebFkR1KCc5RVnPnxZBCU9
	5K3hWWCyt5VtBseK+lDlxdttitG8RQoPYewiNesY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=redLk5tvoEkgGPtlCvpzfnSMXDPp2yesSjsK3vuu9NM=;
	b=G+cuu1Bn3nsQNG+eM0dmd0MGWNdg2Lv8SH32NJB4S+yilO45nB/YFUWQ1yUQlPU8
	fXtF24oVWPzV2a761nOPWKLuJGf15Db5LafYNrI9UHidCXeNJSUmZ5agnVCPNizU6mr
	BuF6EvYvLWAote1u4FdtfLVDeBuYq2C+VOkQVDx4=
Content-Type: multipart/mixed; boundary="===============1104506655522802650=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hiago.franco@toradex.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.402 SUCCEEDED
Message-ID: <0101019b262eebd2-d12a3a9b-d545-475e-bd77-b4105f03ca1b-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227909

--===============1104506655522802650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwdata* to *0.402* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.399-0.402.patch
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
From 75e06e064a4637616a88df8f899716289accaa36 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 07:01:06 +0000
Subject: [PATCH] hwdata: upgrade 0.399 -> 0.402

---
 .../recipes-support/hwdata/{hwdata_0.399.bb => hwdata_0.402.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.399.bb => hwdata_0.402.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.399.bb b/meta/recipes-support/hwdata/hwdata_0.402.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.399.bb
rename to meta/recipes-support/hwdata/hwdata_0.402.bb
index 81dede96ea..826c9b2e32 100644
--- a/meta/recipes-support/hwdata/hwdata_0.399.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.402.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "7ba0e54565843faee300ca885699e4c42ed674b2"
+SRCREV = "d263c183dd429bbe1572a91a8cf180e84b8341c6"
 
 inherit allarch
 
-- 
2.47.1


--===============1104506655522802650==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.399-0.402.patch"

RnJvbSA3NWUwNmUwNjRhNDYzNzYxNmE4OGRmOGY4OTk3MTYyODlhY2NhYTM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDc6MDE6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
d2RhdGE6IHVwZ3JhZGUgMC4zOTkgLT4gMC40MDIKCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC9o
d2RhdGEve2h3ZGF0YV8wLjM5OS5iYiA9PiBod2RhdGFfMC40MDIuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvaHdkYXRhL3tod2RhdGFfMC4zOTkuYmIgPT4gaHdkYXRhXzAuNDAyLmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC4z
OTkuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuNDAyLmJiCnNpbWls
YXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9o
d2RhdGFfMC4zOTkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2Rh
dGFfMC40MDIuYmIKaW5kZXggODFkZWRlOTZlYS4uODI2YzliMmUzMiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjM5OS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuNDAyLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb3ItbGF0ZXIgfCBYMTEiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT0xNTU2NTQ3NzExZTgyNDY5OTJiOTk5ZWRkOTQ0NWE1NyIKIAogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL3ZjcmhvbmVrLyR7QlBOfS5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90
b2NvbD1odHRwczt0YWc9diR7UFZ9IgotU1JDUkVWID0gIjdiYTBlNTQ1NjU4NDNmYWVlMzAwY2E4
ODU2OTllNGM0MmVkNjc0YjIiCitTUkNSRVYgPSAiZDI2M2MxODNkZDQyOWJiZTE1NzJhOTFhOGNm
MTgwZTg0YjgzNDFjNiIKIAogaW5oZXJpdCBhbGxhcmNoCiAKLS0gCjIuNDcuMQoK

--===============1104506655522802650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.399" to "0.402"
packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.399 [default] to 0.402 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.399" to "0.402"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.399 [default] to 0.402 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.399" to "0.402"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.399 [default] to 0.402 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.399" to "0.402"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.399 [default] to 0.402 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.399" to "0.402"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.399 [default] to 0.402 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.399" to "0.402"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.399 [default] to 0.402 [default]
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.399" to "0.402"
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.399 [default] to 0.402 [default]
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 10041198 to 10180599 (+1%)
packages/all-poky-linux/hwdata: PV changed from "0.399" to "0.402"
packages/all-poky-linux/hwdata: PKGV changed from 0.399 [default] to 0.402 [default]
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.399" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.402"

--===============1104506655522802650==--

