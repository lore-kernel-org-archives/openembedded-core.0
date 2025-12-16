Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 340D7D5E14A
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:40 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17406.1765872155127138718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=4C+HWYE6;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=FW605opI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019b262ec9c2-40484cf1-43c9-4c3d-8ca9-46a1f930264d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872159;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=23JlvsxeT8BsxVqoiLmRuNElfpKw2OSqoecFmd+CreI=;
	b=4C+HWYE6UGDbP4T4RP3WfhuIbV6j8dRIwlZ0Nxl/UkHo0MGQf1AHYJhSslIxjHFt
	qq0j/zSTnKhdrlAb0jwn2rKr8qRwyJRY8Pq9fdp8fQxWVAVQwsAQx4NlXXxPpVDwl1d
	31asJ7k3H9eajK0NQms4NPj3EKlN6T41qImFbEDU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872159;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=23JlvsxeT8BsxVqoiLmRuNElfpKw2OSqoecFmd+CreI=;
	b=FW605opIIz8WedIsdziqgYG2wOlfpC5KMukBzJkeIOMyU0Dj48pDUtUI/0EEwvgS
	8k1KUbHiO/9Iml1E5Y9qLdeVFP3Uq2UHfuNOKD7Ov0li5Vn0igoVxYbyqNZ5OV6iM3J
	GDaLYO5T/XYl/jyTd0T5QHH4rmZmY6tATJMSD4ss=
Content-Type: multipart/mixed; boundary="===============2836617651547222129=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-headers: upgrading to 1.4.335.0 SUCCEEDED
Message-ID: <0101019b262ec9c2-40484cf1-43c9-4c3d-8ca9-46a1f930264d-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227868

--===============2836617651547222129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-headers* to *1.4.335.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-headers-upgrade-1.4.328.1-1.4.335.0.patch
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
From 45d39a73fdbf7ed1ed92848694d333c51ffe3e2e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 04:40:59 +0000
Subject: [PATCH] spirv-headers: upgrade 1.4.328.1 -> 1.4.335.0

---
 ...spirv-headers_1.4.328.1.bb => spirv-headers_1.4.335.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.4.328.1.bb => spirv-headers_1.4.335.0.bb} (89%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.335.0.bb
similarity index 89%
rename from meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.4.335.0.bb
index 2b750e4b92..db49f2ae13 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.335.0.bb
@@ -4,9 +4,8 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT & CC-BY-4.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a0dcaa512cc2dee95fe0fd791ee83a18"
 
-SRCREV = "01e0577914a75a2569c846778c2f93aa8e6feddd"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=vulkan-sdk-1.4.328 \
-"
+SRCREV = "b824a462d4256d720bebb40e78b9eb8f78bbb305"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
-- 
2.47.1


--===============2836617651547222129==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-headers-upgrade-1.4.328.1-1.4.335.0.patch"

RnJvbSA0NWQzOWE3M2ZkYmY3ZWQxZWQ5Mjg0ODY5NGQzMzNjNTFmZmUzZTJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDQ6NDA6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi1oZWFkZXJzOiB1cGdyYWRlIDEuNC4zMjguMSAtPiAxLjQuMzM1LjAKCi0tLQogLi4uc3Bp
cnYtaGVhZGVyc18xLjQuMzI4LjEuYmIgPT4gc3BpcnYtaGVhZGVyc18xLjQuMzM1LjAuYmJ9IHwg
NSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci97c3BpcnYtaGVhZGVyc18xLjQuMzI4
LjEuYmIgPT4gc3BpcnYtaGVhZGVyc18xLjQuMzM1LjAuYmJ9ICg4OSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVyc18xLjQuMzI4LjEuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi1oZWFkZXJzXzEuNC4zMzUuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9z
cGlydi1oZWFkZXJzXzEuNC4zMjguMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3NwaXIvc3BpcnYtaGVhZGVyc18xLjQuMzM1LjAuYmIKaW5kZXggMmI3NTBlNGI5Mi4uZGI0OWYy
YWUxMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVhZGVy
c18xLjQuMzI4LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtaGVh
ZGVyc18xLjQuMzM1LjAuYmIKQEAgLTQsOSArNCw4IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vd3d3
Lmtocm9ub3Mub3JnL3JlZ2lzdHJ5L3NwaXItdiIKIExJQ0VOU0UgPSAiTUlUICYgQ0MtQlktNC4w
IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YTBkY2FhNTEyY2MyZGVl
OTVmZTBmZDc5MWVlODNhMTgiCiAKLVNSQ1JFViA9ICIwMWUwNTc3OTE0YTc1YTI1NjljODQ2Nzc4
YzJmOTNhYThlNmZlZGRkIgotU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91
cC9TUElSVi1IZWFkZXJzO3Byb3RvY29sPWh0dHBzO2JyYW5jaD12dWxrYW4tc2RrLTEuNC4zMjgg
XAotIgorU1JDUkVWID0gImI4MjRhNDYyZDQyNTZkNzIwYmViYjQwZTc4YjllYjhmNzhiYmIzMDUi
CitTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1NQSVJWLUhlYWRlcnM7
cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4iCiBQRSA9ICIxIgogIyBUaGVzZSByZWNpcGVzIG5l
ZWQgdG8gYmUgdXBkYXRlZCBpbiBsb2Nrc3RlcCB3aXRoIGVhY2ggb3RoZXI6CiAjIGdsc2xhbmcs
IHZ1bGthbi1oZWFkZXJzLCB2dWxrYW4tbG9hZGVyLCB2dWxrYW4tdG9vbHMsIHNwaXJ2LWhlYWRl
cnMsIHNwaXJ2LXRvb2xzCi0tIAoyLjQ3LjEKCg==

--===============2836617651547222129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/spirv-headers: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/spirv-headers: SRC_URI changed from "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=vulkan-sdk-1.4.328" to "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dbg: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dbg: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: PKGSIZE changed from 3466114 to 3576645 (+3%)
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-dev: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-doc: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-doc: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-locale: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-locale: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-src: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-src: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-staticdev: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers-staticdev: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/spirv-headers/spirv-headers: PV changed from "1.4.328.1" to "1.4.335.0"

--===============2836617651547222129==--

