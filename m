Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B52C02187
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:18 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.17793.1736936763464851484
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=I0P+mhAm;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ysI2E7ab;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010194697fe557-e718aba9-3d4c-44ea-bd01-6d9d6aece207-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936777;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GkUR1MfxAMxgwHhTm97yiQ5XJq0dt36Dmtj00aj7/ls=;
	b=I0P+mhAmE3FFW5R5DhIq9hDuyLVLBxIVs91e+oilh1eJbjHhBFQ8t1Rc3T/Uhr9L
	zuKe1AL/H1Kn9CAW0bqb0QPsQGlH16qcwHrh+4ANqpjmasKX6bEgSBIAijUS+dt8oh6
	EALACQRRnsmN2GZ3C4xqKu+4t+HrHHrhA5aaTVWY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936777;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GkUR1MfxAMxgwHhTm97yiQ5XJq0dt36Dmtj00aj7/ls=;
	b=ysI2E7abkmAfhcChyzAI3dKZp4QVyS6s6hRk9iZzmFcymnyfSkZ7goIyuSSFP5iw
	//bBtWfOaZBTfGqtsSyVCIOdqB04DAYfl4bmbFnzK8CQXIDVMuQ9dHH763TBenintzL
	gigw/i569UUzqgrsshXJ7JrwwAHbBWzvXIFijJ5w=
Content-Type: multipart/mixed; boundary="===============8617686332752282115=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.4.304.0 SUCCEEDED
Message-ID: <01010194697fe557-e718aba9-3d4c-44ea-bd01-6d9d6aece207-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209869

--===============8617686332752282115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-headers* to *1.4.304.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.3.296.0-1.4.304.0.patch
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
From eb705addd1bd0e565d80c7fdcb4b8b3d657ce8c8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 09:22:37 +0000
Subject: [PATCH] spirv-headers: upgrade 1.3.296.0 -> 1.4.304.0

---
 .../{spirv-headers_1.3.296.0.bb => spirv-headers_1.4.304.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.296.0.bb => spirv-headers_1.4.304.0.bb} (93%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.296.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.304.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.296.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.4.304.0.bb
index bf7190379d..a4d947ff54 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.296.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.304.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d14ee3b13f42e9c9674acc5925c3d741"
 
-SRCREV = "2a9b6f951c7d6b04b6c21fe1bf3f475b68b84801"
+SRCREV = "3f17b2af6784bfa2c5aa5dbb8e0e74a607dd8b3b"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.44.1


--===============8617686332752282115==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.3.296.0-1.4.304.0.patch"

RnJvbSBlYjcwNWFkZGQxYmQwZTU2NWQ4MGM3ZmRjYjRiOGIzZDY1N2NlOGM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDk6MjI6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi1oZWFkZXJzOiB1cGdyYWRlIDEuMy4yOTYuMCAtPiAxLjQuMzA0LjAKCi0tLQogLi4uL3tz
cGlydi1oZWFkZXJzXzEuMy4yOTYuMC5iYiA9PiBzcGlydi1oZWFkZXJzXzEuNC4zMDQuMC5iYn0g
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIve3NwaXJ2LWhlYWRlcnNfMS4zLjI5Ni4w
LmJiID0+IHNwaXJ2LWhlYWRlcnNfMS40LjMwNC4wLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRlcnNfMS4zLjI5Ni4wLmJiIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjQuMzA0LjAuYmIKc2ltaWxh
cml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3Bp
cnYtaGVhZGVyc18xLjMuMjk2LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9z
cGlyL3NwaXJ2LWhlYWRlcnNfMS40LjMwNC4wLmJiCmluZGV4IGJmNzE5MDM3OWQuLmE0ZDk0N2Zm
NTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRlcnNf
MS4zLjI5Ni4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRl
cnNfMS40LjMwNC4wLmJiCkBAIC00LDcgKzQsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3d3dy5r
aHJvbm9zLm9yZy9yZWdpc3RyeS9zcGlyLXYiCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWQxNGVlM2IxM2Y0MmU5Yzk2NzRhY2M1OTI1YzNk
NzQxIgogCi1TUkNSRVYgPSAiMmE5YjZmOTUxYzdkNmIwNGI2YzIxZmUxYmYzZjQ3NWI2OGI4NDgw
MSIKK1NSQ1JFViA9ICIzZjE3YjJhZjY3ODRiZmEyYzVhYTVkYmI4ZTBlNzRhNjA3ZGQ4YjNiIgog
U1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9TUElSVi1IZWFkZXJzO3By
b3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIgogUEUgPSAiMSIKICMgVGhlc2UgcmVjaXBlcyBuZWVk
IHRvIGJlIHVwZGF0ZWQgaW4gbG9ja3N0ZXAgd2l0aCBlYWNoIG90aGVyOgotLSAKMi40NC4xCgo=

--===============8617686332752282115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/spirv-headers: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/spirv-headers: PV changed from "1.3.296.0" to "1.4.304.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.3.296.0" to "1.4.304.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PKGSIZE changed from 3308184 to 3349995 (+1%)
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.3.296.0" to "1.4.304.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.3.296.0" to "1.4.304.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.3.296.0" to "1.4.304.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.3.296.0" to "1.4.304.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.3.296.0" to "1.4.304.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.3.296.0 [default] to 1.4.304.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers: PV changed from "1.3.296.0" to "1.4.304.0"

--===============8617686332752282115==--

