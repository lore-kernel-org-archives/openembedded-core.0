Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEE8CEDD9A
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:17 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12119.1763224719787781609
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=umT3Lsbn;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=FEZ8fqJ2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019a886290f7-6a44bdf1-4888-4e04-9565-6d7e719883ae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224752;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=l6Mf037PzLzJOjitO099EbdIf6xlh9JLXlLqZ8yJMEY=;
	b=umT3Lsbn7UN34AnpmMzxc7PHi+mCqe7gx1gDF766cYm9KdRC/0ldvQRZS/idto/B
	GRT0A053slHzgdjCMpilnMY42xqSbNCp3CBHAbYt2doRW99KpU18RmyJLJzE6rvYeT8
	1zz5qwYH10shwB2njc7hqR7RGSno4+VyLXD7UKk4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224752;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=l6Mf037PzLzJOjitO099EbdIf6xlh9JLXlLqZ8yJMEY=;
	b=FEZ8fqJ2KUiMmMSnKGSXC3RaDjDUNGzSAuegho5bsheGwUJbUxagN56yhNA6gflf
	SbFeYWpOIewnLA4UK1dkjXfL20q3HXicWGnLeqQ5jGhzsAw1CAQdpNV3cfwvTfN6RQd
	EeXfuSSQXV6ZhBtDgcsDUbUa0ZrkCDC0citeQUV8=
Content-Type: multipart/mixed; boundary="===============2966784411833877396=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hiago De Franco <hiago.franco@toradex.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] hwdata: upgrading to 0.401 SUCCEEDED
Message-ID: <0101019a886290f7-6a44bdf1-4888-4e04-9565-6d7e719883ae-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226449

--===============2966784411833877396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *hwdata* to *0.401* has Succeeded.

Next steps:
    - apply the patch: git am 0001-hwdata-upgrade-0.399-0.401.patch
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
From 45bed72008f758fc3b386d305cb1e821927ac666 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 15:52:53 +0000
Subject: [PATCH] hwdata: upgrade 0.399 -> 0.401

---
 .../recipes-support/hwdata/{hwdata_0.399.bb => hwdata_0.401.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.399.bb => hwdata_0.401.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.399.bb b/meta/recipes-support/hwdata/hwdata_0.401.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.399.bb
rename to meta/recipes-support/hwdata/hwdata_0.401.bb
index 81dede96ea..fe4514255e 100644
--- a/meta/recipes-support/hwdata/hwdata_0.399.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.401.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "7ba0e54565843faee300ca885699e4c42ed674b2"
+SRCREV = "aa9d811f543d447a1abb97d1b94c10e212f933c1"
 
 inherit allarch
 
-- 
2.47.1


--===============2966784411833877396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/hwdata/hwdata-dbg: PKGV changed from 0.399 [default] to 0.401 [default]
packages/all-poky-linux/hwdata/hwdata-dbg: PV changed from "0.399" to "0.401"
packages/all-poky-linux/hwdata/hwdata-dev: PKGV changed from 0.399 [default] to 0.401 [default]
packages/all-poky-linux/hwdata/hwdata-dev: PV changed from "0.399" to "0.401"
packages/all-poky-linux/hwdata/hwdata-doc: PKGV changed from 0.399 [default] to 0.401 [default]
packages/all-poky-linux/hwdata/hwdata-doc: PV changed from "0.399" to "0.401"
packages/all-poky-linux/hwdata/hwdata-locale: PKGV changed from 0.399 [default] to 0.401 [default]
packages/all-poky-linux/hwdata/hwdata-locale: PV changed from "0.399" to "0.401"
packages/all-poky-linux/hwdata/hwdata-src: PKGV changed from 0.399 [default] to 0.401 [default]
packages/all-poky-linux/hwdata/hwdata-src: PV changed from "0.399" to "0.401"
packages/all-poky-linux/hwdata/hwdata-staticdev: PKGV changed from 0.399 [default] to 0.401 [default]
packages/all-poky-linux/hwdata/hwdata-staticdev: PV changed from "0.399" to "0.401"
packages/all-poky-linux/hwdata/hwdata: PKGV changed from 0.399 [default] to 0.401 [default]
packages/all-poky-linux/hwdata/hwdata: PKGSIZE changed from 10041198 to 10060807 (+0%)
packages/all-poky-linux/hwdata/hwdata: PV changed from "0.399" to "0.401"
packages/all-poky-linux/hwdata: SRC_URI changed from "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.399" to "git://github.com/vcrhonek/hwdata.git;branch=master;protocol=https;tag=v0.401"
packages/all-poky-linux/hwdata: PKGV changed from 0.399 [default] to 0.401 [default]
packages/all-poky-linux/hwdata: PV changed from "0.399" to "0.401"

--===============2966784411833877396==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-hwdata-upgrade-0.399-0.401.patch"

RnJvbSA0NWJlZDcyMDA4Zjc1OGZjM2IzODZkMzA1Y2IxZTgyMTkyN2FjNjY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTU6NTI6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBo
d2RhdGE6IHVwZ3JhZGUgMC4zOTkgLT4gMC40MDEKCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC9o
d2RhdGEve2h3ZGF0YV8wLjM5OS5iYiA9PiBod2RhdGFfMC40MDEuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvaHdkYXRhL3tod2RhdGFfMC4zOTkuYmIgPT4gaHdkYXRhXzAuNDAxLmJifSAo
OTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2RhdGFfMC4z
OTkuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuNDAxLmJiCnNpbWls
YXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9o
d2RhdGFfMC4zOTkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2h3ZGF0YS9od2Rh
dGFfMC40MDEuYmIKaW5kZXggODFkZWRlOTZlYS4uZmU0NTE0MjU1ZSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaHdkYXRhL2h3ZGF0YV8wLjM5OS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9od2RhdGEvaHdkYXRhXzAuNDAxLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb3ItbGF0ZXIgfCBYMTEiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT0xNTU2NTQ3NzExZTgyNDY5OTJiOTk5ZWRkOTQ0NWE1NyIKIAogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL3ZjcmhvbmVrLyR7QlBOfS5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90
b2NvbD1odHRwczt0YWc9diR7UFZ9IgotU1JDUkVWID0gIjdiYTBlNTQ1NjU4NDNmYWVlMzAwY2E4
ODU2OTllNGM0MmVkNjc0YjIiCitTUkNSRVYgPSAiYWE5ZDgxMWY1NDNkNDQ3YTFhYmI5N2QxYjk0
YzEwZTIxMmY5MzNjMSIKIAogaW5oZXJpdCBhbGxhcmNoCiAKLS0gCjIuNDcuMQoK

--===============2966784411833877396==--

