Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF5DD18143
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:15:50 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.11790.1728994550204778530
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OW+Gzkwi;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=JlO2BRAW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010192901b1ea1-d4bbbf97-8055-43e1-80b9-1db292949981-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994549;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8iexwBfo2ka4A/JJtTiyXuoHlNSvQsWDCeFJxT4zOWo=;
	b=OW+Gzkwi/N60IeMok8LTN7YBokzBFZ2LeqHwiPafQQ7w4Tv1Ne3Oh1oN4BawEhD8
	PnZ3YdLasI44gNkufnt3tCV8WVry1MnK+AXql8GcMsyhL5KgMfhUZpcKpsbqCuIEg4U
	E36DhkvgMGFvWcPKk0uTGM7cRtcSXx0pgeXS4Nag=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994549;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8iexwBfo2ka4A/JJtTiyXuoHlNSvQsWDCeFJxT4zOWo=;
	b=JlO2BRAW8VWD0lztHCw3gnfXAeKdme3da54Lfh5M304aoHMnQfj+4hryEJssavjt
	edPczc8ajctgNJIs9oG/nFnF1FnrSGwU1DQPdZEHAPjeGreORKMWlyD/2LKTbG645hU
	l386cVSezPe5P9BPiRFEiq827oUaWqH8vbn3rCwY=
Content-Type: multipart/mixed; boundary="===============6653001542810151054=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libuv: upgrading to 1.49.1 SUCCEEDED
Message-ID: <01010192901b1ea1-d4bbbf97-8055-43e1-80b9-1db292949981-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205819

--===============6653001542810151054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libuv* to *1.49.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libuv-upgrade-1.49.0-1.49.1.patch
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
From 50c7e1f9295cb34f2c5d30139a63e28f2b8e949b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 07:14:16 +0000
Subject: [PATCH] libuv: upgrade 1.49.0 -> 1.49.1

---
 .../libuv/{libuv_1.49.0.bb => libuv_1.49.1.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.49.0.bb => libuv_1.49.1.bb} (94%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.49.0.bb b/meta/recipes-connectivity/libuv/libuv_1.49.1.bb
similarity index 94%
rename from meta/recipes-connectivity/libuv/libuv_1.49.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.49.1.bb
index 1dd73f2f8c..97adbd914a 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.49.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.49.1.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b \
                     file://LICENSE-extra;md5=f9307417749e19bd1d6d68a394b49324"
 
-SRCREV = "d2e56a5e8d3e39947b78405ca6e4727c70f5568a"
+SRCREV = "8be336f4ee296d20e1c071a44d6adf279e202236"
 SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.44.1


--===============6653001542810151054==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libuv-upgrade-1.49.0-1.49.1.patch"

RnJvbSA1MGM3ZTFmOTI5NWNiMzRmMmM1ZDMwMTM5YTYzZTI4ZjJiOGU5NDliIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDc6MTQ6MTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ1djogdXBncmFkZSAxLjQ5LjAgLT4gMS40OS4xCgotLS0KIC4uLi9saWJ1di97bGlidXZfMS40
OS4wLmJiID0+IGxpYnV2XzEuNDkuMS5iYn0gICAgICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvbGlidXYve2xpYnV2XzEuNDkuMC5iYiA9PiBsaWJ1dl8xLjQ5LjEu
YmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJ1di9s
aWJ1dl8xLjQ5LjAuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYnV2L2xpYnV2XzEu
NDkuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2xpYnV2L2xpYnV2XzEuNDkuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9saWJ1di9saWJ1dl8xLjQ5LjEuYmIKaW5kZXggMWRkNzNmMmY4Yy4uOTdhZGJk
OTE0YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJ1di9saWJ1dl8x
LjQ5LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJ1di9saWJ1dl8xLjQ5
LjEuYmIKQEAgLTYsNyArNiw3IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRTttZDU9NzRiNmYyZjc4MThhNGUzYTgwZDAzNTU2ZjcxYjEyOWIgXAog
ICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS1leHRyYTttZDU9ZjkzMDc0MTc3NDll
MTliZDFkNmQ2OGEzOTRiNDkzMjQiCiAKLVNSQ1JFViA9ICJkMmU1NmE1ZThkM2UzOTk0N2I3ODQw
NWNhNmU0NzI3YzcwZjU1NjhhIgorU1JDUkVWID0gIjhiZTMzNmY0ZWUyOTZkMjBlMWMwNzFhNDRk
NmFkZjI3OWUyMDIyMzYiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbGlidXYvbGlidXYu
Z2l0O2JyYW5jaD12MS54O3Byb3RvY29sPWh0dHBzIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVH
RVggPSAidig/UDxwdmVyPlxkKyhcLlxkKykrKSIKIAotLSAKMi40NC4xCgo=

--===============6653001542810151054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libuv: PKGV changed from 1.49.0 [default] to 1.49.1 [default]
packages/core2-64-poky-linux/libuv: PV changed from "1.49.0" to "1.49.1"
packages/core2-64-poky-linux/libuv/libuv-dbg: PKGV changed from 1.49.0 [default] to 1.49.1 [default]
packages/core2-64-poky-linux/libuv/libuv-dbg: PV changed from "1.49.0" to "1.49.1"
packages/core2-64-poky-linux/libuv/libuv-dbg: PKGSIZE changed from 757472 to 759040 (+0%)
packages/core2-64-poky-linux/libuv/libuv-dev: PKGV changed from 1.49.0 [default] to 1.49.1 [default]
packages/core2-64-poky-linux/libuv/libuv-dev: PV changed from "1.49.0" to "1.49.1"
packages/core2-64-poky-linux/libuv/libuv-doc: PKGV changed from 1.49.0 [default] to 1.49.1 [default]
packages/core2-64-poky-linux/libuv/libuv-doc: PV changed from "1.49.0" to "1.49.1"
packages/core2-64-poky-linux/libuv/libuv-locale: PKGV changed from 1.49.0 [default] to 1.49.1 [default]
packages/core2-64-poky-linux/libuv/libuv-locale: PV changed from "1.49.0" to "1.49.1"
packages/core2-64-poky-linux/libuv/libuv-src: PKGV changed from 1.49.0 [default] to 1.49.1 [default]
packages/core2-64-poky-linux/libuv/libuv-src: PV changed from "1.49.0" to "1.49.1"
packages/core2-64-poky-linux/libuv/libuv-src: PKGSIZE changed from 648482 to 649394 (+0%)
packages/core2-64-poky-linux/libuv/libuv-staticdev: PKGV changed from 1.49.0 [default] to 1.49.1 [default]
packages/core2-64-poky-linux/libuv/libuv-staticdev: PV changed from "1.49.0" to "1.49.1"
packages/core2-64-poky-linux/libuv/libuv: PKGV changed from 1.49.0 [default] to 1.49.1 [default]
packages/core2-64-poky-linux/libuv/libuv: PV changed from "1.49.0" to "1.49.1"

--===============6653001542810151054==--

