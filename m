Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93904CDB47C
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:56 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50615.1781195505093330079
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=uUwX7g5n;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IfHDfB2I;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019eb786a6cb-e1693b33-82ca-47cb-84b2-bec5c5c8d773-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195515;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LIl1qrkW0fRGjMYdauEw/i19vPaD+Ce9NWLsjCpQ+2I=;
	b=uUwX7g5nBnokSEWbIkKbOiBIS3heuXJwJnywnHvmm8ZaYpYE5vz0KKG0rST7qTso
	5K/bU+nPYWaSI+lCygJUToyfmaczZmG3Gouae7eeUKFS9HMUvDF62fXqX6odL25mSTx
	6qnrOwopadXGkzI/Sui7K7WsRdPSw11ut/JurCL8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195515;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LIl1qrkW0fRGjMYdauEw/i19vPaD+Ce9NWLsjCpQ+2I=;
	b=IfHDfB2IAITzWGJWkZlWnThYxOdiYUfeh2Ktq09f/yj+h0+7MEh1pdNrNOq98uCc
	yW9vFOPjrYCdQ2lowlzoboFc4GsI9saWu/jDEsbxlQ6pZmnt2Avep0bIO1WxXbRiHvM
	JuiMsd/qkbWaCeEEgVI1l49qOAiKkFQ0/7moBmYI=
Content-Type: multipart/mixed; boundary="===============1115935578674798255=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.4.350.0 SUCCEEDED
Message-ID: <0101019eb786a6cb-e1693b33-82ca-47cb-84b2-bec5c5c8d773-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238532

--===============1115935578674798255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glslang* to *1.4.350.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.4.341.0-1.4.350.0.patch
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
From 0b55407d67987035f8db603e1b3fdf5dca693642 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 12:06:27 +0000
Subject: [PATCH] glslang: upgrade 1.4.341.0 -> 1.4.350.0

---
 .../glslang/glslang/0001-generate-glslang-pkg-config.patch      | 2 +-
 .../glslang/{glslang_1.4.341.0.bb => glslang_1.4.350.0.bb}      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.4.341.0.bb => glslang_1.4.350.0.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index 150242ce1d..d74f37db91 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From 6a4237802d8a79f65ed74b12865e2ce5b666993d Mon Sep 17 00:00:00 2001
+From ee46f2f608ccbe9617ce41235d047f080d972ff7 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
diff --git a/meta/recipes-graphics/glslang/glslang_1.4.341.0.bb b/meta/recipes-graphics/glslang/glslang_1.4.350.0.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.4.341.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.4.350.0.bb
index aa4f48bb9c..bc33931b3c 100644
--- a/meta/recipes-graphics/glslang/glslang_1.4.341.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.4.350.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=50ff9d0fcde2d5b953ebe431c48e34e3"
 
-SRCREV = "f0bd0257c308b9a26562c1a30c4748a0219cc951"
+SRCREV = "275822a6261ee689aadb1da5f09a0ec2f058685c"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-${PV} \
            file://0001-generate-glslang-pkg-config.patch \
            "
-- 
2.47.1


--===============1115935578674798255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/glslang/glslang-dbg: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 53525888 to 54103712 (+1%)
packages/x86-64-v3-poky-linux/glslang/glslang-dbg: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libglslang.so.16.2.0 /usr/lib/.debug/libSPIRV.so.16.2.0 /usr/lib/.debug/libglslang-default-resource-limits.so.16.2.0", added "/usr/lib/.debug/libglslang-default-resource-limits.so.16.3.0 /usr/lib/.debug/libglslang.so.16.3.0 /usr/lib/.debug/libSPIRV.so.16.3.0"
packages/x86-64-v3-poky-linux/glslang/glslang-dev: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-dev: PKGSIZE changed from 424308 to 425929 (+0%)
packages/x86-64-v3-poky-linux/glslang/glslang-dev: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/glslang/glslang-doc: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-doc: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/glslang/glslang-locale: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-locale: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/glslang/glslang-src: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-src: PKGSIZE changed from 5477810 to 5515424 (+1%)
packages/x86-64-v3-poky-linux/glslang/glslang-src: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/glslang/glslang-src: FILELIST: directory renamed /usr/src/debug/glslang/1.4.341.0/glslang/OSDependent/Unix -> /usr/src/debug/glslang/1.4.350.0/glslang/OSDependent/Unix, directory renamed /usr/src/debug/glslang/1.4.341.0/glslang/GenericCodeGen -> /usr/src/debug/glslang/1.4.350.0/glslang/GenericCodeGen, directory renamed /usr/src/debug/glslang/1.4.341.0/glslang/MachineIndependent/preprocessor -> /usr/src/debug/glslang/1.4.350.0/glslang/MachineIndependent/preprocessor, directory renamed /usr/src/debug/glslang/1.4.341.0/glslang/OSDependent -> /usr/src/debug/glslang/1.4.350.0/glslang/OSDependent, directory renamed /usr/src/debug/glslang/1.4.341.0/glslang -> /usr/src/debug/glslang/1.4.350.0/glslang, directory renamed /usr/src/debug/glslang/1.4.341.0/glslang/ResourceLimits -> /usr/src/debug/glslang/1.4.350.0/glslang/ResourceLimits, directory renamed /usr/src/debug/glslang/1.4.341.0/SPIRV/CInterface -> /usr/src/debug/glslang/1.4.350.0/SPIRV/CInterface, directory
  renamed /usr/src/debug/glslang/1.4.341.0/glslang/Public -> /usr/src/debug/glslang/1.4.350.0/glslang/Public, directory renamed /usr/src/debug/glslang/1.4.341.0/StandAlone -> /usr/src/debug/glslang/1.4.350.0/StandAlone, directory renamed /usr/src/debug/glslang/1.4.341.0/glslang/MachineIndependent -> /usr/src/debug/glslang/1.4.350.0/glslang/MachineIndependent, directory renamed /usr/src/debug/glslang/1.4.341.0/glslang/CInterface -> /usr/src/debug/glslang/1.4.350.0/glslang/CInterface, directory renamed /usr/src/debug/glslang/1.4.341.0/include/glslang -> /usr/src/debug/glslang/1.4.350.0/include/glslang, directory renamed /usr/src/debug/glslang/1.4.341.0/glslang/HLSL -> /usr/src/debug/glslang/1.4.350.0/glslang/HLSL, removed "/usr/src/debug/glslang/1.4.341.0/glslang/Include/ConstantUnion.h /usr/src/debug/glslang/1.4.341.0/glslang/Include/arrays.h /usr/src/debug/glslang/1.4.341.0/glslang/Include/Common.h /usr/src/debug/glslang/1.4.341.0/SPIRV/SpvPostProcess.cpp /usr/src/debug/glslang/1.4.3
 41.0/glslang/Include/glslang_c_interface.h /usr/src/debug/glslang/1.4.341.0/SPIRV/InReadableOrder.cpp /usr/src/debug/glslang/1.4.341.0/SPIRV/spvUtil.h /usr/src/debug/glslang/1.4.341.0/glslang/Include/intermediate.h /usr/src/debug/glslang/1.4.341.0/SPIRV/Logger.h /usr/src/debug/glslang/1.4.341.0/SPIRV/GLSL.ext.QCOM.h /usr/src/debug/glslang/1.4.341.0/glslang/Include/glslang_c_shader_types.h /usr/src/debug/glslang/1.4.341.0/glslang/Include/InfoSink.h /usr/src/debug/glslang/1.4.341.0/SPIRV/GLSL.ext.AMD.h /usr/src/debug/glslang/1.4.341.0/SPIRV/GLSL.ext.EXT.h /usr/src/debug/glslang/1.4.341.0/SPIRV/GLSL.ext.NV.h /usr/src/debug/glslang/1.4.341.0/SPIRV/SpvBuilder.h /usr/src/debug/glslang/1.4.341.0/SPIRV/SpvTools.cpp /usr/src/debug/glslang/1.4.341.0/SPIRV/SpvBuilder.cpp /usr/src/debug/glslang/1.4.341.0/SPIRV/NonSemanticDebugPrintf.h /usr/src/debug/glslang/1.4.341.0/glslang/Include/PoolAlloc.h /usr/src/debug/glslang/1.4.341.0/glslang/Include/ResourceLimits.h /usr/src/debug/glslang/1.4.341.0/SP
 IRV/GLSL.ext.KHR.h /usr/src/debug/glslang/1.4.341.0/SPIRV/spirv.hpp11 /usr/src/debug/glslang/1.4.341.0/SPIRV/GlslangToSpv.cpp /usr/src/debug/glslang/1.4.341.0/SPIRV/GLSL.std.450.h /usr/src/debug/glslang/1.4.341.0/SPIRV/disassemble.cpp /usr/src/debug/glslang/1.4.341.0/SPIRV/NonSemanticShaderDebugInfo100.h /usr/src/debug/glslang/1.4.341.0/SPIRV/doc.h /usr/src/debug/glslang/1.4.341.0/glslang/Include/BaseTypes.h /usr/src/debug/glslang/1.4.341.0/SPIRV/disassemble.h /usr/src/debug/glslang/1.4.341.0/SPIRV/doc.cpp /usr/src/debug/glslang/1.4.341.0/SPIRV/GLSL.ext.ARM.h /usr/src/debug/glslang/1.4.341.0/SPIRV/GlslangToSpv.h /usr/src/debug/glslang/1.4.341.0/glslang/Include/Types.h /usr/src/debug/glslang/1.4.341.0/SPIRV/hex_float.h /usr/src/debug/glslang/1.4.341.0/SPIRV/spvIR.h /usr/src/debug/glslang/1.4.341.0/SPIRV/Logger.cpp /usr/src/debug/glslang/1.4.341.0/SPIRV/SpvTools.h /usr/src/debug/glslang/1.4.341.0/glslang/Include/ShHandle.h /usr/src/debug/glslang/1.4.341.0/SPIRV/bitutils.h /usr/src/deb
 ug/glslang/1.4.341.0/glslang/Include/SpirvIntrinsics.h", added "/usr/src/debug/glslang/1.4.350.0/glslang/Include/ConstantUnion.h /usr/src/debug/glslang/1.4.350.0/glslang/Include/arrays.h /usr/src/debug/glslang/1.4.350.0/glslang/Include/Common.h /usr/src/debug/glslang/1.4.350.0/SPIRV/SpvPostProcess.cpp /usr/src/debug/glslang/1.4.350.0/glslang/Include/glslang_c_interface.h /usr/src/debug/glslang/1.4.350.0/SPIRV/InReadableOrder.cpp /usr/src/debug/glslang/1.4.350.0/SPIRV/spvUtil.h /usr/src/debug/glslang/1.4.350.0/glslang/Include/intermediate.h /usr/src/debug/glslang/1.4.350.0/SPIRV/Logger.h /usr/src/debug/glslang/1.4.350.0/SPIRV/GLSL.ext.QCOM.h /usr/src/debug/glslang/1.4.350.0/glslang/Include/glslang_c_shader_types.h /usr/src/debug/glslang/1.4.350.0/glslang/Include/InfoSink.h /usr/src/debug/glslang/1.4.350.0/SPIRV/GLSL.ext.AMD.h /usr/src/debug/glslang/1.4.350.0/SPIRV/GLSL.ext.EXT.h /usr/src/debug/glslang/1.4.350.0/SPIRV/GLSL.ext.NV.h /usr/src/debug/glslang/1.4.350.0/SPIRV/SpvBuilder.h /
 usr/src/debug/glslang/1.4.350.0/SPIRV/SpvTools.cpp /usr/src/debug/glslang/1.4.350.0/SPIRV/SpvBuilder.cpp /usr/src/debug/glslang/1.4.350.0/SPIRV/NonSemanticDebugPrintf.h /usr/src/debug/glslang/1.4.350.0/glslang/Include/PoolAlloc.h /usr/src/debug/glslang/1.4.350.0/glslang/Include/ResourceLimits.h /usr/src/debug/glslang/1.4.350.0/SPIRV/GLSL.ext.KHR.h /usr/src/debug/glslang/1.4.350.0/SPIRV/spirv.hpp11 /usr/src/debug/glslang/1.4.350.0/SPIRV/GlslangToSpv.cpp /usr/src/debug/glslang/1.4.350.0/SPIRV/GLSL.std.450.h /usr/src/debug/glslang/1.4.350.0/SPIRV/disassemble.cpp /usr/src/debug/glslang/1.4.350.0/SPIRV/doc.h /usr/src/debug/glslang/1.4.350.0/glslang/Include/BaseTypes.h /usr/src/debug/glslang/1.4.350.0/SPIRV/disassemble.h /usr/src/debug/glslang/1.4.350.0/SPIRV/doc.cpp /usr/src/debug/glslang/1.4.350.0/SPIRV/GLSL.ext.ARM.h /usr/src/debug/glslang/1.4.350.0/SPIRV/GlslangToSpv.h /usr/src/debug/glslang/1.4.350.0/glslang/Include/Types.h /usr/src/debug/glslang/1.4.350.0/SPIRV/hex_float.h /usr/src/
 debug/glslang/1.4.350.0/SPIRV/spvIR.h /usr/src/debug/glslang/1.4.350.0/SPIRV/Logger.cpp /usr/src/debug/glslang/1.4.350.0/SPIRV/SpvTools.h /usr/src/debug/glslang/1.4.350.0/SPIRV/NonSemanticShaderDebugInfo.h /usr/src/debug/glslang/1.4.350.0/glslang/Include/ShHandle.h /usr/src/debug/glslang/1.4.350.0/SPIRV/bitutils.h /usr/src/debug/glslang/1.4.350.0/glslang/Include/SpirvIntrinsics.h /usr/src/debug/glslang/1.4.350.0/glslang/Include/defer.h"
packages/x86-64-v3-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-staticdev: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/glslang/glslang: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang: PKGSIZE changed from 3985529 to 4030617 (+1%)
packages/x86-64-v3-poky-linux/glslang/glslang: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang.so.16.2.0 /usr/lib/libSPIRV.so.16.2.0 /usr/lib/libglslang-default-resource-limits.so.16.2.0", added "/usr/lib/libSPIRV.so.16.3.0 /usr/lib/libglslang-default-resource-limits.so.16.3.0 /usr/lib/libglslang.so.16.3.0"
packages/x86-64-v3-poky-linux/glslang: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/glslang: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/glslang: SRC_URI changed from "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-1.4.341.0 file://0001-generate-glslang-pkg-config.patch" to "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-1.4.350.0 file://0001-generate-glslang-pkg-config.patch"
Changes to packages/x86-64-v3-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.16 changed symlink target from libglslang-default-resource-limits.so.16.2.0 to libglslang-default-resource-limits.so.16.3.0
  /usr/lib/libglslang.so.16 changed symlink target from libglslang.so.16.2.0 to libglslang.so.16.3.0
  /usr/lib/libSPIRV.so.16 changed symlink target from libSPIRV.so.16.2.0 to libSPIRV.so.16.3.0
  /usr/lib/libglslang-default-resource-limits.so.16.2.0 moved to /usr/lib/libglslang-default-resource-limits.so.16.3.0
  /usr/lib/libglslang.so.16.2.0 moved to /usr/lib/libglslang.so.16.3.0
  /usr/lib/libSPIRV.so.16.2.0 moved to /usr/lib/libSPIRV.so.16.3.0

--===============1115935578674798255==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.4.341.0-1.4.350.0.patch"

RnJvbSAwYjU1NDA3ZDY3OTg3MDM1ZjhkYjYwM2UxYjNmZGY1ZGNhNjkzNjQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTI6MDY6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bHNsYW5nOiB1cGdyYWRlIDEuNC4zNDEuMCAtPiAxLjQuMzUwLjAKCi0tLQogLi4uL2dsc2xhbmcv
Z2xzbGFuZy8wMDAxLWdlbmVyYXRlLWdsc2xhbmctcGtnLWNvbmZpZy5wYXRjaCAgICAgIHwgMiAr
LQogLi4uL2dsc2xhbmcve2dsc2xhbmdfMS40LjM0MS4wLmJiID0+IGdsc2xhbmdfMS40LjM1MC4w
LmJifSAgICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcve2dsc2xhbmdf
MS40LjM0MS4wLmJiID0+IGdsc2xhbmdfMS40LjM1MC4wLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmcvMDAwMS1nZW5lcmF0ZS1nbHNs
YW5nLXBrZy1jb25maWcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNs
YW5nLzAwMDEtZ2VuZXJhdGUtZ2xzbGFuZy1wa2ctY29uZmlnLnBhdGNoCmluZGV4IDE1MDI0MmNl
MWQuLmQ3NGYzN2RiOTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5n
L2dsc2xhbmcvMDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZy8wMDAxLWdlbmVyYXRlLWdsc2xhbmct
cGtnLWNvbmZpZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNmE0MjM3ODAyZDhhNzlmNjVl
ZDc0YjEyODY1ZTJjZTViNjY2OTkzZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZWU0
NmYyZjYwOGNjYmU5NjE3Y2U0MTIzNWQwNDdmMDgwZDk3MmZmNyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwuY29tPgogRGF0
ZTogU3VuLCA3IEZlYiAyMDIxIDAxOjMwOjM5ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdlbmVy
YXRlIGdsc2xhbmcgcGtnLWNvbmZpZwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L2dsc2xhbmcvZ2xzbGFuZ18xLjQuMzQxLjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xz
bGFuZy9nbHNsYW5nXzEuNC4zNTAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuNC4zNDEuMC5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjQuMzUwLjAuYmIK
aW5kZXggYWE0ZjQ4YmI5Yy4uYmMzMzkzMWIzYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjQuMzQxLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjQuMzUwLjAuYmIKQEAgLTgsNyArOCw3IEBAIEhPTUVQ
QUdFID0gImh0dHBzOi8vd3d3Lmtocm9ub3Mub3JnL29wZW5nbGVzL3Nkay90b29scy9SZWZlcmVu
Y2UtQ29tcGlsZXIiCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSAmIEJTRC0yLUNsYXVzZSAmIE1J
VCAmIEFwYWNoZS0yLjAgJiBHUEwtMy13aXRoLWJpc29uLWV4Y2VwdGlvbiIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT01MGZmOWQwZmNkZTJkNWI5NTNlYmU0MzFj
NDhlMzRlMyIKIAotU1JDUkVWID0gImYwYmQwMjU3YzMwOGI5YTI2NTYyYzFhMzBjNDc0OGEwMjE5
Y2M5NTEiCitTUkNSRVYgPSAiMjc1ODIyYTYyNjFlZTY4OWFhZGIxZGE1ZjA5YTBlYzJmMDU4Njg1
YyIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvZ2xzbGFuZy5naXQ7
cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW47dGFnPXZ1bGthbi1zZGstJHtQVn0gXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2ggXAogICAg
ICAgICAgICAiCi0tIAoyLjQ3LjEKCg==

--===============1115935578674798255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang.so.16.2.0 /usr/lib/libSPIRV.so.16.2.0 /usr/lib/libglslang-default-resource-limits.so.16.2.0", added "/usr/lib/libglslang.so.16.3.0 /usr/lib/libSPIRV.so.16.3.0 /usr/lib/libglslang-default-resource-limits.so.16.3.0"
Changes to packages/x86-64-v3-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.16 changed symlink target from libglslang-default-resource-limits.so.16.2.0 to libglslang-default-resource-limits.so.16.3.0
  /usr/lib/libglslang.so.16 changed symlink target from libglslang.so.16.2.0 to libglslang.so.16.3.0
  /usr/lib/libSPIRV.so.16 changed symlink target from libSPIRV.so.16.2.0 to libSPIRV.so.16.3.0
  /usr/lib/libglslang-default-resource-limits.so.16.2.0 moved to /usr/lib/libglslang-default-resource-limits.so.16.3.0
  /usr/lib/libglslang.so.16.2.0 moved to /usr/lib/libglslang.so.16.3.0
  /usr/lib/libSPIRV.so.16.2.0 moved to /usr/lib/libSPIRV.so.16.3.0

--===============1115935578674798255==--

