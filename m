Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813DCC5474F
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:04 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.131091.1723748333753610295
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=QYHJLhTY;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=bkugvhWi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101915768391e-af92fff5-092e-42b9-ad8a-18333724c63d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RHmwYEopf3QeqBOz5PDMKfcLZO6MxRyN8X+xNkHq7h0=;
	b=QYHJLhTYuOkFuqi2ZUKMWmFuJ9S8HIXxgaiJNFKdY1ra5Lzrd2TjCOkirf9qdX5x
	+kpcPDDdZwb6j4m8tQuEA/H+q6h+0xeqvtOv8BXer+FmfZ6vEYSPbPUtI85PjS1+Qk2
	eJ4M3cqCi+lf8jZuXLHcnqByCRgJZHVQczuVLo/s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RHmwYEopf3QeqBOz5PDMKfcLZO6MxRyN8X+xNkHq7h0=;
	b=bkugvhWiWd3Xy1sMLT+C/QS/uYIhimdNvCZDjlBtUSFkCC6MOujENkVaWf3GuE1Z
	6Latdx/ohdIoqnPQJ4FSjQL1LzQFdoC5P9KyFMTkJQsR+k+xjHekE1Th5ycxg0DfZM+
	he/ygOFduvV1V1WN1U77nn8ziF10V7Yh21Icet+M=
Content-Type: multipart/mixed; boundary="===============1866086336193138084=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pkgconf: upgrading to 2.3.0 SUCCEEDED
Message-ID: <010101915768391e-af92fff5-092e-42b9-ad8a-18333724c63d-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203364

--===============1866086336193138084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pkgconf* to *2.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pkgconf-upgrade-2.2.0-2.3.0.patch
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
From 4e92cc263f68369670bf8813275718219da85afb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 11:06:26 +0000
Subject: [PATCH] pkgconf: upgrade 2.2.0 -> 2.3.0

---
 .../pkgconf/{pkgconf_2.2.0.bb => pkgconf_2.3.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_2.2.0.bb => pkgconf_2.3.0.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_2.2.0.bb b/meta/recipes-devtools/pkgconf/pkgconf_2.3.0.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_2.2.0.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_2.3.0.bb
index 5f4ef73d43..c95ab74838 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_2.2.0.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_2.3.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "b06ff63a83536aa8c2f6422fa80ad45e4833f590266feb14eaddfe1d4c853c69"
+SRC_URI[sha256sum] = "3a9080ac51d03615e7c1910a0a2a8df08424892b5f13b0628a204d3fcce0ea8b"
 
 inherit autotools
 
-- 
2.44.0


--===============1866086336193138084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/pkgconf: PKGV changed from 2.2.0 [default] to 2.3.0 [default]
packages/core2-64-poky-linux/pkgconf: SRC_URI changed from "https://distfiles.ariadne.space/pkgconf/pkgconf-2.2.0.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in" to "https://distfiles.ariadne.space/pkgconf/pkgconf-2.3.0.tar.xz file://pkg-config-wrapper file://pkg-config-native.in file://pkg-config-esdk.in"
packages/core2-64-poky-linux/pkgconf: PV changed from "2.2.0" to "2.3.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PKGV changed from 2.2.0 [default] to 2.3.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PV changed from "2.2.0" to "2.3.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-dbg: PKGSIZE changed from 313288 to 319392 (+2%)
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PKGV changed from 2.2.0 [default] to 2.3.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PV changed from "2.2.0" to "2.3.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-dev: PKGSIZE changed from 24378 to 24551 (+1%)
packages/core2-64-poky-linux/pkgconf/pkgconf-doc: PKGV changed from 2.2.0 [default] to 2.3.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-doc: PV changed from "2.2.0" to "2.3.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-doc: PKGSIZE changed from 29201 to 29240 (+0%)
packages/core2-64-poky-linux/pkgconf/pkgconf-locale: PKGV changed from 2.2.0 [default] to 2.3.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-locale: PV changed from "2.2.0" to "2.3.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PKGV changed from 2.2.0 [default] to 2.3.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PV changed from "2.2.0" to "2.3.0"
packages/core2-64-poky-linux/pkgconf/pkgconf-src: PKGSIZE changed from 275510 to 279444 (+1%)
packages/core2-64-poky-linux/pkgconf/pkgconf-staticdev: PKGV changed from 2.2.0 [default] to 2.3.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf-staticdev: PV changed from "2.2.0" to "2.3.0"
packages/core2-64-poky-linux/pkgconf/pkgconf: PKGV changed from 2.2.0 [default] to 2.3.0 [default]
packages/core2-64-poky-linux/pkgconf/pkgconf: PV changed from "2.2.0" to "2.3.0"
packages/core2-64-poky-linux/pkgconf/pkgconf: PKGSIZE changed from 154057 to 154584 (+0%)

--===============1866086336193138084==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pkgconf-upgrade-2.2.0-2.3.0.patch"

RnJvbSA0ZTkyY2MyNjNmNjgzNjk2NzBiZjg4MTMyNzU3MTgyMTlkYTg1YWZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTE6MDY6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
a2djb25mOiB1cGdyYWRlIDIuMi4wIC0+IDIuMy4wCgotLS0KIC4uLi9wa2djb25mL3twa2djb25m
XzIuMi4wLmJiID0+IHBrZ2NvbmZfMi4zLjAuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9wa2djb25mL3twa2djb25mXzIuMi4wLmJiID0+IHBrZ2NvbmZfMi4zLjAu
YmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BrZ2NvbmYvcGtn
Y29uZl8yLjIuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMi4z
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BrZ2NvbmYvcGtnY29uZl8yLjIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3BrZ2NvbmYvcGtnY29uZl8yLjMuMC5iYgppbmRleCA1ZjRlZjczZDQzLi5jOTVhYjc0ODM4
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGtnY29uZi9wa2djb25mXzIuMi4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2djb25mL3BrZ2NvbmZfMi4zLjAuYmIK
QEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9ICJcCiAgICAgZmlsZTovL3BrZy1jb25maWctbmF0
aXZlLmluIFwKICAgICBmaWxlOi8vcGtnLWNvbmZpZy1lc2RrLmluIFwKICIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJiMDZmZjYzYTgzNTM2YWE4YzJmNjQyMmZhODBhZDQ1ZTQ4MzNmNTkwMjY2ZmVi
MTRlYWRkZmUxZDRjODUzYzY5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNhOTA4MGFjNTFkMDM2
MTVlN2MxOTEwYTBhMmE4ZGYwODQyNDg5MmI1ZjEzYjA2MjhhMjA0ZDNmY2NlMGVhOGIiCiAKIGlu
aGVyaXQgYXV0b3Rvb2xzCiAKLS0gCjIuNDQuMAoK

--===============1866086336193138084==--

