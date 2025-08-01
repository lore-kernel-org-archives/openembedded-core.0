Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0550BCA0EF2
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:02 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.88812.1754057271307449629
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MTUadFVV;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fh/Vmt80;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019865f60c81-19393d01-d6d9-45b0-b052-1e995f9b3e98-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057280;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q5/rTL+oEAUkj4IoA6iA3Z6gtLvNBLQc/WU2ru5ZTNA=;
	b=MTUadFVVW0/yh3gtXdwrxjVtrpAuK7e3gF+1Jmi5/+x6PU/k/llWXcAv+S/Q3X0x
	1diobQr1zH1jIGn6th0INZeB672nC2PflWjzcKZTBHbHV05KUv/eZ36BHiAVOzcHtYd
	5wS/lU32MvNv4KaovpSFlPI0gyoMkMbm4AbEyHwc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057280;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q5/rTL+oEAUkj4IoA6iA3Z6gtLvNBLQc/WU2ru5ZTNA=;
	b=fh/Vmt80Lc08qDRDz4t81jPcsoO1p2ysiDAVbKjbaG0P5I5Lf7NNJym8j+cn+Olk
	paKKtclSbh9cI3KGScYGLRg8a366X1sGIznfEjOLs1pxo4HxEHSKkQdXukwZCXzW6xc
	1JWkc3g9NGYdP1EZMR/9zIzfuVeupc0j7XXsj/bM=
Content-Type: multipart/mixed; boundary="===============8843951149861671226=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.4.321.0 SUCCEEDED
Message-ID: <0101019865f60c81-19393d01-d6d9-45b0-b052-1e995f9b3e98-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:08:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221308

--===============8843951149861671226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glslang* to *1.4.321.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.4.313.0-1.4.321.0.patch
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
From 76252b77349fb393c9afcd7323e4729a0ba38a7d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 10:59:18 +0000
Subject: [PATCH] glslang: upgrade 1.4.313.0 -> 1.4.321.0

---
 .../glslang/glslang/0001-generate-glslang-pkg-config.patch    | 4 ++--
 .../glslang/{glslang_1.4.313.0.bb => glslang_1.4.321.0.bb}    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.4.313.0.bb => glslang_1.4.321.0.bb} (93%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index 04dab67773..3236503a18 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From df6111570ada81d3968043decb5eee16dc5f9fa1 Mon Sep 17 00:00:00 2001
+From f54082a334540195a0a0919159a88d9d97dd0609 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
@@ -15,7 +15,7 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 glslang/glslang.pc.cmake.in
 
 diff --git a/glslang/CMakeLists.txt b/glslang/CMakeLists.txt
-index 47925d8d..d90191c3 100644
+index eb1dc68e..825a4662 100644
 --- a/glslang/CMakeLists.txt
 +++ b/glslang/CMakeLists.txt
 @@ -255,6 +255,8 @@ if(GLSLANG_ENABLE_INSTALL)
diff --git a/meta/recipes-graphics/glslang/glslang_1.4.313.0.bb b/meta/recipes-graphics/glslang/glslang_1.4.321.0.bb
similarity index 93%
rename from meta/recipes-graphics/glslang/glslang_1.4.313.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.4.321.0.bb
index cb754c6ac8..f4af9d64e9 100644
--- a/meta/recipes-graphics/glslang/glslang_1.4.313.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.4.321.0.bb
@@ -8,8 +8,8 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "fc9889c889561c5882e83819dcaffef5ed45529b"
-SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=vulkan-sdk-1.4.313;tag=vulkan-sdk-${PV} \
+SRCREV = "8a85691a0740d390761a1008b4696f57facd02c4"
+SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-${PV} \
            file://0001-generate-glslang-pkg-config.patch \
            "
 PE = "1"
-- 
2.47.1


--===============8843951149861671226==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.4.313.0-1.4.321.0.patch"

RnJvbSA3NjI1MmI3NzM0OWZiMzkzYzlhZmNkNzMyM2U0NzI5YTBiYTM4YTdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAxMDo1OToxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
c2xhbmc6IHVwZ3JhZGUgMS40LjMxMy4wIC0+IDEuNC4zMjEuMAoKLS0tCiAuLi4vZ2xzbGFuZy9n
bHNsYW5nLzAwMDEtZ2VuZXJhdGUtZ2xzbGFuZy1wa2ctY29uZmlnLnBhdGNoICAgIHwgNCArKy0t
CiAuLi4vZ2xzbGFuZy97Z2xzbGFuZ18xLjQuMzEzLjAuYmIgPT4gZ2xzbGFuZ18xLjQuMzIxLjAu
YmJ9ICAgIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy97Z2xzbGFuZ18x
LjQuMzEzLjAuYmIgPT4gZ2xzbGFuZ18xLjQuMzIxLjAuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZy8wMDAxLWdlbmVyYXRlLWdsc2xh
bmctcGtnLWNvbmZpZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xh
bmcvMDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2gKaW5kZXggMDRkYWI2Nzc3
My4uMzIzNjUwM2ExOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcv
Z2xzbGFuZy8wMDAxLWdlbmVyYXRlLWdsc2xhbmctcGtnLWNvbmZpZy5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nLzAwMDEtZ2VuZXJhdGUtZ2xzbGFuZy1w
a2ctY29uZmlnLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkZjYxMTE1NzBhZGE4MWQzOTY4
MDQzZGVjYjVlZWUxNmRjNWY5ZmExIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmNTQw
ODJhMzM0NTQwMTk1YTBhMDkxOTE1OWE4OGQ5ZDk3ZGQwNjA5IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBEYXRl
OiBTdW4sIDcgRmViIDIwMjEgMDE6MzA6MzkgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gZ2VuZXJh
dGUgZ2xzbGFuZyBwa2ctY29uZmlnCkBAIC0xNSw3ICsxNSw3IEBAIFNpZ25lZC1vZmYtYnk6IEpv
c2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogIGNyZWF0ZSBtb2RlIDEwMDY0
NCBnbHNsYW5nL2dsc2xhbmcucGMuY21ha2UuaW4KIAogZGlmZiAtLWdpdCBhL2dsc2xhbmcvQ01h
a2VMaXN0cy50eHQgYi9nbHNsYW5nL0NNYWtlTGlzdHMudHh0Ci1pbmRleCA0NzkyNWQ4ZC4uZDkw
MTkxYzMgMTAwNjQ0CitpbmRleCBlYjFkYzY4ZS4uODI1YTQ2NjIgMTAwNjQ0CiAtLS0gYS9nbHNs
YW5nL0NNYWtlTGlzdHMudHh0CiArKysgYi9nbHNsYW5nL0NNYWtlTGlzdHMudHh0CiBAQCAtMjU1
LDYgKzI1NSw4IEBAIGlmKEdMU0xBTkdfRU5BQkxFX0lOU1RBTEwpCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuNC4zMTMuMC5iYiBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS40LjMyMS4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdf
MS40LjMxMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNs
YW5nXzEuNC4zMjEuMC5iYgppbmRleCBjYjc1NGM2YWM4Li5mNGFmOWQ2NGU5IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuNC4zMTMuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuNC4zMjEuMC5iYgpAQCAt
OCw4ICs4LDggQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly93d3cua2hyb25vcy5vcmcvb3BlbmdsZXMv
c2RrL3Rvb2xzL1JlZmVyZW5jZS1Db21waWxlciIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlICYg
QlNELTItQ2xhdXNlICYgTUlUICYgQXBhY2hlLTIuMCAmIEdQTC0zLXdpdGgtYmlzb24tZXhjZXB0
aW9uIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTJhMmI1YWNk
N2JjNDg0NDk2NGNmZGE0NWZlODA3ZGMzIgogCi1TUkNSRVYgPSAiZmM5ODg5Yzg4OTU2MWM1ODgy
ZTgzODE5ZGNhZmZlZjVlZDQ1NTI5YiIKLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJv
bm9zR3JvdXAvZ2xzbGFuZy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPXZ1bGthbi1zZGstMS40
LjMxMzt0YWc9dnVsa2FuLXNkay0ke1BWfSBcCitTUkNSRVYgPSAiOGE4NTY5MWEwNzQwZDM5MDc2
MWExMDA4YjQ2OTZmNTdmYWNkMDJjNCIKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJv
bm9zR3JvdXAvZ2xzbGFuZy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW47dGFnPXZ1bGth
bi1zZGstJHtQVn0gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBr
Zy1jb25maWcucGF0Y2ggXAogICAgICAgICAgICAiCiBQRSA9ICIxIgotLSAKMi40Ny4xCgo=

--===============8843951149861671226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/glslang/glslang-dbg: PV changed from "1.4.313.0" to "1.4.321.0"
packages/core2-64-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 52473064 to 52994488 (+1%)
packages/core2-64-poky-linux/glslang/glslang-dbg: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libglslang-default-resource-limits.so.15.3.0 /usr/lib/.debug/libSPIRV.so.15.3.0 /usr/lib/.debug/libglslang.so.15.3.0 /usr/lib/.debug/libSPVRemapper.so.15.3.0", added "/usr/lib/.debug/libSPIRV.so.15.4.0 /usr/lib/.debug/libglslang.so.15.4.0 /usr/lib/.debug/libglslang-default-resource-limits.so.15.4.0 /usr/lib/.debug/libSPVRemapper.so.15.4.0"
packages/core2-64-poky-linux/glslang/glslang-dev: PV changed from "1.4.313.0" to "1.4.321.0"
packages/core2-64-poky-linux/glslang/glslang-dev: PKGSIZE changed from 422711 to 426408 (+1%)
packages/core2-64-poky-linux/glslang/glslang-dev: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/glslang/glslang-dev: FILELIST: removed "/usr/include/glslang/SPIRV/spirv.hpp", added "/usr/include/glslang/SPIRV/spirv.hpp11"
packages/core2-64-poky-linux/glslang/glslang-doc: PV changed from "1.4.313.0" to "1.4.321.0"
packages/core2-64-poky-linux/glslang/glslang-doc: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/glslang/glslang-locale: PV changed from "1.4.313.0" to "1.4.321.0"
packages/core2-64-poky-linux/glslang/glslang-locale: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/glslang/glslang-src: PV changed from "1.4.313.0" to "1.4.321.0"
packages/core2-64-poky-linux/glslang/glslang-src: PKGSIZE changed from 5216953 to 5343557 (+2%)
packages/core2-64-poky-linux/glslang/glslang-src: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/glslang/glslang-src: FILELIST: directory renamed /usr/src/debug/glslang/1.4.313.0/glslang/MachineIndependent/preprocessor -> /usr/src/debug/glslang/1.4.321.0/glslang/MachineIndependent/preprocessor, directory renamed /usr/src/debug/glslang/1.4.313.0/glslang/OSDependent/Unix -> /usr/src/debug/glslang/1.4.321.0/glslang/OSDependent/Unix, directory renamed /usr/src/debug/glslang/1.4.313.0/glslang/HLSL -> /usr/src/debug/glslang/1.4.321.0/glslang/HLSL, directory renamed /usr/src/debug/glslang/1.4.313.0/glslang/Include -> /usr/src/debug/glslang/1.4.321.0/glslang/Include, directory renamed /usr/src/debug/glslang/1.4.313.0/include/glslang -> /usr/src/debug/glslang/1.4.321.0/include/glslang, directory renamed /usr/src/debug/glslang/1.4.313.0/SPIRV/CInterface -> /usr/src/debug/glslang/1.4.321.0/SPIRV/CInterface, directory renamed /usr/src/debug/glslang/1.4.313.0/StandAlone -> /usr/src/debug/glslang/1.4.321.0/StandAlone, directory renamed /usr/src/debug/glslang/1.4.3
 13.0/glslang/GenericCodeGen -> /usr/src/debug/glslang/1.4.321.0/glslang/GenericCodeGen, directory renamed /usr/src/debug/glslang/1.4.313.0/glslang/OSDependent -> /usr/src/debug/glslang/1.4.321.0/glslang/OSDependent, directory renamed /usr/src/debug/glslang/1.4.313.0/glslang/ResourceLimits -> /usr/src/debug/glslang/1.4.321.0/glslang/ResourceLimits, directory renamed /usr/src/debug/glslang/1.4.313.0/glslang -> /usr/src/debug/glslang/1.4.321.0/glslang, directory renamed /usr/src/debug/glslang/1.4.313.0/glslang/CInterface -> /usr/src/debug/glslang/1.4.321.0/glslang/CInterface, directory renamed /usr/src/debug/glslang/1.4.313.0/glslang/Public -> /usr/src/debug/glslang/1.4.321.0/glslang/Public, directory renamed /usr/src/debug/glslang/1.4.313.0/glslang/MachineIndependent -> /usr/src/debug/glslang/1.4.321.0/glslang/MachineIndependent, removed "/usr/src/debug/glslang/1.4.313.0/SPIRV/SPVRemapper.cpp /usr/src/debug/glslang/1.4.313.0/SPIRV/hex_float.h /usr/src/debug/glslang/1.4.313.0/SPIRV/spi
 rv.hpp /usr/src/debug/glslang/1.4.313.0/SPIRV/disassemble.h /usr/src/debug/glslang/1.4.313.0/SPIRV/Logger.cpp /usr/src/debug/glslang/1.4.313.0/SPIRV/GLSL.ext.AMD.h /usr/src/debug/glslang/1.4.313.0/SPIRV/bitutils.h /usr/src/debug/glslang/1.4.313.0/SPIRV/Logger.h /usr/src/debug/glslang/1.4.313.0/SPIRV/GLSL.ext.NV.h /usr/src/debug/glslang/1.4.313.0/SPIRV/doc.cpp /usr/src/debug/glslang/1.4.313.0/SPIRV/SPVRemapper.h /usr/src/debug/glslang/1.4.313.0/SPIRV/GLSL.std.450.h /usr/src/debug/glslang/1.4.313.0/SPIRV/SpvBuilder.h /usr/src/debug/glslang/1.4.313.0/SPIRV/SpvTools.h /usr/src/debug/glslang/1.4.313.0/SPIRV/GlslangToSpv.h /usr/src/debug/glslang/1.4.313.0/SPIRV/NonSemanticDebugPrintf.h /usr/src/debug/glslang/1.4.313.0/SPIRV/GLSL.ext.ARM.h /usr/src/debug/glslang/1.4.313.0/SPIRV/NonSemanticShaderDebugInfo100.h /usr/src/debug/glslang/1.4.313.0/SPIRV/GLSL.ext.EXT.h /usr/src/debug/glslang/1.4.313.0/SPIRV/spvIR.h /usr/src/debug/glslang/1.4.313.0/SPIRV/GLSL.ext.KHR.h /usr/src/debug/glslang/1.4.3
 13.0/SPIRV/GLSL.ext.QCOM.h /usr/src/debug/glslang/1.4.313.0/SPIRV/SpvBuilder.cpp /usr/src/debug/glslang/1.4.313.0/SPIRV/InReadableOrder.cpp /usr/src/debug/glslang/1.4.313.0/SPIRV/SpvPostProcess.cpp /usr/src/debug/glslang/1.4.313.0/SPIRV/SpvTools.cpp /usr/src/debug/glslang/1.4.313.0/SPIRV/disassemble.cpp /usr/src/debug/glslang/1.4.313.0/SPIRV/GlslangToSpv.cpp /usr/src/debug/glslang/1.4.313.0/SPIRV/doc.h", added "/usr/src/debug/glslang/1.4.321.0/SPIRV/SPVRemapper.cpp /usr/src/debug/glslang/1.4.321.0/SPIRV/hex_float.h /usr/src/debug/glslang/1.4.321.0/SPIRV/disassemble.h /usr/src/debug/glslang/1.4.321.0/SPIRV/Logger.cpp /usr/src/debug/glslang/1.4.321.0/SPIRV/GLSL.ext.AMD.h /usr/src/debug/glslang/1.4.321.0/SPIRV/bitutils.h /usr/src/debug/glslang/1.4.321.0/SPIRV/Logger.h /usr/src/debug/glslang/1.4.321.0/SPIRV/GLSL.ext.NV.h /usr/src/debug/glslang/1.4.321.0/SPIRV/doc.cpp /usr/src/debug/glslang/1.4.321.0/SPIRV/spirv.hpp11 /usr/src/debug/glslang/1.4.321.0/SPIRV/SPVRemapper.h /usr/src/debug/gl
 slang/1.4.321.0/SPIRV/GLSL.std.450.h /usr/src/debug/glslang/1.4.321.0/SPIRV/SpvBuilder.h /usr/src/debug/glslang/1.4.321.0/SPIRV/SpvTools.h /usr/src/debug/glslang/1.4.321.0/SPIRV/GlslangToSpv.h /usr/src/debug/glslang/1.4.321.0/SPIRV/spvUtil.h /usr/src/debug/glslang/1.4.321.0/SPIRV/NonSemanticDebugPrintf.h /usr/src/debug/glslang/1.4.321.0/SPIRV/GLSL.ext.ARM.h /usr/src/debug/glslang/1.4.321.0/SPIRV/NonSemanticShaderDebugInfo100.h /usr/src/debug/glslang/1.4.321.0/SPIRV/GLSL.ext.EXT.h /usr/src/debug/glslang/1.4.321.0/SPIRV/spvIR.h /usr/src/debug/glslang/1.4.321.0/SPIRV/GLSL.ext.KHR.h /usr/src/debug/glslang/1.4.321.0/SPIRV/GLSL.ext.QCOM.h /usr/src/debug/glslang/1.4.321.0/SPIRV/SpvBuilder.cpp /usr/src/debug/glslang/1.4.321.0/SPIRV/InReadableOrder.cpp /usr/src/debug/glslang/1.4.321.0/SPIRV/SpvPostProcess.cpp /usr/src/debug/glslang/1.4.321.0/SPIRV/SpvTools.cpp /usr/src/debug/glslang/1.4.321.0/SPIRV/disassemble.cpp /usr/src/debug/glslang/1.4.321.0/SPIRV/GlslangToSpv.cpp /usr/src/debug/glslang
 /1.4.321.0/SPIRV/doc.h"
packages/core2-64-poky-linux/glslang/glslang-staticdev: PV changed from "1.4.313.0" to "1.4.321.0"
packages/core2-64-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/glslang/glslang: PV changed from "1.4.313.0" to "1.4.321.0"
packages/core2-64-poky-linux/glslang/glslang: PKGSIZE changed from 3723697 to 3809873 (+2%)
packages/core2-64-poky-linux/glslang/glslang: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
packages/core2-64-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang-default-resource-limits.so.15.3.0 /usr/lib/libglslang.so.15.3.0 /usr/lib/libSPVRemapper.so.15.3.0 /usr/lib/libSPIRV.so.15.3.0", added "/usr/lib/libglslang.so.15.4.0 /usr/lib/libglslang-default-resource-limits.so.15.4.0 /usr/lib/libSPIRV.so.15.4.0 /usr/lib/libSPVRemapper.so.15.4.0"
packages/core2-64-poky-linux/glslang: PV changed from "1.4.313.0" to "1.4.321.0"
packages/core2-64-poky-linux/glslang: SRC_URI changed from "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=vulkan-sdk-1.4.313;tag=vulkan-sdk-1.4.313.0 file://0001-generate-glslang-pkg-config.patch" to "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-1.4.321.0 file://0001-generate-glslang-pkg-config.patch"
packages/core2-64-poky-linux/glslang: PKGV changed from 1.4.313.0 [default] to 1.4.321.0 [default]
Changes to packages/core2-64-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.15 changed symlink target from libglslang-default-resource-limits.so.15.3.0 to libglslang-default-resource-limits.so.15.4.0
  /usr/lib/libglslang.so.15 changed symlink target from libglslang.so.15.3.0 to libglslang.so.15.4.0
  /usr/lib/libSPIRV.so.15 changed symlink target from libSPIRV.so.15.3.0 to libSPIRV.so.15.4.0
  /usr/lib/libSPVRemapper.so.15 changed symlink target from libSPVRemapper.so.15.3.0 to libSPVRemapper.so.15.4.0
  /usr/lib/libglslang-default-resource-limits.so.15.3.0 moved to /usr/lib/libglslang-default-resource-limits.so.15.4.0
  /usr/lib/libglslang.so.15.3.0 moved to /usr/lib/libglslang.so.15.4.0
  /usr/lib/libSPIRV.so.15.3.0 moved to /usr/lib/libSPIRV.so.15.4.0
  /usr/lib/libSPVRemapper.so.15.3.0 moved to /usr/lib/libSPVRemapper.so.15.4.0
  /usr/include/glslang/SPIRV/spirv.hpp11 was added
  /usr/include/glslang/SPIRV/spirv.hpp was removed

--===============8843951149861671226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/glslang/glslang-dev: FILELIST: removed "/usr/include/glslang/SPIRV/spirv.hpp", added "/usr/include/glslang/SPIRV/spirv.hpp11"
packages/core2-64-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libSPIRV.so.15.3.0 /usr/lib/libglslang-default-resource-limits.so.15.3.0 /usr/lib/libglslang.so.15.3.0 /usr/lib/libSPVRemapper.so.15.3.0", added "/usr/lib/libSPIRV.so.15.4.0 /usr/lib/libSPVRemapper.so.15.4.0 /usr/lib/libglslang.so.15.4.0 /usr/lib/libglslang-default-resource-limits.so.15.4.0"
Changes to packages/core2-64-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.15 changed symlink target from libglslang-default-resource-limits.so.15.3.0 to libglslang-default-resource-limits.so.15.4.0
  /usr/lib/libglslang.so.15 changed symlink target from libglslang.so.15.3.0 to libglslang.so.15.4.0
  /usr/lib/libSPIRV.so.15 changed symlink target from libSPIRV.so.15.3.0 to libSPIRV.so.15.4.0
  /usr/lib/libSPVRemapper.so.15 changed symlink target from libSPVRemapper.so.15.3.0 to libSPVRemapper.so.15.4.0
  /usr/lib/libglslang-default-resource-limits.so.15.3.0 moved to /usr/lib/libglslang-default-resource-limits.so.15.4.0
  /usr/lib/libglslang.so.15.3.0 moved to /usr/lib/libglslang.so.15.4.0
  /usr/lib/libSPIRV.so.15.3.0 moved to /usr/lib/libSPIRV.so.15.4.0
  /usr/lib/libSPVRemapper.so.15.3.0 moved to /usr/lib/libSPVRemapper.so.15.4.0
  /usr/include/glslang/SPIRV/spirv.hpp11 was added
  /usr/include/glslang/SPIRV/spirv.hpp was removed

--===============8843951149861671226==--

