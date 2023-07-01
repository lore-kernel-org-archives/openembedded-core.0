Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567B2C0729B
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:07 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.10492.1688227322283789541
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KMHwSSGK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018912309efd-981d04a1-9bf5-4c95-ae0f-8a98bfabbcf2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Noq0tO6fl32A5NGA2GBQZ1QaWgzPW6QR5FLS/j0641A=;
	b=KMHwSSGKOP3VHAE+X2lehPoyIMzD7iP0El8k6FPrZ8COkg7Yz2EsRCCuw87CrNg0
	jDYtLcI+/icTVuh0SYY3yLzGX7aXlpsssKUZMlnSK2msTrYHUe1WuzEw7XFkwi1BHR2
	kJoyLb1EHjY6xn/4T4Xw6O8pUfAw5KBRye0fenjQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Noq0tO6fl32A5NGA2GBQZ1QaWgzPW6QR5FLS/j0641A=;
	b=i2GTQA6K8tyOVji0vJpP1AR/GxvwEDFTdlESoQWSGzwA5TbSC1olqV7nHWNgbEik
	0qwAjGr1BzFJ2YQndayEjfJtwMBlc/H6s+rOsKWwBIy9lcpZ4vCfx3BNZi7vdTsaiJk
	lPzhH036F3OBRBmBnJ4ZXKCBulXNm16q+B8OTzdU=
Content-Type: multipart/mixed; boundary="===============7924044540853351524=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-validation-layers: upgrading to 1.3.250.1 SUCCEEDED
Message-ID: <0101018912309efd-981d04a1-9bf5-4c95-ae0f-8a98bfabbcf2-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183746

--===============7924044540853351524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-validation-layers* to *1.3.250.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-validation-layers-upgrade-1.3.250.0-1.3.250.1.patch
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
From e2eec03d6cddc8651a9c4c3f8b1c6569881a4528 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jul 2023 13:44:06 +0000
Subject: [PATCH] vulkan-validation-layers: upgrade 1.3.250.0 -> 1.3.250.1

---
 ...ayers_1.3.250.0.bb => vulkan-validation-layers_1.3.250.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.3.250.0.bb => vulkan-validation-layers_1.3.250.1.bb} (97%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb
similarity index 97%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb
index 62c6343c45..e15a6fb299 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8df9e8826734226d08cb412babfa599c"
 SRC_URI = "git://git@github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=sdk-1.3.250;protocol=https \
            file://0001-scripts-CMakeLists.txt-append-to-CMAKE_FIND_ROOT_PAT.patch \
            "
-SRCREV = "1541e00a63cd125f15d231d5a8059ebe66503b25"
+SRCREV = "d6c1e5a5a6229b52c20c643ff626a948d4850865"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============7924044540853351524==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-validation-layers-upgrade-1.3.250.0-1.3.250.1.patch"

RnJvbSBlMmVlYzAzZDZjZGRjODY1MWE5YzRjM2Y4YjFjNjU2OTg4MWE0NTI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdWwgMjAyMyAxMzo0NDowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi12YWxpZGF0aW9uLWxheWVyczogdXBncmFkZSAxLjMuMjUwLjAgLT4gMS4zLjI1MC4xCgot
LS0KIC4uLmF5ZXJzXzEuMy4yNTAuMC5iYiA9PiB2dWxrYW4tdmFsaWRhdGlvbi1sYXllcnNfMS4z
LjI1MC4xLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi12YWxp
ZGF0aW9uLWxheWVyc18xLjMuMjUwLjAuYmIgPT4gdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJzXzEu
My4yNTAuMS5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi12YWxpZGF0aW9uLWxheWVyc18xLjMuMjUwLjAuYmIgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12YWxpZGF0aW9uLWxheWVyc18xLjMuMjUwLjEuYmIKc2lt
aWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tdmFsaWRhdGlvbi1sYXllcnNfMS4zLjI1MC4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12YWxpZGF0aW9uLWxheWVyc18xLjMuMjUwLjEu
YmIKaW5kZXggNjJjNjM0M2M0NS4uZTE1YTZmYjI5OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdmFsaWRhdGlvbi1sYXllcnNfMS4zLjI1MC4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJz
XzEuMy4yNTAuMS5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFLnR4dDttZDU9OGRmOWU4ODI2NzM0MjI2ZDA4Y2I0MTJiYWJmYTU5OWMiCiBTUkNf
VVJJID0gImdpdDovL2dpdEBnaXRodWIuY29tL0tocm9ub3NHcm91cC9WdWxrYW4tVmFsaWRhdGlv
bkxheWVycy5naXQ7YnJhbmNoPXNkay0xLjMuMjUwO3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAg
ICAgZmlsZTovLzAwMDEtc2NyaXB0cy1DTWFrZUxpc3RzLnR4dC1hcHBlbmQtdG8tQ01BS0VfRklO
RF9ST09UX1BBVC5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICIxNTQxZTAwYTYzY2Qx
MjVmMTVkMjMxZDVhODA1OWViZTY2NTAzYjI1IgorU1JDUkVWID0gImQ2YzFlNWE1YTYyMjliNTJj
MjBjNjQzZmY2MjZhOTQ4ZDQ4NTA4NjUiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIu
MzkuMgoK

--===============7924044540853351524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1799 targets, 61 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:d8ea5c82239e6f9e856bdbf3391a7809e679842f"
workspace            = "master:d221e59a5067266c3f620259a1e56a56823df1fb"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 18 Mirrors 0 Missed 20 Current 405 (47% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 424 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1274 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
NOTE: Running task 1275 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: Running task 1328 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_fetch)
NOTE: Running task 1418 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1424 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: Running task 1425 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1426 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_unpack)
NOTE: Running task 1427 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_unpack)
NOTE: Running task 1428 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1429 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_patch)
NOTE: Running task 1430 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1431 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1432 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1433 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1434 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_patch)
NOTE: Running task 1435 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1436 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1437 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1438 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1439 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1440 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1441 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic unihash changed to d16c68b8db6e1f533dd3a51f12e2d67014e275d921052bddb0fa342b2fab499e
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1442 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1443 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1444 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1445 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1446 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package)
NOTE: Running task 1447 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1448 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1449 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_package)
NOTE: Running task 1450 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1451 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1452 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_configure)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_configure: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_configure: Succeeded
NOTE: Running task 1453 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_compile)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_compile: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 1454 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1454 tasks of which 1419 didn't need to be rerun and 1 failed.
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/glslang/1_1.3.250.0-r0/temp/log.do_packagedata.3113422
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============7924044540853351524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1799 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (895 cached, 1 parsed). 1799 targets, 34 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:d8ea5c82239e6f9e856bdbf3391a7809e679842f"
workspace            = "master:d221e59a5067266c3f620259a1e56a56823df1fb"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 18 Mirrors 0 Missed 20 Current 405 (47% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 424 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1274 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
NOTE: Running task 1275 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: Running task 1328 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_fetch)
NOTE: Running task 1420 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1424 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_unpack)
NOTE: Running task 1425 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1426 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: Running task 1427 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_unpack)
NOTE: Running task 1428 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1429 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_patch)
NOTE: Running task 1430 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1431 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1432 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_patch)
NOTE: Running task 1433 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1434 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1435 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1436 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1437 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1438 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1439 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1440 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1441 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic unihash changed to d16c68b8db6e1f533dd3a51f12e2d67014e275d921052bddb0fa342b2fab499e
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1442 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1443 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1444 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1445 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1446 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_package)
NOTE: Running task 1447 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1448 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1449 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package)
NOTE: Running task 1450 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1451 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1452 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_configure)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 1453 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_configure: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_configure: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1453 tasks of which 1419 didn't need to be rerun and 1 failed.
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glslang/1_1.3.250.0-r0/temp/log.do_packagedata.3100381
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============7924044540853351524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vulkan-validation-layers: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dbg: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dbg: PKGSIZE changed from 279771540 to 279807640 (+0%)
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dbg: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-doc: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-doc: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-locale: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-locale: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-src: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-src: PKGSIZE changed from 24854449 to 24857238 (+0%)
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-src: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-staticdev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-staticdev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]

--===============7924044540853351524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1799 targets, 67 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:d8ea5c82239e6f9e856bdbf3391a7809e679842f"
workspace            = "master:d221e59a5067266c3f620259a1e56a56823df1fb"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 18 Mirrors 0 Missed 20 Current 405 (47% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 424 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1274 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: Running task 1275 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
NOTE: Running task 1328 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_fetch)
NOTE: Running task 1418 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1424 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: Running task 1425 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1426 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_unpack)
NOTE: Running task 1427 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_unpack)
NOTE: Running task 1428 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1429 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_patch)
NOTE: Running task 1430 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1431 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1432 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1433 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1434 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_patch)
NOTE: Running task 1435 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1436 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1437 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1438 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1439 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1440 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1441 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic unihash changed to d16c68b8db6e1f533dd3a51f12e2d67014e275d921052bddb0fa342b2fab499e
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1442 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1443 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1444 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1445 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1446 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1447 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_package)
NOTE: Running task 1448 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1449 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package)
NOTE: Running task 1450 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1451 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1452 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_configure)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_configure: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_configure: Succeeded
NOTE: Running task 1453 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_compile)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_compile: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 1454 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1454 tasks of which 1419 didn't need to be rerun and 1 failed.
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/glslang/1_1.3.250.0-r0/temp/log.do_packagedata.3120200
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============7924044540853351524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1799 targets, 45 skipped, 0 masked, 0 errors.
Removing 40 recipes from the core2-32 sysroot...done.
Removing 40 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:d8ea5c82239e6f9e856bdbf3391a7809e679842f"
workspace            = "master:d221e59a5067266c3f620259a1e56a56823df1fb"

Initialising tasks...done.
Sstate summary: Wanted 233 Local 213 Mirrors 0 Missed 20 Current 210 (91% match, 95% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 217 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 226 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 234 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 319 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
NOTE: Running task 320 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: Running task 321 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 322 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_unpack)
NOTE: Running task 323 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_unpack)
NOTE: Running task 324 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 245 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 246 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 247 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 248 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 249 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_package_setscene)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 264 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 267 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 270 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 273 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 277 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 281 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 284 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 285 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 287 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 288 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 298 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 301 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 303 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 308 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 310 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 312 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: Running task 335 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_fetch)
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 316 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 321 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 337 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_unpack)
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 327 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 332 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 333 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 335 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 336 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 338 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 349 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 351 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 355 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 356 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 357 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 358 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 359 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 360 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 894 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_patch)
NOTE: Running task 895 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_patch)
NOTE: Running task 899 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 365 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 374 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 377 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 931 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 932 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 387 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 953 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 954 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 955 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 961 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 962 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic)
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 395 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 407 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic unihash changed to d16c68b8db6e1f533dd3a51f12e2d67014e275d921052bddb0fa342b2fab499e
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 412 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 413 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 416 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 418 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 430 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 437 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 440 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 441 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1372 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1373 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1431 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: Running task 1436 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1438 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1439 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1440 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1441 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1442 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1443 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1444 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1445 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_package)
NOTE: Running task 1446 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1447 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1448 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package)
NOTE: Running task 1449 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1450 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 1451 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1452 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_configure)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_configure: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_configure: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1452 tasks of which 1415 didn't need to be rerun and 1 failed.
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/glslang/1_1.3.250.0-r0/temp/log.do_packagedata.3132992
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============7924044540853351524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1799 targets, 51 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:d8ea5c82239e6f9e856bdbf3391a7809e679842f"
workspace            = "master:d221e59a5067266c3f620259a1e56a56823df1fb"

Initialising tasks...done.
Sstate summary: Wanted 38 Local 18 Mirrors 0 Missed 20 Current 405 (47% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 424 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1274 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
NOTE: Running task 1275 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: Running task 1328 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_fetch)
NOTE: Running task 1419 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1424 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: Running task 1425 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1426 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_unpack)
NOTE: Running task 1427 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_unpack)
NOTE: Running task 1428 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1429 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_patch)
NOTE: Running task 1430 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1431 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1432 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1433 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: Running task 1434 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1435 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1436 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1437 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1438 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1439 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1440 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1441 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic unihash changed to d16c68b8db6e1f533dd3a51f12e2d67014e275d921052bddb0fa342b2fab499e
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1442 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1443 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1444 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1445 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1446 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1447 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_package)
NOTE: Running task 1448 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1449 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package)
NOTE: Running task 1450 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1451 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1452 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_configure)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_configure: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_configure: Succeeded
NOTE: Running task 1453 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_compile)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_compile: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 1454 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1454 tasks of which 1419 didn't need to be rerun and 1 failed.
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/glslang/1_1.3.250.0-r0/temp/log.do_packagedata.3106498
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============7924044540853351524==--

