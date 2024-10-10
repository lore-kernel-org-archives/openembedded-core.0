Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF10CFD2EB
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:29 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.53351.1728588940997633635
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VkOkJFut;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=4W4aeYYY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019277eea2ae-d23a8570-3932-4beb-aed1-a8a0c32c4c08-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WHKOBlXxOjoI7lzx2ccPHyrsmIfesrAPskqB2JHhJ54=;
	b=VkOkJFutdomYhllBwxPmD/uqyfa2ZUR3GCof9ANAfn1FDAUUAc6jLwuTsaGr40Kw
	hdbwjluiqelvLhVt3NIcCxhK/hFBicV/bgrxAAYKqvPhxS4fIRN6O0raiAXhEo+O9lh
	WcvikBXUEwkRs7kEgNL3h5CFIp2mNAKRrnW/urnw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588981;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WHKOBlXxOjoI7lzx2ccPHyrsmIfesrAPskqB2JHhJ54=;
	b=4W4aeYYYOu9+pCwMoq1duaT+wkOAJk/SadrP4Egqahhg/AVtXzwwJk3yrfpfkHLE
	K2efAADWIVnEsILcXL7+5tJ0C5nYdFB544UVTOdtVX4dUiQxpTvvhODounwhjd37BUb
	iTv4puXB54VHain5dYICZlL8yE151Fw9RRN/+OZY=
Content-Type: multipart/mixed; boundary="===============1142287084081498922=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.3.296.0 SUCCEEDED
Message-ID: <0101019277eea2ae-d23a8570-3932-4beb-aed1-a8a0c32c4c08-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205561

--===============1142287084081498922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-headers* to *1.3.296.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.3.290.0-1.3.296.0.patch
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
From 4531315f75ff64c50cc92361b71df979a0a6e99d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 15:23:35 +0000
Subject: [PATCH] spirv-headers: upgrade 1.3.290.0 -> 1.3.296.0

---
 .../{spirv-headers_1.3.290.0.bb => spirv-headers_1.3.296.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.290.0.bb => spirv-headers_1.3.296.0.bb} (93%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.290.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.296.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.290.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.296.0.bb
index 30280a5b5e..bf7190379d 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.290.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.296.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d14ee3b13f42e9c9674acc5925c3d741"
 
-SRCREV = "2acb319af38d43be3ea76bfabf3998e5281d8d12"
+SRCREV = "2a9b6f951c7d6b04b6c21fe1bf3f475b68b84801"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.44.1


--===============1142287084081498922==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.3.290.0-1.3.296.0.patch"

RnJvbSA0NTMxMzE1Zjc1ZmY2NGM1MGNjOTIzNjFiNzFkZjk3OWEwYTZlOTlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTU6MjM6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi1oZWFkZXJzOiB1cGdyYWRlIDEuMy4yOTAuMCAtPiAxLjMuMjk2LjAKCi0tLQogLi4uL3tz
cGlydi1oZWFkZXJzXzEuMy4yOTAuMC5iYiA9PiBzcGlydi1oZWFkZXJzXzEuMy4yOTYuMC5iYn0g
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIve3NwaXJ2LWhlYWRlcnNfMS4zLjI5MC4w
LmJiID0+IHNwaXJ2LWhlYWRlcnNfMS4zLjI5Ni4wLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRlcnNfMS4zLjI5MC4wLmJiIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjMuMjk2LjAuYmIKc2ltaWxh
cml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3Bp
cnYtaGVhZGVyc18xLjMuMjkwLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9z
cGlyL3NwaXJ2LWhlYWRlcnNfMS4zLjI5Ni4wLmJiCmluZGV4IDMwMjgwYTViNWUuLmJmNzE5MDM3
OWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRlcnNf
MS4zLjI5MC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRl
cnNfMS4zLjI5Ni4wLmJiCkBAIC00LDcgKzQsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3d3dy5r
aHJvbm9zLm9yZy9yZWdpc3RyeS9zcGlyLXYiCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWQxNGVlM2IxM2Y0MmU5Yzk2NzRhY2M1OTI1YzNk
NzQxIgogCi1TUkNSRVYgPSAiMmFjYjMxOWFmMzhkNDNiZTNlYTc2YmZhYmYzOTk4ZTUyODFkOGQx
MiIKK1NSQ1JFViA9ICIyYTliNmY5NTFjN2Q2YjA0YjZjMjFmZTFiZjNmNDc1YjY4Yjg0ODAxIgog
U1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9TUElSVi1IZWFkZXJzO3By
b3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIgogUEUgPSAiMSIKICMgVGhlc2UgcmVjaXBlcyBuZWVk
IHRvIGJlIHVwZGF0ZWQgaW4gbG9ja3N0ZXAgd2l0aCBlYWNoIG90aGVyOgotLSAKMi40NC4xCgo=

--===============1142287084081498922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/spirv-headers: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/spirv-headers: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PKGSIZE changed from 3283078 to 3308184 (+1%)
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.3.290.0" to "1.3.296.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.3.290.0 [default] to 1.3.296.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers: PV changed from "1.3.290.0" to "1.3.296.0"

--===============1142287084081498922==--

