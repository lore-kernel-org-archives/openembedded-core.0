Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22EB9CD98C3
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:51 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1582.1780328149671807006
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gPMGUaL+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VFUzKgaP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019e83d3b085-07d25487-f447-4c9a-b6ab-1d51b60ecfcd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+Zm5Rs+sA2Rvs+3+YpWytonSgEjQfIzSSyWswA+cW50=;
	b=gPMGUaL+f96cKGw9rfaWJA3e3B24S8J4/rJvbL7ksyf/A364K1qED0tC2FpAoRe0
	j0NLhLzFbnpQGaR0/o7i2HN2DabVZw2jY/nS83pxYwkuWWcvAXUvi0gnO/9THOUfbx0
	ZTMX2YMSPKYe0bQzbT7OWejijPUo1Yw4OO/OztMA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+Zm5Rs+sA2Rvs+3+YpWytonSgEjQfIzSSyWswA+cW50=;
	b=VFUzKgaPVPNqJvdIcAVny5Q9KOOpe3F1BV/DCaJTx2nkDeMb7KgO7CBn3LgtuQsm
	lHRrX3QZp/FnOIGkHmMtfDEgJn1XQKScTFHmkA6Aka1DmQbAZJAnlzMZQt0ggyS+uid
	Dq4ETPOfIGSDUnP3CtVMfDb69WlmFTJpXXMtsvC4=
Content-Type: multipart/mixed; boundary="===============2594954500423996137=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.4.350.0 SUCCEEDED
Message-ID: <0101019e83d3b085-07d25487-f447-4c9a-b6ab-1d51b60ecfcd-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237922

--===============2594954500423996137==
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
From 98f657a02c380e79a3e47ee96dcbc37a07f04afc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 11:20:32 +0000
Subject: [PATCH] glslang: upgrade 1.4.341.0 -> 1.4.350.0

---
 .../glslang/glslang/0001-generate-glslang-pkg-config.patch      | 2 +-
 .../glslang/{glslang_1.4.341.0.bb => glslang_1.4.350.0.bb}      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.4.341.0.bb => glslang_1.4.350.0.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index 150242ce1d..3daa62a3bd 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From 6a4237802d8a79f65ed74b12865e2ce5b666993d Mon Sep 17 00:00:00 2001
+From 4d74d1b39b720e320eec7e7e53fc901d928448d2 Mon Sep 17 00:00:00 2001
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


--===============2594954500423996137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang.so.16.2.0 /usr/lib/libglslang-default-resource-limits.so.16.2.0 /usr/lib/libSPIRV.so.16.2.0", added "/usr/lib/libSPIRV.so.16.3.0 /usr/lib/libglslang-default-resource-limits.so.16.3.0 /usr/lib/libglslang.so.16.3.0"
Changes to packages/x86-64-v3-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.16 changed symlink target from libglslang-default-resource-limits.so.16.2.0 to libglslang-default-resource-limits.so.16.3.0
  /usr/lib/libglslang.so.16 changed symlink target from libglslang.so.16.2.0 to libglslang.so.16.3.0
  /usr/lib/libSPIRV.so.16 changed symlink target from libSPIRV.so.16.2.0 to libSPIRV.so.16.3.0
  /usr/lib/libglslang-default-resource-limits.so.16.2.0 moved to /usr/lib/libglslang-default-resource-limits.so.16.3.0
  /usr/lib/libglslang.so.16.2.0 moved to /usr/lib/libglslang.so.16.3.0
  /usr/lib/libSPIRV.so.16.2.0 moved to /usr/lib/libSPIRV.so.16.3.0

--===============2594954500423996137==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.4.341.0-1.4.350.0.patch"

RnJvbSA5OGY2NTdhMDJjMzgwZTc5YTNlNDdlZTk2ZGNiYzM3YTA3ZjA0YWZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMToyMDozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
c2xhbmc6IHVwZ3JhZGUgMS40LjM0MS4wIC0+IDEuNC4zNTAuMAoKLS0tCiAuLi4vZ2xzbGFuZy9n
bHNsYW5nLzAwMDEtZ2VuZXJhdGUtZ2xzbGFuZy1wa2ctY29uZmlnLnBhdGNoICAgICAgfCAyICst
CiAuLi4vZ2xzbGFuZy97Z2xzbGFuZ18xLjQuMzQxLjAuYmIgPT4gZ2xzbGFuZ18xLjQuMzUwLjAu
YmJ9ICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy97Z2xzbGFuZ18x
LjQuMzQxLjAuYmIgPT4gZ2xzbGFuZ18xLjQuMzUwLjAuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZy8wMDAxLWdlbmVyYXRlLWdsc2xh
bmctcGtnLWNvbmZpZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xh
bmcvMDAwMS1nZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2gKaW5kZXggMTUwMjQyY2Ux
ZC4uM2RhYTYyYTNiZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcv
Z2xzbGFuZy8wMDAxLWdlbmVyYXRlLWdsc2xhbmctcGtnLWNvbmZpZy5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nLzAwMDEtZ2VuZXJhdGUtZ2xzbGFuZy1w
a2ctY29uZmlnLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2YTQyMzc4MDJkOGE3OWY2NWVk
NzRiMTI4NjVlMmNlNWI2NjY5OTNkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0ZDc0
ZDFiMzliNzIwZTMyMGVlYzdlN2U1M2ZjOTAxZDkyODQ0OGQyIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogSm9zZSBRdWFyZXNtYSA8cXVhcmVzbWEuam9zZUBnbWFpbC5jb20+CiBEYXRl
OiBTdW4sIDcgRmViIDIwMjEgMDE6MzA6MzkgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gZ2VuZXJh
dGUgZ2xzbGFuZyBwa2ctY29uZmlnCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
Z2xzbGFuZy9nbHNsYW5nXzEuNC4zNDEuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNs
YW5nL2dsc2xhbmdfMS40LjM1MC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS40LjM0MS4wLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuNC4zNTAuMC5iYgpp
bmRleCBhYTRmNDhiYjljLi5iYzMzOTMxYjNjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuNC4zNDEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuNC4zNTAuMC5iYgpAQCAtOCw3ICs4LDcgQEAgSE9NRVBB
R0UgPSAiaHR0cHM6Ly93d3cua2hyb25vcy5vcmcvb3BlbmdsZXMvc2RrL3Rvb2xzL1JlZmVyZW5j
ZS1Db21waWxlciIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlICYgQlNELTItQ2xhdXNlICYgTUlU
ICYgQXBhY2hlLTIuMCAmIEdQTC0zLXdpdGgtYmlzb24tZXhjZXB0aW9uIgogTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PTUwZmY5ZDBmY2RlMmQ1Yjk1M2ViZTQzMWM0
OGUzNGUzIgogCi1TUkNSRVYgPSAiZjBiZDAyNTdjMzA4YjlhMjY1NjJjMWEzMGM0NzQ4YTAyMTlj
Yzk1MSIKK1NSQ1JFViA9ICIyNzU4MjJhNjI2MWVlNjg5YWFkYjFkYTVmMDlhMGVjMmYwNTg2ODVj
IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NHcm91cC9nbHNsYW5nLmdpdDtw
cm90b2NvbD1odHRwczticmFuY2g9bWFpbjt0YWc9dnVsa2FuLXNkay0ke1BWfSBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLWdlbmVyYXRlLWdsc2xhbmctcGtnLWNvbmZpZy5wYXRjaCBcCiAgICAg
ICAgICAgICIKLS0gCjIuNDcuMQoK

--===============2594954500423996137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/glslang/glslang-dbg: FILELIST: removed "/usr/lib/.debug/libSPIRV.so.16.2.0 /usr/lib/.debug/libglslang.so.16.2.0 /usr/lib/.debug/libglslang-default-resource-limits.so.16.2.0", added "/usr/lib/.debug/libglslang.so.16.3.0 /usr/lib/.debug/libSPIRV.so.16.3.0 /usr/lib/.debug/libglslang-default-resource-limits.so.16.3.0"
packages/x86-64-v3-poky-linux/glslang/glslang-dbg: PKGSIZE changed from 53525888 to 54103712 (+1%)
packages/x86-64-v3-poky-linux/glslang/glslang-dbg: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/glslang/glslang-dbg: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-dev: PKGSIZE changed from 424308 to 425929 (+0%)
packages/x86-64-v3-poky-linux/glslang/glslang-dev: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/glslang/glslang-dev: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-doc: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/glslang/glslang-doc: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-locale: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/glslang/glslang-locale: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-src: FILELIST: directory renamed /usr/src/debug/glslang/1.4.341.0/glslang/GenericCodeGen -> /usr/src/debug/glslang/1.4.350.0/glslang/GenericCodeGen, directory renamed /usr/src/debug/glslang/1.4.341.0/glslang/MachineIndependent/preprocessor -> /usr/src/debug/glslang/1.4.350.0/glslang/MachineIndependent/preprocessor, directory renamed /usr/src/debug/glslang/1.4.341.0/glslang/CInterface -> /usr/src/debug/glslang/1.4.350.0/glslang/CInterface, directory renamed /usr/src/debug/glslang/1.4.341.0/glslang/MachineIndependent -> /usr/src/debug/glslang/1.4.350.0/glslang/MachineIndependent, directory renamed /usr/src/debug/glslang/1.4.341.0/include/glslang -> /usr/src/debug/glslang/1.4.350.0/include/glslang, directory renamed /usr/src/debug/glslang/1.4.341.0/glslang/OSDependent -> /usr/src/debug/glslang/1.4.350.0/glslang/OSDependent, directory renamed /usr/src/debug/glslang/1.4.341.0/glslang/HLSL -> /usr/src/debug/glslang/1.4.350.0/glslang/HLSL, direc
 tory renamed /usr/src/debug/glslang/1.4.341.0/StandAlone -> /usr/src/debug/glslang/1.4.350.0/StandAlone, directory renamed /usr/src/debug/glslang/1.4.341.0/glslang/Public -> /usr/src/debug/glslang/1.4.350.0/glslang/Public, directory renamed /usr/src/debug/glslang/1.4.341.0/SPIRV/CInterface -> /usr/src/debug/glslang/1.4.350.0/SPIRV/CInterface, directory renamed /usr/src/debug/glslang/1.4.341.0/glslang/OSDependent/Unix -> /usr/src/debug/glslang/1.4.350.0/glslang/OSDependent/Unix, directory renamed /usr/src/debug/glslang/1.4.341.0/glslang/ResourceLimits -> /usr/src/debug/glslang/1.4.350.0/glslang/ResourceLimits, directory renamed /usr/src/debug/glslang/1.4.341.0/glslang -> /usr/src/debug/glslang/1.4.350.0/glslang, removed "/usr/src/debug/glslang/1.4.341.0/glslang/Include/Types.h /usr/src/debug/glslang/1.4.341.0/SPIRV/GlslangToSpv.cpp /usr/src/debug/glslang/1.4.341.0/SPIRV/GlslangToSpv.h /usr/src/debug/glslang/1.4.341.0/SPIRV/InReadableOrder.cpp /usr/src/debug/glslang/1.4.341.0/SPIRV/GL
 SL.ext.AMD.h /usr/src/debug/glslang/1.4.341.0/glslang/Include/glslang_c_interface.h /usr/src/debug/glslang/1.4.341.0/SPIRV/NonSemanticShaderDebugInfo100.h /usr/src/debug/glslang/1.4.341.0/glslang/Include/intermediate.h /usr/src/debug/glslang/1.4.341.0/glslang/Include/ShHandle.h /usr/src/debug/glslang/1.4.341.0/glslang/Include/PoolAlloc.h /usr/src/debug/glslang/1.4.341.0/SPIRV/GLSL.ext.QCOM.h /usr/src/debug/glslang/1.4.341.0/SPIRV/Logger.h /usr/src/debug/glslang/1.4.341.0/SPIRV/Logger.cpp /usr/src/debug/glslang/1.4.341.0/glslang/Include/InfoSink.h /usr/src/debug/glslang/1.4.341.0/SPIRV/disassemble.h /usr/src/debug/glslang/1.4.341.0/SPIRV/SpvBuilder.cpp /usr/src/debug/glslang/1.4.341.0/glslang/Include/Common.h /usr/src/debug/glslang/1.4.341.0/glslang/Include/arrays.h /usr/src/debug/glslang/1.4.341.0/SPIRV/SpvBuilder.h /usr/src/debug/glslang/1.4.341.0/SPIRV/disassemble.cpp /usr/src/debug/glslang/1.4.341.0/SPIRV/GLSL.ext.ARM.h /usr/src/debug/glslang/1.4.341.0/SPIRV/GLSL.ext.NV.h /usr/sr
 c/debug/glslang/1.4.341.0/SPIRV/spirv.hpp11 /usr/src/debug/glslang/1.4.341.0/SPIRV/NonSemanticDebugPrintf.h /usr/src/debug/glslang/1.4.341.0/SPIRV/bitutils.h /usr/src/debug/glslang/1.4.341.0/SPIRV/GLSL.std.450.h /usr/src/debug/glslang/1.4.341.0/glslang/Include/SpirvIntrinsics.h /usr/src/debug/glslang/1.4.341.0/SPIRV/hex_float.h /usr/src/debug/glslang/1.4.341.0/glslang/Include/glslang_c_shader_types.h /usr/src/debug/glslang/1.4.341.0/SPIRV/SpvTools.h /usr/src/debug/glslang/1.4.341.0/SPIRV/spvUtil.h /usr/src/debug/glslang/1.4.341.0/glslang/Include/ResourceLimits.h /usr/src/debug/glslang/1.4.341.0/SPIRV/doc.cpp /usr/src/debug/glslang/1.4.341.0/SPIRV/GLSL.ext.EXT.h /usr/src/debug/glslang/1.4.341.0/SPIRV/SpvPostProcess.cpp /usr/src/debug/glslang/1.4.341.0/SPIRV/doc.h /usr/src/debug/glslang/1.4.341.0/SPIRV/GLSL.ext.KHR.h /usr/src/debug/glslang/1.4.341.0/SPIRV/SpvTools.cpp /usr/src/debug/glslang/1.4.341.0/glslang/Include/BaseTypes.h /usr/src/debug/glslang/1.4.341.0/SPIRV/spvIR.h /usr/src/d
 ebug/glslang/1.4.341.0/glslang/Include/ConstantUnion.h", added "/usr/src/debug/glslang/1.4.350.0/glslang/Include/Types.h /usr/src/debug/glslang/1.4.350.0/SPIRV/GlslangToSpv.cpp /usr/src/debug/glslang/1.4.350.0/SPIRV/GlslangToSpv.h /usr/src/debug/glslang/1.4.350.0/SPIRV/InReadableOrder.cpp /usr/src/debug/glslang/1.4.350.0/SPIRV/GLSL.ext.AMD.h /usr/src/debug/glslang/1.4.350.0/glslang/Include/glslang_c_interface.h /usr/src/debug/glslang/1.4.350.0/glslang/Include/intermediate.h /usr/src/debug/glslang/1.4.350.0/glslang/Include/ShHandle.h /usr/src/debug/glslang/1.4.350.0/glslang/Include/PoolAlloc.h /usr/src/debug/glslang/1.4.350.0/SPIRV/GLSL.ext.QCOM.h /usr/src/debug/glslang/1.4.350.0/SPIRV/Logger.h /usr/src/debug/glslang/1.4.350.0/SPIRV/Logger.cpp /usr/src/debug/glslang/1.4.350.0/glslang/Include/InfoSink.h /usr/src/debug/glslang/1.4.350.0/SPIRV/disassemble.h /usr/src/debug/glslang/1.4.350.0/SPIRV/SpvBuilder.cpp /usr/src/debug/glslang/1.4.350.0/glslang/Include/Common.h /usr/src/debug/glsl
 ang/1.4.350.0/glslang/Include/arrays.h /usr/src/debug/glslang/1.4.350.0/SPIRV/SpvBuilder.h /usr/src/debug/glslang/1.4.350.0/SPIRV/disassemble.cpp /usr/src/debug/glslang/1.4.350.0/SPIRV/GLSL.ext.ARM.h /usr/src/debug/glslang/1.4.350.0/SPIRV/GLSL.ext.NV.h /usr/src/debug/glslang/1.4.350.0/SPIRV/spirv.hpp11 /usr/src/debug/glslang/1.4.350.0/SPIRV/NonSemanticDebugPrintf.h /usr/src/debug/glslang/1.4.350.0/SPIRV/bitutils.h /usr/src/debug/glslang/1.4.350.0/SPIRV/GLSL.std.450.h /usr/src/debug/glslang/1.4.350.0/SPIRV/NonSemanticShaderDebugInfo.h /usr/src/debug/glslang/1.4.350.0/glslang/Include/SpirvIntrinsics.h /usr/src/debug/glslang/1.4.350.0/SPIRV/hex_float.h /usr/src/debug/glslang/1.4.350.0/glslang/Include/glslang_c_shader_types.h /usr/src/debug/glslang/1.4.350.0/glslang/Include/defer.h /usr/src/debug/glslang/1.4.350.0/SPIRV/SpvTools.h /usr/src/debug/glslang/1.4.350.0/SPIRV/spvUtil.h /usr/src/debug/glslang/1.4.350.0/glslang/Include/ResourceLimits.h /usr/src/debug/glslang/1.4.350.0/SPIRV/doc.
 cpp /usr/src/debug/glslang/1.4.350.0/SPIRV/GLSL.ext.EXT.h /usr/src/debug/glslang/1.4.350.0/SPIRV/SpvPostProcess.cpp /usr/src/debug/glslang/1.4.350.0/SPIRV/doc.h /usr/src/debug/glslang/1.4.350.0/SPIRV/GLSL.ext.KHR.h /usr/src/debug/glslang/1.4.350.0/SPIRV/SpvTools.cpp /usr/src/debug/glslang/1.4.350.0/glslang/Include/BaseTypes.h /usr/src/debug/glslang/1.4.350.0/SPIRV/spvIR.h /usr/src/debug/glslang/1.4.350.0/glslang/Include/ConstantUnion.h"
packages/x86-64-v3-poky-linux/glslang/glslang-src: PKGSIZE changed from 5477810 to 5515424 (+1%)
packages/x86-64-v3-poky-linux/glslang/glslang-src: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/glslang/glslang-src: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang-staticdev: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/glslang/glslang: FILELIST: removed "/usr/lib/libglslang-default-resource-limits.so.16.2.0 /usr/lib/libSPIRV.so.16.2.0 /usr/lib/libglslang.so.16.2.0", added "/usr/lib/libSPIRV.so.16.3.0 /usr/lib/libglslang.so.16.3.0 /usr/lib/libglslang-default-resource-limits.so.16.3.0"
packages/x86-64-v3-poky-linux/glslang/glslang: PKGSIZE changed from 3985529 to 4030617 (+1%)
packages/x86-64-v3-poky-linux/glslang/glslang: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/glslang/glslang: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
packages/x86-64-v3-poky-linux/glslang: SRC_URI changed from "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-1.4.341.0 file://0001-generate-glslang-pkg-config.patch" to "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-1.4.350.0 file://0001-generate-glslang-pkg-config.patch"
packages/x86-64-v3-poky-linux/glslang: PV changed from "1.4.341.0" to "1.4.350.0"
packages/x86-64-v3-poky-linux/glslang: PKGV changed from 1.4.341.0 [default] to 1.4.350.0 [default]
Changes to packages/x86-64-v3-poky-linux/glslang (sysroot):
  /usr/lib/libglslang-default-resource-limits.so.16 changed symlink target from libglslang-default-resource-limits.so.16.2.0 to libglslang-default-resource-limits.so.16.3.0
  /usr/lib/libglslang.so.16 changed symlink target from libglslang.so.16.2.0 to libglslang.so.16.3.0
  /usr/lib/libSPIRV.so.16 changed symlink target from libSPIRV.so.16.2.0 to libSPIRV.so.16.3.0
  /usr/lib/libglslang-default-resource-limits.so.16.2.0 moved to /usr/lib/libglslang-default-resource-limits.so.16.3.0
  /usr/lib/libglslang.so.16.2.0 moved to /usr/lib/libglslang.so.16.3.0
  /usr/lib/libSPIRV.so.16.2.0 moved to /usr/lib/libSPIRV.so.16.3.0

--===============2594954500423996137==--

