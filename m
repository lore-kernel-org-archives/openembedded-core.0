Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92382EEEC16
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:01 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.29478.1694804395305344325
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PAQ3xHk4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Jh4o137I;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018a9a36c2b4-68d582f8-a571-4835-8912-5b208d3825bd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DA5f+U/P65d3zmLqg1EgA9fmV5/fG4bFu2swHy+u5sU=;
	b=PAQ3xHk4LpCMAd9VZrvFdfJGtW/BXuxED+uE/KGiPUEkGm3+/Tc5Bllu2j9WvDq4
	RZDdJUpeQHaHImhT/N65Z9KOh8bRE8ipngvM5u3z7ZFH7WPsYeV05MFH3K1tML01jv8
	XSS9sj0zQo4/QpxrbLM5vZRI8PFxHZ3TDXG2twTU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DA5f+U/P65d3zmLqg1EgA9fmV5/fG4bFu2swHy+u5sU=;
	b=Jh4o137I92yJ02CARLMH765HuDxfRD8dEUmNtuH27eCS2W6ubCAWUPcm7bQh943t
	ZWclQU2CeHWOVlsEy5vXVmh4WagYETEe1dyJ1K2NPSdEve5UYbVzKXDhUVY+hxrd9Lz
	k4UVSVaAEEwst762NHLTgZQ8TPfKmfqSzr8iya+8=
Content-Type: multipart/mixed; boundary="===============6321542752340665120=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.261.1 SUCCEEDED
Message-ID: <0101018a9a36c2b4-68d582f8-a571-4835-8912-5b208d3825bd-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187738

--===============6321542752340665120==
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
From 75935548123dd36ed676e7a8137e248d0bf7cb96 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 14:45:45 +0000
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


--===============6321542752340665120==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.250.0-1.3.261.1.patch"

RnJvbSA3NTkzNTU0ODEyM2RkMzZlZDY3NmU3YTgxMzdlMjQ4ZDBiZjdjYjk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTQ6NDU6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bHNsYW5nOiB1cGdyYWRlIDEuMy4yNTAuMCAtPiAxLjMuMjYxLjEKCi0tLQogLi4uL2dsc2xhbmcv
e2dsc2xhbmdfMS4zLjI1MC4wLmJiID0+IGdsc2xhbmdfMS4zLjI2MS4xLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcve2dsc2xhbmdfMS4zLjI1MC4wLmJiID0+IGds
c2xhbmdfMS4zLjI2MS4xLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI1MC4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjYxLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjUwLjAuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI2MS4x
LmJiCmluZGV4IDZlOWM2NjZkNDYuLmU2MDcwNDUxNDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI1MC4wLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI2MS4xLmJiCkBAIC04LDcgKzgsNyBAQCBI
T01FUEFHRSA9ICJodHRwczovL3d3dy5raHJvbm9zLm9yZy9vcGVuZ2xlcy9zZGsvdG9vbHMvUmVm
ZXJlbmNlLUNvbXBpbGVyIgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UgJiBCU0QtMi1DbGF1c2Ug
JiBNSVQgJiBBcGFjaGUtMi4wICYgR1BMLTMtd2l0aC1iaXNvbi1leGNlcHRpb24iCiBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9MmEyYjVhY2Q3YmM0ODQ0OTY0Y2Zk
YTQ1ZmU4MDdkYzMiCiAKLVNSQ1JFViA9ICJkMTUxN2Q2NGNmY2E5MWY1NzNhZjFiZjczNDFkYzNh
NTExMzM0OWMwIgorU1JDUkVWID0gIjc2YjUyZWJmNzc4MzM5MDhkYzRjMGRkNmM3MGE5YzM1N2Fj
NzIwYmQiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL2dsc2xhbmcu
Z2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEt
Z2VuZXJhdGUtZ2xzbGFuZy1wa2ctY29uZmlnLnBhdGNoIFwKICAgICAgICAgICAgIgotLSAKMi4z
OS4yCgo=

--===============6321542752340665120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glslang/glslang-dbg: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/glslang/glslang-dbg: PV changed from "1.3.250.0" to "1.3.261.1"
packages/core2-32-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 74686316 to 75045772 (+0%)
packages/core2-32-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/bin/.debug/glslangValidator /usr/lib/.debug/libSPIRV.so.12.2.0 /usr/lib/.debug/libSPVRemapper.so.12.2.0 /usr/lib/.debug/libglslang.so.12.2.0 /usr/lib/.debug/libHLSL.so.12.2.0 /usr/lib/.debug/libglslang-default-resource-limits.so.12.2.0", added "/usr/bin/.debug/glslang /usr/lib/.debug/libSPIRV.so.12.3.1 /usr/lib/.debug/libHLSL.so.12.3.1 /usr/lib/.debug/libSPVRemapper.so.12.3.1 /usr/lib/.debug/libglslang.so.12.3.1"
packages/core2-32-poky-linux/glslang/glslang-dev: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/glslang/glslang-dev: PV changed from "1.3.250.0" to "1.3.261.1"
packages/core2-32-poky-linux/glslang/glslang-dev: PKGSIZE changed from 1020014 to 1014938 (-0%)
packages/core2-32-poky-linux/glslang/glslang-dev: FILELIST: removed "/usr/lib/cmake/glslangValidatorTargets.cmake /usr/lib/libglslang-default-resource-limits.so", added "/usr/lib/cmake/glslang-standaloneTargets.cmake"
packages/core2-32-poky-linux/glslang/glslang-doc: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/glslang/glslang-doc: PV changed from "1.3.250.0" to "1.3.261.1"
packages/core2-32-poky-linux/glslang/glslang-locale: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/glslang/glslang-locale: PV changed from "1.3.250.0" to "1.3.261.1"
packages/core2-32-poky-linux/glslang/glslang-src: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/glslang/glslang-src: PV changed from "1.3.250.0" to "1.3.261.1"
packages/core2-32-poky-linux/glslang/glslang-src: PKGSIZE changed from 4821631 to 4836565 (+0%)
packages/core2-32-poky-linux/glslang/glslang-src: FILELIST: directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/CInterface -> /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/CInterface, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/MachineIndependent -> /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/MachineIndependent, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/OSDependent -> /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/OSDependent, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/SPIRV -> /usr/src/debug/glslang/1_1.3.261.1-r0/SPIRV, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/OSDependent/Unix -> /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/OSDependent/Unix, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Public -> /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Public, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/include/glslang -> /usr/src/debug/glslang/1_1.3.261.1-r0/include/glsla
 ng, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/GenericCodeGen -> /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/GenericCodeGen, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/StandAlone -> /usr/src/debug/glslang/1_1.3.261.1-r0/StandAlone, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/MachineIndependent/preprocessor -> /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/MachineIndependent/preprocessor, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/HLSL -> /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/HLSL, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/ResourceLimits -> /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/ResourceLimits, directory renamed /usr/src/debug/glslang/1_1.3.250.0-r0/SPIRV/CInterface -> /usr/src/debug/glslang/1_1.3.261.1-r0/SPIRV/CInterface, removed "/usr/src/debug/glslang/1_1.3.250.0-r0/OGLCompilersDLL/InitializeDll.h /usr/src/debug/glslang/1_1.3.250.0-r0/OGLCompilersDLL/InitializeDll.cpp 
 /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/glslang_c_shader_types.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/ShHandle.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/Types.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/ResourceLimits.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/PoolAlloc.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/intermediate.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/InfoSink.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/BaseTypes.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/Common.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/InitializeGlobals.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/arrays.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/SpirvIntrinsics.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/ConstantUnion.h /usr/src/debug/glslang/1_1.3.250.0-r0/glslang/Include/glslang_c_interface.h", added "/usr/src/debug/glslang/1_1.
 3.261.1-r0/OGLCompilersDLL/InitializeDll.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/glslang_c_shader_types.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/ShHandle.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/Types.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/ResourceLimits.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/PoolAlloc.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/intermediate.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/InfoSink.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/BaseTypes.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/Common.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/arrays.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/SpirvIntrinsics.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/ConstantUnion.h /usr/src/debug/glslang/1_1.3.261.1-r0/glslang/Include/glslang_c_interface.h"
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/glslang/glslang-staticdev: PV changed from "1.3.250.0" to "1.3.261.1"
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGSIZE changed from 0 to 172892 (+100%)
packages/core2-32-poky-linux/glslang/glslang-staticdev: FILELIST: added "/usr/lib/libglslang-default-resource-limits.a"
packages/core2-32-poky-linux/glslang/glslang: PKGV changed from 1.3.250.0 [default] to 1.3.261.1 [default]
packages/core2-32-poky-linux/glslang/glslang: PV changed from "1.3.250.0" to "1.3.261.1"
packages/core2-32-poky-linux/glslang/glslang: PKGSIZE changed from 6530999 to 6582958 (+1%)
packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang-default-resource-limits.so.12 /usr/lib/libglslang-default-resource-limits.so.12.2.0 /usr/lib/libSPIRV.so.12.2.0 /usr/lib/libglslang.so.12.2.0 /usr/lib/libHLSL.so.12.2.0 /usr/lib/libSPVRemapper.so.12.2.0", added "/usr/bin/glslang /usr/lib/libglslang.so.12.3.1 /usr/lib/libSPIRV.so.12.3.1 /usr/lib/libHLSL.so.12.3.1 /usr/lib/libSPVRemapper.so.12.3.1"
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

--===============6321542752340665120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/glslang/glslang-dev: FILELIST: removed "/usr/lib/cmake/glslangValidatorTargets.cmake /usr/lib/libglslang-default-resource-limits.so", added "/usr/lib/cmake/glslang-standaloneTargets.cmake"
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGSIZE changed from 0 to 172892 (+100%)
packages/core2-32-poky-linux/glslang/glslang-staticdev: FILELIST: added "/usr/lib/libglslang-default-resource-limits.a"
packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libHLSL.so.12.2.0 /usr/lib/libSPIRV.so.12.2.0 /usr/lib/libSPVRemapper.so.12.2.0 /usr/lib/libglslang.so.12.2.0 /usr/lib/libglslang-default-resource-limits.so.12 /usr/lib/libglslang-default-resource-limits.so.12.2.0", added "/usr/lib/libHLSL.so.12.3.1 /usr/lib/libglslang.so.12.3.1 /usr/lib/libSPVRemapper.so.12.3.1 /usr/bin/glslang /usr/lib/libSPIRV.so.12.3.1"
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

--===============6321542752340665120==--

