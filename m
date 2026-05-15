Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B01CD5BD0
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:51 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34770.1778851238068324047
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GtdG5vgF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=aYY3RniP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019e2bcbce4e-ba28b89e-e31b-4946-95fd-9abc168f87a0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851237;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hbNq/ftA+WTbkMMXSD0QV/rZe7rhx1N6gbjFVgAJV/4=;
	b=GtdG5vgFff2ah2y7OnODuRYZBO2RwBYgXfdRfh/nwuA4nMyRyZ1nCE9KHtS6yeJZ
	G1X2fhMvlgQkSlTPtUGOfu/vlKChuJRciOspdVWMz8wsE84Ia0EvAzvq5fygxft0doM
	loA9kN2A43qfPkOHVTMstjyOcbGgVKDR/l/lXNk4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851237;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hbNq/ftA+WTbkMMXSD0QV/rZe7rhx1N6gbjFVgAJV/4=;
	b=aYY3RniPbesdsfIqv8XwYoc5RGP76AseGuBfaNXEo9tBkR0kj3TsAsw8BY4LqVLB
	SfbgIuBitfQdIm6+cZivhjW+ECclSKCCj46/d7X3OPIJFiKJz8+abFTyABMx3gCbouN
	ZCJdJlG7rPbJZ5oot+6Xbe9mwNzqpPWvxno2i+ds=
Content-Type: multipart/mixed; boundary="===============7469405573618285491=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.4.350.0 SUCCEEDED
Message-ID: <0101019e2bcbce4e-ba28b89e-e31b-4946-95fd-9abc168f87a0-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237141

--===============7469405573618285491==
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
From 981864c359f5c155d5cf2c933b0530b9560325a7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 10:10:17 +0000
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


--===============7469405573618285491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/spirv-headers: SRC_URI changed from "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main;tag=vulkan-sdk-1.4.341.0" to "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main;tag=vulkan-sdk-1.4.350.0"
packages/x86-64-v3-poky-linux/spirv-headers: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: FILELIST: added "/usr/include/spirv/unified1/extinst.nonsemantic.shader.debuginfo.grammar.json /usr/include/spirv/unified1/NonSemanticShaderDebugInfo.h"
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

--===============7469405573618285491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: FILELIST: added "/usr/include/spirv/unified1/NonSemanticShaderDebugInfo.h /usr/include/spirv/unified1/extinst.nonsemantic.shader.debuginfo.grammar.json"
Changes to packages/x86-64-v3-poky-linux/spirv-headers (sysroot):
  /usr/include/spirv/unified1/extinst.nonsemantic.shader.debuginfo.grammar.json was added
  /usr/include/spirv/unified1/NonSemanticShaderDebugInfo.h was added

--===============7469405573618285491==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.4.341.0-1.4.350.0.patch"

RnJvbSA5ODE4NjRjMzU5ZjVjMTU1ZDVjZjJjOTMzYjA1MzBiOTU2MDMyNWE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMTA6MTA6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
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

--===============7469405573618285491==--

