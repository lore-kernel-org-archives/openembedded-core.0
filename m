Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEDBC54E5E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:33 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.20339.1708018346591723322
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Pd7Pqh2Q;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZawVXr16;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018dadd3a7cf-bd0ea100-cec3-413c-b66b-2a2426f7c2d5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KBcAyGdOG13FKldzIl9RJ1jxHkVABdOG7ojvnajW3dk=;
	b=Pd7Pqh2Q13M4wHOjf98uSt0SfUAqKPkTBJ1ECRmGQcPkEWxDEnIxwgNJRR+bcqa1
	Tc/Ca7Xp4/bMEogydKzU2I1j9/uhG/Vkl8kg6oIaRf8j2Xqoi+bYyURnQM7tiftDV6z
	dM0fjHXeEAarYfdeLP7TTqEzO5PuYFbCyX365HuI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018346;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KBcAyGdOG13FKldzIl9RJ1jxHkVABdOG7ojvnajW3dk=;
	b=ZawVXr16oHo1r5fCFHE+DrNTx7W6L9SZ5b7ZqU+gIYlW7HCrRk7TDmLOi0rrifEm
	3Ey5CTuNMHXWApZVBCEh1jxPPAteWRfqA1l+NmQ4wmPHB9b/YAGgKZqSyAEBq/eSrff
	Ur9RKKAnSKx04HfFQ1HEm7a9BeXX+Uv4WSOUqwnQ=
Content-Type: multipart/mixed; boundary="===============2988819791163293273=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.275.0 SUCCEEDED
Message-ID: <0101018dadd3a7cf-bd0ea100-cec3-413c-b66b-2a2426f7c2d5-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195640

--===============2988819791163293273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *1.3.275.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.3.268.0-1.3.275.0.patch
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
From 4da49d939c048174a5e623b0d80df536bba3ae78 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 13:06:07 +0000
Subject: [PATCH] glslang: upgrade 1.3.268.0 -> 1.3.275.0

---
 .../glslang/0001-generate-glslang-pkg-config.patch   | 12 ++++++------
 .../{glslang_1.3.268.0.bb => glslang_1.3.275.0.bb}   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.268.0.bb => glslang_1.3.275.0.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index a2dcb13b36..7ed938e0b8 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From e8c1b7e1dc6d108a3b49d0adfdc4f836cfafcf1a Mon Sep 17 00:00:00 2001
+From a369bce8dd890f6260fc29b941b07b0a6c284a3c Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
@@ -16,21 +16,21 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 glslang/glslang.pc.cmake.in
 
 diff --git a/glslang/CMakeLists.txt b/glslang/CMakeLists.txt
-index 72e82b48..c6188e12 100644
+index 37eecaad..6974935c 100644
 --- a/glslang/CMakeLists.txt
 +++ b/glslang/CMakeLists.txt
-@@ -223,6 +223,8 @@ if(ENABLE_GLSLANG_INSTALL)
+@@ -251,6 +251,8 @@ if(PROJECT_IS_TOP_LEVEL)
          ")
          install(FILES "${CMAKE_CURRENT_BINARY_DIR}/glslangTargets.cmake" DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake)
      endif()
 +    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/glslang.pc.cmake.in ${CMAKE_CURRENT_BINARY_DIR}/pkgconfig/glslang.pc @ONLY)
 +    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pkgconfig/glslang.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
  
-     set(ALL_HEADERS
-         ${GLSLANG_HEADERS}
+     set(PUBLIC_HEADERS
+         Public/ResourceLimits.h
 diff --git a/glslang/glslang.pc.cmake.in b/glslang/glslang.pc.cmake.in
 new file mode 100644
-index 00000000..948a0952
+index 00000000..43104e68
 --- /dev/null
 +++ b/glslang/glslang.pc.cmake.in
 @@ -0,0 +1,11 @@
diff --git a/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.3.268.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.275.0.bb
index 033830ba36..2fd1e72a26 100644
--- a/meta/recipes-graphics/glslang/glslang_1.3.268.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.3.275.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "36d08c0d940cf307a23928299ef52c7970d8cee6"
+SRCREV = "a91631b260cba3f22858d6c6827511e636c2458a"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main \
            file://0001-generate-glslang-pkg-config.patch \
            "
-- 
2.42.0


--===============2988819791163293273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 82309528 to 82472200 (+0%)
packages/core2-64-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libSPIRV.so.13.1.1 /usr/lib/.debug/libglslang.so.13.1.1 /usr/lib/.debug/libSPVRemapper.so.13.1.1 /usr/lib/.debug/libglslang-default-resource-limits.so.13.1.1 /usr/lib/.debug/libHLSL.so.13.1.1", added "/usr/lib/.debug/libglslang.so.14.0.0 /usr/lib/.debug/libglslang-default-resource-limits.so.14.0.0 /usr/lib/.debug/libSPIRV.so.14.0.0 /usr/lib/.debug/libSPVRemapper.so.14.0.0"
packages/core2-64-poky-linux/glslang/glslang-dbg: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang/glslang-dbg: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang/glslang-dev: PKGSIZE changed from 1019651 to 276224 (-73%)
packages/core2-64-poky-linux/glslang/glslang-dev: FILELIST: removed "/usr/include/glslang/Include/Types.h /usr/include/glslang/HLSL/hlslTokens.h /usr/include/glslang/HLSL/hlslParseables.h /usr/include/glslang/Include/Common.h /usr/include/glslang/SPIRV/bitutils.h /usr/include/glslang/Include/ConstantUnion.h /usr/include/glslang/Include/PoolAlloc.h /usr/include/glslang/MachineIndependent/Scan.h /usr/include/glslang/MachineIndependent/propagateNoContraction.h /usr/include/glslang/SPIRV/GLSL.std.450.h /usr/include/glslang/Include/ShHandle.h /usr/include/glslang/HLSL/hlslScanContext.h /usr/include/glslang/MachineIndependent/localintermediate.h /usr/include/glslang/HLSL/hlslOpMap.h /usr/include/glslang/HLSL/hlslAttributes.h /usr/include/glslang/MachineIndependent/preprocessor/PpTokens.h /usr/include/glslang/Include/InitializeGlobals.h /usr/include/glslang/MachineIndependent/ParseHelper.h /usr/include/glslang/MachineIndependent/preprocessor/PpContext.h /usr/include/glslang/SPIRV/SpvTools.h
  /usr/include/glslang/Include/InfoSink.h /usr/include/glslang/Include/BaseTypes.h /usr/include/glslang/HLSL/hlslTokenStream.h /usr/include/glslang/SPIRV/hex_float.h /usr/include/glslang/MachineIndependent/attribute.h /usr/include/glslang/Include/SpirvIntrinsics.h /usr/include/glslang/HLSL/hlslGrammar.h /usr/include/glslang/MachineIndependent/SymbolTable.h /usr/include/glslang/MachineIndependent/parseVersions.h /usr/include/glslang/MachineIndependent/LiveTraverser.h /usr/include/glslang/SPIRV/doc.h /usr/include/glslang/MachineIndependent/RemoveTree.h /usr/include/glslang/SPIRV/GLSL.ext.AMD.h /usr/include/glslang/SPIRV/GLSL.ext.ARM.h /usr/include/glslang/SPIRV/GLSL.ext.EXT.h /usr/include/glslang/SPIRV/GLSL.ext.KHR.h /usr/include/glslang/MachineIndependent/Initialize.h /usr/include/glslang/SPIRV/SpvBuilder.h /usr/include/glslang/SPIRV/NonSemanticShaderDebugInfo100.h /usr/include/glslang/Include/arrays.h /usr/include/glslang/MachineIndependent/glslang_tab.cpp.h /usr/include/glslang/Mach
 ineIndependent/gl_types.h /usr/include/glslang/MachineIndependent/reflection.h /usr/include/glslang/SPIRV/NonSemanticDebugPrintf.h /usr/include/glslang/MachineIndependent/ScanContext.h /usr/include/glslang/HLSL/hlslParseHelper.h /usr/include/glslang/Include/intermediate.h /usr/include/glslang/SPIRV/GLSL.ext.NV.h /usr/lib/cmake/HLSLTargets.cmake /usr/lib/libHLSL.so /usr/include/glslang/MachineIndependent/iomapper.h /usr/include/glslang/SPIRV/spvIR.h"
packages/core2-64-poky-linux/glslang/glslang-dev: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang/glslang-dev: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang/glslang-doc: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang/glslang-doc: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang/glslang-locale: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang/glslang-locale: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang/glslang-src: PKGSIZE changed from 4880558 to 4900643 (+0%)
packages/core2-64-poky-linux/glslang/glslang-src: FILELIST: directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/HLSL -> /usr/src/debug/glslang/1.3.275.0/glslang/HLSL, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/OSDependent -> /usr/src/debug/glslang/1.3.275.0/glslang/OSDependent, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/ResourceLimits -> /usr/src/debug/glslang/1.3.275.0/glslang/ResourceLimits, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/MachineIndependent -> /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/CInterface -> /usr/src/debug/glslang/1.3.275.0/glslang/CInterface, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/Public -> /usr/src/debug/glslang/1.3.275.0/glslang/Public, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/Include -> /usr/src/debug/glslang/1.3.275.0/glslang/Include, directory renamed /usr/src/debug/glslang/1.3.268.0/glsla
 ng/MachineIndependent/preprocessor -> /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/preprocessor, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/OSDependent/Unix -> /usr/src/debug/glslang/1.3.275.0/glslang/OSDependent/Unix, directory renamed /usr/src/debug/glslang/1.3.268.0/include/glslang -> /usr/src/debug/glslang/1.3.275.0/include/glslang, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/GenericCodeGen -> /usr/src/debug/glslang/1.3.275.0/glslang/GenericCodeGen, directory renamed /usr/src/debug/glslang/1.3.268.0/SPIRV -> /usr/src/debug/glslang/1.3.275.0/SPIRV, directory renamed /usr/src/debug/glslang/1.3.268.0/SPIRV/CInterface -> /usr/src/debug/glslang/1.3.275.0/SPIRV/CInterface, directory renamed /usr/src/debug/glslang/1.3.268.0/StandAlone -> /usr/src/debug/glslang/1.3.275.0/StandAlone, removed all items "/usr/src/debug/glslang/1.3.268.0/OGLCompilersDLL/InitializeDll.h"
packages/core2-64-poky-linux/glslang/glslang-src: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang/glslang-src: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang/glslang-staticdev: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang/glslang: PKGSIZE changed from 5952234 to 5958841 (+0%)
packages/core2-64-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libSPIRV.so.13 /usr/lib/libSPVRemapper.so.13 /usr/lib/libglslang.so.13.1.1 /usr/lib/libHLSL.so.13.1.1 /usr/lib/libSPIRV.so.13.1.1 /usr/lib/libglslang-default-resource-limits.so.13.1.1 /usr/lib/libSPVRemapper.so.13.1.1 /usr/lib/libglslang.so.13 /usr/lib/libglslang-default-resource-limits.so.13 /usr/lib/libHLSL.so.13", added "/usr/lib/libSPVRemapper.so.14 /usr/lib/libglslang.so.14.0.0 /usr/lib/libSPIRV.so.14 /usr/lib/libglslang-default-resource-limits.so.14.0.0 /usr/lib/libSPIRV.so.14.0.0 /usr/lib/libglslang.so.14 /usr/lib/libSPVRemapper.so.14.0.0 /usr/lib/libglslang-default-resource-limits.so.14"
packages/core2-64-poky-linux/glslang/glslang: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang/glslang: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang: PV changed from "1.3.268.0" to "1.3.275.0"
Changes to packages/core2-64-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so changed symlink target from libglslang-default-resource-limits.so.13 to libglslang-default-resource-limits.so.14
  /usr/lib/libglslang.so changed symlink target from libglslang.so.13 to libglslang.so.14
  /usr/lib/libSPIRV.so changed symlink target from libSPIRV.so.13 to libSPIRV.so.14
  /usr/lib/libSPVRemapper.so changed symlink target from libSPVRemapper.so.13 to libSPVRemapper.so.14
  /usr/lib/libglslang-default-resource-limits.so.13.1.1 moved to /usr/lib/libglslang-default-resource-limits.so.14.0.0
  /usr/lib/libglslang-default-resource-limits.so.13 moved to /usr/lib/libglslang-default-resource-limits.so.14
  /usr/lib/libglslang.so.13.1.1 moved to /usr/lib/libglslang.so.14.0.0
  /usr/lib/libglslang.so.13 moved to /usr/lib/libglslang.so.14
  /usr/lib/libSPIRV.so.13.1.1 moved to /usr/lib/libSPIRV.so.14.0.0
  /usr/lib/libSPIRV.so.13 moved to /usr/lib/libSPIRV.so.14
  /usr/lib/libSPVRemapper.so.13.1.1 moved to /usr/lib/libSPVRemapper.so.14.0.0
  /usr/lib/libSPVRemapper.so.13 moved to /usr/lib/libSPVRemapper.so.14
  /usr/include/glslang/HLSL was removed
  /usr/include/glslang/HLSL/hlslAttributes.h was removed
  /usr/include/glslang/HLSL/hlslGrammar.h was removed
  /usr/include/glslang/HLSL/hlslOpMap.h was removed
  /usr/include/glslang/HLSL/hlslParseables.h was removed
  /usr/include/glslang/HLSL/hlslParseHelper.h was removed
  /usr/include/glslang/HLSL/hlslScanContext.h was removed
  /usr/include/glslang/HLSL/hlslTokens.h was removed
  /usr/include/glslang/HLSL/hlslTokenStream.h was removed
  /usr/include/glslang/Include/arrays.h was removed
  /usr/include/glslang/Include/BaseTypes.h was removed
  /usr/include/glslang/Include/Common.h was removed
  /usr/include/glslang/Include/ConstantUnion.h was removed
  /usr/include/glslang/Include/InfoSink.h was removed
  /usr/include/glslang/Include/InitializeGlobals.h was removed
  /usr/include/glslang/Include/intermediate.h was removed
  /usr/include/glslang/Include/PoolAlloc.h was removed
  /usr/include/glslang/Include/ShHandle.h was removed
  /usr/include/glslang/Include/SpirvIntrinsics.h was removed
  /usr/include/glslang/Include/Types.h was removed
  /usr/include/glslang/MachineIndependent/attribute.h was removed
  /usr/include/glslang/MachineIndependent/glslang_tab.cpp.h was removed
  /usr/include/glslang/MachineIndependent/gl_types.h was removed
  /usr/include/glslang/MachineIndependent/Initialize.h was removed
  /usr/include/glslang/MachineIndependent/iomapper.h was removed
  /usr/include/glslang/MachineIndependent/LiveTraverser.h was removed
  /usr/include/glslang/MachineIndependent/localintermediate.h was removed
  /usr/include/glslang/MachineIndependent/ParseHelper.h was removed
  /usr/include/glslang/MachineIndependent/parseVersions.h was removed
  /usr/include/glslang/MachineIndependent/preprocessor was removed
  /usr/include/glslang/MachineIndependent/preprocessor/PpContext.h was removed
  /usr/include/glslang/MachineIndependent/preprocessor/PpTokens.h was removed
  /usr/include/glslang/MachineIndependent/propagateNoContraction.h was removed
  /usr/include/glslang/MachineIndependent/reflection.h was removed
  /usr/include/glslang/MachineIndependent/RemoveTree.h was removed
  /usr/include/glslang/MachineIndependent/ScanContext.h was removed
  /usr/include/glslang/MachineIndependent/Scan.h was removed
  /usr/include/glslang/MachineIndependent/SymbolTable.h was removed
  /usr/include/glslang/SPIRV/bitutils.h was removed
  /usr/include/glslang/SPIRV/doc.h was removed
  /usr/include/glslang/SPIRV/GLSL.ext.AMD.h was removed
  /usr/include/glslang/SPIRV/GLSL.ext.ARM.h was removed
  /usr/include/glslang/SPIRV/GLSL.ext.EXT.h was removed
  /usr/include/glslang/SPIRV/GLSL.ext.KHR.h was removed
  /usr/include/glslang/SPIRV/GLSL.ext.NV.h was removed
  /usr/include/glslang/SPIRV/GLSL.std.450.h was removed
  /usr/include/glslang/SPIRV/hex_float.h was removed
  /usr/include/glslang/SPIRV/NonSemanticDebugPrintf.h was removed
  /usr/include/glslang/SPIRV/NonSemanticShaderDebugInfo100.h was removed
  /usr/include/glslang/SPIRV/SpvBuilder.h was removed
  /usr/include/glslang/SPIRV/spvIR.h was removed
  /usr/include/glslang/SPIRV/SpvTools.h was removed
  /usr/lib/cmake/HLSLTargets.cmake was removed
  /usr/lib/libHLSL.so.13.1.1 was removed
  /usr/lib/libHLSL.so.13 was removed
  /usr/lib/libHLSL.so was removed

--===============2988819791163293273==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.268.0-1.3.275.0.patch"

RnJvbSA0ZGE0OWQ5MzljMDQ4MTc0YTVlNjIzYjBkODBkZjUzNmJiYTNhZTc4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTM6MDY6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bHNsYW5nOiB1cGdyYWRlIDEuMy4yNjguMCAtPiAxLjMuMjc1LjAKCi0tLQogLi4uL2dsc2xhbmcv
MDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2ggICB8IDEyICsrKysrKy0tLS0t
LQogLi4uL3tnbHNsYW5nXzEuMy4yNjguMC5iYiA9PiBnbHNsYW5nXzEuMy4yNzUuMC5iYn0gICB8
ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy97Z2xzbGFuZ18xLjMuMjY4LjAu
YmIgPT4gZ2xzbGFuZ18xLjMuMjc1LjAuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZy8wMDAxLWdlbmVyYXRlLWdsc2xhbmctcGtnLWNv
bmZpZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmcvMDAwMS1n
ZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2gKaW5kZXggYTJkY2IxM2IzNi4uN2VkOTM4
ZTBiOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZy8w
MDAxLWdlbmVyYXRlLWdsc2xhbmctcGtnLWNvbmZpZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nLzAwMDEtZ2VuZXJhdGUtZ2xzbGFuZy1wa2ctY29uZmln
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlOGMxYjdlMWRjNmQxMDhhM2I0OWQwYWRmZGM0
ZjgzNmNmYWZjZjFhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhMzY5YmNlOGRkODkw
ZjYyNjBmYzI5Yjk0MWIwN2IwYTZjMjg0YTNjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBEYXRlOiBTdW4sIDcg
RmViIDIwMjEgMDE6MzA6MzkgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gZ2VuZXJhdGUgZ2xzbGFu
ZyBwa2ctY29uZmlnCkBAIC0xNiwyMSArMTYsMjEgQEAgU2lnbmVkLW9mZi1ieTogSm9zZSBRdWFy
ZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGdsc2xh
bmcvZ2xzbGFuZy5wYy5jbWFrZS5pbgogCiBkaWZmIC0tZ2l0IGEvZ2xzbGFuZy9DTWFrZUxpc3Rz
LnR4dCBiL2dsc2xhbmcvQ01ha2VMaXN0cy50eHQKLWluZGV4IDcyZTgyYjQ4Li5jNjE4OGUxMiAx
MDA2NDQKK2luZGV4IDM3ZWVjYWFkLi42OTc0OTM1YyAxMDA2NDQKIC0tLSBhL2dsc2xhbmcvQ01h
a2VMaXN0cy50eHQKICsrKyBiL2dsc2xhbmcvQ01ha2VMaXN0cy50eHQKLUBAIC0yMjMsNiArMjIz
LDggQEAgaWYoRU5BQkxFX0dMU0xBTkdfSU5TVEFMTCkKK0BAIC0yNTEsNiArMjUxLDggQEAgaWYo
UFJPSkVDVF9JU19UT1BfTEVWRUwpCiAgICAgICAgICAiKQogICAgICAgICAgaW5zdGFsbChGSUxF
UyAiJHtDTUFLRV9DVVJSRU5UX0JJTkFSWV9ESVJ9L2dsc2xhbmdUYXJnZXRzLmNtYWtlIiBERVNU
SU5BVElPTiAke0NNQUtFX0lOU1RBTExfTElCRElSfS9jbWFrZSkKICAgICAgZW5kaWYoKQogKyAg
ICBjb25maWd1cmVfZmlsZSgke0NNQUtFX0NVUlJFTlRfU09VUkNFX0RJUn0vZ2xzbGFuZy5wYy5j
bWFrZS5pbiAke0NNQUtFX0NVUlJFTlRfQklOQVJZX0RJUn0vcGtnY29uZmlnL2dsc2xhbmcucGMg
QE9OTFkpCiArICAgIGluc3RhbGwoRklMRVMgJHtDTUFLRV9DVVJSRU5UX0JJTkFSWV9ESVJ9L3Br
Z2NvbmZpZy9nbHNsYW5nLnBjIERFU1RJTkFUSU9OICR7Q01BS0VfSU5TVEFMTF9MSUJESVJ9L3Br
Z2NvbmZpZykKICAKLSAgICAgc2V0KEFMTF9IRUFERVJTCi0gICAgICAgICAke0dMU0xBTkdfSEVB
REVSU30KKyAgICAgc2V0KFBVQkxJQ19IRUFERVJTCisgICAgICAgICBQdWJsaWMvUmVzb3VyY2VM
aW1pdHMuaAogZGlmZiAtLWdpdCBhL2dsc2xhbmcvZ2xzbGFuZy5wYy5jbWFrZS5pbiBiL2dsc2xh
bmcvZ2xzbGFuZy5wYy5jbWFrZS5pbgogbmV3IGZpbGUgbW9kZSAxMDA2NDQKLWluZGV4IDAwMDAw
MDAwLi45NDhhMDk1MgoraW5kZXggMDAwMDAwMDAuLjQzMTA0ZTY4CiAtLS0gL2Rldi9udWxsCiAr
KysgYi9nbHNsYW5nL2dsc2xhbmcucGMuY21ha2UuaW4KIEBAIC0wLDAgKzEsMTEgQEAKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI2OC4wLmJi
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjc1LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xh
bmcvZ2xzbGFuZ18xLjMuMjY4LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9n
bHNsYW5nL2dsc2xhbmdfMS4zLjI3NS4wLmJiCmluZGV4IDAzMzgzMGJhMzYuLjJmZDFlNzJhMjYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI2
OC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI3
NS4wLmJiCkBAIC04LDcgKzgsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3d3dy5raHJvbm9zLm9y
Zy9vcGVuZ2xlcy9zZGsvdG9vbHMvUmVmZXJlbmNlLUNvbXBpbGVyIgogTElDRU5TRSA9ICJCU0Qt
My1DbGF1c2UgJiBCU0QtMi1DbGF1c2UgJiBNSVQgJiBBcGFjaGUtMi4wICYgR1BMLTMtd2l0aC1i
aXNvbi1leGNlcHRpb24iCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDtt
ZDU9MmEyYjVhY2Q3YmM0ODQ0OTY0Y2ZkYTQ1ZmU4MDdkYzMiCiAKLVNSQ1JFViA9ICIzNmQwOGMw
ZDk0MGNmMzA3YTIzOTI4Mjk5ZWY1MmM3OTcwZDhjZWU2IgorU1JDUkVWID0gImE5MTYzMWIyNjBj
YmEzZjIyODU4ZDZjNjgyNzUxMWU2MzZjMjQ1OGEiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5j
b20vS2hyb25vc0dyb3VwL2dsc2xhbmcuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIFwK
ICAgICAgICAgICAgZmlsZTovLzAwMDEtZ2VuZXJhdGUtZ2xzbGFuZy1wa2ctY29uZmlnLnBhdGNo
IFwKICAgICAgICAgICAgIgotLSAKMi40Mi4wCgo=

--===============2988819791163293273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/glslang/glslang-dev: FILELIST: removed "/usr/include/glslang/MachineIndependent/SymbolTable.h /usr/include/glslang/SPIRV/spvIR.h /usr/include/glslang/SPIRV/NonSemanticDebugPrintf.h /usr/include/glslang/MachineIndependent/ScanContext.h /usr/include/glslang/SPIRV/SpvBuilder.h /usr/include/glslang/HLSL/hlslAttributes.h /usr/include/glslang/HLSL/hlslParseHelper.h /usr/include/glslang/SPIRV/hex_float.h /usr/include/glslang/SPIRV/GLSL.std.450.h /usr/include/glslang/Include/Common.h /usr/include/glslang/Include/ConstantUnion.h /usr/include/glslang/Include/BaseTypes.h /usr/lib/cmake/HLSLTargets.cmake /usr/include/glslang/Include/SpirvIntrinsics.h /usr/include/glslang/SPIRV/GLSL.ext.NV.h /usr/include/glslang/Include/intermediate.h /usr/include/glslang/MachineIndependent/localintermediate.h /usr/include/glslang/MachineIndependent/preprocessor/PpTokens.h /usr/include/glslang/MachineIndependent/reflection.h /usr/include/glslang/MachineIndependent/LiveTraverser.h /usr
 /include/glslang/MachineIndependent/preprocessor/PpContext.h /usr/include/glslang/MachineIndependent/attribute.h /usr/include/glslang/Include/InitializeGlobals.h /usr/lib/libHLSL.so /usr/include/glslang/Include/ShHandle.h /usr/include/glslang/Include/InfoSink.h /usr/include/glslang/MachineIndependent/propagateNoContraction.h /usr/include/glslang/HLSL/hlslTokenStream.h /usr/include/glslang/HLSL/hlslGrammar.h /usr/include/glslang/HLSL/hlslTokens.h /usr/include/glslang/MachineIndependent/glslang_tab.cpp.h /usr/include/glslang/SPIRV/SpvTools.h /usr/include/glslang/Include/arrays.h /usr/include/glslang/MachineIndependent/Initialize.h /usr/include/glslang/Include/PoolAlloc.h /usr/include/glslang/HLSL/hlslScanContext.h /usr/include/glslang/HLSL/hlslOpMap.h /usr/include/glslang/Include/Types.h /usr/include/glslang/MachineIndependent/Scan.h /usr/include/glslang/MachineIndependent/parseVersions.h /usr/include/glslang/SPIRV/doc.h /usr/include/glslang/SPIRV/GLSL.ext.AMD.h /usr/include/glslang/S
 PIRV/GLSL.ext.ARM.h /usr/include/glslang/SPIRV/GLSL.ext.EXT.h /usr/include/glslang/SPIRV/GLSL.ext.KHR.h /usr/include/glslang/SPIRV/NonSemanticShaderDebugInfo100.h /usr/include/glslang/HLSL/hlslParseables.h /usr/include/glslang/MachineIndependent/iomapper.h /usr/include/glslang/MachineIndependent/RemoveTree.h /usr/include/glslang/MachineIndependent/gl_types.h /usr/include/glslang/MachineIndependent/ParseHelper.h /usr/include/glslang/SPIRV/bitutils.h"
packages/core2-64-poky-linux/glslang/glslang-dev: PKGSIZE changed from 1019651 to 276224 (-73%)
packages/core2-64-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libSPVRemapper.so.13.1.1 /usr/lib/libglslang.so.13.1.1 /usr/lib/libHLSL.so.13 /usr/lib/libSPIRV.so.13.1.1 /usr/lib/libHLSL.so.13.1.1 /usr/lib/libSPIRV.so.13 /usr/lib/libglslang-default-resource-limits.so.13 /usr/lib/libglslang-default-resource-limits.so.13.1.1 /usr/lib/libglslang.so.13 /usr/lib/libSPVRemapper.so.13", added "/usr/lib/libSPVRemapper.so.14.0.0 /usr/lib/libglslang-default-resource-limits.so.14.0.0 /usr/lib/libglslang.so.14.0.0 /usr/lib/libglslang-default-resource-limits.so.14 /usr/lib/libSPIRV.so.14 /usr/lib/libSPIRV.so.14.0.0 /usr/lib/libSPVRemapper.so.14 /usr/lib/libglslang.so.14"
Changes to packages/core2-64-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so changed symlink target from libglslang-default-resource-limits.so.13 to libglslang-default-resource-limits.so.14
  /usr/lib/libglslang.so changed symlink target from libglslang.so.13 to libglslang.so.14
  /usr/lib/libSPIRV.so changed symlink target from libSPIRV.so.13 to libSPIRV.so.14
  /usr/lib/libSPVRemapper.so changed symlink target from libSPVRemapper.so.13 to libSPVRemapper.so.14
  /usr/lib/libglslang-default-resource-limits.so.13.1.1 moved to /usr/lib/libglslang-default-resource-limits.so.14.0.0
  /usr/lib/libglslang-default-resource-limits.so.13 moved to /usr/lib/libglslang-default-resource-limits.so.14
  /usr/lib/libglslang.so.13.1.1 moved to /usr/lib/libglslang.so.14.0.0
  /usr/lib/libglslang.so.13 moved to /usr/lib/libglslang.so.14
  /usr/lib/libSPIRV.so.13.1.1 moved to /usr/lib/libSPIRV.so.14.0.0
  /usr/lib/libSPIRV.so.13 moved to /usr/lib/libSPIRV.so.14
  /usr/lib/libSPVRemapper.so.13.1.1 moved to /usr/lib/libSPVRemapper.so.14.0.0
  /usr/lib/libSPVRemapper.so.13 moved to /usr/lib/libSPVRemapper.so.14
  /usr/include/glslang/HLSL was removed
  /usr/include/glslang/HLSL/hlslAttributes.h was removed
  /usr/include/glslang/HLSL/hlslGrammar.h was removed
  /usr/include/glslang/HLSL/hlslOpMap.h was removed
  /usr/include/glslang/HLSL/hlslParseables.h was removed
  /usr/include/glslang/HLSL/hlslParseHelper.h was removed
  /usr/include/glslang/HLSL/hlslScanContext.h was removed
  /usr/include/glslang/HLSL/hlslTokens.h was removed
  /usr/include/glslang/HLSL/hlslTokenStream.h was removed
  /usr/include/glslang/Include/arrays.h was removed
  /usr/include/glslang/Include/BaseTypes.h was removed
  /usr/include/glslang/Include/Common.h was removed
  /usr/include/glslang/Include/ConstantUnion.h was removed
  /usr/include/glslang/Include/InfoSink.h was removed
  /usr/include/glslang/Include/InitializeGlobals.h was removed
  /usr/include/glslang/Include/intermediate.h was removed
  /usr/include/glslang/Include/PoolAlloc.h was removed
  /usr/include/glslang/Include/ShHandle.h was removed
  /usr/include/glslang/Include/SpirvIntrinsics.h was removed
  /usr/include/glslang/Include/Types.h was removed
  /usr/include/glslang/MachineIndependent/attribute.h was removed
  /usr/include/glslang/MachineIndependent/glslang_tab.cpp.h was removed
  /usr/include/glslang/MachineIndependent/gl_types.h was removed
  /usr/include/glslang/MachineIndependent/Initialize.h was removed
  /usr/include/glslang/MachineIndependent/iomapper.h was removed
  /usr/include/glslang/MachineIndependent/LiveTraverser.h was removed
  /usr/include/glslang/MachineIndependent/localintermediate.h was removed
  /usr/include/glslang/MachineIndependent/ParseHelper.h was removed
  /usr/include/glslang/MachineIndependent/parseVersions.h was removed
  /usr/include/glslang/MachineIndependent/preprocessor was removed
  /usr/include/glslang/MachineIndependent/preprocessor/PpContext.h was removed
  /usr/include/glslang/MachineIndependent/preprocessor/PpTokens.h was removed
  /usr/include/glslang/MachineIndependent/propagateNoContraction.h was removed
  /usr/include/glslang/MachineIndependent/reflection.h was removed
  /usr/include/glslang/MachineIndependent/RemoveTree.h was removed
  /usr/include/glslang/MachineIndependent/ScanContext.h was removed
  /usr/include/glslang/MachineIndependent/Scan.h was removed
  /usr/include/glslang/MachineIndependent/SymbolTable.h was removed
  /usr/include/glslang/SPIRV/bitutils.h was removed
  /usr/include/glslang/SPIRV/doc.h was removed
  /usr/include/glslang/SPIRV/GLSL.ext.AMD.h was removed
  /usr/include/glslang/SPIRV/GLSL.ext.ARM.h was removed
  /usr/include/glslang/SPIRV/GLSL.ext.EXT.h was removed
  /usr/include/glslang/SPIRV/GLSL.ext.KHR.h was removed
  /usr/include/glslang/SPIRV/GLSL.ext.NV.h was removed
  /usr/include/glslang/SPIRV/GLSL.std.450.h was removed
  /usr/include/glslang/SPIRV/hex_float.h was removed
  /usr/include/glslang/SPIRV/NonSemanticDebugPrintf.h was removed
  /usr/include/glslang/SPIRV/NonSemanticShaderDebugInfo100.h was removed
  /usr/include/glslang/SPIRV/SpvBuilder.h was removed
  /usr/include/glslang/SPIRV/spvIR.h was removed
  /usr/include/glslang/SPIRV/SpvTools.h was removed
  /usr/lib/cmake/HLSLTargets.cmake was removed
  /usr/lib/libHLSL.so.13.1.1 was removed
  /usr/lib/libHLSL.so.13 was removed
  /usr/lib/libHLSL.so was removed

--===============2988819791163293273==--

