Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74520CA5FBD
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:18:53 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1831.1790662721503620390
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=exfZvHSI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ebp7hHX9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a0ebd0bc30-861260da-51a3-432d-925e-cd17162b9294-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790662720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+73gsW+RvbxFTjjAtVzUwSrM97R6VnJWPAJP6a6Z9oU=;
	b=exfZvHSIrkke7ITx6Hc8H2rKq4ABpfG3D2JZNO4oZFNJwVK9X7aw8PEEUJdhB8kz
	NqSY5uzHUHLh+9jxJmYHsnICwxtA0H9Hg84+X6MSiWKb4uuTSAWvtWfaLt9MYVXEuhq
	ip+hLnxlBsujX/Wpw4jkt4le/N/K1wBtHm1LLuzw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790662720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+73gsW+RvbxFTjjAtVzUwSrM97R6VnJWPAJP6a6Z9oU=;
	b=Ebp7hHX93nzWHfVV29YESkcnFDq6Y4iuqBrASTlQaX8B23IJIvAHxGpH78gtABi3
	cvOAg2OALQhoNbEfxkjjD1gCYBUM7b/5g/Zmerv/a7rTcI/Vuv3j3uFNFWBeLux3hXU
	CVbYDr4odajQA8mH/j7R8TYMB+2BjeyPwNNmPwmQ=
Content-Type: multipart/mixed; boundary="===============8929135980846857844=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.4.363.0 SUCCEEDED
Message-ID: <010101a0ebd0bc30-861260da-51a3-432d-925e-cd17162b9294-000000@us-west-2.amazonses.com>
Date: Tue, 29 Sep 2026 06:18:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.29-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246828

--===============8929135980846857844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-headers* to *1.4.363.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.4.357.0-1.4.363.0.patch
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
From 896b45248fe10018d104d9251b46638ac86a4433 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 29 Sep 2026 05:39:42 +0000
Subject: [PATCH] spirv-headers: upgrade 1.4.357.0 -> 1.4.363.0

SPV_QCOM_subgroup_size
SPV_QCOM_bfloat16_muladd
README: Use 'main' branch; update Bazel instructions
document header tagging conventions
Correct name and comment
Add SPV_EXT_cooperative_matrix_maintenance1
switch to the canonical CC-BY-4.0 license text
Add Java output
---
 .../{spirv-headers_1.4.357.0.bb => spirv-headers_1.4.363.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.4.357.0.bb => spirv-headers_1.4.363.0.bb} (93%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.357.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.363.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-headers_1.4.357.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.4.363.0.bb
index 244c6854fa..4ad077c688 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.4.357.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.363.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "CC-BY-4.0 AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a0dcaa512cc2dee95fe0fd791ee83a18"
 
-SRCREV = "29981f65241605e08b0ede4cfeb999fe3b723c6a"
+SRCREV = "496543121ce6419f23d6fa5d7194ba66c36212d2"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main;tag=vulkan-sdk-${PV}"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.47.1


--===============8929135980846857844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/spirv-headers: SRC_URI changed from "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main;tag=vulkan-sdk-1.4.357.0" to "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main;tag=vulkan-sdk-1.4.363.0"
packages/x86-64-v3-poky-linux/spirv-headers: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/spirv-headers: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: FILELIST: added "/usr/include/spirv/unified1/org/khronos/spv/Spv.java"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: PKGSIZE changed from 3668443 to 3780005 (+3%)
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
Changes to packages/x86-64-v3-poky-linux/spirv-headers (sysroot):
  /usr/include/spirv/unified1/org was added
  /usr/include/spirv/unified1/org/khronos was added
  /usr/include/spirv/unified1/org/khronos/spv was added
  /usr/include/spirv/unified1/org/khronos/spv/Spv.java was added

--===============8929135980846857844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="spirv-headers-changelog.txt"

SPV_QCOM_subgroup_size
SPV_QCOM_bfloat16_muladd
README: Use 'main' branch; update Bazel instructions
document header tagging conventions
Correct name and comment
Add SPV_EXT_cooperative_matrix_maintenance1
switch to the canonical CC-BY-4.0 license text
Add Java output

--===============8929135980846857844==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.4.357.0-1.4.363.0.patch"

RnJvbSA4OTZiNDUyNDhmZTEwMDE4ZDEwNGQ5MjUxYjQ2NjM4YWM4NmE0NDMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjkgU2VwIDIwMjYgMDU6Mzk6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi1oZWFkZXJzOiB1cGdyYWRlIDEuNC4zNTcuMCAtPiAxLjQuMzYzLjAKClNQVl9RQ09NX3N1
Ymdyb3VwX3NpemUKU1BWX1FDT01fYmZsb2F0MTZfbXVsYWRkClJFQURNRTogVXNlICdtYWluJyBi
cmFuY2g7IHVwZGF0ZSBCYXplbCBpbnN0cnVjdGlvbnMKZG9jdW1lbnQgaGVhZGVyIHRhZ2dpbmcg
Y29udmVudGlvbnMKQ29ycmVjdCBuYW1lIGFuZCBjb21tZW50CkFkZCBTUFZfRVhUX2Nvb3BlcmF0
aXZlX21hdHJpeF9tYWludGVuYW5jZTEKc3dpdGNoIHRvIHRoZSBjYW5vbmljYWwgQ0MtQlktNC4w
IGxpY2Vuc2UgdGV4dApBZGQgSmF2YSBvdXRwdXQKLS0tCiAuLi4ve3NwaXJ2LWhlYWRlcnNfMS40
LjM1Ny4wLmJiID0+IHNwaXJ2LWhlYWRlcnNfMS40LjM2My4wLmJifSAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3Mvc3Bpci97c3BpcnYtaGVhZGVyc18xLjQuMzU3LjAuYmIgPT4gc3BpcnYtaGVh
ZGVyc18xLjQuMzYzLjAuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjQuMzU3LjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3Mvc3Bpci9zcGlydi1oZWFkZXJzXzEuNC4zNjMuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1oZWFkZXJzXzEuNC4z
NTcuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVy
c18xLjQuMzYzLjAuYmIKaW5kZXggMjQ0YzY4NTRmYS4uNGFkMDc3YzY4OCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjQuMzU3LjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjQuMzYzLjAuYmIK
QEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vd3d3Lmtocm9ub3Mub3JnL3JlZ2lz
dHJ5L3NwaXItdiIKIExJQ0VOU0UgPSAiQ0MtQlktNC4wIEFORCBNSVQiCiBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1hMGRjYWE1MTJjYzJkZWU5NWZlMGZkNzkxZWU4M2Ex
OCIKIAotU1JDUkVWID0gIjI5OTgxZjY1MjQxNjA1ZTA4YjBlZGU0Y2ZlYjk5OWZlM2I3MjNjNmEi
CitTUkNSRVYgPSAiNDk2NTQzMTIxY2U2NDE5ZjIzZDZmYTVkNzE5NGJhNjZjMzYyMTJkMiIKIFNS
Q19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvU1BJUlYtSGVhZGVycztwcm90
b2NvbD1odHRwczticmFuY2g9bWFpbjt0YWc9dnVsa2FuLXNkay0ke1BWfSIKIFBFID0gIjEiCiAj
IFRoZXNlIHJlY2lwZXMgbmVlZCB0byBiZSB1cGRhdGVkIGluIGxvY2tzdGVwIHdpdGggZWFjaCBv
dGhlcjoKLS0gCjIuNDcuMQoK

--===============8929135980846857844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: FILELIST: added "/usr/include/spirv/unified1/org/khronos/spv/Spv.java"
Changes to packages/x86-64-v3-poky-linux/spirv-headers (sysroot):
  /usr/include/spirv/unified1/org was added
  /usr/include/spirv/unified1/org/khronos was added
  /usr/include/spirv/unified1/org/khronos/spv was added
  /usr/include/spirv/unified1/org/khronos/spv/Spv.java was added

--===============8929135980846857844==--

