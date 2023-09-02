Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFF9CCF999
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:27 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.5690.1693650555425288999
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hpT2Uzfy;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GMGfmx1Q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018a55708f3d-edc1a954-68ad-4904-b312-03222354b168-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pJmufvUrOQlQtG859TFxC49xTNvDBJ7r/xXz6NWdESc=;
	b=hpT2UzfymuLk8aHvH2Q7BhUD7k9IUEDc84CLSFSvEw5N1C8npMMVZ8wWI+jBHy5J
	ceOCzoc0XVgXdnxbEYxiKUr0wKHqm1pFhM7pBtYT3FC36muBbKorO7U/4lCK9w3VP2P
	BJeo7gWJKDg5P0Xn71r8/2ujXbGtcDfTmXRhomyI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pJmufvUrOQlQtG859TFxC49xTNvDBJ7r/xXz6NWdESc=;
	b=GMGfmx1Q529vI+NI9JcJF4brEE0E8Sgy3V3pKXMxH38oGEjgeR8DT8ykJcv75W/c
	c5w6wu7K6bkiHSpS6ojxhefxvgb3iEnhidr5ChUS17zgLMER6zq0PP9Z1ELQBJYBfsu
	MoznywywkWNR3a5P8xa3TviXywCeePzkS/Y3RD+M=
Content-Type: multipart/mixed; boundary="===============5581868169167170142=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.261.1 SUCCEEDED
Message-ID: <0101018a55708f3d-edc1a954-68ad-4904-b312-03222354b168-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187112

--===============5581868169167170142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *1.3.261.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.3.250.0-1.3.261.1.patch
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
From 9a490ba1f8f640e038a7b1bed9e8a5ace1499fa2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 2 Sep 2023 00:11:02 +0000
Subject: [PATCH] glslang: upgrade 1.3.250.0 -> 1.3.261.1

---
 .../glslang/{glslang_1.3.250.0.bb => glslang_1.3.261.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.250.0.bb => glslang_1.3.261.1.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.261.1.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.3.250.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.261.1.bb
index 6e9c666d46..e607045148 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.261.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "d1517d64cfca91f573af1bf7341dc3a5113349c0"
+SRCREV = "76b52ebf77833908dc4c0dd6c70a9c357ac720bd"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
            "
-- 
2.39.2


--===============5581868169167170142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glslang/glslang-dbg: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/glslang/glslang-dbg: PV changed from "1.3.250.0" to "1.3.261.1"
packages/core2-32-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libSPVRemapper.so.12.2.0 /usr/lib/.debug/libglslang.so.12.2.0 /usr/lib/.debug/libglslang-default-resource-limits.so.12.2.0 /usr/bin/.debug/glslangValidator /usr/lib/.debug/libHLSL.so.12.2.0 /usr/lib/.debug/libSPIRV.so.12.2.0", added "/usr/lib/.debug/libSPVRemapper.so.12.3.1 /usr/lib/.debug/libglslang.so.12.3.1 /usr/bin/.debug/glslang /usr/lib/.debug/libHLSL.so.12.3.1 /usr/lib/.debug/libSPIRV.so.12.3.1"
packages/core2-32-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 74686180 to 75045648 (+0%)
packages/core2-32-poky-linux/glslang/glslang-dev: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/glslang/glslang-dev: PV changed from "1.3.250.0" to "1.3.261.1"
packages/core2-32-poky-linux/glslang/glslang-dev: FILELIST: removed "/usr/lib/cmake/glslangValidatorTargets.cmake /usr/lib/libglslang-default-resource-limits.so", added "/usr/lib/cmake/glslang-standaloneTargets.cmake"
packages/core2-32-poky-linux/glslang/glslang-dev: PKGSIZE changed from 1020014 to 1014938 (-0%)
packages/core2-32-poky-linux/glslang/glslang-doc: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/glslang/glslang-doc: PV changed from "1.3.250.0" to "1.3.261.1"
packages/core2-32-poky-linux/glslang/glslang-locale: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/glslang/glslang-locale: PV changed from "1.3.250.0" to "1.3.261.1"
packages/core2-32-poky-linux/glslang/glslang-src: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/glslang/glslang-src: PV changed from "1.3.250.0" to "1.3.261.1"
packages/core2-32-poky-linux/glslang/glslang-src: FILELIST: directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/OSDependent/Unix -> /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/OSDependent/Unix, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/ResourceLimits -> /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/ResourceLimits, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/SPIRV -> /usr/src/debug/glslang/1_1.3.261.1-r0/SPIRV, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/HLSL -> /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/HLSL, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/MachineIndependent -> /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/MachineIndependent, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/GenericCodeGen -> /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/GenericCodeGen, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/StandAlone -> /usr/src/debug/glslang/1_1.3.261.1-r0/StandAlo
 ne, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/OSDependent -> /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/OSDependent, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/include/glslang -> /usr/src/debug/glslang/1_1.3.261.1-r0/include/glslang, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/SPIRV/CInterface -> /usr/src/debug/glslang/1_1.3.261.1-r0/SPIRV/CInterface, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/CInterface -> /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/CInterface, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Public -> /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Public, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/MachineIndependent/preprocessor -> /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/MachineIndependent/preprocessor, removed "/usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/glslang_c_shader_types.h /usr/src/debug/glslang/1_1.3.250.0-r0/OGLCompilersDLL/Initializ
 eDll.cpp /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/BaseTypes.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/Common.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/ResourceLimits.h /usr/src/debug/glslang/1_1.3.250.0-r0/OGLCompilersDLL/InitializeDll.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/InfoSink.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/SpirvIntrinsics.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/Types.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/PoolAlloc.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/glslang_c_interface.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/ConstantUnion.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/arrays.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/InitializeGlobals.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/intermediate.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/ShHandle.h", added "/usr/src/debug/glslang/1_1.
 3.261.1-r0/glslang/Include/glslang_c_shader_types.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/Common.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/BaseTypes.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/ResourceLimits.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/InfoSink.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/SpirvIntrinsics.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/Types.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/PoolAlloc.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/glslang_c_interface.h /usr/src/debug/glslang/1_1.3.261.1-r0/OGLCompilersDLL/InitializeDll.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/ConstantUnion.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/intermediate.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/ShHandle.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/arrays.h"
packages/core2-32-poky-linux/glslang/glslang-src: PKGSIZE changed from 4821631 to 4836565 (+0%)
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/glslang/glslang-staticdev: PV changed from "1.3.250.0" to "1.3.261.1"
packages/core2-32-poky-linux/glslang/glslang-staticdev: FILELIST: added "/usr/lib/libglslang-default-resource-limits.a"
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGSIZE changed from 0 to 172892 (+100%)
packages/core2-32-poky-linux/glslang/glslang: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/glslang/glslang: PV changed from "1.3.250.0" to "1.3.261.1"
packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libSPIRV.so.12.2.0 /usr/lib/libglslang.so.12.2.0 /usr/lib/libSPVRemapper.so.12.2.0 /usr/lib/libglslang-default-resource-limits.so.12 /usr/lib/libglslang-default-resource-limits.so.12.2.0 /usr/lib/libHLSL.so.12.2.0", added "/usr/bin/glslang /usr/lib/libSPVRemapper.so.12.3.1 /usr/lib/libSPIRV.so.12.3.1 /usr/lib/libglslang.so.12.3.1 /usr/lib/libHLSL.so.12.3.1"
packages/core2-32-poky-linux/glslang/glslang: PKGSIZE changed from 6530999 to 6582958 (+1%)
packages/core2-32-poky-linux/glslang: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/glslang: PV changed from "1.3.250.0" to "1.3.261.1"
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/lib/libglslang.so.12 changed symlink target from libglslang.so.12.2.0 to libglslang.so.12.3.1
  /usr/lib/libHLSL.so.12 changed symlink target from libHLSL.so.12.2.0 to libHLSL.so.12.3.1
  /usr/lib/libSPIRV.so.12 changed symlink target from libSPIRV.so.12.2.0 to libSPIRV.so.12.3.1
  /usr/lib/libSPVRemapper.so.12 changed symlink target from libSPVRemapper.so.12.2.0 to libSPVRemapper.so.12.3.1
  /usr/lib/libglslang.so.12.2.0 moved to /usr/lib/libglslang.so.12.3.1
  /usr/lib/libHLSL.so.12.2.0 moved to /usr/lib/libHLSL.so.12.3.1
  /usr/lib/libSPIRV.so.12.2.0 moved to /usr/lib/libSPIRV.so.12.3.1
  /usr/lib/libSPVRemapper.so.12.2.0 moved to /usr/lib/libSPVRemapper.so.12.3.1
  /usr/lib/cmake/glslang-standaloneTargets.cmake was added
  /usr/lib/libglslang-default-resource-limits.a was added
  /usr/lib/cmake/glslangValidatorTargets.cmake was removed
  /usr/lib/libglslang-default-resource-limits.so.12.2.0 was removed
  /usr/lib/libglslang-default-resource-limits.so.12 was removed
  /usr/lib/libglslang-default-resource-limits.so was removed

--===============5581868169167170142==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.250.0-1.3.261.1.patch"

RnJvbSA5YTQ5MGJhMWY4ZjY0MGUwMzhhN2IxYmVkOWU4YTVhY2UxNDk5ZmEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMiBTZXAgMjAyMyAwMDoxMTowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
c2xhbmc6IHVwZ3JhZGUgMS4zLjI1MC4wIC0+IDEuMy4yNjEuMQoKLS0tCiAuLi4vZ2xzbGFuZy97
Z2xzbGFuZ18xLjMuMjUwLjAuYmIgPT4gZ2xzbGFuZ18xLjMuMjYxLjEuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy97Z2xzbGFuZ18xLjMuMjUwLjAuYmIgPT4gZ2xz
bGFuZ18xLjMuMjYxLjEuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjUwLjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
Z2xzbGFuZy9nbHNsYW5nXzEuMy4yNjEuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuMy4yNTAuMC5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjYxLjEu
YmIKaW5kZXggNmU5YzY2NmQ0Ni4uZTYwNzA0NTE0OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjUwLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjYxLjEuYmIKQEAgLTgsNyArOCw3IEBAIEhP
TUVQQUdFID0gImh0dHBzOi8vd3d3Lmtocm9ub3Mub3JnL29wZW5nbGVzL3Nkay90b29scy9SZWZl
cmVuY2UtQ29tcGlsZXIiCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSAmIEJTRC0yLUNsYXVzZSAm
IE1JVCAmIEFwYWNoZS0yLjAgJiBHUEwtMy13aXRoLWJpc29uLWV4Y2VwdGlvbiIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT0yYTJiNWFjZDdiYzQ4NDQ5NjRjZmRh
NDVmZTgwN2RjMyIKIAotU1JDUkVWID0gImQxNTE3ZDY0Y2ZjYTkxZjU3M2FmMWJmNzM0MWRjM2E1
MTEzMzQ5YzAiCitTUkNSRVYgPSAiNzZiNTJlYmY3NzgzMzkwOGRjNGMwZGQ2YzcwYTljMzU3YWM3
MjBiZCIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvZ2xzbGFuZy5n
aXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1n
ZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2ggXAogICAgICAgICAgICAiCi0tIAoyLjM5
LjIKCg==

--===============5581868169167170142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/glslang/glslang-dev: FILELIST: removed "/usr/lib/cmake/glslangValidatorTargets.cmake /usr/lib/libglslang-default-resource-limits.so", added "/usr/lib/cmake/glslang-standaloneTargets.cmake"
packages/core2-32-poky-linux/glslang/glslang-staticdev: FILELIST: added "/usr/lib/libglslang-default-resource-limits.a"
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGSIZE changed from 0 to 172892 (+100%)
packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libSPVRemapper.so.12.2.0 /usr/lib/libSPIRV.so.12.2.0 /usr/lib/libglslang.so.12.2.0 /usr/lib/libglslang-default-resource-limits.so.12 /usr/lib/libHLSL.so.12.2.0 /usr/lib/libglslang-default-resource-limits.so.12.2.0", added "/usr/bin/glslang /usr/lib/libSPVRemapper.so.12.3.1 /usr/lib/libSPIRV.so.12.3.1 /usr/lib/libglslang.so.12.3.1 /usr/lib/libHLSL.so.12.3.1"
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/lib/libglslang.so.12 changed symlink target from libglslang.so.12.2.0 to libglslang.so.12.3.1
  /usr/lib/libHLSL.so.12 changed symlink target from libHLSL.so.12.2.0 to libHLSL.so.12.3.1
  /usr/lib/libSPIRV.so.12 changed symlink target from libSPIRV.so.12.2.0 to libSPIRV.so.12.3.1
  /usr/lib/libSPVRemapper.so.12 changed symlink target from libSPVRemapper.so.12.2.0 to libSPVRemapper.so.12.3.1
  /usr/lib/libglslang.so.12.2.0 moved to /usr/lib/libglslang.so.12.3.1
  /usr/lib/libHLSL.so.12.2.0 moved to /usr/lib/libHLSL.so.12.3.1
  /usr/lib/libSPIRV.so.12.2.0 moved to /usr/lib/libSPIRV.so.12.3.1
  /usr/lib/libSPVRemapper.so.12.2.0 moved to /usr/lib/libSPVRemapper.so.12.3.1
  /usr/lib/cmake/glslang-standaloneTargets.cmake was added
  /usr/lib/libglslang-default-resource-limits.a was added
  /usr/lib/cmake/glslangValidatorTargets.cmake was removed
  /usr/lib/libglslang-default-resource-limits.so.12.2.0 was removed
  /usr/lib/libglslang-default-resource-limits.so.12 was removed
  /usr/lib/libglslang-default-resource-limits.so was removed

--===============5581868169167170142==--

