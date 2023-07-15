Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F10C25B75
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.5956.1689456455842170999
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Jjj6/d0A;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101895b73ae8b-d040c518-9858-420d-beda-4f971bdf4a2a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=so0sERx1C62eYfjo/f2BEaSRgEetryJHF2/KEbOLcHQ=;
	b=Jjj6/d0A/30GKhBgVykHgu9tQG5jO/wDCwz9fG67V8B2XfTonkbWsoaB2K5XI9ah
	8/ch2PkzW2/z/fzzUBywNJ4i1zLte6QePMV8GjfyThvKVA0g4aBa+bawEI2+jZiZn15
	+O0FAAr99LJdO9gNNiYDQDaMYhOFLg0MMOZ/8QJ0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=so0sERx1C62eYfjo/f2BEaSRgEetryJHF2/KEbOLcHQ=;
	b=QGCTCyuz40rRevcxITy3W1+QwqFpucdoHfwLfQN4wm+04xL6TqXgLrAI6IUHy+J/
	qgAJFPoVW4x4gvxzDyCntNhKAHqpJ0l1Ak61HXOlgHHyE4Y6sRLrcd3je8uMDKbvrtS
	dJppxyWTI024OgPiXczJMo7PpSO+2ZQ2fE9Jb2YU=
Content-Type: multipart/mixed; boundary="===============8085216136003548997=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.250.1 SUCCEEDED
Message-ID: <010101895b73ae8b-d040c518-9858-420d-beda-4f971bdf4a2a-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184380

--===============8085216136003548997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *1.3.250.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.3.250.0-1.3.250.1.patch
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
From e66337c204324a0eb5e71d5cc7c5415e4ddea5c6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 16:49:40 +0000
Subject: [PATCH] glslang: upgrade 1.3.250.0 -> 1.3.250.1

---
 .../glslang/{glslang_1.3.250.0.bb => glslang_1.3.250.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.250.0.bb => glslang_1.3.250.1.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.250.1.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.3.250.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.250.1.bb
index 6e9c666d46..16205bf026 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.250.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "d1517d64cfca91f573af1bf7341dc3a5113349c0"
+SRCREV = "3ebb72cc7429f0ab8218104dc3687c659c0f364d"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
            "
-- 
2.39.2


--===============8085216136003548997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libglslang-default-resource-limits.so.12.2.0"
packages/core2-32-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 74683608 to 74612200 (-0%)
packages/core2-32-poky-linux/glslang/glslang-dbg: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-dbg: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang-dev: FILELIST: removed "/usr/lib/libglslang-default-resource-limits.so"
packages/core2-32-poky-linux/glslang/glslang-dev: PKGSIZE changed from 1020014 to 1020059 (+0%)
packages/core2-32-poky-linux/glslang/glslang-dev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-dev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang-doc: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-doc: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang-locale: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-locale: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang-src: PKGSIZE changed from 4821631 to 4822370 (+0%)
packages/core2-32-poky-linux/glslang/glslang-src: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-src: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang-staticdev: FILELIST: added "/usr/lib/libglslang-default-resource-limits.a"
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGSIZE changed from 0 to 172584 (+100%)
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-staticdev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang-default-resource-limits.so.12.2.0 /usr/lib/libglslang-default-resource-limits.so.12"
packages/core2-32-poky-linux/glslang/glslang: PKGSIZE changed from 6530999 to 6525523 (-0%)
packages/core2-32-poky-linux/glslang/glslang: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang: PV changed from "1.3.250.0" to "1.3.250.1"
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.a was added
  /usr/lib/libglslang-default-resource-limits.so.12.2.0 was removed
  /usr/lib/libglslang-default-resource-limits.so.12 was removed
  /usr/lib/libglslang-default-resource-limits.so was removed

--===============8085216136003548997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/glslang/glslang-dev: FILELIST: removed "/usr/lib/libglslang-default-resource-limits.so"
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGSIZE changed from 0 to 172584 (+100%)
packages/core2-32-poky-linux/glslang/glslang-staticdev: FILELIST: added "/usr/lib/libglslang-default-resource-limits.a"
packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang-default-resource-limits.so.12 /usr/lib/libglslang-default-resource-limits.so.12.2.0"
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.a was added
  /usr/lib/libglslang-default-resource-limits.so.12.2.0 was removed
  /usr/lib/libglslang-default-resource-limits.so.12 was removed
  /usr/lib/libglslang-default-resource-limits.so was removed

--===============8085216136003548997==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.250.0-1.3.250.1.patch"

RnJvbSBlNjYzMzdjMjA0MzI0YTBlYjVlNzFkNWNjN2M1NDE1ZTRkZGVhNWM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTY6NDk6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bHNsYW5nOiB1cGdyYWRlIDEuMy4yNTAuMCAtPiAxLjMuMjUwLjEKCi0tLQogLi4uL2dsc2xhbmcv
e2dsc2xhbmdfMS4zLjI1MC4wLmJiID0+IGdsc2xhbmdfMS4zLjI1MC4xLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcve2dsc2xhbmdfMS4zLjI1MC4wLmJiID0+IGds
c2xhbmdfMS4zLjI1MC4xLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI1MC4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjUwLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjUwLjAuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI1MC4x
LmJiCmluZGV4IDZlOWM2NjZkNDYuLjE2MjA1YmYwMjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI1MC4wLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI1MC4xLmJiCkBAIC04LDcgKzgsNyBAQCBI
T01FUEFHRSA9ICJodHRwczovL3d3dy5raHJvbm9zLm9yZy9vcGVuZ2xlcy9zZGsvdG9vbHMvUmVm
ZXJlbmNlLUNvbXBpbGVyIgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UgJiBCU0QtMi1DbGF1c2Ug
JiBNSVQgJiBBcGFjaGUtMi4wICYgR1BMLTMtd2l0aC1iaXNvbi1leGNlcHRpb24iCiBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9MmEyYjVhY2Q3YmM0ODQ0OTY0Y2Zk
YTQ1ZmU4MDdkYzMiCiAKLVNSQ1JFViA9ICJkMTUxN2Q2NGNmY2E5MWY1NzNhZjFiZjczNDFkYzNh
NTExMzM0OWMwIgorU1JDUkVWID0gIjNlYmI3MmNjNzQyOWYwYWI4MjE4MTA0ZGMzNjg3YzY1OWMw
ZjM2NGQiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL2dsc2xhbmcu
Z2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEt
Z2VuZXJhdGUtZ2xzbGFuZy1wa2ctY29uZmlnLnBhdGNoIFwKICAgICAgICAgICAgIgotLSAKMi4z
OS4yCgo=

--===============8085216136003548997==--

