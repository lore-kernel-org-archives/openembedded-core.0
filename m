Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF672C35FF7
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:19 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.10364.1742048296696486039
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZWsxqIlV;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Cj2m4NJs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101959a2b7c78-59ea4e20-5b8c-4c9d-afd5-61109f6004e9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048296;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mHB+BnSypBoci8H5LQ5B45ZD/+tvmwWuCBXEd1hKRkY=;
	b=ZWsxqIlVVnhToFz9tcefIOvWWDG2oLH7W3b7uyP2ycZEq97zo4wuucHagwYc+o+O
	qHDlF3c3FVjDZp6pF8mlIc+rZBEq07trbU92mWW5oujuoswn+fdUs4u2LNdnAVeGMNw
	8FDANagwxBL9CRjLpDkyfHq4X96hhuGk6HbCsPNg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048296;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mHB+BnSypBoci8H5LQ5B45ZD/+tvmwWuCBXEd1hKRkY=;
	b=Cj2m4NJsRQr3HJOR/frLaZ3gfxjCZZFp8+rk/VLc5E0b1wxpXEZhAV2PFJjVTbyd
	Z3h6Uecjw4jec/lfu/L6+V+acPkIFHNImFBg5IuGvVE1gF+Y8E3846SOSHdnRAEYD4f
	nfeOCxAYF4heXIYtRKafpFodAysCDoUFNXwxl0to=
Content-Type: multipart/mixed; boundary="===============4624357627370954933=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 20.1.0 SUCCEEDED
Message-ID: <010101959a2b7c78-59ea4e20-5b8c-4c9d-afd5-61109f6004e9-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212904

--===============4624357627370954933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *llvm* to *20.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-llvm-upgrade-19.1.7-20.1.0.patch
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
From 2eee15fffdd8c909168b58c7cbb043e3331deaaa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 08:55:48 +0000
Subject: [PATCH] llvm: upgrade 19.1.7 -> 20.1.0

---
 ...AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch | 4 ++--
 .../llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch  | 2 +-
 meta/recipes-devtools/llvm/{llvm_19.1.7.bb => llvm_20.1.0.bb} | 4 +++-
 3 files changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/llvm/{llvm_19.1.7.bb => llvm_20.1.0.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
index f2447e07fd..ae2c3baa8c 100644
--- a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -1,4 +1,4 @@
-From 51d1ecbd5fc05aa801ded4ada9d9ff6426087aea Mon Sep 17 00:00:00 2001
+From 9824c2ab5e7d37a5a18a409a512511f5f5cd408d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 27 Nov 2020 10:11:08 +0000
 Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-index 5035ef527..03fc84203 100644
+index 7684387d8..d225a3b6d 100644
 --- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 +++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 @@ -361,7 +361,10 @@ public:
diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
index edd8824a38..29266013ec 100644
--- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
+++ b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
@@ -1,4 +1,4 @@
-From e10e7f1ef8816f99550cc124ea8c0c8c265cfc16 Mon Sep 17 00:00:00 2001
+From 00e5ac68dad872b8490297fa6f0b67e6a3e48661 Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 19 May 2017 00:22:57 -0700
 Subject: [PATCH] llvm: allow env override of exe and libdir path
diff --git a/meta/recipes-devtools/llvm/llvm_19.1.7.bb b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_19.1.7.bb
rename to meta/recipes-devtools/llvm/llvm_20.1.0.bb
index 8e861939e0..47d1e28b9d 100644
--- a/meta/recipes-devtools/llvm/llvm_19.1.7.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "82401fea7b79d0078043f7598b835284d6650a75b93e64b6f761ea7b63097501"
+SRC_URI[sha256sum] = "4579051e3c255fb4bb795d54324f5a7f3ef79bd9181e44293d7ee9a7f62aad9a"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
@@ -180,3 +180,5 @@ FILES:${PN}-staticdev += "\
 INSANE_SKIP:${PN}-libllvm += "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PV = "20.1.0"
-- 
2.44.1


--===============4624357627370954933==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-llvm-upgrade-19.1.7-20.1.0.patch"

RnJvbSAyZWVlMTVmZmZkZDhjOTA5MTY4YjU4YzdjYmIwNDNlMzMzMWRlYWFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDg6NTU6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
bHZtOiB1cGdyYWRlIDE5LjEuNyAtPiAyMC4xLjAKCi0tLQogLi4uQXNtTWF0Y2hlckVtaXR0ZXIt
c29ydC1DbGFzc0luZm8tbGlzdHMtYnktbmFtZS1hcy13ZS5wYXRjaCB8IDQgKystLQogLi4uL2xs
dm0vbGx2bS8wMDA3LWxsdm0tYWxsb3ctZW52LW92ZXJyaWRlLW9mLWV4ZS1wYXRoLnBhdGNoICB8
IDIgKy0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL3tsbHZtXzE5LjEuNy5iYiA9PiBsbHZt
XzIwLjEuMC5iYn0gfCA0ICsrKy0KIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL3tsbHZtXzE5
LjEuNy5iYiA9PiBsbHZtXzIwLjEuMC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbGx2bS9sbHZtLzAwMDEtQXNtTWF0Y2hlckVtaXR0ZXItc29ydC1DbGFzc0lu
Zm8tbGlzdHMtYnktbmFtZS1hcy13ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZt
L2xsdm0vMDAwMS1Bc21NYXRjaGVyRW1pdHRlci1zb3J0LUNsYXNzSW5mby1saXN0cy1ieS1uYW1l
LWFzLXdlLnBhdGNoCmluZGV4IGYyNDQ3ZTA3ZmQuLmFlMmMzYmFhOGMgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm0vMDAwMS1Bc21NYXRjaGVyRW1pdHRlci1zb3J0
LUNsYXNzSW5mby1saXN0cy1ieS1uYW1lLWFzLXdlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9sbHZtL2xsdm0vMDAwMS1Bc21NYXRjaGVyRW1pdHRlci1zb3J0LUNsYXNzSW5mby1s
aXN0cy1ieS1uYW1lLWFzLXdlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1MWQxZWNiZDVm
YzA1YWE4MDFkZWQ0YWRhOWQ5ZmY2NDI2MDg3YWVhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSA5ODI0YzJhYjVlN2QzN2E1YTE4YTQwOWE1MTI1MTFmNWY1Y2Q0MDhkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFp
bC5jb20+CiBEYXRlOiBGcmksIDI3IE5vdiAyMDIwIDEwOjExOjA4ICswMDAwCiBTdWJqZWN0OiBb
UEFUQ0hdIEFzbU1hdGNoZXJFbWl0dGVyOiBzb3J0IENsYXNzSW5mbyBsaXN0cyBieSBuYW1lIGFz
IHdlbGwKQEAgLTE0LDcgKzE0LDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4g
PGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvbGx2bS91dGlscy9UYWJsZUdlbi9Bc21N
YXRjaGVyRW1pdHRlci5jcHAgYi9sbHZtL3V0aWxzL1RhYmxlR2VuL0FzbU1hdGNoZXJFbWl0dGVy
LmNwcAotaW5kZXggNTAzNWVmNTI3Li4wM2ZjODQyMDMgMTAwNjQ0CitpbmRleCA3Njg0Mzg3ZDgu
LmQyMjVhM2I2ZCAxMDA2NDQKIC0tLSBhL2xsdm0vdXRpbHMvVGFibGVHZW4vQXNtTWF0Y2hlckVt
aXR0ZXIuY3BwCiArKysgYi9sbHZtL3V0aWxzL1RhYmxlR2VuL0FzbU1hdGNoZXJFbWl0dGVyLmNw
cAogQEAgLTM2MSw3ICszNjEsMTAgQEAgcHVibGljOgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2xsdm0vbGx2bS8wMDA3LWxsdm0tYWxsb3ctZW52LW92ZXJyaWRlLW9mLWV4ZS1w
YXRoLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xsdm0vbGx2bS8wMDA3LWxsdm0tYWxs
b3ctZW52LW92ZXJyaWRlLW9mLWV4ZS1wYXRoLnBhdGNoCmluZGV4IGVkZDg4MjRhMzguLjI5MjY2
MDEzZWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm0vMDAwNy1s
bHZtLWFsbG93LWVudi1vdmVycmlkZS1vZi1leGUtcGF0aC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbGx2bS9sbHZtLzAwMDctbGx2bS1hbGxvdy1lbnYtb3ZlcnJpZGUtb2YtZXhl
LXBhdGgucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGUxMGU3ZjFlZjg4MTZmOTk1NTBjYzEy
NGVhOGMwYzhjMjY1Y2ZjMTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDAwZTVhYzY4
ZGFkODcyYjg0OTAyOTdmYTZmMGI2N2U2YTNlNDg2NjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBNYXJ0aW4gS2VsbHkgPG1rZWxseUB4ZXZvLmNvbT4KIERhdGU6IEZyaSwgMTkgTWF5
IDIwMTcgMDA6MjI6NTcgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gbGx2bTogYWxsb3cgZW52IG92
ZXJyaWRlIG9mIGV4ZSBhbmQgbGliZGlyIHBhdGgKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9sbHZtL2xsdm1fMTkuMS43LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xsdm0v
bGx2bV8yMC4xLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2xsdm0vbGx2bV8xOS4xLjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9sbHZtL2xsdm1fMjAuMS4wLmJiCmluZGV4IDhlODYxOTM5ZTAuLjQ3ZDFlMjhiOWQg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm1fMTkuMS43LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm1fMjAuMS4wLmJiCkBAIC0yNyw3ICsy
Nyw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L3Jl
bGVhc2VzL2Rvd25sb2FkL2xsdm1vcmctJHtQVn0vCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUFz
bU1hdGNoZXJFbWl0dGVyLXNvcnQtQ2xhc3NJbmZvLWxpc3RzLWJ5LW5hbWUtYXMtd2UucGF0Y2g7
c3RyaXBsZXZlbD0yIFwKICAgICAgICAgICAgZmlsZTovL2xsdm0tY29uZmlnIFwKICAgICAgICAg
ICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjgyNDAxZmVhN2I3OWQwMDc4MDQzZjc1OThiODM1
Mjg0ZDY2NTBhNzViOTNlNjRiNmY3NjFlYTdiNjMwOTc1MDEiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNDU3OTA1MWUzYzI1NWZiNGJiNzk1ZDU0MzI0ZjVhN2YzZWY3OWJkOTE4MWU0NDI5M2Q3ZWU5
YTdmNjJhYWQ5YSIKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vbGx2
bS9sbHZtLXByb2plY3QiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJsbHZtb3JnLSg/UDxwdmVy
PlxkKyhcLlxkKykrKSIKIApAQCAtMTgwLDMgKzE4MCw1IEBAIEZJTEVTOiR7UE59LXN0YXRpY2Rl
diArPSAiXAogSU5TQU5FX1NLSVA6JHtQTn0tbGlibGx2bSArPSAiZGV2LXNvIgogCiBCQkNMQVNT
RVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCisKK1BWID0gIjIwLjEuMCIKLS0gCjIuNDQuMQoK

--===============4624357627370954933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/llvm: SRC_URI changed from "https://github.com/llvm/llvm-project/releases/download/llvmorg-19.1.7/llvm-project-19.1.7.src.tar.xz file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 file://llvm-config" to "https://github.com/llvm/llvm-project/releases/download/llvmorg-20.1.0/llvm-project-20.1.0.src.tar.xz file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 file://llvm-config"
packages/core2-64-poky-linux/llvm: PV changed from "19.1.7" to "20.1.0"
packages/core2-64-poky-linux/llvm: PKGV changed from 19.1.7 [default] to 20.1.0 [default]
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PV changed from "19.1.7" to "20.1.0"
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PKGV changed from 19.1.7 [default] to 20.1.0 [default]
packages/core2-64-poky-linux/llvm/llvm-dbg: PV changed from "19.1.7" to "20.1.0"
packages/core2-64-poky-linux/llvm/llvm-dbg: FILELIST: removed "/usr/lib/.debug/libRemarks.so.19.1 /usr/lib/.debug/libLTO.so.19.1 /usr/lib/.debug/libLLVM.so.19.1", added "/usr/lib/.debug/libRemarks.so.20.1 /usr/bin/.debug/llvm-ctxprof-util /usr/lib/.debug/libLTO.so.20.1 /usr/bin/.debug/llvm-cgdata /usr/lib/.debug/libLLVM.so.20.1"
packages/core2-64-poky-linux/llvm/llvm-dbg: PKGV changed from 19.1.7 [default] to 20.1.0 [default]
packages/core2-64-poky-linux/llvm/llvm-dbg: PKGSIZE changed from 38194392 to 43460792 (+14%)
packages/core2-64-poky-linux/llvm/llvm-dev: PV changed from "19.1.7" to "20.1.0"
packages/core2-64-poky-linux/llvm/llvm-dev: FILES: removed "/usr/lib/libLLVM-19.1.7.so", added "/usr/lib/libLLVM-20.1.0.so"
packages/core2-64-poky-linux/llvm/llvm-dev: FILELIST: removed "/usr/include/llvm/SandboxIR/SandboxIR.h /usr/include/llvm/Transforms/Scalar/TLSVariableHoist.h /usr/include/llvm/Transforms/IPO/SyntheticCountsPropagation.h /usr/include/llvm/Transforms/Instrumentation/PoisonChecking.h /usr/lib/cmake/llvm/LLVMCheckLinkerFlag.cmake /usr/include/llvm/Frontend/OpenMP/ConstructCompositionT.h /usr/include/llvm/SandboxIR/SandboxIRValues.def /usr/include/llvm/CodeGenData/OutlinedHashTreeRecord.h /usr/include/llvm/Transforms/Instrumentation.h /usr/include/llvm/CodeGenData/OutlinedHashTree.h /usr/include/llvm/ProfileData/RawMemProfReader.h /usr/include/llvm/LTO/SummaryBasedOptimizations.h /usr/include/llvm/Transforms/Utils/DXILResource.h", added "/usr/include/llvm/Transforms/Utils/ExtraPassManager.h /usr/include/llvm/Transforms/Instrumentation/PGOCtxProfFlattening.h /usr/include/llvm/DebugInfo/GSYM/CallSiteInfo.h /usr/include/llvm/Passes/DroppedVariableStatsIR.h /usr/include/llvm/TableGen/AArch64I
 mmCheck.h /usr/include/llvm/CodeGen/GlobalMergeFunctions.h /usr/include/llvm/ExecutionEngine/Orc/Shared/MachOObjectFormat.h /usr/include/llvm/ExecutionEngine/Orc/CoreContainers.h /usr/include/llvm/ExecutionEngine/Orc/IRPartitionLayer.h /usr/include/llvm/TargetParser/PPCTargetParser.h /usr/include/llvm/IR/VectorTypeUtils.h /usr/include/llvm/SandboxIR/Region.h /usr/include/llvm/SandboxIR/Function.h /usr/include/llvm/SandboxIR/Value.h /usr/include/llvm/CodeGen/TailDuplication.h /usr/include/llvm/CodeGen/MachineLICM.h /usr/include/llvm/ADT/StringTable.h /usr/include/llvm/CodeGen/RegUsageInfoCollector.h /usr/include/llvm/ExecutionEngine/Orc/UnwindInfoRegistrationPlugin.h /usr/include/llvm/ExecutionEngine/Orc/TargetProcess/UnwindInfoManager.h /usr/include/llvm/ExecutionEngine/Orc/EHFrameRegistrationPlugin.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/SeedCollector.h /usr/include/llvm/Transforms/Utils/ControlFlowUtils.h /usr/include/llvm/SandboxIR/Pass.h /usr/include/llvm/Sand
 boxIR/Type.h /usr/lib/cmake/llvm/FileLock.cmake /usr/include/llvm/SandboxIR/User.h /usr/include/llvm/Passes/DroppedVariableStats.h /usr/include/llvm/CGData/CodeGenData.h /usr/include/llvm/CGData/OutlinedHashTreeRecord.h /usr/include/llvm/SandboxIR/Constant.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/DependencyGraph.h /usr/include/llvm/IR/ConstantFPRange.h /usr/include/llvm/SandboxIR/Argument.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/BottomUpVec.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Interval.h /usr/include/llvm/ExecutionEngine/Orc/LinkGraphLayer.h /usr/include/llvm/ADT/TrieRawHashMap.h /usr/include/llvm/SandboxIR/BasicBlock.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/SandboxVectorizerPassBuilder.h /usr/include/llvm/Transforms/Utils/Instrumentation.h /usr/include/llvm/CGData/OutlinedHashTree.h /usr/include/llvm/Transforms/Coroutines/MaterializationUtils.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer
 /Scheduler.h /usr/include/llvm/SandboxIR/Module.h /usr/include/llvm/BinaryFormat/ELFRelocs/RISCV_nonstandard.def /usr/include/llvm/ExecutionEngine/Orc/LazyObjectLinkingLayer.h /usr/include/llvm/CodeGen/MachineCSE.h /usr/include/llvm/ExecutionEngine/Orc/LoadLinkableFile.h /usr/include/llvm/CodeGen/OptimizePHIs.h /usr/include/llvm/Analysis/DXILResource.h /usr/include/llvm/SandboxIR/Context.h /usr/include/llvm/ExecutionEngine/Orc/JITLinkLazyCallThroughManager.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/InstrMaps.h /usr/include/llvm/Transforms/Coroutines/CoroAnnotationElide.h /usr/include/llvm/ADT/RewriteRope.h /usr/include/llvm/CGData/CodeGenDataReader.h /usr/include/llvm/SandboxIR/Values.def /usr/include/llvm/CGData/CodeGenDataWriter.h /usr/include/llvm/CodeGen/SpillPlacement.h /usr/include/llvm/Analysis/DXILMetadataAnalysis.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/SandboxVectorizer.h /usr/include/llvm/ExecutionEngine/Orc/MaterializationUnit.h /usr/inc
 lude/llvm/ProfileData/MemProfYAML.h /usr/include/llvm/ExecutionEngine/Orc/JITLinkRedirectableSymbolManager.h /usr/include/llvm/Transforms/Instrumentation/TypeSanitizer.h /usr/include/llvm/DebugInfo/GSYM/MergedFunctionsInfo.h /usr/include/llvm/CodeGen/RegUsageInfoPropagate.h /usr/include/llvm/ExecutionEngine/Orc/TargetProcess/DefaultHostBootstrapValues.h /usr/include/llvm/CodeGen/CodeGenTargetMachineImpl.h /usr/include/llvm/TableGen/TGTimer.h /usr/include/llvm/ADT/RewriteBuffer.h /usr/include/llvm/Analysis/CtxProfAnalysis.h /usr/include/llvm/Transforms/Coroutines/CoroInstr.h /usr/include/llvm/IR/NVVMIntrinsicUtils.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/NullPass.h /usr/include/llvm/Analysis/ScalarEvolutionPatternMatch.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/RegionsFromMetadata.h /usr/include/llvm/CGData/StableFunctionMap.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Legality.h /usr/include/llvm/ExecutionEngine/Orc/Redir
 ectionManager.h /usr/include/llvm/Transforms/Coroutines/SuspendCrossingInfo.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/PrintInstructionCount.h /usr/include/llvm/SandboxIR/Operator.h /usr/include/llvm/Support/AArch64BuildAttributes.h /usr/include/llvm/Support/OptionStrCmp.h /usr/include/llvm/CGData/StableFunctionMapRecord.h /usr/include/llvm/ExecutionEngine/Orc/MachO.h /usr/include/llvm/Frontend/Atomic/Atomic.h /usr/include/llvm/SandboxIR/Utils.h /usr/include/llvm/Support/NVPTXAddrSpace.h /usr/include/llvm/Transforms/Coroutines/CoroShape.h /usr/include/llvm/SandboxIR/PassManager.h /usr/include/llvm/Transforms/Coroutines/ABI.h /usr/include/llvm/ExecutionEngine/Orc/ReOptimizeLayer.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/VecUtils.h /usr/include/llvm/Transforms/Scalar/LoopTermFold.h /usr/include/llvm/CodeGen/PeepholeOptimizer.h /usr/include/llvm/IR/CmpPredicate.h /usr/include/llvm/Transforms/Utils/IRNormalizer.h /usr/include/llvm/Analysis/LastRun
 TrackingAnalysis.h /usr/include/llvm/CGData/CodeGenData.inc /usr/include/llvm/ADT/DeltaTree.h /usr/include/llvm/CodeGen/EarlyIfConversion.h /usr/include/llvm/Transforms/Coroutines/SpillUtils.h /usr/include/llvm/TargetParser/AArch64FeatPriorities.inc /usr/include/llvm/ExecutionEngine/Orc/LinkGraphLinkingLayer.h /usr/include/llvm/ExecutionEngine/Orc/AbsoluteSymbols.h /usr/include/llvm/CodeGen/StackColoring.h /usr/include/llvm/ExecutionEngine/Orc/DylibManager.h /usr/include/llvm/Transforms/Instrumentation/RealtimeSanitizer.h /usr/include/llvm/ExecutionEngine/Orc/JITLinkReentryTrampolines.h /usr/include/llvm/ADT/TrieHashIndexGenerator.h /usr/include/llvm/Transforms/Utils/LowerVectorIntrinsics.h /usr/include/llvm/Telemetry/Telemetry.h /usr/include/llvm/SandboxIR/Instruction.h /usr/include/llvm/SandboxIR/IntrinsicInst.h /usr/include/llvm/Transforms/Utils/LongestCommonSequence.h"
packages/core2-64-poky-linux/llvm/llvm-dev: PKGV changed from 19.1.7 [default] to 20.1.0 [default]
packages/core2-64-poky-linux/llvm/llvm-dev: PKGSIZE changed from 26271386 to 29470562 (+12%)
packages/core2-64-poky-linux/llvm/llvm-doc: PV changed from "19.1.7" to "20.1.0"
packages/core2-64-poky-linux/llvm/llvm-doc: PKGV changed from 19.1.7 [default] to 20.1.0 [default]
packages/core2-64-poky-linux/llvm/llvm-libllvm: PV changed from "19.1.7" to "20.1.0"
packages/core2-64-poky-linux/llvm/llvm-libllvm: FILES: removed "/usr/lib/libLLVM-19.so", added "/usr/lib/libLLVM-20.so"
packages/core2-64-poky-linux/llvm/llvm-libllvm: FILELIST: removed "/usr/lib/libLLVM-19.so", added "/usr/lib/libLLVM-20.so"
packages/core2-64-poky-linux/llvm/llvm-libllvm: PKGV changed from 19.1.7 [default] to 20.1.0 [default]
packages/core2-64-poky-linux/llvm/llvm-liblto: PV changed from "19.1.7" to "20.1.0"
packages/core2-64-poky-linux/llvm/llvm-liblto: FILELIST: removed "/usr/lib/libLTO.so.19.1", added "/usr/lib/libLTO.so.20.1"
packages/core2-64-poky-linux/llvm/llvm-liblto: PKG changed from liblto19.1 to liblto20.1
packages/core2-64-poky-linux/llvm/llvm-liblto: PKGV changed from 19.1.7 [default] to 20.1.0 [default]
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PV changed from "19.1.7" to "20.1.0"
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: FILELIST: removed "/usr/lib/libRemarks.so.19.1", added "/usr/lib/libRemarks.so.20.1"
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PKG changed from libremarks19.1 to libremarks20.1
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PKGV changed from 19.1.7 [default] to 20.1.0 [default]
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PV changed from "19.1.7" to "20.1.0"
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PKGV changed from 19.1.7 [default] to 20.1.0 [default]
packages/core2-64-poky-linux/llvm/llvm-locale: PV changed from "19.1.7" to "20.1.0"
packages/core2-64-poky-linux/llvm/llvm-locale: PKGV changed from 19.1.7 [default] to 20.1.0 [default]
packages/core2-64-poky-linux/llvm/llvm-src: PV changed from "19.1.7" to "20.1.0"
packages/core2-64-poky-linux/llvm/llvm-src: PKGV changed from 19.1.7 [default] to 20.1.0 [default]
packages/core2-64-poky-linux/llvm/llvm-staticdev: PV changed from "19.1.7" to "20.1.0"
packages/core2-64-poky-linux/llvm/llvm-staticdev: FILELIST: removed "/usr/lib/libLLVMCodeGenData.a", added "/usr/lib/libLLVMTelemetry.a /usr/lib/libLLVMCGData.a /usr/lib/libLLVMFrontendAtomic.a"
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGV changed from 19.1.7 [default] to 20.1.0 [default]
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGSIZE changed from 225628032 to 242260830 (+7%)
packages/core2-64-poky-linux/llvm/llvm: PV changed from "19.1.7" to "20.1.0"
packages/core2-64-poky-linux/llvm/llvm: FILELIST: removed "/usr/lib/libLLVM.so.19.1", added "/usr/bin/llvm-ctxprof-util /usr/bin/llvm-cgdata /usr/lib/libLLVM.so.20.1"
packages/core2-64-poky-linux/llvm/llvm: PKGV changed from 19.1.7 [default] to 20.1.0 [default]
packages/core2-64-poky-linux/llvm/llvm: PKGSIZE changed from 142983519 to 154937607 (+8%)
Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/lib/libLLVM.so changed symlink target from libLLVM.so.19.1 to libLLVM.so.20.1
  /usr/lib/libLTO.so changed symlink target from libLTO.so.19.1 to libLTO.so.20.1
  /usr/lib/libRemarks.so changed symlink target from libRemarks.so.19.1 to libRemarks.so.20.1
  /usr/bin/crossscripts/llvm-config19.1.7 moved to /usr/bin/crossscripts/llvm-config20.1.0
  /usr/lib/libLLVM-19.so moved to /usr/lib/libLLVM-20.so
  /usr/lib/libLLVM.so.19.1 moved to /usr/lib/libLLVM.so.20.1
  /usr/lib/libLTO.so.19.1 moved to /usr/lib/libLTO.so.20.1
  /usr/lib/libRemarks.so.19.1 moved to /usr/lib/libRemarks.so.20.1
  /usr/include/llvm/ADT/DeltaTree.h was added
  /usr/include/llvm/ADT/RewriteBuffer.h was added
  /usr/include/llvm/ADT/RewriteRope.h was added
  /usr/include/llvm/ADT/StringTable.h was added
  /usr/include/llvm/ADT/TrieHashIndexGenerator.h was added
  /usr/include/llvm/ADT/TrieRawHashMap.h was added
  /usr/include/llvm/Analysis/CtxProfAnalysis.h was added
  /usr/include/llvm/Analysis/DXILMetadataAnalysis.h was added
  /usr/include/llvm/Analysis/DXILResource.h was added
  /usr/include/llvm/Analysis/LastRunTrackingAnalysis.h was added
  /usr/include/llvm/Analysis/ScalarEvolutionPatternMatch.h was added
  /usr/include/llvm/BinaryFormat/ELFRelocs/RISCV_nonstandard.def was added
  /usr/include/llvm/CGData was added
  /usr/include/llvm/CGData/CodeGenData.h was added
  /usr/include/llvm/CGData/CodeGenData.inc was added
  /usr/include/llvm/CGData/CodeGenDataReader.h was added
  /usr/include/llvm/CGData/CodeGenDataWriter.h was added
  /usr/include/llvm/CGData/OutlinedHashTree.h was added
  /usr/include/llvm/CGData/OutlinedHashTreeRecord.h was added
  /usr/include/llvm/CGData/StableFunctionMap.h was added
  /usr/include/llvm/CGData/StableFunctionMapRecord.h was added
  /usr/include/llvm/CodeGen/CodeGenTargetMachineImpl.h was added
  /usr/include/llvm/CodeGen/EarlyIfConversion.h was added
  /usr/include/llvm/CodeGen/GlobalMergeFunctions.h was added
  /usr/include/llvm/CodeGen/MachineCSE.h was added
  /usr/include/llvm/CodeGen/MachineLICM.h was added
  /usr/include/llvm/CodeGen/OptimizePHIs.h was added
  /usr/include/llvm/CodeGen/PeepholeOptimizer.h was added
  /usr/include/llvm/CodeGen/RegUsageInfoCollector.h was added
  /usr/include/llvm/CodeGen/RegUsageInfoPropagate.h was added
  /usr/include/llvm/CodeGen/SpillPlacement.h was added
  /usr/include/llvm/CodeGen/StackColoring.h was added
  /usr/include/llvm/CodeGen/TailDuplication.h was added
  /usr/include/llvm/DebugInfo/GSYM/CallSiteInfo.h was added
  /usr/include/llvm/DebugInfo/GSYM/MergedFunctionsInfo.h was added
  /usr/include/llvm/ExecutionEngine/Orc/AbsoluteSymbols.h was added
  /usr/include/llvm/ExecutionEngine/Orc/CoreContainers.h was added
  /usr/include/llvm/ExecutionEngine/Orc/DylibManager.h was added
  /usr/include/llvm/ExecutionEngine/Orc/EHFrameRegistrationPlugin.h was added
  /usr/include/llvm/ExecutionEngine/Orc/IRPartitionLayer.h was added
  /usr/include/llvm/ExecutionEngine/Orc/JITLinkLazyCallThroughManager.h was added
  /usr/include/llvm/ExecutionEngine/Orc/JITLinkRedirectableSymbolManager.h was added
  /usr/include/llvm/ExecutionEngine/Orc/JITLinkReentryTrampolines.h was added
  /usr/include/llvm/ExecutionEngine/Orc/LazyObjectLinkingLayer.h was added
  /usr/include/llvm/ExecutionEngine/Orc/LinkGraphLayer.h was added
  /usr/include/llvm/ExecutionEngine/Orc/LinkGraphLinkingLayer.h was added
  /usr/include/llvm/ExecutionEngine/Orc/LoadLinkableFile.h was added
  /usr/include/llvm/ExecutionEngine/Orc/MachO.h was added
  /usr/include/llvm/ExecutionEngine/Orc/MaterializationUnit.h was added
  /usr/include/llvm/ExecutionEngine/Orc/RedirectionManager.h was added
  /usr/include/llvm/ExecutionEngine/Orc/ReOptimizeLayer.h was added
  /usr/include/llvm/ExecutionEngine/Orc/Shared/MachOObjectFormat.h was added
  /usr/include/llvm/ExecutionEngine/Orc/TargetProcess/DefaultHostBootstrapValues.h was added
  /usr/include/llvm/ExecutionEngine/Orc/TargetProcess/UnwindInfoManager.h was added
  /usr/include/llvm/ExecutionEngine/Orc/UnwindInfoRegistrationPlugin.h was added
  /usr/include/llvm/Frontend/Atomic was added
  /usr/include/llvm/Frontend/Atomic/Atomic.h was added
  /usr/include/llvm/IR/CmpPredicate.h was added
  /usr/include/llvm/IR/ConstantFPRange.h was added
  /usr/include/llvm/IR/NVVMIntrinsicUtils.h was added
  /usr/include/llvm/IR/VectorTypeUtils.h was added
  /usr/include/llvm/Passes/DroppedVariableStats.h was added
  /usr/include/llvm/Passes/DroppedVariableStatsIR.h was added
  /usr/include/llvm/ProfileData/MemProfYAML.h was added
  /usr/include/llvm/SandboxIR/Argument.h was added
  /usr/include/llvm/SandboxIR/BasicBlock.h was added
  /usr/include/llvm/SandboxIR/Constant.h was added
  /usr/include/llvm/SandboxIR/Context.h was added
  /usr/include/llvm/SandboxIR/Function.h was added
  /usr/include/llvm/SandboxIR/Instruction.h was added
  /usr/include/llvm/SandboxIR/IntrinsicInst.h was added
  /usr/include/llvm/SandboxIR/Module.h was added
  /usr/include/llvm/SandboxIR/Operator.h was added
  /usr/include/llvm/SandboxIR/Pass.h was added
  /usr/include/llvm/SandboxIR/PassManager.h was added
  /usr/include/llvm/SandboxIR/Region.h was added
  /usr/include/llvm/SandboxIR/Type.h was added
  /usr/include/llvm/SandboxIR/User.h was added
  /usr/include/llvm/SandboxIR/Utils.h was added
  /usr/include/llvm/SandboxIR/Value.h was added
  /usr/include/llvm/SandboxIR/Values.def was added
  /usr/include/llvm/Support/AArch64BuildAttributes.h was added
  /usr/include/llvm/Support/NVPTXAddrSpace.h was added
  /usr/include/llvm/Support/OptionStrCmp.h was added
  /usr/include/llvm/TableGen/AArch64ImmCheck.h was added
  /usr/include/llvm/TableGen/TGTimer.h was added
  /usr/include/llvm/TargetParser/AArch64FeatPriorities.inc was added
  /usr/include/llvm/TargetParser/PPCTargetParser.h was added
  /usr/include/llvm/Telemetry was added
  /usr/include/llvm/Telemetry/Telemetry.h was added
  /usr/include/llvm/Transforms/Coroutines/ABI.h was added
  /usr/include/llvm/Transforms/Coroutines/CoroAnnotationElide.h was added
  /usr/include/llvm/Transforms/Coroutines/CoroInstr.h was added
  /usr/include/llvm/Transforms/Coroutines/CoroShape.h was added
  /usr/include/llvm/Transforms/Coroutines/MaterializationUtils.h was added
  /usr/include/llvm/Transforms/Coroutines/SpillUtils.h was added
  /usr/include/llvm/Transforms/Coroutines/SuspendCrossingInfo.h was added
  /usr/include/llvm/Transforms/Instrumentation/PGOCtxProfFlattening.h was added
  /usr/include/llvm/Transforms/Instrumentation/RealtimeSanitizer.h was added
  /usr/include/llvm/Transforms/Instrumentation/TypeSanitizer.h was added
  /usr/include/llvm/Transforms/Scalar/LoopTermFold.h was added
  /usr/include/llvm/Transforms/Utils/ControlFlowUtils.h was added
  /usr/include/llvm/Transforms/Utils/ExtraPassManager.h was added
  /usr/include/llvm/Transforms/Utils/Instrumentation.h was added
  /usr/include/llvm/Transforms/Utils/IRNormalizer.h was added
  /usr/include/llvm/Transforms/Utils/LongestCommonSequence.h was added
  /usr/include/llvm/Transforms/Utils/LowerVectorIntrinsics.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/DependencyGraph.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/InstrMaps.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Interval.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Legality.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/BottomUpVec.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/NullPass.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/PrintInstructionCount.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/RegionsFromMetadata.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/SandboxVectorizer.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/SandboxVectorizerPassBuilder.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Scheduler.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/SeedCollector.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/VecUtils.h was added
  /usr/lib/cmake/llvm/FileLock.cmake was added
  /usr/lib/libLLVMCGData.a was added
  /usr/lib/libLLVMFrontendAtomic.a was added
  /usr/lib/libLLVMTelemetry.a was added
  /usr/include/llvm/CodeGenData was removed
  /usr/include/llvm/CodeGenData/OutlinedHashTree.h was removed
  /usr/include/llvm/CodeGenData/OutlinedHashTreeRecord.h was removed
  /usr/include/llvm/Frontend/OpenMP/ConstructCompositionT.h was removed
  /usr/include/llvm/LTO/SummaryBasedOptimizations.h was removed
  /usr/include/llvm/ProfileData/RawMemProfReader.h was removed
  /usr/include/llvm/SandboxIR/SandboxIR.h was removed
  /usr/include/llvm/SandboxIR/SandboxIRValues.def was removed
  /usr/include/llvm/Transforms/Instrumentation.h was removed
  /usr/include/llvm/Transforms/Instrumentation/PoisonChecking.h was removed
  /usr/include/llvm/Transforms/IPO/SyntheticCountsPropagation.h was removed
  /usr/include/llvm/Transforms/Scalar/TLSVariableHoist.h was removed
  /usr/include/llvm/Transforms/Utils/DXILResource.h was removed
  /usr/lib/cmake/llvm/LLVMCheckLinkerFlag.cmake was removed
  /usr/lib/libLLVMCodeGenData.a was removed
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config19.1.7 to llvm-config20.1.0
  /usr/lib/libLLVM.so changed symlink target from libLLVM.so.19.1 to libLLVM.so.20.1
  /usr/lib/libLTO.so changed symlink target from libLTO.so.19.1 to libLTO.so.20.1
  /usr/lib/libRemarks.so changed symlink target from libRemarks.so.19.1 to libRemarks.so.20.1
  /usr/bin/llvm-config19.1.7 moved to /usr/bin/llvm-config20.1.0
  /usr/bin/llvm-tblgen19.1.7 moved to /usr/bin/llvm-tblgen20.1.0
  /usr/lib/libLLVM-19.so moved to /usr/lib/libLLVM-20.so
  /usr/lib/libLLVM.so.19.1 moved to /usr/lib/libLLVM.so.20.1
  /usr/lib/libLTO.so.19.1 moved to /usr/lib/libLTO.so.20.1
  /usr/lib/libRemarks.so.19.1 moved to /usr/lib/libRemarks.so.20.1
  /usr/bin/llvm-cgdata was added
  /usr/bin/llvm-ctxprof-util was added
  /usr/include/llvm/ADT/DeltaTree.h was added
  /usr/include/llvm/ADT/RewriteBuffer.h was added
  /usr/include/llvm/ADT/RewriteRope.h was added
  /usr/include/llvm/ADT/StringTable.h was added
  /usr/include/llvm/ADT/TrieHashIndexGenerator.h was added
  /usr/include/llvm/ADT/TrieRawHashMap.h was added
  /usr/include/llvm/Analysis/CtxProfAnalysis.h was added
  /usr/include/llvm/Analysis/DXILMetadataAnalysis.h was added
  /usr/include/llvm/Analysis/DXILResource.h was added
  /usr/include/llvm/Analysis/LastRunTrackingAnalysis.h was added
  /usr/include/llvm/Analysis/ScalarEvolutionPatternMatch.h was added
  /usr/include/llvm/BinaryFormat/ELFRelocs/RISCV_nonstandard.def was added
  /usr/include/llvm/CGData was added
  /usr/include/llvm/CGData/CodeGenData.h was added
  /usr/include/llvm/CGData/CodeGenData.inc was added
  /usr/include/llvm/CGData/CodeGenDataReader.h was added
  /usr/include/llvm/CGData/CodeGenDataWriter.h was added
  /usr/include/llvm/CGData/OutlinedHashTree.h was added
  /usr/include/llvm/CGData/OutlinedHashTreeRecord.h was added
  /usr/include/llvm/CGData/StableFunctionMap.h was added
  /usr/include/llvm/CGData/StableFunctionMapRecord.h was added
  /usr/include/llvm/CodeGen/CodeGenTargetMachineImpl.h was added
  /usr/include/llvm/CodeGen/EarlyIfConversion.h was added
  /usr/include/llvm/CodeGen/GlobalMergeFunctions.h was added
  /usr/include/llvm/CodeGen/MachineCSE.h was added
  /usr/include/llvm/CodeGen/MachineLICM.h was added
  /usr/include/llvm/CodeGen/OptimizePHIs.h was added
  /usr/include/llvm/CodeGen/PeepholeOptimizer.h was added
  /usr/include/llvm/CodeGen/RegUsageInfoCollector.h was added
  /usr/include/llvm/CodeGen/RegUsageInfoPropagate.h was added
  /usr/include/llvm/CodeGen/SpillPlacement.h was added
  /usr/include/llvm/CodeGen/StackColoring.h was added
  /usr/include/llvm/CodeGen/TailDuplication.h was added
  /usr/include/llvm/DebugInfo/GSYM/CallSiteInfo.h was added
  /usr/include/llvm/DebugInfo/GSYM/MergedFunctionsInfo.h was added
  /usr/include/llvm/ExecutionEngine/Orc/AbsoluteSymbols.h was added
  /usr/include/llvm/ExecutionEngine/Orc/CoreContainers.h was added
  /usr/include/llvm/ExecutionEngine/Orc/DylibManager.h was added
  /usr/include/llvm/ExecutionEngine/Orc/EHFrameRegistrationPlugin.h was added
  /usr/include/llvm/ExecutionEngine/Orc/IRPartitionLayer.h was added
  /usr/include/llvm/ExecutionEngine/Orc/JITLinkLazyCallThroughManager.h was added
  /usr/include/llvm/ExecutionEngine/Orc/JITLinkRedirectableSymbolManager.h was added
  /usr/include/llvm/ExecutionEngine/Orc/JITLinkReentryTrampolines.h was added
  /usr/include/llvm/ExecutionEngine/Orc/LazyObjectLinkingLayer.h was added
  /usr/include/llvm/ExecutionEngine/Orc/LinkGraphLayer.h was added
  /usr/include/llvm/ExecutionEngine/Orc/LinkGraphLinkingLayer.h was added
  /usr/include/llvm/ExecutionEngine/Orc/LoadLinkableFile.h was added
  /usr/include/llvm/ExecutionEngine/Orc/MachO.h was added
  /usr/include/llvm/ExecutionEngine/Orc/MaterializationUnit.h was added
  /usr/include/llvm/ExecutionEngine/Orc/RedirectionManager.h was added
  /usr/include/llvm/ExecutionEngine/Orc/ReOptimizeLayer.h was added
  /usr/include/llvm/ExecutionEngine/Orc/Shared/MachOObjectFormat.h was added
  /usr/include/llvm/ExecutionEngine/Orc/TargetProcess/DefaultHostBootstrapValues.h was added
  /usr/include/llvm/ExecutionEngine/Orc/TargetProcess/UnwindInfoManager.h was added
  /usr/include/llvm/ExecutionEngine/Orc/UnwindInfoRegistrationPlugin.h was added
  /usr/include/llvm/Frontend/Atomic was added
  /usr/include/llvm/Frontend/Atomic/Atomic.h was added
  /usr/include/llvm/IR/CmpPredicate.h was added
  /usr/include/llvm/IR/ConstantFPRange.h was added
  /usr/include/llvm/IR/NVVMIntrinsicUtils.h was added
  /usr/include/llvm/IR/VectorTypeUtils.h was added
  /usr/include/llvm/Passes/DroppedVariableStats.h was added
  /usr/include/llvm/Passes/DroppedVariableStatsIR.h was added
  /usr/include/llvm/ProfileData/MemProfYAML.h was added
  /usr/include/llvm/SandboxIR/Argument.h was added
  /usr/include/llvm/SandboxIR/BasicBlock.h was added
  /usr/include/llvm/SandboxIR/Constant.h was added
  /usr/include/llvm/SandboxIR/Context.h was added
  /usr/include/llvm/SandboxIR/Function.h was added
  /usr/include/llvm/SandboxIR/Instruction.h was added
  /usr/include/llvm/SandboxIR/IntrinsicInst.h was added
  /usr/include/llvm/SandboxIR/Module.h was added
  /usr/include/llvm/SandboxIR/Operator.h was added
  /usr/include/llvm/SandboxIR/Pass.h was added
  /usr/include/llvm/SandboxIR/PassManager.h was added
  /usr/include/llvm/SandboxIR/Region.h was added
  /usr/include/llvm/SandboxIR/Type.h was added
  /usr/include/llvm/SandboxIR/User.h was added
  /usr/include/llvm/SandboxIR/Utils.h was added
  /usr/include/llvm/SandboxIR/Value.h was added
  /usr/include/llvm/SandboxIR/Values.def was added
  /usr/include/llvm/Support/AArch64BuildAttributes.h was added
  /usr/include/llvm/Support/NVPTXAddrSpace.h was added
  /usr/include/llvm/Support/OptionStrCmp.h was added
  /usr/include/llvm/TableGen/AArch64ImmCheck.h was added
  /usr/include/llvm/TableGen/TGTimer.h was added
  /usr/include/llvm/TargetParser/AArch64FeatPriorities.inc was added
  /usr/include/llvm/TargetParser/PPCTargetParser.h was added
  /usr/include/llvm/Telemetry was added
  /usr/include/llvm/Telemetry/Telemetry.h was added
  /usr/include/llvm/Transforms/Coroutines/ABI.h was added
  /usr/include/llvm/Transforms/Coroutines/CoroAnnotationElide.h was added
  /usr/include/llvm/Transforms/Coroutines/CoroInstr.h was added
  /usr/include/llvm/Transforms/Coroutines/CoroShape.h was added
  /usr/include/llvm/Transforms/Coroutines/MaterializationUtils.h was added
  /usr/include/llvm/Transforms/Coroutines/SpillUtils.h was added
  /usr/include/llvm/Transforms/Coroutines/SuspendCrossingInfo.h was added
  /usr/include/llvm/Transforms/Instrumentation/PGOCtxProfFlattening.h was added
  /usr/include/llvm/Transforms/Instrumentation/RealtimeSanitizer.h was added
  /usr/include/llvm/Transforms/Instrumentation/TypeSanitizer.h was added
  /usr/include/llvm/Transforms/Scalar/LoopTermFold.h was added
  /usr/include/llvm/Transforms/Utils/ControlFlowUtils.h was added
  /usr/include/llvm/Transforms/Utils/ExtraPassManager.h was added
  /usr/include/llvm/Transforms/Utils/Instrumentation.h was added
  /usr/include/llvm/Transforms/Utils/IRNormalizer.h was added
  /usr/include/llvm/Transforms/Utils/LongestCommonSequence.h was added
  /usr/include/llvm/Transforms/Utils/LowerVectorIntrinsics.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/DependencyGraph.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/InstrMaps.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Interval.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Legality.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/BottomUpVec.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/NullPass.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/PrintInstructionCount.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/RegionsFromMetadata.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/SandboxVectorizer.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/SandboxVectorizerPassBuilder.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Scheduler.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/SeedCollector.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/VecUtils.h was added
  /usr/lib/cmake/llvm/FileLock.cmake was added
  /usr/lib/libLLVMCGData.a was added
  /usr/lib/libLLVMFrontendAtomic.a was added
  /usr/lib/libLLVMTelemetry.a was added
  /usr/include/llvm/CodeGenData was removed
  /usr/include/llvm/CodeGenData/OutlinedHashTree.h was removed
  /usr/include/llvm/CodeGenData/OutlinedHashTreeRecord.h was removed
  /usr/include/llvm/Frontend/OpenMP/ConstructCompositionT.h was removed
  /usr/include/llvm/LTO/SummaryBasedOptimizations.h was removed
  /usr/include/llvm/ProfileData/RawMemProfReader.h was removed
  /usr/include/llvm/SandboxIR/SandboxIR.h was removed
  /usr/include/llvm/SandboxIR/SandboxIRValues.def was removed
  /usr/include/llvm/Transforms/Instrumentation.h was removed
  /usr/include/llvm/Transforms/Instrumentation/PoisonChecking.h was removed
  /usr/include/llvm/Transforms/IPO/SyntheticCountsPropagation.h was removed
  /usr/include/llvm/Transforms/Scalar/TLSVariableHoist.h was removed
  /usr/include/llvm/Transforms/Utils/DXILResource.h was removed
  /usr/lib/cmake/llvm/LLVMCheckLinkerFlag.cmake was removed
  /usr/lib/libLLVMCodeGenData.a was removed

--===============4624357627370954933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/llvm/llvm-dbg: PKGSIZE changed from 38194392 to 43460792 (+14%)
packages/core2-64-poky-linux/llvm/llvm-dev: FILELIST: removed "/usr/include/llvm/ProfileData/RawMemProfReader.h /usr/include/llvm/Transforms/Instrumentation/PoisonChecking.h /usr/include/llvm/SandboxIR/SandboxIRValues.def /usr/include/llvm/Transforms/IPO/SyntheticCountsPropagation.h /usr/include/llvm/CodeGenData/OutlinedHashTreeRecord.h /usr/include/llvm/Frontend/OpenMP/ConstructCompositionT.h /usr/include/llvm/LTO/SummaryBasedOptimizations.h /usr/lib/cmake/llvm/LLVMCheckLinkerFlag.cmake /usr/include/llvm/Transforms/Scalar/TLSVariableHoist.h /usr/include/llvm/Transforms/Instrumentation.h /usr/include/llvm/CodeGenData/OutlinedHashTree.h /usr/include/llvm/SandboxIR/SandboxIR.h /usr/include/llvm/Transforms/Utils/DXILResource.h", added "/usr/include/llvm/SandboxIR/BasicBlock.h /usr/include/llvm/Transforms/Scalar/LoopTermFold.h /usr/include/llvm/ExecutionEngine/Orc/LinkGraphLinkingLayer.h /usr/include/llvm/IR/VectorTypeUtils.h /usr/include/llvm/CodeGen/RegUsageInfoPropagate.h /usr/include
 /llvm/ExecutionEngine/Orc/UnwindInfoRegistrationPlugin.h /usr/include/llvm/ExecutionEngine/Orc/JITLinkRedirectableSymbolManager.h /usr/include/llvm/Analysis/DXILResource.h /usr/include/llvm/ExecutionEngine/Orc/TargetProcess/UnwindInfoManager.h /usr/include/llvm/CGData/OutlinedHashTree.h /usr/include/llvm/SandboxIR/Instruction.h /usr/include/llvm/IR/CmpPredicate.h /usr/include/llvm/ExecutionEngine/Orc/LazyObjectLinkingLayer.h /usr/include/llvm/CodeGen/MachineLICM.h /usr/include/llvm/Support/NVPTXAddrSpace.h /usr/include/llvm/ADT/RewriteBuffer.h /usr/include/llvm/SandboxIR/Operator.h /usr/include/llvm/CodeGen/CodeGenTargetMachineImpl.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/SeedCollector.h /usr/include/llvm/ExecutionEngine/Orc/MaterializationUnit.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Legality.h /usr/include/llvm/ExecutionEngine/Orc/JITLinkLazyCallThroughManager.h /usr/include/llvm/CodeGen/GlobalMergeFunctions.h /usr/include/llvm/Transforms/Instru
 mentation/RealtimeSanitizer.h /usr/include/llvm/Transforms/Coroutines/CoroShape.h /usr/include/llvm/DebugInfo/GSYM/MergedFunctionsInfo.h /usr/include/llvm/SandboxIR/IntrinsicInst.h /usr/include/llvm/Transforms/Utils/IRNormalizer.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/RegionsFromMetadata.h /usr/include/llvm/IR/ConstantFPRange.h /usr/include/llvm/CGData/OutlinedHashTreeRecord.h /usr/include/llvm/Transforms/Coroutines/MaterializationUtils.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/InstrMaps.h /usr/include/llvm/ADT/TrieHashIndexGenerator.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/SandboxVectorizer.h /usr/include/llvm/CGData/CodeGenData.h /usr/include/llvm/SandboxIR/Constant.h /usr/include/llvm/ExecutionEngine/Orc/ReOptimizeLayer.h /usr/include/llvm/DebugInfo/GSYM/CallSiteInfo.h /usr/include/llvm/ExecutionEngine/Orc/EHFrameRegistrationPlugin.h /usr/include/llvm/Transforms/Utils/LongestCommonSequence.h /usr/include/llvm/SandboxIR/
 Value.h /usr/include/llvm/TargetParser/PPCTargetParser.h /usr/include/llvm/ExecutionEngine/Orc/Shared/MachOObjectFormat.h /usr/include/llvm/Frontend/Atomic/Atomic.h /usr/include/llvm/Analysis/DXILMetadataAnalysis.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/SandboxVectorizerPassBuilder.h /usr/include/llvm/Support/OptionStrCmp.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/BottomUpVec.h /usr/include/llvm/Transforms/Coroutines/CoroInstr.h /usr/include/llvm/ADT/DeltaTree.h /usr/include/llvm/SandboxIR/PassManager.h /usr/include/llvm/Support/AArch64BuildAttributes.h /usr/include/llvm/CGData/StableFunctionMap.h /usr/include/llvm/Passes/DroppedVariableStats.h /usr/include/llvm/Analysis/ScalarEvolutionPatternMatch.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Scheduler.h /usr/include/llvm/Transforms/Utils/ExtraPassManager.h /usr/include/llvm/CGData/StableFunctionMapRecord.h /usr/include/llvm/Transforms/Coroutines/SuspendCrossingInfo.h /usr/inclu
 de/llvm/TableGen/AArch64ImmCheck.h /usr/include/llvm/Transforms/Instrumentation/TypeSanitizer.h /usr/include/llvm/ExecutionEngine/Orc/DylibManager.h /usr/include/llvm/Transforms/Coroutines/CoroAnnotationElide.h /usr/include/llvm/CodeGen/EarlyIfConversion.h /usr/include/llvm/Transforms/Instrumentation/PGOCtxProfFlattening.h /usr/include/llvm/CGData/CodeGenData.inc /usr/include/llvm/ExecutionEngine/Orc/IRPartitionLayer.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/NullPass.h /usr/include/llvm/Transforms/Utils/LowerVectorIntrinsics.h /usr/include/llvm/Transforms/Coroutines/ABI.h /usr/include/llvm/TableGen/TGTimer.h /usr/include/llvm/SandboxIR/Values.def /usr/include/llvm/CodeGen/StackColoring.h /usr/include/llvm/SandboxIR/Region.h /usr/include/llvm/SandboxIR/Context.h /usr/include/llvm/BinaryFormat/ELFRelocs/RISCV_nonstandard.def /usr/include/llvm/SandboxIR/Pass.h /usr/include/llvm/SandboxIR/Type.h /usr/include/llvm/SandboxIR/User.h /usr/include/llvm/CodeGen/TailDup
 lication.h /usr/include/llvm/IR/NVVMIntrinsicUtils.h /usr/include/llvm/ExecutionEngine/Orc/LoadLinkableFile.h /usr/include/llvm/CodeGen/PeepholeOptimizer.h /usr/include/llvm/CodeGen/SpillPlacement.h /usr/include/llvm/SandboxIR/Function.h /usr/include/llvm/TargetParser/AArch64FeatPriorities.inc /usr/include/llvm/CodeGen/OptimizePHIs.h /usr/include/llvm/ProfileData/MemProfYAML.h /usr/include/llvm/ADT/StringTable.h /usr/lib/cmake/llvm/FileLock.cmake /usr/include/llvm/CodeGen/RegUsageInfoCollector.h /usr/include/llvm/ExecutionEngine/Orc/AbsoluteSymbols.h /usr/include/llvm/ExecutionEngine/Orc/MachO.h /usr/include/llvm/ADT/RewriteRope.h /usr/include/llvm/SandboxIR/Argument.h /usr/include/llvm/CodeGen/MachineCSE.h /usr/include/llvm/Passes/DroppedVariableStatsIR.h /usr/include/llvm/ExecutionEngine/Orc/RedirectionManager.h /usr/include/llvm/SandboxIR/Utils.h /usr/include/llvm/CGData/CodeGenDataReader.h /usr/include/llvm/CGData/CodeGenDataWriter.h /usr/include/llvm/Telemetry/Telemetry.h /usr/
 include/llvm/Transforms/Vectorize/SandboxVectorizer/DependencyGraph.h /usr/include/llvm/ADT/TrieRawHashMap.h /usr/include/llvm/ExecutionEngine/Orc/CoreContainers.h /usr/include/llvm/Transforms/Coroutines/SpillUtils.h /usr/include/llvm/Transforms/Utils/Instrumentation.h /usr/include/llvm/Transforms/Utils/ControlFlowUtils.h /usr/include/llvm/ExecutionEngine/Orc/JITLinkReentryTrampolines.h /usr/include/llvm/ExecutionEngine/Orc/TargetProcess/DefaultHostBootstrapValues.h /usr/include/llvm/Analysis/LastRunTrackingAnalysis.h /usr/include/llvm/SandboxIR/Module.h /usr/include/llvm/ExecutionEngine/Orc/LinkGraphLayer.h /usr/include/llvm/Analysis/CtxProfAnalysis.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Interval.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/VecUtils.h /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/PrintInstructionCount.h"
packages/core2-64-poky-linux/llvm/llvm-dev: PKGSIZE changed from 26271386 to 29470562 (+12%)
packages/core2-64-poky-linux/llvm/llvm-libllvm: FILELIST: removed "/usr/lib/libLLVM-19.so", added "/usr/lib/libLLVM-20.so"
packages/core2-64-poky-linux/llvm/llvm-liblto: FILELIST: removed "/usr/lib/libLTO.so.19.1", added "/usr/lib/libLTO.so.20.1"
packages/core2-64-poky-linux/llvm/llvm-liblto: PKG changed from liblto19.1 to liblto20.1
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: FILELIST: removed "/usr/lib/libRemarks.so.19.1", added "/usr/lib/libRemarks.so.20.1"
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PKG changed from libremarks19.1 to libremarks20.1
packages/core2-64-poky-linux/llvm/llvm-staticdev: FILELIST: removed "/usr/lib/libLLVMCodeGenData.a", added "/usr/lib/libLLVMCGData.a /usr/lib/libLLVMTelemetry.a /usr/lib/libLLVMFrontendAtomic.a"
packages/core2-64-poky-linux/llvm/llvm: FILELIST: removed "/usr/lib/libLLVM.so.19.1", added "/usr/bin/llvm-cgdata /usr/lib/libLLVM.so.20.1 /usr/bin/llvm-ctxprof-util"
Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/lib/libLLVM.so changed symlink target from libLLVM.so.19.1 to libLLVM.so.20.1
  /usr/lib/libLTO.so changed symlink target from libLTO.so.19.1 to libLTO.so.20.1
  /usr/lib/libRemarks.so changed symlink target from libRemarks.so.19.1 to libRemarks.so.20.1
  /usr/bin/crossscripts/llvm-config19.1.7 moved to /usr/bin/crossscripts/llvm-config20.1.0
  /usr/lib/libLLVM-19.so moved to /usr/lib/libLLVM-20.so
  /usr/lib/libLLVM.so.19.1 moved to /usr/lib/libLLVM.so.20.1
  /usr/lib/libLTO.so.19.1 moved to /usr/lib/libLTO.so.20.1
  /usr/lib/libRemarks.so.19.1 moved to /usr/lib/libRemarks.so.20.1
  /usr/include/llvm/ADT/DeltaTree.h was added
  /usr/include/llvm/ADT/RewriteBuffer.h was added
  /usr/include/llvm/ADT/RewriteRope.h was added
  /usr/include/llvm/ADT/StringTable.h was added
  /usr/include/llvm/ADT/TrieHashIndexGenerator.h was added
  /usr/include/llvm/ADT/TrieRawHashMap.h was added
  /usr/include/llvm/Analysis/CtxProfAnalysis.h was added
  /usr/include/llvm/Analysis/DXILMetadataAnalysis.h was added
  /usr/include/llvm/Analysis/DXILResource.h was added
  /usr/include/llvm/Analysis/LastRunTrackingAnalysis.h was added
  /usr/include/llvm/Analysis/ScalarEvolutionPatternMatch.h was added
  /usr/include/llvm/BinaryFormat/ELFRelocs/RISCV_nonstandard.def was added
  /usr/include/llvm/CGData was added
  /usr/include/llvm/CGData/CodeGenData.h was added
  /usr/include/llvm/CGData/CodeGenData.inc was added
  /usr/include/llvm/CGData/CodeGenDataReader.h was added
  /usr/include/llvm/CGData/CodeGenDataWriter.h was added
  /usr/include/llvm/CGData/OutlinedHashTree.h was added
  /usr/include/llvm/CGData/OutlinedHashTreeRecord.h was added
  /usr/include/llvm/CGData/StableFunctionMap.h was added
  /usr/include/llvm/CGData/StableFunctionMapRecord.h was added
  /usr/include/llvm/CodeGen/CodeGenTargetMachineImpl.h was added
  /usr/include/llvm/CodeGen/EarlyIfConversion.h was added
  /usr/include/llvm/CodeGen/GlobalMergeFunctions.h was added
  /usr/include/llvm/CodeGen/MachineCSE.h was added
  /usr/include/llvm/CodeGen/MachineLICM.h was added
  /usr/include/llvm/CodeGen/OptimizePHIs.h was added
  /usr/include/llvm/CodeGen/PeepholeOptimizer.h was added
  /usr/include/llvm/CodeGen/RegUsageInfoCollector.h was added
  /usr/include/llvm/CodeGen/RegUsageInfoPropagate.h was added
  /usr/include/llvm/CodeGen/SpillPlacement.h was added
  /usr/include/llvm/CodeGen/StackColoring.h was added
  /usr/include/llvm/CodeGen/TailDuplication.h was added
  /usr/include/llvm/DebugInfo/GSYM/CallSiteInfo.h was added
  /usr/include/llvm/DebugInfo/GSYM/MergedFunctionsInfo.h was added
  /usr/include/llvm/ExecutionEngine/Orc/AbsoluteSymbols.h was added
  /usr/include/llvm/ExecutionEngine/Orc/CoreContainers.h was added
  /usr/include/llvm/ExecutionEngine/Orc/DylibManager.h was added
  /usr/include/llvm/ExecutionEngine/Orc/EHFrameRegistrationPlugin.h was added
  /usr/include/llvm/ExecutionEngine/Orc/IRPartitionLayer.h was added
  /usr/include/llvm/ExecutionEngine/Orc/JITLinkLazyCallThroughManager.h was added
  /usr/include/llvm/ExecutionEngine/Orc/JITLinkRedirectableSymbolManager.h was added
  /usr/include/llvm/ExecutionEngine/Orc/JITLinkReentryTrampolines.h was added
  /usr/include/llvm/ExecutionEngine/Orc/LazyObjectLinkingLayer.h was added
  /usr/include/llvm/ExecutionEngine/Orc/LinkGraphLayer.h was added
  /usr/include/llvm/ExecutionEngine/Orc/LinkGraphLinkingLayer.h was added
  /usr/include/llvm/ExecutionEngine/Orc/LoadLinkableFile.h was added
  /usr/include/llvm/ExecutionEngine/Orc/MachO.h was added
  /usr/include/llvm/ExecutionEngine/Orc/MaterializationUnit.h was added
  /usr/include/llvm/ExecutionEngine/Orc/RedirectionManager.h was added
  /usr/include/llvm/ExecutionEngine/Orc/ReOptimizeLayer.h was added
  /usr/include/llvm/ExecutionEngine/Orc/Shared/MachOObjectFormat.h was added
  /usr/include/llvm/ExecutionEngine/Orc/TargetProcess/DefaultHostBootstrapValues.h was added
  /usr/include/llvm/ExecutionEngine/Orc/TargetProcess/UnwindInfoManager.h was added
  /usr/include/llvm/ExecutionEngine/Orc/UnwindInfoRegistrationPlugin.h was added
  /usr/include/llvm/Frontend/Atomic was added
  /usr/include/llvm/Frontend/Atomic/Atomic.h was added
  /usr/include/llvm/IR/CmpPredicate.h was added
  /usr/include/llvm/IR/ConstantFPRange.h was added
  /usr/include/llvm/IR/NVVMIntrinsicUtils.h was added
  /usr/include/llvm/IR/VectorTypeUtils.h was added
  /usr/include/llvm/Passes/DroppedVariableStats.h was added
  /usr/include/llvm/Passes/DroppedVariableStatsIR.h was added
  /usr/include/llvm/ProfileData/MemProfYAML.h was added
  /usr/include/llvm/SandboxIR/Argument.h was added
  /usr/include/llvm/SandboxIR/BasicBlock.h was added
  /usr/include/llvm/SandboxIR/Constant.h was added
  /usr/include/llvm/SandboxIR/Context.h was added
  /usr/include/llvm/SandboxIR/Function.h was added
  /usr/include/llvm/SandboxIR/Instruction.h was added
  /usr/include/llvm/SandboxIR/IntrinsicInst.h was added
  /usr/include/llvm/SandboxIR/Module.h was added
  /usr/include/llvm/SandboxIR/Operator.h was added
  /usr/include/llvm/SandboxIR/Pass.h was added
  /usr/include/llvm/SandboxIR/PassManager.h was added
  /usr/include/llvm/SandboxIR/Region.h was added
  /usr/include/llvm/SandboxIR/Type.h was added
  /usr/include/llvm/SandboxIR/User.h was added
  /usr/include/llvm/SandboxIR/Utils.h was added
  /usr/include/llvm/SandboxIR/Value.h was added
  /usr/include/llvm/SandboxIR/Values.def was added
  /usr/include/llvm/Support/AArch64BuildAttributes.h was added
  /usr/include/llvm/Support/NVPTXAddrSpace.h was added
  /usr/include/llvm/Support/OptionStrCmp.h was added
  /usr/include/llvm/TableGen/AArch64ImmCheck.h was added
  /usr/include/llvm/TableGen/TGTimer.h was added
  /usr/include/llvm/TargetParser/AArch64FeatPriorities.inc was added
  /usr/include/llvm/TargetParser/PPCTargetParser.h was added
  /usr/include/llvm/Telemetry was added
  /usr/include/llvm/Telemetry/Telemetry.h was added
  /usr/include/llvm/Transforms/Coroutines/ABI.h was added
  /usr/include/llvm/Transforms/Coroutines/CoroAnnotationElide.h was added
  /usr/include/llvm/Transforms/Coroutines/CoroInstr.h was added
  /usr/include/llvm/Transforms/Coroutines/CoroShape.h was added
  /usr/include/llvm/Transforms/Coroutines/MaterializationUtils.h was added
  /usr/include/llvm/Transforms/Coroutines/SpillUtils.h was added
  /usr/include/llvm/Transforms/Coroutines/SuspendCrossingInfo.h was added
  /usr/include/llvm/Transforms/Instrumentation/PGOCtxProfFlattening.h was added
  /usr/include/llvm/Transforms/Instrumentation/RealtimeSanitizer.h was added
  /usr/include/llvm/Transforms/Instrumentation/TypeSanitizer.h was added
  /usr/include/llvm/Transforms/Scalar/LoopTermFold.h was added
  /usr/include/llvm/Transforms/Utils/ControlFlowUtils.h was added
  /usr/include/llvm/Transforms/Utils/ExtraPassManager.h was added
  /usr/include/llvm/Transforms/Utils/Instrumentation.h was added
  /usr/include/llvm/Transforms/Utils/IRNormalizer.h was added
  /usr/include/llvm/Transforms/Utils/LongestCommonSequence.h was added
  /usr/include/llvm/Transforms/Utils/LowerVectorIntrinsics.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/DependencyGraph.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/InstrMaps.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Interval.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Legality.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/BottomUpVec.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/NullPass.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/PrintInstructionCount.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/RegionsFromMetadata.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/SandboxVectorizer.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/SandboxVectorizerPassBuilder.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Scheduler.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/SeedCollector.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/VecUtils.h was added
  /usr/lib/cmake/llvm/FileLock.cmake was added
  /usr/lib/libLLVMCGData.a was added
  /usr/lib/libLLVMFrontendAtomic.a was added
  /usr/lib/libLLVMTelemetry.a was added
  /usr/include/llvm/CodeGenData was removed
  /usr/include/llvm/CodeGenData/OutlinedHashTree.h was removed
  /usr/include/llvm/CodeGenData/OutlinedHashTreeRecord.h was removed
  /usr/include/llvm/Frontend/OpenMP/ConstructCompositionT.h was removed
  /usr/include/llvm/LTO/SummaryBasedOptimizations.h was removed
  /usr/include/llvm/ProfileData/RawMemProfReader.h was removed
  /usr/include/llvm/SandboxIR/SandboxIR.h was removed
  /usr/include/llvm/SandboxIR/SandboxIRValues.def was removed
  /usr/include/llvm/Transforms/Instrumentation.h was removed
  /usr/include/llvm/Transforms/Instrumentation/PoisonChecking.h was removed
  /usr/include/llvm/Transforms/IPO/SyntheticCountsPropagation.h was removed
  /usr/include/llvm/Transforms/Scalar/TLSVariableHoist.h was removed
  /usr/include/llvm/Transforms/Utils/DXILResource.h was removed
  /usr/lib/cmake/llvm/LLVMCheckLinkerFlag.cmake was removed
  /usr/lib/libLLVMCodeGenData.a was removed
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config19.1.7 to llvm-config20.1.0
  /usr/lib/libLLVM.so changed symlink target from libLLVM.so.19.1 to libLLVM.so.20.1
  /usr/lib/libLTO.so changed symlink target from libLTO.so.19.1 to libLTO.so.20.1
  /usr/lib/libRemarks.so changed symlink target from libRemarks.so.19.1 to libRemarks.so.20.1
  /usr/bin/llvm-config19.1.7 moved to /usr/bin/llvm-config20.1.0
  /usr/bin/llvm-tblgen19.1.7 moved to /usr/bin/llvm-tblgen20.1.0
  /usr/lib/libLLVM-19.so moved to /usr/lib/libLLVM-20.so
  /usr/lib/libLLVM.so.19.1 moved to /usr/lib/libLLVM.so.20.1
  /usr/lib/libLTO.so.19.1 moved to /usr/lib/libLTO.so.20.1
  /usr/lib/libRemarks.so.19.1 moved to /usr/lib/libRemarks.so.20.1
  /usr/bin/llvm-cgdata was added
  /usr/bin/llvm-ctxprof-util was added
  /usr/include/llvm/ADT/DeltaTree.h was added
  /usr/include/llvm/ADT/RewriteBuffer.h was added
  /usr/include/llvm/ADT/RewriteRope.h was added
  /usr/include/llvm/ADT/StringTable.h was added
  /usr/include/llvm/ADT/TrieHashIndexGenerator.h was added
  /usr/include/llvm/ADT/TrieRawHashMap.h was added
  /usr/include/llvm/Analysis/CtxProfAnalysis.h was added
  /usr/include/llvm/Analysis/DXILMetadataAnalysis.h was added
  /usr/include/llvm/Analysis/DXILResource.h was added
  /usr/include/llvm/Analysis/LastRunTrackingAnalysis.h was added
  /usr/include/llvm/Analysis/ScalarEvolutionPatternMatch.h was added
  /usr/include/llvm/BinaryFormat/ELFRelocs/RISCV_nonstandard.def was added
  /usr/include/llvm/CGData was added
  /usr/include/llvm/CGData/CodeGenData.h was added
  /usr/include/llvm/CGData/CodeGenData.inc was added
  /usr/include/llvm/CGData/CodeGenDataReader.h was added
  /usr/include/llvm/CGData/CodeGenDataWriter.h was added
  /usr/include/llvm/CGData/OutlinedHashTree.h was added
  /usr/include/llvm/CGData/OutlinedHashTreeRecord.h was added
  /usr/include/llvm/CGData/StableFunctionMap.h was added
  /usr/include/llvm/CGData/StableFunctionMapRecord.h was added
  /usr/include/llvm/CodeGen/CodeGenTargetMachineImpl.h was added
  /usr/include/llvm/CodeGen/EarlyIfConversion.h was added
  /usr/include/llvm/CodeGen/GlobalMergeFunctions.h was added
  /usr/include/llvm/CodeGen/MachineCSE.h was added
  /usr/include/llvm/CodeGen/MachineLICM.h was added
  /usr/include/llvm/CodeGen/OptimizePHIs.h was added
  /usr/include/llvm/CodeGen/PeepholeOptimizer.h was added
  /usr/include/llvm/CodeGen/RegUsageInfoCollector.h was added
  /usr/include/llvm/CodeGen/RegUsageInfoPropagate.h was added
  /usr/include/llvm/CodeGen/SpillPlacement.h was added
  /usr/include/llvm/CodeGen/StackColoring.h was added
  /usr/include/llvm/CodeGen/TailDuplication.h was added
  /usr/include/llvm/DebugInfo/GSYM/CallSiteInfo.h was added
  /usr/include/llvm/DebugInfo/GSYM/MergedFunctionsInfo.h was added
  /usr/include/llvm/ExecutionEngine/Orc/AbsoluteSymbols.h was added
  /usr/include/llvm/ExecutionEngine/Orc/CoreContainers.h was added
  /usr/include/llvm/ExecutionEngine/Orc/DylibManager.h was added
  /usr/include/llvm/ExecutionEngine/Orc/EHFrameRegistrationPlugin.h was added
  /usr/include/llvm/ExecutionEngine/Orc/IRPartitionLayer.h was added
  /usr/include/llvm/ExecutionEngine/Orc/JITLinkLazyCallThroughManager.h was added
  /usr/include/llvm/ExecutionEngine/Orc/JITLinkRedirectableSymbolManager.h was added
  /usr/include/llvm/ExecutionEngine/Orc/JITLinkReentryTrampolines.h was added
  /usr/include/llvm/ExecutionEngine/Orc/LazyObjectLinkingLayer.h was added
  /usr/include/llvm/ExecutionEngine/Orc/LinkGraphLayer.h was added
  /usr/include/llvm/ExecutionEngine/Orc/LinkGraphLinkingLayer.h was added
  /usr/include/llvm/ExecutionEngine/Orc/LoadLinkableFile.h was added
  /usr/include/llvm/ExecutionEngine/Orc/MachO.h was added
  /usr/include/llvm/ExecutionEngine/Orc/MaterializationUnit.h was added
  /usr/include/llvm/ExecutionEngine/Orc/RedirectionManager.h was added
  /usr/include/llvm/ExecutionEngine/Orc/ReOptimizeLayer.h was added
  /usr/include/llvm/ExecutionEngine/Orc/Shared/MachOObjectFormat.h was added
  /usr/include/llvm/ExecutionEngine/Orc/TargetProcess/DefaultHostBootstrapValues.h was added
  /usr/include/llvm/ExecutionEngine/Orc/TargetProcess/UnwindInfoManager.h was added
  /usr/include/llvm/ExecutionEngine/Orc/UnwindInfoRegistrationPlugin.h was added
  /usr/include/llvm/Frontend/Atomic was added
  /usr/include/llvm/Frontend/Atomic/Atomic.h was added
  /usr/include/llvm/IR/CmpPredicate.h was added
  /usr/include/llvm/IR/ConstantFPRange.h was added
  /usr/include/llvm/IR/NVVMIntrinsicUtils.h was added
  /usr/include/llvm/IR/VectorTypeUtils.h was added
  /usr/include/llvm/Passes/DroppedVariableStats.h was added
  /usr/include/llvm/Passes/DroppedVariableStatsIR.h was added
  /usr/include/llvm/ProfileData/MemProfYAML.h was added
  /usr/include/llvm/SandboxIR/Argument.h was added
  /usr/include/llvm/SandboxIR/BasicBlock.h was added
  /usr/include/llvm/SandboxIR/Constant.h was added
  /usr/include/llvm/SandboxIR/Context.h was added
  /usr/include/llvm/SandboxIR/Function.h was added
  /usr/include/llvm/SandboxIR/Instruction.h was added
  /usr/include/llvm/SandboxIR/IntrinsicInst.h was added
  /usr/include/llvm/SandboxIR/Module.h was added
  /usr/include/llvm/SandboxIR/Operator.h was added
  /usr/include/llvm/SandboxIR/Pass.h was added
  /usr/include/llvm/SandboxIR/PassManager.h was added
  /usr/include/llvm/SandboxIR/Region.h was added
  /usr/include/llvm/SandboxIR/Type.h was added
  /usr/include/llvm/SandboxIR/User.h was added
  /usr/include/llvm/SandboxIR/Utils.h was added
  /usr/include/llvm/SandboxIR/Value.h was added
  /usr/include/llvm/SandboxIR/Values.def was added
  /usr/include/llvm/Support/AArch64BuildAttributes.h was added
  /usr/include/llvm/Support/NVPTXAddrSpace.h was added
  /usr/include/llvm/Support/OptionStrCmp.h was added
  /usr/include/llvm/TableGen/AArch64ImmCheck.h was added
  /usr/include/llvm/TableGen/TGTimer.h was added
  /usr/include/llvm/TargetParser/AArch64FeatPriorities.inc was added
  /usr/include/llvm/TargetParser/PPCTargetParser.h was added
  /usr/include/llvm/Telemetry was added
  /usr/include/llvm/Telemetry/Telemetry.h was added
  /usr/include/llvm/Transforms/Coroutines/ABI.h was added
  /usr/include/llvm/Transforms/Coroutines/CoroAnnotationElide.h was added
  /usr/include/llvm/Transforms/Coroutines/CoroInstr.h was added
  /usr/include/llvm/Transforms/Coroutines/CoroShape.h was added
  /usr/include/llvm/Transforms/Coroutines/MaterializationUtils.h was added
  /usr/include/llvm/Transforms/Coroutines/SpillUtils.h was added
  /usr/include/llvm/Transforms/Coroutines/SuspendCrossingInfo.h was added
  /usr/include/llvm/Transforms/Instrumentation/PGOCtxProfFlattening.h was added
  /usr/include/llvm/Transforms/Instrumentation/RealtimeSanitizer.h was added
  /usr/include/llvm/Transforms/Instrumentation/TypeSanitizer.h was added
  /usr/include/llvm/Transforms/Scalar/LoopTermFold.h was added
  /usr/include/llvm/Transforms/Utils/ControlFlowUtils.h was added
  /usr/include/llvm/Transforms/Utils/ExtraPassManager.h was added
  /usr/include/llvm/Transforms/Utils/Instrumentation.h was added
  /usr/include/llvm/Transforms/Utils/IRNormalizer.h was added
  /usr/include/llvm/Transforms/Utils/LongestCommonSequence.h was added
  /usr/include/llvm/Transforms/Utils/LowerVectorIntrinsics.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/DependencyGraph.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/InstrMaps.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Interval.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Legality.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/BottomUpVec.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/NullPass.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/PrintInstructionCount.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Passes/RegionsFromMetadata.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/SandboxVectorizer.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/SandboxVectorizerPassBuilder.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/Scheduler.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/SeedCollector.h was added
  /usr/include/llvm/Transforms/Vectorize/SandboxVectorizer/VecUtils.h was added
  /usr/lib/cmake/llvm/FileLock.cmake was added
  /usr/lib/libLLVMCGData.a was added
  /usr/lib/libLLVMFrontendAtomic.a was added
  /usr/lib/libLLVMTelemetry.a was added
  /usr/include/llvm/CodeGenData was removed
  /usr/include/llvm/CodeGenData/OutlinedHashTree.h was removed
  /usr/include/llvm/CodeGenData/OutlinedHashTreeRecord.h was removed
  /usr/include/llvm/Frontend/OpenMP/ConstructCompositionT.h was removed
  /usr/include/llvm/LTO/SummaryBasedOptimizations.h was removed
  /usr/include/llvm/ProfileData/RawMemProfReader.h was removed
  /usr/include/llvm/SandboxIR/SandboxIR.h was removed
  /usr/include/llvm/SandboxIR/SandboxIRValues.def was removed
  /usr/include/llvm/Transforms/Instrumentation.h was removed
  /usr/include/llvm/Transforms/Instrumentation/PoisonChecking.h was removed
  /usr/include/llvm/Transforms/IPO/SyntheticCountsPropagation.h was removed
  /usr/include/llvm/Transforms/Scalar/TLSVariableHoist.h was removed
  /usr/include/llvm/Transforms/Utils/DXILResource.h was removed
  /usr/lib/cmake/llvm/LLVMCheckLinkerFlag.cmake was removed
  /usr/lib/libLLVMCodeGenData.a was removed

--===============4624357627370954933==--

