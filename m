Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C478C3ABC9
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:31:59 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.11254.1747312304903867747
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=M7Ck6Pnr;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WB8RrPjh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010196d3edf91b-d08b04f2-6f40-47fb-9ef9-b3216090400f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312310;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XeBvQKQKBSL87oExVL5uqDbxYQ6amlmKcqo2Z0b6EnQ=;
	b=M7Ck6Pnr+xpwWHv6xHrUu/u8az6vw23UdimNUqQP0cSaNT+uyhwAmaxvzCj2UDJT
	q03niqTehuzTDO0gbPNqMBk3KtXEvV787k32m4bbCTn+1Bl5RgqdQ0KUExzhsKcBADY
	ZpBsabDVbTAHWOjS13QnRXJ/66k7jPTwd4Uj0ic0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312310;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XeBvQKQKBSL87oExVL5uqDbxYQ6amlmKcqo2Z0b6EnQ=;
	b=WB8RrPjh0OmPiX01bQOlXLi7tL4pxk7gdQroDdbfG6VcCMHuOUaBUFApCmljNaIR
	kpku2kGkQPdsRIqsCgyI04D/n/YwAiS8TBmTtbhZUnXcpFdidVemmvzdDwU4UiDIQbZ
	Cux4IPrurjDTq/+CsR6XKFLE3mDVflKYSTt+5FBo=
Content-Type: multipart/mixed; boundary="===============2119054281069877207=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] psplash: upgrading to 53ae74a36bf17675228552abb927d2f981940a6a
 SUCCEEDED
Message-ID: <01010196d3edf91b-d08b04f2-6f40-47fb-9ef9-b3216090400f-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216595

--===============2119054281069877207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *psplash* to *53ae74a36bf17675228552abb927d2f981940a6a* has Succeeded.

Next steps:
    - apply the patch: git am 0001-psplash-upgrade-to-latest-revision.patch
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
From 8edf8221c2bc0780fa7c092c4ed9a17b8dcc1a2c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 07:17:46 +0000
Subject: [PATCH] psplash: upgrade to latest revision

---
 meta/recipes-core/psplash/psplash_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 712fff7bd0..f3647d389d 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=8;md5=8f232c1e95929eacab37f00900580224"
 DEPENDS = "gdk-pixbuf-native"
 
-SRCREV = "1f64c654129fdb6a1b75d8c16e3bcdd986468083"
+SRCREV = "53ae74a36bf17675228552abb927d2f981940a6a"
 PV = "0.1+git"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https \
-- 
2.47.1


--===============2119054281069877207==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-psplash-upgrade-to-latest-revision.patch"

RnJvbSA4ZWRmODIyMWMyYmMwNzgwZmE3YzA5MmM0ZWQ5YTE3YjhkY2MxYTJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDc6MTc6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
c3BsYXNoOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtY29y
ZS9wc3BsYXNoL3BzcGxhc2hfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvcHNw
bGFzaC9wc3BsYXNoX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3BzcGxhc2gvcHNwbGFzaF9n
aXQuYmIKaW5kZXggNzEyZmZmN2JkMC4uZjM2NDdkMzg5ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvcmUvcHNwbGFzaC9wc3BsYXNoX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9w
c3BsYXNoL3BzcGxhc2hfZ2l0LmJiCkBAIC02LDcgKzYsNyBAQCBMSUNFTlNFID0gIkdQTC0yLjAt
b3ItbGF0ZXIiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9wc3BsYXNoLmg7YmVnaW5saW5l
PTE7ZW5kbGluZT04O21kNT04ZjIzMmMxZTk1OTI5ZWFjYWIzN2YwMDkwMDU4MDIyNCIKIERFUEVO
RFMgPSAiZ2RrLXBpeGJ1Zi1uYXRpdmUiCiAKLVNSQ1JFViA9ICIxZjY0YzY1NDEyOWZkYjZhMWI3
NWQ4YzE2ZTNiY2RkOTg2NDY4MDgzIgorU1JDUkVWID0gIjUzYWU3NGEzNmJmMTc2NzUyMjg1NTJh
YmI5MjdkMmY5ODE5NDBhNmEiCiBQViA9ICIwLjErZ2l0IgogCiBTUkNfVVJJID0gImdpdDovL2dp
dC55b2N0b3Byb2plY3Qub3JnLyR7QlBOfTticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwK
LS0gCjIuNDcuMQoK

--===============2119054281069877207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/psplash/psplash-dbg: PKGV changed from 0.1+git0+1f64c65412 to 0.1+git0+53ae74a36b
packages/core2-64-poky-linux/psplash/psplash-default: PKGV changed from 0.1+git0+1f64c65412 to 0.1+git0+53ae74a36b
packages/core2-64-poky-linux/psplash/psplash-dev: PKGV changed from 0.1+git0+1f64c65412 to 0.1+git0+53ae74a36b
packages/core2-64-poky-linux/psplash/psplash-doc: PKGV changed from 0.1+git0+1f64c65412 to 0.1+git0+53ae74a36b
packages/core2-64-poky-linux/psplash/psplash-locale: PKGV changed from 0.1+git0+1f64c65412 to 0.1+git0+53ae74a36b
packages/core2-64-poky-linux/psplash/psplash-src: PKGV changed from 0.1+git0+1f64c65412 to 0.1+git0+53ae74a36b
packages/core2-64-poky-linux/psplash/psplash-staticdev: PKGV changed from 0.1+git0+1f64c65412 to 0.1+git0+53ae74a36b
packages/core2-64-poky-linux/psplash/psplash: PKGV changed from 0.1+git0+1f64c65412 to 0.1+git0+53ae74a36b

--===============2119054281069877207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/psplash/psplash-dbg: PKGV changed from 0.1+git0+1f64c65412 to 0.1+git0+53ae74a36b
packages/core2-64-poky-linux/psplash/psplash-default: PKGV changed from 0.1+git0+1f64c65412 to 0.1+git0+53ae74a36b
packages/core2-64-poky-linux/psplash/psplash-dev: PKGV changed from 0.1+git0+1f64c65412 to 0.1+git0+53ae74a36b
packages/core2-64-poky-linux/psplash/psplash-doc: PKGV changed from 0.1+git0+1f64c65412 to 0.1+git0+53ae74a36b
packages/core2-64-poky-linux/psplash/psplash-locale: PKGV changed from 0.1+git0+1f64c65412 to 0.1+git0+53ae74a36b
packages/core2-64-poky-linux/psplash/psplash-src: PKGV changed from 0.1+git0+1f64c65412 to 0.1+git0+53ae74a36b
packages/core2-64-poky-linux/psplash/psplash-staticdev: PKGV changed from 0.1+git0+1f64c65412 to 0.1+git0+53ae74a36b
packages/core2-64-poky-linux/psplash/psplash: PKGV changed from 0.1+git0+1f64c65412 to 0.1+git0+53ae74a36b

--===============2119054281069877207==--

