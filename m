Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0254C53210
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:34 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.144494.1671136350880845425
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=B0dCrKQS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010185177d1a30-74a205a9-e327-4ca8-93c3-ff466b66ad42-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Fw7aMyM8CZMMEWTkxVAapjLyiMW5GQzk2ISf2cLDQ0U=;
	b=B0dCrKQSolPqA81zAXguP4Q3Svb0ixUFfsSJAFAdCiZcts05InmjGsOPmreb+Fre
	DKQAr4ru/SSsiLSxYkBzEEFrLPSM5GcelvAdi0gn3ZOzFG8jti3Zrp9Ufe0nGxb0UZk
	1fe1AM37AD/IEF/badYgA2kg65jYao8uZ0F5lro4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Fw7aMyM8CZMMEWTkxVAapjLyiMW5GQzk2ISf2cLDQ0U=;
	b=XQWbYCZ/66xi+hD6Md9I2unpyg+V59F4ONycP8n4T7hVa+jvnj5ZopGI1oSpUcY+
	84R9ouj99ENLXAjJXGk924jcIGTNPWYjwCvXeOPt1IkbXHN7/qrp4Zbp6tnAvExjLVQ
	nFePRKVUzKypNnrNHkr64AkgXXP6eaX1rWFnw+Do=
Content-Type: multipart/mixed; boundary="===============3204809796987085362=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.236.0 SUCCEEDED
Message-ID: <01010185177d1a30-74a205a9-e327-4ca8-93c3-ff466b66ad42-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174685

--===============3204809796987085362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *1.3.236.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.3.231.1-1.3.236.0.patch
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
--===============3204809796987085362==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.231.1-1.3.236.0.patch"

RnJvbSA4YjI2ZTAyMWZkOWYzOTJlNmRkNjEyZWZiNmQ3OGMxODA1N2ZiYzViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTQ6NTc6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bHNsYW5nOiB1cGdyYWRlIDEuMy4yMzEuMSAtPiAxLjMuMjM2LjAKCi0tLQogLi4uL2dsc2xhbmcv
e2dsc2xhbmdfMS4zLjIzMS4xLmJiID0+IGdsc2xhbmdfMS4zLjIzNi4wLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcve2dsc2xhbmdfMS4zLjIzMS4xLmJiID0+IGds
c2xhbmdfMS4zLjIzNi4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjIzMS4xLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjM2LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjMxLjEuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjIzNi4w
LmJiCmluZGV4IGZlZGUyNTE2YjEuLjk5ZWNhNmE2YzEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjIzMS4xLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjIzNi4wLmJiCkBAIC04LDcgKzgsNyBAQCBI
T01FUEFHRSA9ICJodHRwczovL3d3dy5raHJvbm9zLm9yZy9vcGVuZ2xlcy9zZGsvdG9vbHMvUmVm
ZXJlbmNlLUNvbXBpbGVyIgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UgJiBCU0QtMi1DbGF1c2Ug
JiBNSVQgJiBBcGFjaGUtMi4wICYgR1BMLTMtd2l0aC1iaXNvbi1leGNlcHRpb24iCiBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9MmEyYjVhY2Q3YmM0ODQ0OTY0Y2Zk
YTQ1ZmU4MDdkYzMiCiAKLVNSQ1JFViA9ICI1NzU1ZGU0NmIwN2U0Mzc0YzA1ZmIxMDgxZjY1Zjdh
ZTFmOGNjYTgxIgorU1JDUkVWID0gIjc3NTUxYzQyOWY4NmMwZTA3N2YyNjU1MmI3YzFjMGYxMmE5
ZjIzNWUiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL2dsc2xhbmcu
Z2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIgXAogICAgICAgICAgICBmaWxlOi8vMDAw
MS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2giCiBQRSA9ICIxIgotLSAKMi4zNy4z
Cgo=

--===============3204809796987085362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glslang/glslang-dbg: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 70438344 to 70462404 (+0%)
packages/core2-32-poky-linux/glslang/glslang-dbg: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
packages/core2-32-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libglslang.so.11.12.0", added "/usr/lib/.debug/libglslang.so.11.13.0"
packages/core2-32-poky-linux/glslang/glslang-dev: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/glslang/glslang-dev: PKGSIZE changed from 988779 to 994093 (+1%)
packages/core2-32-poky-linux/glslang/glslang-dev: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
packages/core2-32-poky-linux/glslang/glslang-dev: FILELIST: added "/usr/include/glslang/Public/ResourceLimits.h /usr/include/glslang/Public/resource_limits_c.h /usr/include/glslang/SPIRV/GLSL.ext.ARM.h"
packages/core2-32-poky-linux/glslang/glslang-doc: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/glslang/glslang-doc: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
packages/core2-32-poky-linux/glslang/glslang-locale: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/glslang/glslang-locale: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
packages/core2-32-poky-linux/glslang/glslang-src: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/glslang/glslang-src: PKGSIZE changed from 4679040 to 4687396 (+0%)
packages/core2-32-poky-linux/glslang/glslang-src: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
packages/core2-32-poky-linux/glslang/glslang-src: FILELIST: directory renamed /usr/src/debug/glslang/1_1.3.231.1-r0/glslang/OSDependent/Unix -> /usr/src/debug/glslang/1_1.3.236.0-r0/glslang/OSDependent/Unix, directory renamed /usr/src/debug/glslang/1_1.3.231.1-r0/glslang/HLSL -> /usr/src/debug/glslang/1_1.3.236.0-r0/glslang/HLSL, directory renamed /usr/src/debug/glslang/1_1.3.231.1-r0/glslang/GenericCodeGen -> /usr/src/debug/glslang/1_1.3.236.0-r0/glslang/GenericCodeGen, directory renamed /usr/src/debug/glslang/1_1.3.231.1-r0/glslang/CInterface -> /usr/src/debug/glslang/1_1.3.236.0-r0/glslang/CInterface, directory renamed /usr/src/debug/glslang/1_1.3.231.1-r0/glslang/MachineIndependent/preprocessor -> /usr/src/debug/glslang/1_1.3.236.0-r0/glslang/MachineIndependent/preprocessor, directory renamed /usr/src/debug/glslang/1_1.3.231.1-r0/include/glslang -> /usr/src/debug/glslang/1_1.3.236.0-r0/include/glslang, directory renamed /usr/src/debug/glslang/1_1.3.231.1-r0/glslang/Include -> /us
 r/src/debug/glslang/1_1.3.236.0-r0/glslang/Include, directory renamed /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/CInterface -> /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/CInterface, directory renamed /usr/src/debug/glslang/1_1.3.231.1-r0/glslang/OSDependent -> /usr/src/debug/glslang/1_1.3.236.0-r0/glslang/OSDependent, directory renamed /usr/src/debug/glslang/1_1.3.231.1-r0/OGLCompilersDLL -> /usr/src/debug/glslang/1_1.3.236.0-r0/OGLCompilersDLL, directory renamed /usr/src/debug/glslang/1_1.3.231.1-r0/glslang/MachineIndependent -> /usr/src/debug/glslang/1_1.3.236.0-r0/glslang/MachineIndependent, removed "/usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/doc.h /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/SpvBuilder.h /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/hex_float.h /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/GLSL.ext.KHR.h /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/GLSL.ext.EXT.h /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/GLSL.std.450.h /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/
 GLSL.ext.AMD.h /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/SPVRemapper.cpp /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/SpvBuilder.cpp /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/Logger.cpp /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/disassemble.cpp /usr/src/debug/glslang/1_1.3.231.1-r0/StandAlone/StandAlone.cpp /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/GlslangToSpv.cpp /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/NonSemanticShaderDebugInfo100.h /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/Logger.h /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/NonSemanticDebugPrintf.h /usr/src/debug/glslang/1_1.3.231.1-r0/StandAlone/DirStackFileIncluder.h /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/InReadableOrder.cpp /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/SpvPostProcess.cpp /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/GLSL.ext.NV.h /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/spvIR.h /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/GlslangToSpv.h /usr/src/debug/glslang/1_1.3.231.1-r0/glslang/Public/Shad
 erLang.h /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/SPVRemapper.h /usr/src/debug/glslang/1_1.3.231.1-r0/StandAlone/spirv-remap.cpp /usr/src/debug/glslang/1_1.3.231.1-r0/StandAlone/ResourceLimits.cpp /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/bitutils.h /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/spirv.hpp /usr/src/debug/glslang/1_1.3.231.1-r0/StandAlone/resource_limits_c.cpp /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/disassemble.h /usr/src/debug/glslang/1_1.3.231.1-r0/StandAlone/ResourceLimits.h /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/SpvTools.h /usr/src/debug/glslang/1_1.3.231.1-r0/SPIRV/doc.cpp /usr/src/debug/glslang/1_1.3.231.1-r0/StandAlone/Worklist.h", added "/usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/doc.h /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/SpvBuilder.h /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/hex_float.h /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/GLSL.ext.EXT.h /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/GLSL.ext.ARM.h /usr/src/debug/glslang/1_1.3.236.0-r
 0/SPIRV/GLSL.ext.AMD.h /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/GLSL.ext.KHR.h /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/GLSL.std.450.h /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/SPVRemapper.cpp /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/SpvBuilder.cpp /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/disassemble.cpp /usr/src/debug/glslang/1_1.3.236.0-r0/StandAlone/StandAlone.cpp /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/GlslangToSpv.cpp /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/NonSemanticShaderDebugInfo100.h /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/Logger.cpp /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/Logger.h /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/NonSemanticDebugPrintf.h /usr/src/debug/glslang/1_1.3.236.0-r0/StandAlone/DirStackFileIncluder.h /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/InReadableOrder.cpp /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/SpvPostProcess.cpp /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/GLSL.ext.NV.h /usr/src/debug/glslang/1_1.3.236.0-r0/SPIR
 V/spvIR.h /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/GlslangToSpv.h /usr/src/debug/glslang/1_1.3.236.0-r0/glslang/Public/ShaderLang.h /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/SPVRemapper.h /usr/src/debug/glslang/1_1.3.236.0-r0/StandAlone/spirv-remap.cpp /usr/src/debug/glslang/1_1.3.236.0-r0/StandAlone/ResourceLimits.cpp /usr/src/debug/glslang/1_1.3.236.0-r0/glslang/Public/ResourceLimits.h /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/bitutils.h /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/spirv.hpp /usr/src/debug/glslang/1_1.3.236.0-r0/StandAlone/resource_limits_c.cpp /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/disassemble.h /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/SpvTools.h /usr/src/debug/glslang/1_1.3.236.0-r0/SPIRV/doc.cpp /usr/src/debug/glslang/1_1.3.236.0-r0/StandAlone/Worklist.h"
packages/core2-32-poky-linux/glslang/glslang-staticdev: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
packages/core2-32-poky-linux/glslang/glslang: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/glslang/glslang: PKGSIZE changed from 6350641 to 6362929 (+0%)
packages/core2-32-poky-linux/glslang/glslang: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang.so.11.12.0", added "/usr/lib/libglslang.so.11.13.0"
packages/core2-32-poky-linux/glslang: PV changed from "1.3.231.1" to "1.3.236.0"
packages/core2-32-poky-linux/glslang: PKGV changed from 1.3.231.1 [default] to 1.3.236.0 [default]
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/lib/libglslang.so.11 changed symlink target from libglslang.so.11.12.0 to libglslang.so.11.13.0
  /usr/lib/libglslang.so.11.12.0 moved to /usr/lib/libglslang.so.11.13.0
  /usr/include/glslang/Public/resource_limits_c.h was added
  /usr/include/glslang/Public/ResourceLimits.h was added
  /usr/include/glslang/SPIRV/GLSL.ext.ARM.h was added

--===============3204809796987085362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/glslang/glslang-dev: FILELIST: added "/usr/include/glslang/SPIRV/GLSL.ext.ARM.h /usr/include/glslang/Public/resource_limits_c.h /usr/include/glslang/Public/ResourceLimits.h"
packages/core2-32-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang.so.11.12.0", added "/usr/lib/libglslang.so.11.13.0"
Changes to packages/core2-32-poky-linux/glslang (sysroot):
  /usr/lib/libglslang.so.11 changed symlink target from libglslang.so.11.12.0 to libglslang.so.11.13.0
  /usr/lib/libglslang.so.11.12.0 moved to /usr/lib/libglslang.so.11.13.0
  /usr/include/glslang/Public/resource_limits_c.h was added
  /usr/include/glslang/Public/ResourceLimits.h was added
  /usr/include/glslang/SPIRV/GLSL.ext.ARM.h was added

--===============3204809796987085362==--

