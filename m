Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B61C27C6D
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:52 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.17599.1690907330465153976
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Blsjwkc/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Dyz3m1vN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010189b1ee4c6b-a33122dd-2cb5-40a5-89d9-ae7abbb0f705-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907331;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=T9M7Vf1Ac1QbsBG5c2JeeJLAD60AjdMO5ly3GrLe0t4=;
	b=Blsjwkc/AUjnWu6f/WiDUM5IXk11OxRrjsbu0dS2y9B9Y0mMVlEUQbXApaEfptcc
	1T4Kd0M6W/bIpGZExcc3fknWz8c1b7a/uErU6hXOirxypdaiIUU8xFGWWgU+LnbSkXb
	f0Hkm5BcPKYyP8bJ+pa1t58iYOFOTyP/Hp2UDIf4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907331;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=T9M7Vf1Ac1QbsBG5c2JeeJLAD60AjdMO5ly3GrLe0t4=;
	b=Dyz3m1vNVm1TkWJt4Mu1ocmCWxGYJ8K8+tzTjQbFLIIvDabpsXZqsJIRru3JB8EU
	L2tF76sV3+RIVj/agEMuEGTnCf7JYSiU1E7itBj8BUOM/9uIUsudafAZhTau4ilDBJU
	TZipyjS/rbdKUr61ZrJJtwnc7u+nCLm7tjvfswuQ=
Content-Type: multipart/mixed; boundary="===============0257268416901942839=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2023.5 SUCCEEDED
Message-ID: <01010189b1ee4c6b-a33122dd-2cb5-40a5-89d9-ae7abbb0f705-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185321

--===============0257268416901942839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shaderc* to *2023.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2023.4-2023.5.patch
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
From 0fadb890501a400584124ab7062b27b02a70b53a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Aug 2023 14:11:14 +0000
Subject: [PATCH] shaderc: upgrade 2023.4 -> 2023.5

---
 .../shaderc/{shaderc_2023.4.bb => shaderc_2023.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2023.4.bb => shaderc_2023.5.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2023.4.bb b/meta/recipes-graphics/shaderc/shaderc_2023.5.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2023.4.bb
rename to meta/recipes-graphics/shaderc/shaderc_2023.5.bb
index 739e7ae81c..8d2f4551ab 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2023.4.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2023.5.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "7a8b3da0583425cf511336cf3afbdcf2ebc8b36b"
+SRCREV = "7428c8d5f6b200910fbd32fa0ca0b0244ace6482"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.39.2


--===============0257268416901942839==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2023.4-2023.5.patch"

RnJvbSAwZmFkYjg5MDUwMWE0MDA1ODQxMjRhYjcwNjJiMjdiMDJhNzBiNTNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBdWcgMjAyMyAxNDoxMToxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNo
YWRlcmM6IHVwZ3JhZGUgMjAyMy40IC0+IDIwMjMuNQoKLS0tCiAuLi4vc2hhZGVyYy97c2hhZGVy
Y18yMDIzLjQuYmIgPT4gc2hhZGVyY18yMDIzLjUuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy97c2hhZGVyY18yMDIzLjQuYmIgPT4gc2hhZGVyY18yMDIz
LjUuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMv
c2hhZGVyY18yMDIzLjQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJj
XzIwMjMuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3Mvc2hhZGVyYy9zaGFkZXJjXzIwMjMuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18yMDIzLjUuYmIKaW5kZXggNzM5ZTdhZTgxYy4uOGQy
ZjQ1NTFhYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVy
Y18yMDIzLjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NoYWRlcmMvc2hhZGVyY18y
MDIzLjUuYmIKQEAgLTYsNyArNiw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9n
b29nbGUvc2hhZGVyYyIKIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4Njk2OGY0MzI3Igog
Ci1TUkNSRVYgPSAiN2E4YjNkYTA1ODM0MjVjZjUxMTMzNmNmM2FmYmRjZjJlYmM4YjM2YiIKK1NS
Q1JFViA9ICI3NDI4YzhkNWY2YjIwMDkxMGZiZDMyZmEwY2EwYjAyNDRhY2U2NDgyIgogU1JDX1VS
SSA9ICJnaXQ6Ly9naXRodWIuY29tL2dvb2dsZS9zaGFkZXJjLmdpdDtwcm90b2NvbD1odHRwczti
cmFuY2g9bWFpbiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWNtYWtlLWRpc2FibGUtYnVpbGRp
bmctZXh0ZXJuYWwtZGVwZW5kZW5jaWVzLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDIt
bGlic2hhZGVyY191dGlsLWZpeC1nbHNsYW5nLWhlYWRlci1maWxlLWxvY2F0aW9uLnBhdGNoIFwK
LS0gCjIuMzkuMgoK

--===============0257268416901942839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1806 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1160fcdcd4deb55354a9b97df27b378f6c3f6d78"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 10 Mirrors 0 Missed 28 Current 273 (26% match, 90% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 763 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 797 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 798 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 805 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_recipe_qa)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe shaderc-2023.5-r0: task do_recipe_qa: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe shaderc-2023.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 856 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_fetch)
NOTE: Running task 857 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
NOTE: Running task 858 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: Running task 859 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.5-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe shaderc-2023.5-r0: task do_fetch: Succeeded
NOTE: Running task 860 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_unpack)
NOTE: Running task 861 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 862 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_unpack)
NOTE: Running task 863 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: Running task 864 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_unpack)
NOTE: Running task 865 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe shaderc-2023.5-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 866 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_patch)
NOTE: Running task 867 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe shaderc-2023.5-r0: task do_unpack: Succeeded
NOTE: Running task 868 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shaderc-2023.5-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 869 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 870 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 871 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 872 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_patch)
NOTE: Running task 873 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 874 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 875 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.5-r0: task do_patch: Succeeded
NOTE: Running task 876 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 877 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_generate_toolchain_file)
NOTE: Running task 878 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_populate_lic)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 879 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.5-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2023.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shaderc-2023.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 880 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 881 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_populate_lic unihash changed to 451955aef7da932bce71dd647c988b9559a606e20baf4bf3192f8b85405a8c98
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shaderc-2023.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 882 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 883 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 884 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 885 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 886 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_populate_sysroot)
NOTE: Running task 887 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 888 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 889 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 890 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 891 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Succeeded
NOTE: Running task 892 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 893 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 894 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 895 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_package)
NOTE: Running task 896 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 897 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 898 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package)
NOTE: Running task 899 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 900 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: Running task 901 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2023.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe shaderc-2023.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 901 tasks of which 851 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/glslang/1_1.3.250.0-r0/temp/log.do_packagedata.1268088
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============0257268416901942839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/shaderc: PV changed from "2023.4" to "2023.5"
packages/core2-32-poky-linux/shaderc: PKGV changed from 2023.4 [default] to 2023.5 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PV changed from "2023.4" to "2023.5"
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2023.4 [default] to 2023.5 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dev: PV changed from "2023.4" to "2023.5"
packages/core2-32-poky-linux/shaderc/shaderc-dev: PKGV changed from 2023.4 [default] to 2023.5 [default]
packages/core2-32-poky-linux/shaderc/shaderc-doc: PV changed from "2023.4" to "2023.5"
packages/core2-32-poky-linux/shaderc/shaderc-doc: PKGV changed from 2023.4 [default] to 2023.5 [default]
packages/core2-32-poky-linux/shaderc/shaderc-locale: PV changed from "2023.4" to "2023.5"
packages/core2-32-poky-linux/shaderc/shaderc-locale: PKGV changed from 2023.4 [default] to 2023.5 [default]
packages/core2-32-poky-linux/shaderc/shaderc-src: PV changed from "2023.4" to "2023.5"
packages/core2-32-poky-linux/shaderc/shaderc-src: PKGV changed from 2023.4 [default] to 2023.5 [default]
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PV changed from "2023.4" to "2023.5"
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 2476676 to 2476672 (-0%)
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2023.4 [default] to 2023.5 [default]
packages/core2-32-poky-linux/shaderc/shaderc: PV changed from "2023.4" to "2023.5"
packages/core2-32-poky-linux/shaderc/shaderc: PKGV changed from 2023.4 [default] to 2023.5 [default]

--===============0257268416901942839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1806 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1160fcdcd4deb55354a9b97df27b378f6c3f6d78"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 10 Mirrors 0 Missed 28 Current 273 (26% match, 90% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 763 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 797 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 798 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 805 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_recipe_qa)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe shaderc-2023.5-r0: task do_recipe_qa: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 856 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_fetch)
NOTE: Running task 857 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
NOTE: recipe shaderc-2023.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 858 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: Running task 859 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.5-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 860 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_unpack)
NOTE: Running task 861 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 862 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_unpack)
NOTE: Running task 863 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2023.5-r0: task do_fetch: Succeeded
NOTE: Running task 864 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: Running task 865 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_unpack)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe shaderc-2023.5-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 866 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_patch)
NOTE: Running task 867 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe shaderc-2023.5-r0: task do_unpack: Succeeded
NOTE: Running task 868 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shaderc-2023.5-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 869 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 870 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 871 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 872 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_patch)
NOTE: Running task 873 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: recipe shaderc-2023.5-r0: task do_patch: Succeeded
NOTE: Running task 874 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 875 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 876 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 877 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_generate_toolchain_file)
NOTE: Running task 878 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_populate_lic)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Started
NOTE: Running task 879 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.5-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2023.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: recipe shaderc-2023.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Started
NOTE: Running task 880 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 881 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_populate_lic unihash changed to 451955aef7da932bce71dd647c988b9559a606e20baf4bf3192f8b85405a8c98
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shaderc-2023.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 882 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 883 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 884 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 885 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 886 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_populate_sysroot)
NOTE: Running task 887 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 888 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 889 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 890 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 891 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Succeeded
NOTE: Running task 892 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 893 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 894 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 895 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package)
NOTE: Running task 896 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 897 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 898 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_package)
NOTE: Running task 899 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 900 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2023.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2023.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 901 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_configure)
NOTE: recipe shaderc-2023.5-r0: task do_configure: Started
NOTE: recipe shaderc-2023.5-r0: task do_configure: Succeeded
NOTE: Running task 902 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_compile)
NOTE: recipe shaderc-2023.5-r0: task do_compile: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 903 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: recipe shaderc-2023.5-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 903 tasks of which 851 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/glslang/1_1.3.250.0-r0/temp/log.do_packagedata.1261634
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============0257268416901942839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1806 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1160fcdcd4deb55354a9b97df27b378f6c3f6d78"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 10 Mirrors 0 Missed 28 Current 273 (26% match, 90% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 763 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 797 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 798 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 805 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_recipe_qa)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe shaderc-2023.5-r0: task do_recipe_qa: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe shaderc-2023.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 856 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
NOTE: Running task 857 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_fetch)
NOTE: Running task 858 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_fetch)
NOTE: Running task 859 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.5-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 860 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: Running task 861 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_unpack)
NOTE: Running task 862 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_unpack)
NOTE: Running task 863 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe shaderc-2023.5-r0: task do_fetch: Succeeded
NOTE: Running task 864 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_unpack)
NOTE: Running task 865 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2023.5-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 866 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_patch)
NOTE: Running task 867 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe shaderc-2023.5-r0: task do_unpack: Succeeded
NOTE: Running task 868 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shaderc-2023.5-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 869 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 870 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 871 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 872 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_patch)
NOTE: Running task 873 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 874 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 875 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.5-r0: task do_patch: Succeeded
NOTE: Running task 876 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 877 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_generate_toolchain_file)
NOTE: Running task 878 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_populate_lic)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 879 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.5-r0: task do_populate_lic: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 880 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 881 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe shaderc-2023.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_populate_lic unihash changed to 451955aef7da932bce71dd647c988b9559a606e20baf4bf3192f8b85405a8c98
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 882 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 883 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 884 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 885 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 886 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_populate_sysroot)
NOTE: Running task 887 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 888 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 889 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 890 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 891 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Started
NOTE: Running task 892 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 893 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 894 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 895 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_package)
NOTE: Running task 896 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 897 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 898 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 899 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package)
NOTE: Running task 900 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 900 tasks of which 851 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/glslang/1_1.3.250.0-r0/temp/log.do_packagedata.1253094
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============0257268416901942839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1808 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1806 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1160fcdcd4deb55354a9b97df27b378f6c3f6d78"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 36 Local 8 Mirrors 0 Missed 28 Current 275 (22% match, 90% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 763 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 797 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 798 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 805 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_recipe_qa)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe shaderc-2023.5-r0: task do_recipe_qa: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe shaderc-2023.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 856 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
NOTE: Running task 857 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_fetch)
NOTE: Running task 858 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: Running task 859 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_fetch)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe shaderc-2023.5-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe shaderc-2023.5-r0: task do_fetch: Succeeded
NOTE: Running task 860 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_unpack)
NOTE: Running task 861 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: Running task 862 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 863 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_unpack)
NOTE: Running task 864 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_unpack)
NOTE: Running task 865 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shaderc-2023.5-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 866 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_patch)
NOTE: Running task 867 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe shaderc-2023.5-r0: task do_unpack: Succeeded
NOTE: Running task 868 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shaderc-2023.5-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 869 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 870 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 871 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 872 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_patch)
NOTE: Running task 873 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 874 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 875 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.5-r0: task do_patch: Succeeded
NOTE: Running task 876 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 877 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_generate_toolchain_file)
NOTE: Running task 878 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_populate_lic)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 879 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.5-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2023.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe shaderc-2023.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 880 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 881 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_populate_lic unihash changed to 451955aef7da932bce71dd647c988b9559a606e20baf4bf3192f8b85405a8c98
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shaderc-2023.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 882 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 883 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 884 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 885 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 886 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_populate_sysroot)
NOTE: Running task 887 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 888 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 889 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 890 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 891 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Succeeded
NOTE: Running task 892 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 893 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 894 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 895 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_package)
NOTE: Running task 896 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 897 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 898 of 916 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 898 tasks of which 851 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glslang/1_1.3.250.0-r0/temp/log.do_packagedata.1246988
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============0257268416901942839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1806 targets, 48 skipped, 0 masked, 0 errors.
Removing 109 recipes from the core2-32 sysroot...done.
Removing 134 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1160fcdcd4deb55354a9b97df27b378f6c3f6d78"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 85 Local 57 Mirrors 0 Missed 28 Current 232 (67% match, 91% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 251 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 258 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 327 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 330 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 331 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_recipe_qa)
NOTE: Running task 332 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_recipe_qa)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa: Started
NOTE: recipe shaderc-2023.5-r0: task do_recipe_qa: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe shaderc-2023.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 335 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: Running task 336 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_fetch)
NOTE: Running setscene task 270 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running task 337 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_fetch)
NOTE: Running task 338 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Started
NOTE: recipe shaderc-2023.5-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe shaderc-2023.5-r0: task do_fetch: Succeeded
NOTE: Running task 339 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: Running task 340 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_unpack)
NOTE: Running task 341 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_unpack)
NOTE: Running task 342 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_unpack)
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 276 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe shaderc-2023.5-r0: task do_unpack: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 279 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 280 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 286 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 287 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 289 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 757 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_patch)
NOTE: recipe shaderc-2023.5-r0: task do_unpack: Succeeded
NOTE: Running task 758 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_patch)
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 291 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shaderc-2023.5-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 761 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 294 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running task 764 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 765 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 766 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Started
NOTE: Running task 767 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 768 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shaderc-2023.5-r0: task do_patch: Succeeded
NOTE: Running task 769 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 770 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_generate_toolchain_file)
NOTE: Running task 771 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_populate_lic)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 306 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 307 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 308 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe shaderc-2023.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shaderc-2023.5-r0: task do_populate_lic: Started
NOTE: recipe shaderc-2023.5-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 777 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 778 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shaderc-2023.5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shaderc-2023.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/shaderc/shaderc_2023.5.bb:do_populate_lic unihash changed to 451955aef7da932bce71dd647c988b9559a606e20baf4bf3192f8b85405a8c98
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shaderc-2023.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 311 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 312 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 313 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 317 of 317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 880 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 887 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 892 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: Running task 893 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 894 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 895 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 896 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 897 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 898 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 899 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_populate_sysroot)
NOTE: Running task 900 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_package)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 901 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 902 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 903 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 904 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Succeeded
NOTE: Running task 905 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 906 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 907 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 908 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_package)
NOTE: Running task 909 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 910 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 911 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package)
NOTE: Running task 912 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Started
NOTE: Running task 913 of 929 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 913 tasks of which 864 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package glslang went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: glslang-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/glslang/1_1.3.250.0-r0/temp/log.do_packagedata.1277164
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============0257268416901942839==--

