Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04019C98306
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 06:52:58 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2755.1790319174348864340
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 23:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HaxfUcuv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HevXAQXN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a0d7569f15-6ff563d9-0b7d-46ba-8d06-215e474a6500-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790319173;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=3A5Km0lgtpa68Jbitu2D/Sb8+wKtUQgmScRoet/u5cA=;
	b=HaxfUcuvJWHBYB3u8tw/inJuadW6T+Qe9YlQcLiNuT/Z6IGW8D4lD4LzzCiUhBob
	w9KpJD0dCIEVuWykRUqM/ACowkKFRI764gQqy4H7JMv0kXn7yN32Ys7hGAOBmnz1fvu
	M7sTS2G54tOdKpbMRYPI6hsBjOx46zXQD+TF2SzA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790319173;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=3A5Km0lgtpa68Jbitu2D/Sb8+wKtUQgmScRoet/u5cA=;
	b=HevXAQXNh6lp1VFut+M0leEX3S93Cd3eNvXG6mQsCdiS0XhXik39aqEUXqs1apJ7
	5LKHeM3jwVtcBUiYeOeGiSIO88M0EJhAsANh/iFYE/jSTANh/8Vuekx4UVJHAzzj3gc
	CgIOF/D1yW+CP0LKNDBHWI4/ZV14dQ+1bT+B/h4s=
Content-Type: multipart/mixed; boundary="===============4743376526028160420=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libuv: upgrading to 1.53.0 SUCCEEDED
Message-ID: <010101a0d7569f15-6ff563d9-0b7d-46ba-8d06-215e474a6500-000000@us-west-2.amazonses.com>
Date: Fri, 25 Sep 2026 06:52:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.25-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 06:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246600

--===============4743376526028160420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libuv* to *1.53.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libuv-upgrade-1.52.1-1.53.0.patch
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
From 90ad3c23d64e656098cba1328bfea3ddc358ac15 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 25 Sep 2026 05:09:25 +0000
Subject: [PATCH] libuv: upgrade 1.52.1 -> 1.53.0

2026.09.24, Version 1.53.0 (Stable)
Changes since version 1.52.1:
2026.03.06, Version 1.52.1 (Stable), 1cfa32ff59c076ffb6ed735bbc8c18361558661f
---
 .../libuv/{libuv_1.52.1.bb => libuv_1.53.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.52.1.bb => libuv_1.53.0.bb} (94%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.52.1.bb b/meta/recipes-connectivity/libuv/libuv_1.53.0.bb
similarity index 94%
rename from meta/recipes-connectivity/libuv/libuv_1.52.1.bb
rename to meta/recipes-connectivity/libuv/libuv_1.53.0.bb
index 08f0755911..8d2b1f8b4b 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.52.1.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.53.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=74b6f2f7818a4e3a80d03556f71b129b \
                     file://LICENSE-extra;md5=f9307417749e19bd1d6d68a394b49324"
 
-SRCREV = "1cfa32ff59c076ffb6ed735bbc8c18361558661f"
+SRCREV = "840404ce8ba7cc0204be52389a6cfff9f2c90fb6"
 SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https;tag=v${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.1


--===============4743376526028160420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libuv-changelog.txt"

2026.09.24, Version 1.53.0 (Stable)
Changes since version 1.52.1:
2026.03.06, Version 1.52.1 (Stable), 1cfa32ff59c076ffb6ed735bbc8c18361558661f

--===============4743376526028160420==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libuv-upgrade-1.52.1-1.53.0.patch"

RnJvbSA5MGFkM2MyM2Q2NGU2NTYwOThjYmExMzI4YmZlYTNkZGMzNThhYzE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjUgU2VwIDIwMjYgMDU6MDk6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ1djogdXBncmFkZSAxLjUyLjEgLT4gMS41My4wCgoyMDI2LjA5LjI0LCBWZXJzaW9uIDEuNTMu
MCAoU3RhYmxlKQpDaGFuZ2VzIHNpbmNlIHZlcnNpb24gMS41Mi4xOgoyMDI2LjAzLjA2LCBWZXJz
aW9uIDEuNTIuMSAoU3RhYmxlKSwgMWNmYTMyZmY1OWMwNzZmZmI2ZWQ3MzViYmM4YzE4MzYxNTU4
NjYxZgotLS0KIC4uLi9saWJ1di97bGlidXZfMS41Mi4xLmJiID0+IGxpYnV2XzEuNTMuMC5iYn0g
ICAgICAgICAgICAgICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlidXYve2xp
YnV2XzEuNTIuMS5iYiA9PiBsaWJ1dl8xLjUzLjAuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJ1di9saWJ1dl8xLjUyLjEuYmIgYi9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2xpYnV2L2xpYnV2XzEuNTMuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYnV2L2xpYnV2XzEuNTIu
MS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJ1di9saWJ1dl8xLjUz
LjAuYmIKaW5kZXggMDhmMDc1NTkxMS4uOGQyYjFmOGI0YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9saWJ1di9saWJ1dl8xLjUyLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9saWJ1di9saWJ1dl8xLjUzLjAuYmIKQEAgLTYsNyArNiw3IEBAIExJQ0VO
U0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NzRiNmYy
Zjc4MThhNGUzYTgwZDAzNTU2ZjcxYjEyOWIgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
TElDRU5TRS1leHRyYTttZDU9ZjkzMDc0MTc3NDllMTliZDFkNmQ2OGEzOTRiNDkzMjQiCiAKLVNS
Q1JFViA9ICIxY2ZhMzJmZjU5YzA3NmZmYjZlZDczNWJiYzhjMTgzNjE1NTg2NjFmIgorU1JDUkVW
ID0gIjg0MDQwNGNlOGJhN2NjMDIwNGJlNTIzODlhNmNmZmY5ZjJjOTBmYjYiCiBTUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vbGlidXYvbGlidXYuZ2l0O2JyYW5jaD12MS54O3Byb3RvY29sPWh0
dHBzO3RhZz12JHtQVn0iCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+
XGQrKFwuXGQrKSspIgogCi0tIAoyLjQ3LjEKCg==

--===============4743376526028160420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libuv: SRC_URI changed from "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https;tag=v1.52.1" to "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https;tag=v1.53.0"
packages/x86-64-v3-poky-linux/libuv: PKGV changed from 1.52.1 [default] to 1.53.0 [default]
packages/x86-64-v3-poky-linux/libuv: PV changed from "1.52.1" to "1.53.0"
packages/x86-64-v3-poky-linux/libuv/libuv-dbg: PKGV changed from 1.52.1 [default] to 1.53.0 [default]
packages/x86-64-v3-poky-linux/libuv/libuv-dbg: PKGSIZE changed from 851680 to 870904 (+2%)
packages/x86-64-v3-poky-linux/libuv/libuv-dbg: PV changed from "1.52.1" to "1.53.0"
packages/x86-64-v3-poky-linux/libuv/libuv-dev: PKGV changed from 1.52.1 [default] to 1.53.0 [default]
packages/x86-64-v3-poky-linux/libuv/libuv-dev: PKGSIZE changed from 109592 to 110576 (+1%)
packages/x86-64-v3-poky-linux/libuv/libuv-dev: PV changed from "1.52.1" to "1.53.0"
packages/x86-64-v3-poky-linux/libuv/libuv-doc: PKGV changed from 1.52.1 [default] to 1.53.0 [default]
packages/x86-64-v3-poky-linux/libuv/libuv-doc: PV changed from "1.52.1" to "1.53.0"
packages/x86-64-v3-poky-linux/libuv/libuv-locale: PKGV changed from 1.52.1 [default] to 1.53.0 [default]
packages/x86-64-v3-poky-linux/libuv/libuv-locale: PV changed from "1.52.1" to "1.53.0"
packages/x86-64-v3-poky-linux/libuv/libuv-src: FILELIST: directory renamed /usr/src/debug/libuv/1.52.1/include -> /usr/src/debug/libuv/1.53.0/include, directory renamed /usr/src/debug/libuv/1.52.1/src/unix -> /usr/src/debug/libuv/1.53.0/src/unix, directory renamed /usr/src/debug/libuv/1.52.1/src -> /usr/src/debug/libuv/1.53.0/src, directory renamed /usr/src/debug/libuv/1.52.1/include/uv -> /usr/src/debug/libuv/1.53.0/include/uv
packages/x86-64-v3-poky-linux/libuv/libuv-src: PKGV changed from 1.52.1 [default] to 1.53.0 [default]
packages/x86-64-v3-poky-linux/libuv/libuv-src: PKGSIZE changed from 667214 to 680280 (+2%)
packages/x86-64-v3-poky-linux/libuv/libuv-src: PV changed from "1.52.1" to "1.53.0"
packages/x86-64-v3-poky-linux/libuv/libuv-staticdev: PKGV changed from 1.52.1 [default] to 1.53.0 [default]
packages/x86-64-v3-poky-linux/libuv/libuv-staticdev: PV changed from "1.52.1" to "1.53.0"
packages/x86-64-v3-poky-linux/libuv/libuv: PKGV changed from 1.52.1 [default] to 1.53.0 [default]
packages/x86-64-v3-poky-linux/libuv/libuv: PKGSIZE changed from 227398 to 235590 (+4%)
packages/x86-64-v3-poky-linux/libuv/libuv: PV changed from "1.52.1" to "1.53.0"

--===============4743376526028160420==--

