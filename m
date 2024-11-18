Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E600D60056
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:10 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.4782.1731964602116720663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=E2uHN7Y/;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=lgHocfEB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101934122cd08-dcafb1d1-fb77-4274-a73a-ea1e6d3b3ed6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964620;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ncJTBh5OR82N/WM78szg0+2WaVfjiMKAMQI6QmPVpEE=;
	b=E2uHN7Y/v1SW4Uu048lN1wSRsiAhiao9RtcMr+06QfyLF6NVkYs/lp+tjAlqsTAj
	r8Vkvt//NPl39V8tlraW7nZkhi6McwPymS1jdgk6FomTgLcFT/YAWIEpdyQkBDQ4LCR
	CKWUAZ+ounPttWG/ySY/Ja1etIda8f9UMA+GlLSM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964620;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ncJTBh5OR82N/WM78szg0+2WaVfjiMKAMQI6QmPVpEE=;
	b=lgHocfEBAhm8OpHSQlzIczzrokx9+uXUQUYE4PdwCYiv0ZTzy7fmw95lr2FSZrIH
	oKFbwevkWqsaNUJdu5Moh/3Y5IXKQw4coWjIaBpJ1QMmyerdbPhs8d6KxaQBxfs+g95
	/F/oc2d7kSmtJaY37HjGNeq1b/wdzRV43pV2zDdM=
Content-Type: multipart/mixed; boundary="===============0243023125585825458=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mmc-utils: upgrading to
 523d8f3cfb219d800f45860892e742e3a355f1bb SUCCEEDED
Message-ID: <010101934122cd08-dcafb1d1-fb77-4274-a73a-ea1e6d3b3ed6-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207268

--===============0243023125585825458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mmc-utils* to *523d8f3cfb219d800f45860892e742e3a355f1bb* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mmc-utils-upgrade-to-latest-revision.patch
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
From d6d5570eb885673bc442a4bf19220b81c39cff48 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 18:01:38 +0000
Subject: [PATCH] mmc-utils: upgrade to latest revision

---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 94015d6f83..7bf21a1fe2 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "123fd8b2ac3933be1319486fb1f32236a4a86a7c"
+SRCREV = "523d8f3cfb219d800f45860892e742e3a355f1bb"
 
 PV = "0.1+git"
 
-- 
2.44.1


--===============0243023125585825458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+123fd8b2ac to 0.1+git0+523d8f3cfb
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+123fd8b2ac to 0.1+git0+523d8f3cfb
packages/core2-64-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+123fd8b2ac to 0.1+git0+523d8f3cfb
packages/core2-64-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+123fd8b2ac to 0.1+git0+523d8f3cfb
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+123fd8b2ac to 0.1+git0+523d8f3cfb
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+123fd8b2ac to 0.1+git0+523d8f3cfb
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+123fd8b2ac to 0.1+git0+523d8f3cfb

--===============0243023125585825458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGSIZE changed from 291160 to 301968 (+4%)
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+123fd8b2ac to 0.1+git0+523d8f3cfb
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+123fd8b2ac to 0.1+git0+523d8f3cfb
packages/core2-64-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+123fd8b2ac to 0.1+git0+523d8f3cfb
packages/core2-64-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+123fd8b2ac to 0.1+git0+523d8f3cfb
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGSIZE changed from 210804 to 218940 (+4%)
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+123fd8b2ac to 0.1+git0+523d8f3cfb
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+123fd8b2ac to 0.1+git0+523d8f3cfb
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGSIZE changed from 115184 to 119504 (+4%)
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+123fd8b2ac to 0.1+git0+523d8f3cfb

--===============0243023125585825458==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mmc-utils-upgrade-to-latest-revision.patch"

RnJvbSBkNmQ1NTcwZWI4ODU2NzNiYzQ0MmE0YmYxOTIyMGI4MWMzOWNmZjQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMTg6MDE6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
bWMtdXRpbHM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tbWMvbW1j
LXV0aWxzX2dpdC5iYgppbmRleCA5NDAxNWQ2ZjgzLi43YmYyMWExZmUyIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbW1jL21tYy11dGlsc19naXQuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL21tYy5jO2JlZ2lu
bGluZT0xO2VuZGxpbmU9MjA7bWQ1PWZhZTMyNzkyZTIwZjRkMjdhZGUxYzVhNzYyZDE2YjdkIgog
CiBTUkNCUkFOQ0ggPz0gIm1hc3RlciIKLVNSQ1JFViA9ICIxMjNmZDhiMmFjMzkzM2JlMTMxOTQ4
NmZiMWYzMjIzNmE0YTg2YTdjIgorU1JDUkVWID0gIjUyM2Q4ZjNjZmIyMTlkODAwZjQ1ODYwODky
ZTc0MmUzYTM1NWYxYmIiCiAKIFBWID0gIjAuMStnaXQiCiAKLS0gCjIuNDQuMQoK

--===============0243023125585825458==--

