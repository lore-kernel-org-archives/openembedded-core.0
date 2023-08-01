Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F33C07E8E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:29:03 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.17705.1690907329307923521
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Z1f/x64h;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=U6lNKUkH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010189b1ee4e0e-f501f247-a15a-422a-b0c8-46a32d6d381c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=g5ib5AxixvJKty8mh/IWq/DeRH+WWz0mcFPK6ozqMAQ=;
	b=Z1f/x64hQpOiEIzL6L17NhsGKi/ZKInWrhErH84nFsPoU5pvMJI94E47whIpdtW3
	DOmHbc7hPYGs2gf7MUqojLjzfw6BDzsbyyeG7zgXfV+6U0gtfH64RkIwh805cg5E8qA
	J2mrxwVqRQZf38ZTPMTiD8JfiyjqdVWPipi87iKM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907332;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=g5ib5AxixvJKty8mh/IWq/DeRH+WWz0mcFPK6ozqMAQ=;
	b=U6lNKUkHlvvaJKanr+GVBoyqYIRrR22JtxhLUzRo4TQRD6GPHewL5jcKxj864hKu
	s9nhVIG0d8G1qYhGF0TqjTPQVoteQpr6J9q9pTonICcy5eYV3hPz4lDQaQ++3pN3YJM
	3ONibY8B5xSPO9cDhX+sSdVKSwazkijkeQ88g0Co=
Content-Type: multipart/mixed; boundary="===============3959934878377521887=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-validation-layers: upgrading to 1.3.250.1 SUCCEEDED
Message-ID: <01010189b1ee4e0e-f501f247-a15a-422a-b0c8-46a32d6d381c-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185333

--===============3959934878377521887==
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
From ce4d75586bef251a2894e0a3bed055b181830ad7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Aug 2023 14:56:22 +0000
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


--===============3959934878377521887==
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
meta-yocto-bsp       = "tmp-auh-upgrades:02c62b4f95a1eefce33c148675c8e94e0de58838"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 53 Local 23 Mirrors 0 Missed 30 Current 517 (43% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 534 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1383 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_compile)
NOTE: Running task 1384 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package_setscene: Started
NOTE: Running task 1445 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_recipe_qa)
NOTE: Running task 1528 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_create_spdx)
NOTE: Running task 1532 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_create_spdx)
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1533 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_fetch)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1534 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_unpack)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 570 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Succeeded
NOTE: Running task 1535 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1537 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1538 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1539 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_install)
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Started
NOTE: Running task 1540 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1542 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: Running task 1543 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1544 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1545 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot)
NOTE: Running task 1546 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_package)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic unihash changed to 49c5c93a3fced990968d65bf24360dca7909f6b0ee59d521a85b7688bdee8c18
NOTE: recipe glslang-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1547 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1548 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_package)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Started
NOTE: Running task 1556 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata)
NOTE: Running task 1558 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1558 tasks of which 1537 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-lesspipe went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/spirv-tools/1_1.3.250.0-r0/temp/log.do_packagedata.2480911
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============3959934878377521887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vulkan-validation-layers: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dbg: PKGSIZE changed from 279552640 to 279589164 (+0%)
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dbg: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dbg: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-doc: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-doc: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-locale: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-locale: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-src: PKGSIZE changed from 24854449 to 24857238 (+0%)
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-src: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-src: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-staticdev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers-staticdev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-validation-layers/vulkan-validation-layers: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]

--===============3959934878377521887==
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
meta-yocto-bsp       = "tmp-auh-upgrades:02c62b4f95a1eefce33c148675c8e94e0de58838"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 53 Local 23 Mirrors 0 Missed 30 Current 517 (43% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 534 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 539 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1383 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_compile)
NOTE: Running task 1384 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_compile)
NOTE: Running task 1445 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_recipe_qa)
NOTE: Running task 1528 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_create_spdx)
NOTE: Running task 1532 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_create_spdx)
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1533 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_fetch)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1534 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_unpack)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 570 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Succeeded
NOTE: Running task 1535 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1536 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1538 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1539 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1540 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1542 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1543 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1544 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Succeeded
NOTE: Running task 1545 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot)
NOTE: Running task 1546 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_package)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic unihash changed to 49c5c93a3fced990968d65bf24360dca7909f6b0ee59d521a85b7688bdee8c18
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Started
NOTE: Running task 1547 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1548 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_package)
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1556 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata)
NOTE: Running task 1558 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1559 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1559 tasks of which 1537 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-lesspipe went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/spirv-tools/1_1.3.250.0-r0/temp/log.do_packagedata.2429545
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============3959934878377521887==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-validation-layers-upgrade-1.3.250.0-1.3.250.1.patch"

RnJvbSBjZTRkNzU1ODZiZWYyNTFhMjg5NGUwYTNiZWQwNTViMTgxODMwYWQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBdWcgMjAyMyAxNDo1NjoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
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

--===============3959934878377521887==
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
meta-yocto-bsp       = "tmp-auh-upgrades:02c62b4f95a1eefce33c148675c8e94e0de58838"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 53 Local 23 Mirrors 0 Missed 30 Current 517 (43% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 534 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 539 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1383 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_compile)
NOTE: Running task 1384 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_compile)
NOTE: Running task 1445 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_recipe_qa)
NOTE: Running task 1528 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_create_spdx)
NOTE: Running task 1532 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1533 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_fetch)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1534 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_unpack)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Succeeded
NOTE: Running task 1535 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_install)
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1536 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_install)
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 570 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1537 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_patch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1539 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1540 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Succeeded
NOTE: Running task 1542 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot)
NOTE: Running task 1543 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_package)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1544 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1545 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1546 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic)
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Succeeded
NOTE: Running task 1547 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: Running task 1548 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_package)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic unihash changed to 49c5c93a3fced990968d65bf24360dca7909f6b0ee59d521a85b7688bdee8c18
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1556 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata)
NOTE: Running task 1558 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1559 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1559 tasks of which 1537 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-lesspipe went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/spirv-tools/1_1.3.250.0-r0/temp/log.do_packagedata.2393961
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============3959934878377521887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1806 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:02c62b4f95a1eefce33c148675c8e94e0de58838"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 48 Local 16 Mirrors 0 Missed 32 Current 522 (33% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 534 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 570 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1383 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_compile)
NOTE: Running task 1384 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_compile)
NOTE: Running task 1399 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: Running task 1447 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_recipe_qa)
NOTE: Running task 1532 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_create_spdx)
NOTE: Running task 1534 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_create_spdx)
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1535 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: Running task 1536 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1537 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_fetch)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1538 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_unpack)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_compile: Succeeded
NOTE: Running task 1539 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_install)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 1540 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_install)
NOTE: Running task 1541 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_patch)
NOTE: Running task 1542 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1543 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_patch)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1544 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1546 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1547 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1548 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1549 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_configure)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_install: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1550 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot)
NOTE: Running task 1551 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_package)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic unihash changed to 49c5c93a3fced990968d65bf24360dca7909f6b0ee59d521a85b7688bdee8c18
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_install: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Started
NOTE: Running task 1552 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 1553 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_package)
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1554 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_compile)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1555 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1556 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_package: Succeeded
NOTE: Running task 1557 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.5-r0: task do_package: Succeeded
NOTE: Running task 1558 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1559 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx)
NOTE: Running task 1560 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx)
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx: Succeeded
NOTE: Running task 1561 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_collect_spdx_deps)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_configure: Succeeded
NOTE: Running task 1562 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_compile: Succeeded
NOTE: Running task 1563 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_install)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_install: Succeeded
NOTE: Running task 1564 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot)
NOTE: Running task 1565 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_package)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1566 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1567 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_package: Succeeded
NOTE: Running task 1568 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1569 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1570 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1571 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1572 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_install)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1573 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_package)
NOTE: Running task 1574 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 1575 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1576 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_create_spdx)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1577 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_install)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1578 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package)
NOTE: Running task 1579 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1580 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1581 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_configure)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_configure: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_configure: Succeeded
NOTE: Running task 1582 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_compile)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_compile: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 1583 of 1594 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1583 tasks of which 1529 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-lesspipe went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/spirv-tools/1_1.3.250.0-r0/temp/log.do_packagedata.2239383
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============3959934878377521887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1806 targets, 48 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:02c62b4f95a1eefce33c148675c8e94e0de58838"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 278 Local 212 Mirrors 0 Missed 66 Current 292 (76% match, 88% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 297 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 304 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_package_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 307 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_package_setscene)
NOTE: Running setscene task 310 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 316 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 321 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 325 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 335 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 336 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 357 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 360 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 362 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 363 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 365 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 366 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 371 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 376 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 379 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_package_setscene)
NOTE: Running setscene task 380 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_package_setscene)
NOTE: Running setscene task 384 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 400 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_write_config)
NOTE: Running task 402 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_recipe_qa)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 395 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 396 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 397 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 398 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 399 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 400 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 401 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 402 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 403 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 404 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 405 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 406 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_recipe_qa: Started
NOTE: Running setscene task 407 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_package_setscene)
NOTE: Running setscene task 408 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 422 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_write_config: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 403 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_fetch)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 405 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_fetch)
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 408 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 410 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_fetch)
NOTE: Running task 411 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_fetch)
NOTE: Running task 413 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 416 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_fetch)
NOTE: Running task 418 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_fetch)
NOTE: Running task 419 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: Running task 421 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_fetch)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 423 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 425 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 424 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 427 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_fetch: Started
NOTE: recipe libxcb-1.15-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 427 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 428 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: Running task 428 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_unpack)
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: Running task 429 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_unpack)
NOTE: recipe wayland-1.22.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: Running task 430 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package_setscene: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_package_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_package_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 430 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_unpack: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 432 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 434 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 436 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 438 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Started
NOTE: Running task 435 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_fetch)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_package_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 440 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: Running task 437 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_fetch)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 439 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.0-r0: task do_fetch: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 444 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 440 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_unpack)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 442 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_fetch)
NOTE: Running task 443 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_unpack)
NOTE: recipe util-macros-1_1.20.0-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_unpack: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 449 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 457 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 460 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 461 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 467 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 473 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe glslang-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 903 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_unpack)
NOTE: Running task 927 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: Running task 928 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 929 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_unpack)
NOTE: Running task 930 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: Running task 931 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_unpack)
NOTE: Running task 932 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_unpack)
NOTE: Running task 939 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_unpack)
NOTE: Running task 943 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_unpack)
NOTE: Running task 969 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: Running task 970 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: Running task 975 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: Running task 986 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_unpack)
NOTE: Running task 987 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_patch)
NOTE: Running task 988 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 480 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1001 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_fetch)
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 485 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 491 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 496 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 497 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 500 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.15-r0: task do_unpack: Started
NOTE: Running setscene task 501 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 503 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Started
NOTE: Running setscene task 508 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 510 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 513 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1002 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: Running setscene task 516 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1003 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_unpack)
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1015 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_patch)
NOTE: recipe xtrans-1_1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 1016 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_patch)
NOTE: Running task 1017 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1039 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: Running task 1040 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: Running task 1042 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_patch)
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 1043 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: Running task 1044 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1063 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1073 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1074 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1075 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic)
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: Running setscene task 519 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 522 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_patch: Started
NOTE: Running setscene task 523 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 524 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Started
NOTE: Running task 1089 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_patch)
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.250.1.bb:do_populate_lic unihash changed to 49c5c93a3fced990968d65bf24360dca7909f6b0ee59d521a85b7688bdee8c18
NOTE: recipe vulkan-validation-layers-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_patch: Succeeded
NOTE: Running setscene task 527 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 529 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 530 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 532 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 536 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 537 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 540 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 558 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 559 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 561 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 564 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 565 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 566 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 568 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 570 of 570 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1354 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata)
NOTE: Running task 1355 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata)
NOTE: Running task 1358 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1359 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1360 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1361 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1366 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1369 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1382 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_collect_spdx_deps)
NOTE: Running task 1383 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_collect_spdx_deps)
NOTE: Running task 1430 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_collect_spdx_deps)
NOTE: Running task 1431 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_collect_spdx_deps)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata: Started
NOTE: Running task 1434 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1468 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe xcb-proto-1.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1469 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_collect_spdx_deps)
NOTE: recipe wayland-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1472 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe xorgproto-2023.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1473 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe libpthread-stubs-0.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xorgproto-2023.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1474 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_configure)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1475 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx)
NOTE: Running task 1476 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1477 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_configure)
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1478 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_configure)
NOTE: Running task 1479 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1480 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_create_spdx)
NOTE: Running task 1481 of 1593 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb:do_create_spdx)
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx: Started
NOTE: recipe spirv-tools-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_configure: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe glslang-1_1.3.250.0-r0: task do_create_spdx: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe glslang-1_1.3.250.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_configure: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_configure: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1481 tasks of which 1401 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-lesspipe went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-tools went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-tools-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/spirv-tools/1_1.3.250.0-r0/temp/log.do_packagedata.2496569
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============3959934878377521887==--

