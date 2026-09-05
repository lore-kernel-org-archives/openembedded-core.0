Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A55C79F85
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 06:28:38 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3452.1788589717902792291
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 23:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QLevlC7H;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YdkC7Pfn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a070413628-a5a052eb-e27d-471c-b71f-b3a5aab84cd5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788589717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AA4AsSiz2fPYyly3bZ55jH2XOzSNrWbJvA/Ch1w68aI=;
	b=QLevlC7H0ot9kWqiRsr7+uJUb7g7/aINLKHlwrW4vEUZY1maEsu/7GY+7D2Op0uG
	OQDkgn+fLA63qRnNG2AGoO/v4ZOAlKbRKTiOIXxTEijU9rScvh29LirOll3+ShOohFU
	W5fh8F/Ut+Dc5bkCMZqVOqfREOnxJfuk3JDRYn34=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788589717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AA4AsSiz2fPYyly3bZ55jH2XOzSNrWbJvA/Ch1w68aI=;
	b=YdkC7Pfn3cpTehSqr7BxOcZDZw+/FwCoTNQeKXFlyW7nDb+WcIx0i14UQ5crBjWG
	Iri00Jvr1etYeKpFpANuCiJVxNvm2FdNDrbIxSIbEEpITKUlhMvtubreY7ywBQjtVRL
	3IV3t+T0RXPxr0Qb4irvLX4y4vBbpNpiLp8rbHPE=
Content-Type: multipart/mixed; boundary="===============3998384247033537639=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hfranco@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.411 SUCCEEDED
Message-ID: <010101a070413628-a5a052eb-e27d-471c-b71f-b3a5aab84cd5-000000@us-west-2.amazonses.com>
Date: Sat, 5 Sep 2026 06:28:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.05-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 06:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245138

--===============3998384247033537639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwdata* to *0.411* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.410-0.411.patch
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
From 7b7511a09b16487c662368fa65caf013ae6dbbcc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 5 Sep 2026 06:25:06 +0000
Subject: [PATCH] hwdata: upgrade 0.410 -> 0.411

7fc63d4 Update pci and vendor ids
---
 .../recipes-support/hwdata/{hwdata_0.410.bb => hwdata_0.411.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.410.bb => hwdata_0.411.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.410.bb b/meta/recipes-support/hwdata/hwdata_0.411.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.410.bb
rename to meta/recipes-support/hwdata/hwdata_0.411.bb
index a34724abea..b83c11f09d 100644
--- a/meta/recipes-support/hwdata/hwdata_0.410.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.411.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later OR X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "8bb6c48dc2e683777e625d1c9ef02c1b25b741cd"
+SRCREV = "7fc63d411377e40aab66bfbf77dce6a439c3fe87"
 
 inherit allarch
 
-- 
2.47.1


--===============3998384247033537639==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.410-0.411.patch"

RnJvbSA3Yjc1MTFhMDliMTY0ODdjNjYyMzY4ZmE2NWNhZjAxM2FlNmRiYmNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNSBTZXAgMjAyNiAwNjoyNTowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGh3
ZGF0YTogdXBncmFkZSAwLjQxMCAtPiAwLjQxMQoKN2ZjNjNkNCBVcGRhdGUgcGNpIGFuZCB2ZW5k
b3IgaWRzCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC9od2RhdGEve2h3ZGF0YV8wLjQxMC5iYiA9
PiBod2RhdGFfMC40MTEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL3tod2Rh
dGFfMC40MTAuYmIgPT4gaHdkYXRhXzAuNDExLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC40MTAuYmIgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9od2RhdGEvaHdkYXRhXzAuNDExLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC40MTAuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC40MTEuYmIKaW5kZXggYTM0NzI0
YWJlYS4uYjgzYzExZjA5ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRh
L2h3ZGF0YV8wLjQxMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRh
XzAuNDExLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNFID0gIkdQTC0yLjAtb3ItbGF0ZXIgT1Ig
WDExIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MTU1NjU0NzcxMWU4
MjQ2OTkyYjk5OWVkZDk0NDVhNTciCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS92Y3Jo
b25lay8ke0JQTn0uZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHM7dGFnPXYke1BWfSIK
LVNSQ1JFViA9ICI4YmI2YzQ4ZGMyZTY4Mzc3N2U2MjVkMWM5ZWYwMmMxYjI1Yjc0MWNkIgorU1JD
UkVWID0gIjdmYzYzZDQxMTM3N2U0MGFhYjY2YmZiZjc3ZGNlNmE0MzljM2ZlODciCiAKIGluaGVy
aXQgYWxsYXJjaAogCi0tIAoyLjQ3LjEKCg==

--===============3998384247033537639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.410 [default] to 0.411 [default]
packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.410" to "0.411"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.410 [default] to 0.411 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.410" to "0.411"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.410 [default] to 0.411 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.410" to "0.411"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.410 [default] to 0.411 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.410" to "0.411"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.410 [default] to 0.411 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.410" to "0.411"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.410 [default] to 0.411 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.410" to "0.411"
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 10511826 to 10556262 (+0%)
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.410 [default] to 0.411 [default]
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.410" to "0.411"
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.410" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.411"
packages/all-poky-linux/hwdata: PKGV changed from 0.410 [default] to 0.411 [default]
packages/all-poky-linux/hwdata: PV changed from "0.410" to "0.411"

--===============3998384247033537639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="hwdata-changelog.txt"

Changelog for hwdata: 0.410 -> 0.411

7fc63d4 Update pci and vendor ids

--===============3998384247033537639==--

