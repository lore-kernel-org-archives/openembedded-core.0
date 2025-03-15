Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2EAC369B6
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:32 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.10330.1742048293593537702
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=H7+1Muz0;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=lUQRvP8o;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101959a2bb782-c5deb991-f597-47d8-b53c-1d1e5e8efda2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048311;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Zi5KVqCgdDo3hDMOF+Reupv38PmmPE0ypkPU/BUwiTM=;
	b=H7+1Muz0slaSOLukRDRbZgbRr+LFpgrekwyq5gz9MBrUYNqw+8bi2RSKiNMRqQRM
	PsMy2kyQBhf8gYjvxurO/L+L6Oe7ZPY+pbyjJbK2wkSwOUMIRDPBXUY/BfGf7Euy2cX
	UtMuAonYSOpb20H54Ttf5OyYaIvyr3G/bfAIB1k0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048311;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Zi5KVqCgdDo3hDMOF+Reupv38PmmPE0ypkPU/BUwiTM=;
	b=lUQRvP8oNlfgXwJPVdWA4lH8l30m69/kJA8NE6UiIWhD8w85iTrY39WlTQIPLyLC
	kBD1ymfQttwYwIutWjKBZgGnUyT7I+G7bUTHxj4YW0aoZw84pf/zVTTeap8Jb3G6OKr
	ys4EyuuBAXqDoE3YAf+KuafKPjz+Bk+oAKdhkU/w=
Content-Type: multipart/mixed; boundary="===============7976678039697800060=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.4.309.0 SUCCEEDED
Message-ID: <010101959a2bb782-c5deb991-f597-47d8-b53c-1d1e5e8efda2-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212949

--===============7976678039697800060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-headers* to *1.4.309.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.3.296.0-1.4.309.0.patch
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
From f0108c915838a6dd86ef362dc9245d7f046435e4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 12:34:07 +0000
Subject: [PATCH] spirv-headers: upgrade 1.3.296.0 -> 1.4.309.0

---
 .../{spirv-headers_1.3.296.0.bb => spirv-headers_1.4.309.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.296.0.bb => spirv-headers_1.4.309.0.bb} (93%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.296.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.296.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb
index bf7190379d..71ec2f7b42 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.296.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d14ee3b13f42e9c9674acc5925c3d741"
 
-SRCREV = "2a9b6f951c7d6b04b6c21fe1bf3f475b68b84801"
+SRCREV = "09913f088a1197aba4aefd300a876b2ebbaa3391"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.44.1


--===============7976678039697800060==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.3.296.0-1.4.309.0.patch"

RnJvbSBmMDEwOGM5MTU4MzhhNmRkODZlZjM2MmRjOTI0NWQ3ZjA0NjQzNWU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMTI6MzQ6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi1oZWFkZXJzOiB1cGdyYWRlIDEuMy4yOTYuMCAtPiAxLjQuMzA5LjAKCi0tLQogLi4uL3tz
cGlydi1oZWFkZXJzXzEuMy4yOTYuMC5iYiA9PiBzcGlydi1oZWFkZXJzXzEuNC4zMDkuMC5iYn0g
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIve3NwaXJ2LWhlYWRlcnNfMS4zLjI5Ni4w
LmJiID0+IHNwaXJ2LWhlYWRlcnNfMS40LjMwOS4wLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRlcnNfMS4zLjI5Ni4wLmJiIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjQuMzA5LjAuYmIKc2ltaWxh
cml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3Bp
cnYtaGVhZGVyc18xLjMuMjk2LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9z
cGlyL3NwaXJ2LWhlYWRlcnNfMS40LjMwOS4wLmJiCmluZGV4IGJmNzE5MDM3OWQuLjcxZWMyZjdi
NDIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRlcnNf
MS4zLjI5Ni4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRl
cnNfMS40LjMwOS4wLmJiCkBAIC00LDcgKzQsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3d3dy5r
aHJvbm9zLm9yZy9yZWdpc3RyeS9zcGlyLXYiCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWQxNGVlM2IxM2Y0MmU5Yzk2NzRhY2M1OTI1YzNk
NzQxIgogCi1TUkNSRVYgPSAiMmE5YjZmOTUxYzdkNmIwNGI2YzIxZmUxYmYzZjQ3NWI2OGI4NDgw
MSIKK1NSQ1JFViA9ICIwOTkxM2YwODhhMTE5N2FiYTRhZWZkMzAwYTg3NmIyZWJiYWEzMzkxIgog
U1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9TUElSVi1IZWFkZXJzO3By
b3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIgogUEUgPSAiMSIKICMgVGhlc2UgcmVjaXBlcyBuZWVk
IHRvIGJlIHVwZGF0ZWQgaW4gbG9ja3N0ZXAgd2l0aCBlYWNoIG90aGVyOgotLSAKMi40NC4xCgo=

--===============7976678039697800060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/spirv-headers: PV changed from "1.3.296.0" to "1.4.309.0"
packages/core2-64-poky-linux/spirv-headers: PKGV changed from 1.3.296.0 [default] to 1.4.309.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.3.296.0" to "1.4.309.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.3.296.0 [default] to 1.4.309.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.3.296.0" to "1.4.309.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.3.296.0 [default] to 1.4.309.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-dev: PKGSIZE changed from 3308184 to 3440096 (+4%)
packages/core2-64-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.3.296.0" to "1.4.309.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.3.296.0 [default] to 1.4.309.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.3.296.0" to "1.4.309.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.3.296.0 [default] to 1.4.309.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.3.296.0" to "1.4.309.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.3.296.0 [default] to 1.4.309.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.3.296.0" to "1.4.309.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.3.296.0 [default] to 1.4.309.0 [default]
packages/core2-64-poky-linux/spirv-headers/spirv-headers: PV changed from "1.3.296.0" to "1.4.309.0"
packages/core2-64-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.3.296.0 [default] to 1.4.309.0 [default]

--===============7976678039697800060==--

