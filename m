Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E61DCA5FB5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:18:52 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1830.1790662721456618042
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=sBaEPOVo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=zBosubF4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a0ebd0bc4e-e9191551-057f-4983-8ca1-a11cbcec79b0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790662720;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=OI6RvQ1oF4XJ673w/H0wCPdY8t+LvzROBgKF7A5rFEM=;
	b=sBaEPOVolqb2qKOZNlkHR22vYrDT+5o6Toa8vqvElghIzUKNtJhvLTNn8Hh4S15k
	K3hMaW2+1p4/4UYqVgbDpeUURxFcTUJVozM0CN19xxJAY8WB5GFQmXnfQlJfPOM0E0J
	qAZlrTbBRjK8xMxJxOm+S8fjAOrhU2y2IXfsvm0U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790662720;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=OI6RvQ1oF4XJ673w/H0wCPdY8t+LvzROBgKF7A5rFEM=;
	b=zBosubF4PFIQekecpzzXGwgOiu77pmj2Rx7/Zmll8Qh1sQEVKXbYPcjSFjAVBRkM
	2hIw3+D++uy2DcQEnaO5kL7HKTBUROVq9zd1EPPhqgngjvTioMkhRYpLvHLW7k5INyx
	ZU2DnQ93enukJlq35oIbu3SNzoLoAEL6rSPCn9eU=
Content-Type: multipart/mixed; boundary="===============8539448260445244546=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-headers: upgrading to 1.4.363.0 SUCCEEDED
Message-ID: <010101a0ebd0bc4e-e9191551-057f-4983-8ca1-a11cbcec79b0-000000@us-west-2.amazonses.com>
Date: Tue, 29 Sep 2026 06:18:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.29-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246826

--===============8539448260445244546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-headers* to *1.4.363.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-headers-upgrade-1.4.357.0-1.4.363.0.patch
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
From 37ade429277841ecfa59a0ab7d7f424979d87ff2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 29 Sep 2026 05:44:47 +0000
Subject: [PATCH] vulkan-headers: upgrade 1.4.357.0 -> 1.4.363.0

Update for Vulkan-Docs 1.4.363
Update for Vulkan-Docs 1.4.362
Update for Vulkan-Docs 1.4.361
Update Vulkan named module in test
Update for Vulkan-Docs 1.4.360
Update for Vulkan-Docs 1.4.359
Update for Vulkan-Docs 1.4.358
Mention CONTRIBUTING.md to be part of the repo itself
Clarify home repository of `registry/*.xml` files
---
 ...{vulkan-headers_1.4.357.0.bb => vulkan-headers_1.4.363.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.4.357.0.bb => vulkan-headers_1.4.363.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb
index 4a91e39dcd..b187d75d5f 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 AND MIT AND (Apache-2.0 OR MIT)"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=adc9da32fdd898219b3db5529f2185c0"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
 
-SRCREV = "e3b1eec08173d6b825cd3ac88c885a63b621504a"
+SRCREV = "6802bb4733b63ed5efd3adb308a6c885ef180ea1"
 
 inherit cmake
 
-- 
2.47.1


--===============8539448260445244546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/vulkan-headers: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/vulkan-headers: SRC_URI changed from "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https;tag=vulkan-sdk-1.4.357.0" to "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https;tag=vulkan-sdk-1.4.363.0"
packages/x86-64-v3-poky-linux/vulkan-headers: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dbg: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dbg: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dev: PKGSIZE changed from 22050691 to 22891864 (+4%)
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dev: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-dev: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-doc: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-doc: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-locale: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-locale: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-src: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-src: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-staticdev: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers-staticdev: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers: PKGSIZE changed from 19565208 to 19500027 (-0%)
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/vulkan-headers/vulkan-headers: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]

--===============8539448260445244546==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-headers-upgrade-1.4.357.0-1.4.363.0.patch"

RnJvbSAzN2FkZTQyOTI3Nzg0MWVjZmE1OWEwYWI3ZDdmNDI0OTc5ZDg3ZmYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjkgU2VwIDIwMjYgMDU6NDQ6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4taGVhZGVyczogdXBncmFkZSAxLjQuMzU3LjAgLT4gMS40LjM2My4wCgpVcGRhdGUgZm9y
IFZ1bGthbi1Eb2NzIDEuNC4zNjMKVXBkYXRlIGZvciBWdWxrYW4tRG9jcyAxLjQuMzYyClVwZGF0
ZSBmb3IgVnVsa2FuLURvY3MgMS40LjM2MQpVcGRhdGUgVnVsa2FuIG5hbWVkIG1vZHVsZSBpbiB0
ZXN0ClVwZGF0ZSBmb3IgVnVsa2FuLURvY3MgMS40LjM2MApVcGRhdGUgZm9yIFZ1bGthbi1Eb2Nz
IDEuNC4zNTkKVXBkYXRlIGZvciBWdWxrYW4tRG9jcyAxLjQuMzU4Ck1lbnRpb24gQ09OVFJJQlVU
SU5HLm1kIHRvIGJlIHBhcnQgb2YgdGhlIHJlcG8gaXRzZWxmCkNsYXJpZnkgaG9tZSByZXBvc2l0
b3J5IG9mIGByZWdpc3RyeS8qLnhtbGAgZmlsZXMKLS0tCiAuLi57dnVsa2FuLWhlYWRlcnNfMS40
LjM1Ny4wLmJiID0+IHZ1bGthbi1oZWFkZXJzXzEuNC4zNjMuMC5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3t2dWxrYW4taGVhZGVyc18xLjQuMzU3LjAuYmIgPT4gdnVsa2Fu
LWhlYWRlcnNfMS40LjM2My4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1n
cmFwaGljcy92dWxrYW4vdnVsa2FuLWhlYWRlcnNfMS40LjM1Ny4wLmJiIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3Z1bGthbi92dWxrYW4taGVhZGVyc18xLjQuMzYzLjAuYmIKc2ltaWxhcml0eSBp
bmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4t
aGVhZGVyc18xLjQuMzU3LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxr
YW4vdnVsa2FuLWhlYWRlcnNfMS40LjM2My4wLmJiCmluZGV4IDRhOTFlMzlkY2QuLmIxODdkNzVk
NWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLWhlYWRl
cnNfMS40LjM1Ny4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2Fu
LWhlYWRlcnNfMS40LjM2My4wLmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ0VOU0UgPSAiQXBhY2hl
LTIuMCBBTkQgTUlUIEFORCAoQXBhY2hlLTIuMCBPUiBNSVQpIgogTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9YWRjOWRhMzJmZGQ4OTgyMTliM2RiNTUyOWYyMTg1YzAi
CiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1IZWFkZXJz
LmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwczt0YWc9dnVsa2FuLXNkay0ke1BWfSIKIAot
U1JDUkVWID0gImUzYjFlZWMwODE3M2Q2YjgyNWNkM2FjODhjODg1YTYzYjYyMTUwNGEiCitTUkNS
RVYgPSAiNjgwMmJiNDczM2I2M2VkNWVmZDNhZGIzMDhhNmM4ODVlZjE4MGVhMSIKIAogaW5oZXJp
dCBjbWFrZQogCi0tIAoyLjQ3LjEKCg==

--===============8539448260445244546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="vulkan-headers-changelog.txt"

Update for Vulkan-Docs 1.4.363
Update for Vulkan-Docs 1.4.362
Update for Vulkan-Docs 1.4.361
Update Vulkan named module in test
Update for Vulkan-Docs 1.4.360
Update for Vulkan-Docs 1.4.359
Update for Vulkan-Docs 1.4.358
Mention CONTRIBUTING.md to be part of the repo itself
Clarify home repository of `registry/*.xml` files

--===============8539448260445244546==--

