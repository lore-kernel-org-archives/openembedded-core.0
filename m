Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BC0EEEC1D
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:01 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.29476.1694804395110897314
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=P8kXV88D;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=S55rc+nH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018a9a36c3f2-99ec59b9-ed57-402e-814e-b519e0fb4e26-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZlxQ4jpLGvInU3ju1SDyP7mUFCkQnFwb0JbODM0R2EE=;
	b=P8kXV88DHNZQ3pxi+Wj7KR/8ZE8+KlhXVFFj70ZGgHeQLXliaTci+U5w2dlWahNV
	e2BctrKQ876Yyxj6Ja1ZPG1jZuUjPwoN6ho/vFFzRvFZlpDoz2Da1lhnxZAN6lEZqwW
	t6gQdqhg3JgldSHApYdcNYJ9YIrFAKnoeWniPqkM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZlxQ4jpLGvInU3ju1SDyP7mUFCkQnFwb0JbODM0R2EE=;
	b=S55rc+nHek+7Jh1svagd15OQg0MgucyWzXzqdR186wBvcx+xYhlIaR/0ToQuf/24
	XFcGrWiyg/Y7ec8wz8J3ycPdpzr5N8kl92Hom7rEQ6k3IPIuIZCQfbq23MADGXDk3OQ
	b2fVqD60+i5oE+yQ1V6RPCIDYF3MHvPdWy+nGOf8=
Content-Type: multipart/mixed; boundary="===============3012072683182727130=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.3.261.1 SUCCEEDED
Message-ID: <0101018a9a36c3f2-99ec59b9-ed57-402e-814e-b519e0fb4e26-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187740

--===============3012072683182727130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *spirv-headers* to *1.3.261.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.3.250.0-1.3.261.1.patch
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
From b435d7ff247f73375ec98c050048a2a7d5928a59 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 15:37:51 +0000
Subject: [PATCH] spirv-headers: upgrade 1.3.250.0 -> 1.3.261.1

---
 .../{spirv-headers_1.3.250.0.bb => spirv-headers_1.3.261.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.3.250.0.bb => spirv-headers_1.3.261.1.bb} (92%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.261.1.bb
similarity index 92%
rename from meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.3.261.1.bb
index d0a2e2e991..945f0879f5 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.3.261.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
 
-SRCREV = "268a061764ee69f09a477a695bf6a11ffe311b8d"
+SRCREV = "124a9665e464ef98b8b718d572d5f329311061eb"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.39.2


--===============3012072683182727130==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.3.250.0-1.3.261.1.patch"

RnJvbSBiNDM1ZDdmZjI0N2Y3MzM3NWVjOThjMDUwMDQ4YTJhN2Q1OTI4YTU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTU6Mzc6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi1oZWFkZXJzOiB1cGdyYWRlIDEuMy4yNTAuMCAtPiAxLjMuMjYxLjEKCi0tLQogLi4uL3tz
cGlydi1oZWFkZXJzXzEuMy4yNTAuMC5iYiA9PiBzcGlydi1oZWFkZXJzXzEuMy4yNjEuMS5iYn0g
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIve3NwaXJ2LWhlYWRlcnNfMS4zLjI1MC4w
LmJiID0+IHNwaXJ2LWhlYWRlcnNfMS4zLjI2MS4xLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRlcnNfMS4zLjI1MC4wLmJiIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjMuMjYxLjEuYmIKc2ltaWxh
cml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3Bp
cnYtaGVhZGVyc18xLjMuMjUwLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9z
cGlyL3NwaXJ2LWhlYWRlcnNfMS4zLjI2MS4xLmJiCmluZGV4IGQwYTJlMmU5OTEuLjk0NWYwODc5
ZjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRlcnNf
MS4zLjI1MC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LWhlYWRl
cnNfMS4zLjI2MS4xLmJiCkBAIC00LDcgKzQsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3d3dy5r
aHJvbm9zLm9yZy9yZWdpc3RyeS9zcGlyLXYiCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWM5MzhiODViY2ViOGZiMjZjMWE4MDdmMjhhNTJh
ZTJkIgogCi1TUkNSRVYgPSAiMjY4YTA2MTc2NGVlNjlmMDlhNDc3YTY5NWJmNmExMWZmZTMxMWI4
ZCIKK1NSQ1JFViA9ICIxMjRhOTY2NWU0NjRlZjk4YjhiNzE4ZDU3MmQ1ZjMyOTMxMTA2MWViIgog
U1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9TUElSVi1IZWFkZXJzO3By
b3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIgogUEUgPSAiMSIKICMgVGhlc2UgcmVjaXBlcyBuZWVk
IHRvIGJlIHVwZGF0ZWQgaW4gbG9ja3N0ZXAgd2l0aCBlYWNoIG90aGVyOgotLSAKMi4zOS4yCgo=

--===============3012072683182727130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/spirv-headers: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/spirv-headers: PV changed from "1.3.250.0" to "1.3.261.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.3.250.0" to "1.3.261.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PKGSIZE changed from 2828577 to 2851522 (+1%)
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.3.250.0" to "1.3.261.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.3.250.0" to "1.3.261.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.3.250.0" to "1.3.261.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.3.250.0" to "1.3.261.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.3.250.0" to "1.3.261.1"
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/spirv-headers/spirv-headers: PV changed from "1.3.250.0" to "1.3.261.1"

--===============3012072683182727130==--

