Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E4ED1A434
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:30 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.53350.1728588940637321485
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CfFAzwN0;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=n10a3uLd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019277eea29b-f28cc6fc-891b-4386-acc3-51d8f36f08f7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4T8WAu2GSNn/o+xvhZBI4PBmqLR0xInhIl49SqYcgEE=;
	b=CfFAzwN0aqY9e184kqF81OZ2FH0HuhXDt6ff2GFAPo15q/dcZEWsZV67viV+9aKr
	6h+bfhrnIFp2ZzLnLaOA+8bF1akwEj+TWEm4BDG5z1iptoyk3STAHPN6KIWzqQtXT5v
	LyZiPbBBL2QGXhQf531qwvjabBmKFi/4dauOPGYQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4T8WAu2GSNn/o+xvhZBI4PBmqLR0xInhIl49SqYcgEE=;
	b=n10a3uLd2w0pS5wUoJ9G5Q8wRj9sCRO0WoACahnF88a2aFahall6C7bU8ix+Ek84
	UEcuhjmlV/soKJy7s5dZpJ8GZBcTnB+lAaKN11uziJdaN/l1hQUxCzJ8ofICp8F36aX
	dzpT1X+NOKmf2YQE28cI1PPfBQAFULyuH1u/mPe4=
Content-Type: multipart/mixed; boundary="===============5931306042501890272=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libuv: upgrading to 1.49.0 SUCCEEDED
Message-ID: <0101019277eea29b-f28cc6fc-891b-4386-acc3-51d8f36f08f7-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205560

--===============5931306042501890272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libuv* to *1.49.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libuv-upgrade-1.48.0-1.49.0.patch
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
From 1cb6365acd0a759e97899eafca2307247572e47e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 12:16:59 +0000
Subject: [PATCH] libuv: upgrade 1.48.0 -> 1.49.0

---
 .../libuv/{libuv_1.48.0.bb => libuv_1.49.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.48.0.bb => libuv_1.49.0.bb} (94%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.48.0.bb b/meta/recipes-connectivity/libuv/libuv_1.49.0.bb
similarity index 94%
rename from meta/recipes-connectivity/libuv/libuv_1.48.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.49.0.bb
index 87a2c22a7c..1dd73f2f8c 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.48.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.49.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b \
                     file://LICENSE-extra;md5=f9307417749e19bd1d6d68a394b49324"
 
-SRCREV = "e9f29cb984231524e3931aa0ae2c5dae1a32884e"
+SRCREV = "d2e56a5e8d3e39947b78405ca6e4727c70f5568a"
 SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.44.1


--===============5931306042501890272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libuv: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-64-poky-linux/libuv: PV changed from "1.48.0" to "1.49.0"
packages/core2-64-poky-linux/libuv/libuv-dbg: PV changed from "1.48.0" to "1.49.0"
packages/core2-64-poky-linux/libuv/libuv-dbg: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-64-poky-linux/libuv/libuv-dbg: PKGSIZE changed from 744800 to 757472 (+2%)
packages/core2-64-poky-linux/libuv/libuv-dev: PV changed from "1.48.0" to "1.49.0"
packages/core2-64-poky-linux/libuv/libuv-dev: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-64-poky-linux/libuv/libuv-dev: PKGSIZE changed from 106843 to 108223 (+1%)
packages/core2-64-poky-linux/libuv/libuv-doc: PV changed from "1.48.0" to "1.49.0"
packages/core2-64-poky-linux/libuv/libuv-doc: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-64-poky-linux/libuv/libuv-locale: PV changed from "1.48.0" to "1.49.0"
packages/core2-64-poky-linux/libuv/libuv-locale: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-64-poky-linux/libuv/libuv-src: PV changed from "1.48.0" to "1.49.0"
packages/core2-64-poky-linux/libuv/libuv-src: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-64-poky-linux/libuv/libuv-src: PKGSIZE changed from 626232 to 648482 (+4%)
packages/core2-64-poky-linux/libuv/libuv-staticdev: PV changed from "1.48.0" to "1.49.0"
packages/core2-64-poky-linux/libuv/libuv-staticdev: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-64-poky-linux/libuv/libuv: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-64-poky-linux/libuv/libuv: PKGSIZE changed from 211014 to 215110 (+2%)
packages/core2-64-poky-linux/libuv/libuv: PV changed from "1.48.0" to "1.49.0"

--===============5931306042501890272==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libuv-upgrade-1.48.0-1.49.0.patch"

RnJvbSAxY2I2MzY1YWNkMGE3NTllOTc4OTllYWZjYTIzMDcyNDc1NzJlNDdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTI6MTY6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ1djogdXBncmFkZSAxLjQ4LjAgLT4gMS40OS4wCgotLS0KIC4uLi9saWJ1di97bGlidXZfMS40
OC4wLmJiID0+IGxpYnV2XzEuNDkuMC5iYn0gICAgICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvbGlidXYve2xpYnV2XzEuNDguMC5iYiA9PiBsaWJ1dl8xLjQ5LjAu
YmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJ1di9s
aWJ1dl8xLjQ4LjAuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYnV2L2xpYnV2XzEu
NDkuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L2xpYnV2L2xpYnV2XzEuNDguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9saWJ1di9saWJ1dl8xLjQ5LjAuYmIKaW5kZXggODdhMmMyMmE3Yy4uMWRkNzNm
MmY4YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJ1di9saWJ1dl8x
LjQ4LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJ1di9saWJ1dl8xLjQ5
LjAuYmIKQEAgLTYsNyArNiw3IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRTttZDU9NzRiNmYyZjc4MThhNGUzYTgwZDAzNTU2ZjcxYjEyOWIgXAog
ICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS1leHRyYTttZDU9ZjkzMDc0MTc3NDll
MTliZDFkNmQ2OGEzOTRiNDkzMjQiCiAKLVNSQ1JFViA9ICJlOWYyOWNiOTg0MjMxNTI0ZTM5MzFh
YTBhZTJjNWRhZTFhMzI4ODRlIgorU1JDUkVWID0gImQyZTU2YTVlOGQzZTM5OTQ3Yjc4NDA1Y2E2
ZTQ3MjdjNzBmNTU2OGEiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbGlidXYvbGlidXYu
Z2l0O2JyYW5jaD12MS54O3Byb3RvY29sPWh0dHBzIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVH
RVggPSAidig/UDxwdmVyPlxkKyhcLlxkKykrKSIKIAotLSAKMi40NC4xCgo=

--===============5931306042501890272==--

