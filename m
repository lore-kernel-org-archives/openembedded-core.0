Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F16C54787
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:17 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.2148.1706810404538100987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Snm26aA+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rMwBuQU4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018d65d3f752-868eb95b-b934-4422-b1e0-679f7e7ec395-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Fq3LAhW8OBemzJU1R9oBgmkj4/O3zgv3Qpu3jgDN8vA=;
	b=Snm26aA+cAg2wF42foFhXfnygakMnT7oBF7GPczMt9I+Jrw3aMdeHZ5r+PqqaBHC
	O7Ko3hxu/wes23mOzZA7ZwB1vgSC6ttBDdx6hcMwrzP6PI+mHgC7Fct9Mg2aaKYrEUx
	G/Ej0Ef65pnKJL201vD2iheUPjs9BVGFVbnCmSa0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Fq3LAhW8OBemzJU1R9oBgmkj4/O3zgv3Qpu3jgDN8vA=;
	b=rMwBuQU42Rroba/iV4Prg/BYPJRP2J5yvXuEifkpAOKyhJNQjxNaMC5fOxxQJHLm
	zt8KZX2Y87i6tCXuxgSY5L+lo6VxBOcOpbTXFvKQaI++1iMEAWbTCnpE41vC2WV9MW8
	sB/MFBKwDwF8L4c6LSbOLrv8Jo0XbKmuocvGZixg=
Content-Type: multipart/mixed; boundary="===============4523203860725804259=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.275.0 SUCCEEDED
Message-ID: <0101018d65d3f752-868eb95b-b934-4422-b1e0-679f7e7ec395-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194674

--===============4523203860725804259==
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
From 31130659f9cf629ad75b8644aea7b8949c7b3166 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 12:42:35 +0000
Subject: [PATCH] glslang: upgrade 1.3.268.0 -> 1.3.275.0

---
 .../glslang/0001-generate-glslang-pkg-config.patch   | 12 ++++++------
 .../{glslang_1.3.268.0.bb => glslang_1.3.275.0.bb}   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.268.0.bb => glslang_1.3.275.0.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index a2dcb13b36..901f32bc49 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From e8c1b7e1dc6d108a3b49d0adfdc4f836cfafcf1a Mon Sep 17 00:00:00 2001
+From 53c39333962590e5ec9c217bffe260a31416a85d Mon Sep 17 00:00:00 2001
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


--===============4523203860725804259==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.268.0-1.3.275.0.patch"

RnJvbSAzMTEzMDY1OWY5Y2Y2MjlhZDc1Yjg2NDRhZWE3Yjg5NDljN2IzMTY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAxMjo0MjozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
c2xhbmc6IHVwZ3JhZGUgMS4zLjI2OC4wIC0+IDEuMy4yNzUuMAoKLS0tCiAuLi4vZ2xzbGFuZy8w
MDAxLWdlbmVyYXRlLWdsc2xhbmctcGtnLWNvbmZpZy5wYXRjaCAgIHwgMTIgKysrKysrLS0tLS0t
CiAuLi4ve2dsc2xhbmdfMS4zLjI2OC4wLmJiID0+IGdsc2xhbmdfMS4zLjI3NS4wLmJifSAgIHwg
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL3tnbHNsYW5nXzEuMy4yNjguMC5i
YiA9PiBnbHNsYW5nXzEuMy4yNzUuMC5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nLzAwMDEtZ2VuZXJhdGUtZ2xzbGFuZy1wa2ctY29u
ZmlnLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZy8wMDAxLWdl
bmVyYXRlLWdsc2xhbmctcGtnLWNvbmZpZy5wYXRjaAppbmRleCBhMmRjYjEzYjM2Li45MDFmMzJi
YzQ5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nLzAw
MDEtZ2VuZXJhdGUtZ2xzbGFuZy1wa2ctY29uZmlnLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9nbHNsYW5nL2dsc2xhbmcvMDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGU4YzFiN2UxZGM2ZDEwOGEzYjQ5ZDBhZGZkYzRm
ODM2Y2ZhZmNmMWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDUzYzM5MzMzOTYyNTkw
ZTVlYzljMjE3YmZmZTI2MGEzMTQxNmE4NWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBKb3NlIFF1YXJlc21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgNyBG
ZWIgMjAyMSAwMTozMDozOSArMDAwMAogU3ViamVjdDogW1BBVENIXSBnZW5lcmF0ZSBnbHNsYW5n
IHBrZy1jb25maWcKQEAgLTE2LDIxICsxNiwyMSBAQCBTaWduZWQtb2ZmLWJ5OiBKb3NlIFF1YXJl
c21hIDxxdWFyZXNtYS5qb3NlQGdtYWlsLmNvbT4KICBjcmVhdGUgbW9kZSAxMDA2NDQgZ2xzbGFu
Zy9nbHNsYW5nLnBjLmNtYWtlLmluCiAKIGRpZmYgLS1naXQgYS9nbHNsYW5nL0NNYWtlTGlzdHMu
dHh0IGIvZ2xzbGFuZy9DTWFrZUxpc3RzLnR4dAotaW5kZXggNzJlODJiNDguLmM2MTg4ZTEyIDEw
MDY0NAoraW5kZXggMzdlZWNhYWQuLjY5NzQ5MzVjIDEwMDY0NAogLS0tIGEvZ2xzbGFuZy9DTWFr
ZUxpc3RzLnR4dAogKysrIGIvZ2xzbGFuZy9DTWFrZUxpc3RzLnR4dAotQEAgLTIyMyw2ICsyMjMs
OCBAQCBpZihFTkFCTEVfR0xTTEFOR19JTlNUQUxMKQorQEAgLTI1MSw2ICsyNTEsOCBAQCBpZihQ
Uk9KRUNUX0lTX1RPUF9MRVZFTCkKICAgICAgICAgICIpCiAgICAgICAgICBpbnN0YWxsKEZJTEVT
ICIke0NNQUtFX0NVUlJFTlRfQklOQVJZX0RJUn0vZ2xzbGFuZ1RhcmdldHMuY21ha2UiIERFU1RJ
TkFUSU9OICR7Q01BS0VfSU5TVEFMTF9MSUJESVJ9L2NtYWtlKQogICAgICBlbmRpZigpCiArICAg
IGNvbmZpZ3VyZV9maWxlKCR7Q01BS0VfQ1VSUkVOVF9TT1VSQ0VfRElSfS9nbHNsYW5nLnBjLmNt
YWtlLmluICR7Q01BS0VfQ1VSUkVOVF9CSU5BUllfRElSfS9wa2djb25maWcvZ2xzbGFuZy5wYyBA
T05MWSkKICsgICAgaW5zdGFsbChGSUxFUyAke0NNQUtFX0NVUlJFTlRfQklOQVJZX0RJUn0vcGtn
Y29uZmlnL2dsc2xhbmcucGMgREVTVElOQVRJT04gJHtDTUFLRV9JTlNUQUxMX0xJQkRJUn0vcGtn
Y29uZmlnKQogIAotICAgICBzZXQoQUxMX0hFQURFUlMKLSAgICAgICAgICR7R0xTTEFOR19IRUFE
RVJTfQorICAgICBzZXQoUFVCTElDX0hFQURFUlMKKyAgICAgICAgIFB1YmxpYy9SZXNvdXJjZUxp
bWl0cy5oCiBkaWZmIC0tZ2l0IGEvZ2xzbGFuZy9nbHNsYW5nLnBjLmNtYWtlLmluIGIvZ2xzbGFu
Zy9nbHNsYW5nLnBjLmNtYWtlLmluCiBuZXcgZmlsZSBtb2RlIDEwMDY0NAotaW5kZXggMDAwMDAw
MDAuLjk0OGEwOTUyCitpbmRleCAwMDAwMDAwMC4uNDMxMDRlNjgKIC0tLSAvZGV2L251bGwKICsr
KyBiL2dsc2xhbmcvZ2xzbGFuZy5wYy5jbWFrZS5pbgogQEAgLTAsMCArMSwxMSBAQApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjY4LjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuMy4yNzUuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFu
Zy9nbHNsYW5nXzEuMy4yNjguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ds
c2xhbmcvZ2xzbGFuZ18xLjMuMjc1LjAuYmIKaW5kZXggMDMzODMwYmEzNi4uMmZkMWU3MmEyNiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjY4
LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjc1
LjAuYmIKQEAgLTgsNyArOCw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vd3d3Lmtocm9ub3Mub3Jn
L29wZW5nbGVzL3Nkay90b29scy9SZWZlcmVuY2UtQ29tcGlsZXIiCiBMSUNFTlNFID0gIkJTRC0z
LUNsYXVzZSAmIEJTRC0yLUNsYXVzZSAmIE1JVCAmIEFwYWNoZS0yLjAgJiBHUEwtMy13aXRoLWJp
c29uLWV4Y2VwdGlvbiIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21k
NT0yYTJiNWFjZDdiYzQ4NDQ5NjRjZmRhNDVmZTgwN2RjMyIKIAotU1JDUkVWID0gIjM2ZDA4YzBk
OTQwY2YzMDdhMjM5MjgyOTllZjUyYzc5NzBkOGNlZTYiCitTUkNSRVYgPSAiYTkxNjMxYjI2MGNi
YTNmMjI4NThkNmM2ODI3NTExZTYzNmMyNDU4YSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNv
bS9LaHJvbm9zR3JvdXAvZ2xzbGFuZy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4gXAog
ICAgICAgICAgICBmaWxlOi8vMDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2gg
XAogICAgICAgICAgICAiCi0tIAoyLjQyLjAKCg==

--===============4523203860725804259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/glslang/glslang-dev: FILELIST: removed "/usr/include/glslang/Include/PoolAlloc.h /usr/include/glslang/MachineIndependent/RemoveTree.h /usr/include/glslang/Include/ShHandle.h /usr/lib/cmake/HLSLTargets.cmake /usr/include/glslang/SPIRV/SpvTools.h /usr/include/glslang/Include/Common.h /usr/lib/libHLSL.so /usr/include/glslang/Include/InitializeGlobals.h /usr/include/glslang/HLSL/hlslTokens.h /usr/include/glslang/SPIRV/GLSL.ext.NV.h /usr/include/glslang/Include/BaseTypes.h /usr/include/glslang/MachineIndependent/ScanContext.h /usr/include/glslang/MachineIndependent/LiveTraverser.h /usr/include/glslang/MachineIndependent/iomapper.h /usr/include/glslang/MachineIndependent/SymbolTable.h /usr/include/glslang/MachineIndependent/ParseHelper.h /usr/include/glslang/HLSL/hlslScanContext.h /usr/include/glslang/SPIRV/NonSemanticShaderDebugInfo100.h /usr/include/glslang/HLSL/hlslAttributes.h /usr/include/glslang/SPIRV/GLSL.ext.AMD.h /usr/include/glslang/SPIRV/GLSL.ext.ARM
 .h /usr/include/glslang/SPIRV/GLSL.ext.EXT.h /usr/include/glslang/MachineIndependent/attribute.h /usr/include/glslang/SPIRV/GLSL.ext.KHR.h /usr/include/glslang/Include/Types.h /usr/include/glslang/SPIRV/bitutils.h /usr/include/glslang/Include/InfoSink.h /usr/include/glslang/MachineIndependent/Scan.h /usr/include/glslang/HLSL/hlslParseHelper.h /usr/include/glslang/MachineIndependent/gl_types.h /usr/include/glslang/Include/SpirvIntrinsics.h /usr/include/glslang/MachineIndependent/reflection.h /usr/include/glslang/MachineIndependent/preprocessor/PpTokens.h /usr/include/glslang/Include/intermediate.h /usr/include/glslang/MachineIndependent/glslang_tab.cpp.h /usr/include/glslang/SPIRV/GLSL.std.450.h /usr/include/glslang/SPIRV/NonSemanticDebugPrintf.h /usr/include/glslang/MachineIndependent/parseVersions.h /usr/include/glslang/HLSL/hlslParseables.h /usr/include/glslang/SPIRV/spvIR.h /usr/include/glslang/HLSL/hlslGrammar.h /usr/include/glslang/HLSL/hlslTokenStream.h /usr/include/glslang/SP
 IRV/doc.h /usr/include/glslang/SPIRV/hex_float.h /usr/include/glslang/SPIRV/SpvBuilder.h /usr/include/glslang/MachineIndependent/Initialize.h /usr/include/glslang/HLSL/hlslOpMap.h /usr/include/glslang/Include/arrays.h /usr/include/glslang/MachineIndependent/propagateNoContraction.h /usr/include/glslang/Include/ConstantUnion.h /usr/include/glslang/MachineIndependent/preprocessor/PpContext.h /usr/include/glslang/MachineIndependent/localintermediate.h"
packages/core2-64-poky-linux/glslang/glslang-dev: PKGSIZE changed from 1019651 to 276224 (-73%)
packages/core2-64-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libSPVRemapper.so.13 /usr/lib/libHLSL.so.13.1.1 /usr/lib/libHLSL.so.13 /usr/lib/libSPIRV.so.13.1.1 /usr/lib/libglslang.so.13 /usr/lib/libglslang-default-resource-limits.so.13 /usr/lib/libglslang-default-resource-limits.so.13.1.1 /usr/lib/libSPVRemapper.so.13.1.1 /usr/lib/libSPIRV.so.13 /usr/lib/libglslang.so.13.1.1", added "/usr/lib/libSPIRV.so.14.0.0 /usr/lib/libglslang.so.14 /usr/lib/libglslang-default-resource-limits.so.14 /usr/lib/libSPVRemapper.so.14.0.0 /usr/lib/libSPIRV.so.14 /usr/lib/libglslang-default-resource-limits.so.14.0.0 /usr/lib/libglslang.so.14.0.0 /usr/lib/libSPVRemapper.so.14"
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

--===============4523203860725804259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/glslang/glslang-dbg: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang/glslang-dbg: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libglslang-default-resource-limits.so.13.1.1 /usr/lib/.debug/libHLSL.so.13.1.1 /usr/lib/.debug/libSPVRemapper.so.13.1.1 /usr/lib/.debug/libSPIRV.so.13.1.1 /usr/lib/.debug/libglslang.so.13.1.1", added "/usr/lib/.debug/libSPIRV.so.14.0.0 /usr/lib/.debug/libglslang-default-resource-limits.so.14.0.0 /usr/lib/.debug/libglslang.so.14.0.0 /usr/lib/.debug/libSPVRemapper.so.14.0.0"
packages/core2-64-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 82309048 to 82471752 (+0%)
packages/core2-64-poky-linux/glslang/glslang-dev: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang/glslang-dev: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang/glslang-dev: FILELIST: removed "/usr/include/glslang/SPIRV/doc.h /usr/include/glslang/Include/SpirvIntrinsics.h /usr/lib/cmake/HLSLTargets.cmake /usr/include/glslang/MachineIndependent/gl_types.h /usr/include/glslang/Include/PoolAlloc.h /usr/include/glslang/MachineIndependent/iomapper.h /usr/include/glslang/SPIRV/NonSemanticDebugPrintf.h /usr/include/glslang/MachineIndependent/glslang_tab.cpp.h /usr/include/glslang/Include/Common.h /usr/include/glslang/MachineIndependent/propagateNoContraction.h /usr/include/glslang/SPIRV/GLSL.std.450.h /usr/include/glslang/Include/BaseTypes.h /usr/include/glslang/Include/arrays.h /usr/include/glslang/SPIRV/hex_float.h /usr/include/glslang/SPIRV/SpvBuilder.h /usr/include/glslang/MachineIndependent/localintermediate.h /usr/include/glslang/MachineIndependent/LiveTraverser.h /usr/include/glslang/MachineIndependent/Scan.h /usr/include/glslang/MachineIndependent/ParseHelper.h /usr/include/glslang/MachineIndependent/pre
 processor/PpContext.h /usr/include/glslang/SPIRV/SpvTools.h /usr/include/glslang/Include/InitializeGlobals.h /usr/include/glslang/HLSL/hlslTokens.h /usr/include/glslang/Include/InfoSink.h /usr/include/glslang/SPIRV/NonSemanticShaderDebugInfo100.h /usr/include/glslang/HLSL/hlslGrammar.h /usr/include/glslang/HLSL/hlslTokenStream.h /usr/include/glslang/Include/intermediate.h /usr/include/glslang/SPIRV/GLSL.ext.AMD.h /usr/include/glslang/MachineIndependent/preprocessor/PpTokens.h /usr/include/glslang/HLSL/hlslOpMap.h /usr/lib/libHLSL.so /usr/include/glslang/SPIRV/bitutils.h /usr/include/glslang/SPIRV/GLSL.ext.ARM.h /usr/include/glslang/SPIRV/GLSL.ext.EXT.h /usr/include/glslang/SPIRV/GLSL.ext.KHR.h /usr/include/glslang/Include/ShHandle.h /usr/include/glslang/SPIRV/GLSL.ext.NV.h /usr/include/glslang/SPIRV/spvIR.h /usr/include/glslang/MachineIndependent/ScanContext.h /usr/include/glslang/Include/ConstantUnion.h /usr/include/glslang/MachineIndependent/reflection.h /usr/include/glslang/Machi
 neIndependent/RemoveTree.h /usr/include/glslang/MachineIndependent/Initialize.h /usr/include/glslang/HLSL/hlslParseables.h /usr/include/glslang/MachineIndependent/SymbolTable.h /usr/include/glslang/HLSL/hlslAttributes.h /usr/include/glslang/MachineIndependent/parseVersions.h /usr/include/glslang/HLSL/hlslParseHelper.h /usr/include/glslang/Include/Types.h /usr/include/glslang/MachineIndependent/attribute.h /usr/include/glslang/HLSL/hlslScanContext.h"
packages/core2-64-poky-linux/glslang/glslang-dev: PKGSIZE changed from 1019651 to 276224 (-73%)
packages/core2-64-poky-linux/glslang/glslang-doc: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang/glslang-doc: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang/glslang-locale: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang/glslang-locale: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang/glslang-src: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang/glslang-src: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang/glslang-src: FILELIST: directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/Public -> /usr/src/debug/glslang/1.3.275.0/glslang/Public, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/OSDependent -> /usr/src/debug/glslang/1.3.275.0/glslang/OSDependent, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/MachineIndependent/preprocessor -> /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent/preprocessor, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/HLSL -> /usr/src/debug/glslang/1.3.275.0/glslang/HLSL, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/ResourceLimits -> /usr/src/debug/glslang/1.3.275.0/glslang/ResourceLimits, directory renamed /usr/src/debug/glslang/1.3.268.0/include/glslang -> /usr/src/debug/glslang/1.3.275.0/include/glslang, directory renamed /usr/src/debug/glslang/1.3.268.0/StandAlone -> /usr/src/debug/glslang/1.3.275.0/StandAlone, directory renamed /usr/src/debug/glslang/1.3.2
 68.0/SPIRV/CInterface -> /usr/src/debug/glslang/1.3.275.0/SPIRV/CInterface, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/GenericCodeGen -> /usr/src/debug/glslang/1.3.275.0/glslang/GenericCodeGen, directory renamed /usr/src/debug/glslang/1.3.268.0/SPIRV -> /usr/src/debug/glslang/1.3.275.0/SPIRV, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/OSDependent/Unix -> /usr/src/debug/glslang/1.3.275.0/glslang/OSDependent/Unix, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/Include -> /usr/src/debug/glslang/1.3.275.0/glslang/Include, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/MachineIndependent -> /usr/src/debug/glslang/1.3.275.0/glslang/MachineIndependent, directory renamed /usr/src/debug/glslang/1.3.268.0/glslang/CInterface -> /usr/src/debug/glslang/1.3.275.0/glslang/CInterface, removed all items "/usr/src/debug/glslang/1.3.268.0/OGLCompilersDLL/InitializeDll.h"
packages/core2-64-poky-linux/glslang/glslang-src: PKGSIZE changed from 4880558 to 4900643 (+0%)
packages/core2-64-poky-linux/glslang/glslang-staticdev: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang/glslang: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang/glslang: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
packages/core2-64-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang.so.13 /usr/lib/libSPVRemapper.so.13 /usr/lib/libSPIRV.so.13 /usr/lib/libSPIRV.so.13.1.1 /usr/lib/libglslang-default-resource-limits.so.13 /usr/lib/libHLSL.so.13 /usr/lib/libSPVRemapper.so.13.1.1 /usr/lib/libHLSL.so.13.1.1 /usr/lib/libglslang-default-resource-limits.so.13.1.1 /usr/lib/libglslang.so.13.1.1", added "/usr/lib/libSPIRV.so.14 /usr/lib/libglslang.so.14 /usr/lib/libSPIRV.so.14.0.0 /usr/lib/libglslang-default-resource-limits.so.14 /usr/lib/libSPVRemapper.so.14 /usr/lib/libglslang.so.14.0.0 /usr/lib/libSPVRemapper.so.14.0.0 /usr/lib/libglslang-default-resource-limits.so.14.0.0"
packages/core2-64-poky-linux/glslang/glslang: PKGSIZE changed from 5952234 to 5958841 (+0%)
packages/core2-64-poky-linux/glslang: PV changed from "1.3.268.0" to "1.3.275.0"
packages/core2-64-poky-linux/glslang: PKGV changed from 1.3.268.0 [default] to 1.3.275.0 [default]
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

--===============4523203860725804259==--

