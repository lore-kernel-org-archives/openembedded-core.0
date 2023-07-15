Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EBEFC0729B
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:38 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.5961.1689456456562815021
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CpEMYUHu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101895b73b0bb-6a7d6d6c-92ab-460c-9306-b87aebf20239-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Q+cPGkc5IyjJUS6EnBWPP4EdqRVx/DApXtbsoaxy6Gk=;
	b=CpEMYUHunwqvxddt/dA1X3HfUorxbylMMOOIGmdQH9B4FnF+EK8y6rUz0U1wHswo
	ljfg0o4GLw+bVN7ki0cGfBd/XiCwS9n/kzMp+oZXARJE5G18FYFQA6hd3I3JmdcKbob
	2zyEux2iYLeNmj6hwhaCwUjhf7nL4pyq1l83ikBM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Q+cPGkc5IyjJUS6EnBWPP4EdqRVx/DApXtbsoaxy6Gk=;
	b=dqCbZ30lFMQkoPxhcNoYRTyfBFtUbQswysM3Z9NFYTa8wJfSdqz9AGbo5MXqKpKv
	IIS94RcK/715F9OJC45ZrqmmQX/YNQvrHD+qlDcXFyPoNyiUtAsQUOuz+cREVc3AML2
	noujTEdC7YCgaX7qii511n+Q+zsYniKqEgdAiqf0=
Content-Type: multipart/mixed; boundary="===============8307178418312736668=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-validation-layers: upgrading to 1.3.250.1 SUCCEEDED
Message-ID: <010101895b73b0bb-6a7d6d6c-92ab-460c-9306-b87aebf20239-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184396

--===============8307178418312736668==
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
From feec127ca7f5026d49339ff34bf45ba2a49a8502 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 19:16:49 +0000
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


--===============8307178418312736668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vulkan-validation-layers: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dbg: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dbg: PKGSIZE changed from 279771540 to 279807640 (+0%)
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dbg: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-doc: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-doc: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-locale: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-locale: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-src: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-src: PKGSIZE changed from 24854449 to 24857238 (+0%)
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-src: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-staticdev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-staticdev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers: PV changed from "1.3.250.0" to "1.3.250.1"

--===============8307178418312736668==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-validation-layers-upgrade-1.3.250.0-1.3.250.1.patch"

RnJvbSBmZWVjMTI3Y2E3ZjUwMjZkNDkzMzlmZjM0YmY0NWJhMmE0OWE4NTAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTk6MTY6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdmFsaWRhdGlvbi1sYXllcnM6IHVwZ3JhZGUgMS4zLjI1MC4wIC0+IDEuMy4yNTAuMQoK
LS0tCiAuLi5heWVyc18xLjMuMjUwLjAuYmIgPT4gdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJzXzEu
My4yNTAuMS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3t2dWxrYW4tdmFs
aWRhdGlvbi1sYXllcnNfMS4zLjI1MC4wLmJiID0+IHZ1bGthbi12YWxpZGF0aW9uLWxheWVyc18x
LjMuMjUwLjEuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4tdmFsaWRhdGlvbi1sYXllcnNfMS4zLjI1MC4wLmJiIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdmFsaWRhdGlvbi1sYXllcnNfMS4zLjI1MC4xLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxr
YW4vdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJzXzEuMy4yNTAuMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdmFsaWRhdGlvbi1sYXllcnNfMS4zLjI1MC4x
LmJiCmluZGV4IDYyYzYzNDNjNDUuLmUxNWE2ZmIyOTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJzXzEuMy4yNTAuMC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12YWxpZGF0aW9uLWxheWVy
c18xLjMuMjUwLjEuYmIKQEAgLTExLDcgKzExLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5TRS50eHQ7bWQ1PThkZjllODgyNjczNDIyNmQwOGNiNDEyYmFiZmE1OTljIgogU1JD
X1VSSSA9ICJnaXQ6Ly9naXRAZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLVZhbGlkYXRp
b25MYXllcnMuZ2l0O2JyYW5jaD1zZGstMS4zLjI1MDtwcm90b2NvbD1odHRwcyBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLXNjcmlwdHMtQ01ha2VMaXN0cy50eHQtYXBwZW5kLXRvLUNNQUtFX0ZJ
TkRfUk9PVF9QQVQucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiMTU0MWUwMGE2M2Nk
MTI1ZjE1ZDIzMWQ1YTgwNTllYmU2NjUwM2IyNSIKK1NSQ1JFViA9ICJkNmMxZTVhNWE2MjI5YjUy
YzIwYzY0M2ZmNjI2YTk0OGQ0ODUwODY1IgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoy
LjM5LjIKCg==

--===============8307178418312736668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 70 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:a105ff1f3e80714c32731163a7960008c998dacc"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 41 Local 21 Mirrors 0 Missed 20 Current 402 (51% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 424 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1275 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: Running task 1276 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
NOTE: Running task 1328 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_fetch)
NOTE: Running task 1420 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1424 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: Running task 1425 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1426 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_unpack)
NOTE: Running task 1427 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_unpack)
NOTE: Running task 1428 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Started
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
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
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
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1441 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic unihash changed to d16c68b8db6e1f533dd3a51f12e2d67014e275d921052bddb0fa342b2fab499e
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
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
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1446 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_install)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1447 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package)
NOTE: Running task 1448 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1449 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_package)
NOTE: Running task 1450 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Started
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/glslang/1_1.3.250.0-r0/temp/log.do_packagedata.632253
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============8307178418312736668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:a105ff1f3e80714c32731163a7960008c998dacc"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 41 Local 21 Mirrors 0 Missed 20 Current 402 (51% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 424 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1274 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
NOTE: Running task 1276 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: Running task 1328 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_fetch)
NOTE: Running task 1418 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1424 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_unpack)
NOTE: Running task 1425 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: Running task 1426 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1427 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_unpack)
NOTE: Running task 1428 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
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
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1436 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1437 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1438 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1439 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1440 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1441 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic unihash changed to d16c68b8db6e1f533dd3a51f12e2d67014e275d921052bddb0fa342b2fab499e
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/glslang/1_1.3.250.0-r0/temp/log.do_packagedata.3656974
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============8307178418312736668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 48 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:a105ff1f3e80714c32731163a7960008c998dacc"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 233 Local 213 Mirrors 0 Missed 20 Current 210 (91% match, 95% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 217 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 226 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 234 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 844 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
NOTE: Running task 845 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: Running task 846 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_fetch)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 246 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 247 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 248 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 249 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 250 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_package_setscene)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 853 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 265 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 271 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx_setscene)
NOTE: Running task 855 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: Running task 858 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 278 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 282 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 285 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 286 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 288 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 289 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 299 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 302 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 306 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 309 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 311 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 887 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_patch)
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 888 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Started
NOTE: Running task 889 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_patch)
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 313 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 890 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_fetch)
NOTE: Running task 891 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 892 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 317 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 322 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 897 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 898 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 899 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 900 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 901 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 902 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_unpack)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 327 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 332 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic unihash changed to d16c68b8db6e1f533dd3a51f12e2d67014e275d921052bddb0fa342b2fab499e
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
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
NOTE: Running setscene task 360 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 364 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 368 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 373 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 382 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 387 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 394 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 403 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
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
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 421 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 424 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 430 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 436 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 440 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 441 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1371 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1372 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1431 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: Running task 1435 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1438 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: Running task 1439 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1440 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1441 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1442 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1443 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Started
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
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1451 of 1466 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1451 tasks of which 1415 didn't need to be rerun and 1 failed.
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/glslang/1_1.3.250.0-r0/temp/log.do_packagedata.1055839
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============8307178418312736668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1804 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1804 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:a105ff1f3e80714c32731163a7960008c998dacc"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 41 Local 21 Mirrors 0 Missed 20 Current 402 (51% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 424 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1275 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: Running task 1276 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
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
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1429 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_patch)
NOTE: Running task 1430 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1431 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1432 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_patch)
NOTE: Running task 1433 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1434 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1435 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1436 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1437 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1438 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1439 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1440 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1441 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic unihash changed to d16c68b8db6e1f533dd3a51f12e2d67014e275d921052bddb0fa342b2fab499e
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1442 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_configure)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1443 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Started
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
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1448 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1449 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package)
NOTE: Running task 1450 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 1451 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1451 tasks of which 1419 didn't need to be rerun and 1 failed.
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/glslang/1_1.3.250.0-r0/temp/log.do_packagedata.3517875
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============8307178418312736668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 64 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:a105ff1f3e80714c32731163a7960008c998dacc"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 41 Local 21 Mirrors 0 Missed 20 Current 402 (51% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 424 of 443 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1275 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
NOTE: Running task 1276 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: Running task 1328 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_fetch)
NOTE: Running task 1420 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1424 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_unpack)
NOTE: Running task 1425 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: Running task 1426 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1427 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1428 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_unpack)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Started
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
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
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
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Started
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
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1446 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1447 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package)
NOTE: Running task 1448 of 1467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Started
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
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/glslang/1_1.3.250.0-r0/temp/log.do_packagedata.6113
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============8307178418312736668==--

