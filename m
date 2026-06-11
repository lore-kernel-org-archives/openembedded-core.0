Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5D4CDE000
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:56 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50424.1781195505185481678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FAbyLTZH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xhcjExy1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019eb786a8e6-be079f90-3d7a-462d-9656-2b941c022fff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195516;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YsHljPQBHFO7eMeJF3GQPM5kvKDCT8W6AVdqJXWHv3k=;
	b=FAbyLTZH/j6PLA/8YlDZPQS/UTlORMJ3KS/U1rMzUKPoyruMniFlCFEvTGbLIdUC
	gWUT9msxRTVAjX8gVWe/L7x22rlBwTGCE1v1pFCrgZKnh/+hk87GPsCRoKQWWEAoj1X
	o3edEezW7WSzy4QyTue9bsevmnTfmsnVJKdzbiOY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195516;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YsHljPQBHFO7eMeJF3GQPM5kvKDCT8W6AVdqJXWHv3k=;
	b=xhcjExy1SSuvGh24qjAy5JJiIznX8cmklQCzudfXIcpCJRqUigt/jwaIaumS3jce
	w4jn6JP/AW0ftNuDI+g2w8jYgESGPL98kkZCwE3faVK/BFfH0y8A2r2TZIs68KahDx1
	srVn+10WZZDkA7IxcvEjFMuzBQTg7Uj/YH3fF2TM=
Content-Type: multipart/mixed; boundary="===============2332629205059755495=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.4.350.0 SUCCEEDED
Message-ID: <0101019eb786a8e6-be079f90-3d7a-462d-9656-2b941c022fff-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238535

--===============2332629205059755495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-headers* to *1.4.350.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.4.341.0-1.4.350.0.patch
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
From c095fa6a88b778561c7ec1ebed491a5e8ff0adf3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 12:25:41 +0000
Subject: [PATCH] spirv-headers: upgrade 1.4.341.0 -> 1.4.350.0

---
 .../{spirv-headers_1.4.341.0.bb => spirv-headers_1.4.350.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.4.341.0.bb => spirv-headers_1.4.350.0.bb} (93%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.341.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-headers_1.4.341.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb
index 258ba11504..c4a7be4045 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.4.341.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.350.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT & CC-BY-4.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a0dcaa512cc2dee95fe0fd791ee83a18"
 
-SRCREV = "04f10f650d514df88b76d25e83db360142c7b174"
+SRCREV = "ad9184e76a66b1001c29db9b0a3e87f646c64de0"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main;tag=vulkan-sdk-${PV}"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.47.1


--===============2332629205059755495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/spirv-headers: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers: SRC_URI changed from "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main;tag=vulkan-sdk-1.4.341.0" to "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main;tag=vulkan-sdk-1.4.350.0"
packages/x86-64-v3-poky-linux/spirv-headers: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: FILELIST: added "/usr/include/spirv/unified1/NonSemanticShaderDebugInfo.h /usr/include/spirv/unified1/extinst.nonsemantic.shader.debuginfo.grammar.json"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: PKGSIZE changed from 3591544 to 3634800 (+1%)
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers: PV changed from "1.4.341.0" to "1.4.350.0"
Changes to packages/x86-64-v3-poky-linux/spirv-headers (sysroot):
  /usr/include/spirv/unified1/extinst.nonsemantic.shader.debuginfo.grammar.json was added
  /usr/include/spirv/unified1/NonSemanticShaderDebugInfo.h was added

--===============2332629205059755495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: FILELIST: added "/usr/include/spirv/unified1/extinst.nonsemantic.shader.debuginfo.grammar.json /usr/include/spirv/unified1/NonSemanticShaderDebugInfo.h"
Changes to packages/x86-64-v3-poky-linux/spirv-headers (sysroot):
  /usr/include/spirv/unified1/extinst.nonsemantic.shader.debuginfo.grammar.json was added
  /usr/include/spirv/unified1/NonSemanticShaderDebugInfo.h was added

--===============2332629205059755495==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.4.341.0-1.4.350.0.patch"

RnJvbSBjMDk1ZmE2YTg4Yjc3ODU2MWM3ZWMxZWJlZDQ5MWE1ZThmZjBhZGYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTI6MjU6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi1oZWFkZXJzOiB1cGdyYWRlIDEuNC4zNDEuMCAtPiAxLjQuMzUwLjAKCi0tLQogLi4uL3tz
cGlydi1oZWFkZXJzXzEuNC4zNDEuMC5iYiA9PiBzcGlydi1oZWFkZXJzXzEuNC4zNTAuMC5iYn0g
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIve3NwaXJ2LWhlYWRlcnNfMS40LjM0MS4w
LmJiID0+IHNwaXJ2LWhlYWRlcnNfMS40LjM1MC4wLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRlcnNfMS40LjM0MS4wLmJiIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjQuMzUwLjAuYmIKc2ltaWxh
cml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3Bp
cnYtaGVhZGVyc18xLjQuMzQxLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9z
cGlyL3NwaXJ2LWhlYWRlcnNfMS40LjM1MC4wLmJiCmluZGV4IDI1OGJhMTE1MDQuLmM0YTdiZTQw
NDUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRlcnNf
MS40LjM0MS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRl
cnNfMS40LjM1MC4wLmJiCkBAIC00LDcgKzQsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3d3dy5r
aHJvbm9zLm9yZy9yZWdpc3RyeS9zcGlyLXYiCiBMSUNFTlNFID0gIk1JVCAmIENDLUJZLTQuMCIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWEwZGNhYTUxMmNjMmRlZTk1
ZmUwZmQ3OTFlZTgzYTE4IgogCi1TUkNSRVYgPSAiMDRmMTBmNjUwZDUxNGRmODhiNzZkMjVlODNk
YjM2MDE0MmM3YjE3NCIKK1NSQ1JFViA9ICJhZDkxODRlNzZhNjZiMTAwMWMyOWRiOWIwYTNlODdm
NjQ2YzY0ZGUwIgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9TUElS
Vi1IZWFkZXJzO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluO3RhZz12dWxrYW4tc2RrLSR7UFZ9
IgogUEUgPSAiMSIKICMgVGhlc2UgcmVjaXBlcyBuZWVkIHRvIGJlIHVwZGF0ZWQgaW4gbG9ja3N0
ZXAgd2l0aCBlYWNoIG90aGVyOgotLSAKMi40Ny4xCgo=

--===============2332629205059755495==--

