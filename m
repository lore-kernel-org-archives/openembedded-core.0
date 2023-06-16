Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65420EB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:27 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.812.1686887483866591644
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OsnxV5rr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010188c2544ef3-573a958f-fb00-4424-a1f9-4dfa938a3c72-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uJ+x1o7FEJq3+a8+0xsdDZ0x55674HJswP4xhCcKQxw=;
	b=OsnxV5rrjxX0A4W+ru1A59JEjZ0kr5joDsGRDYLG5kq6J5nWf2yqLcTteDqthq42
	yyHh2ulIlqUBKApO/sx1srGx1GsUK5hoEXUA+AMdbmP3RscIsGhqQdF+7PA2WD7T+Ox
	HrEWIPvzE64gTywMNSH8zh2dl+f/IehQoncKWIFM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uJ+x1o7FEJq3+a8+0xsdDZ0x55674HJswP4xhCcKQxw=;
	b=SxfSlI5BUhIC9DJduIMr0COLL9JkX7abTyi4I3LNz/f1ntAtCD7mEeVlOFfshFqM
	VKxR0sxathF4VQNzChodCPC0/54liNo/gYePLcEWZlEJm0gNwZLrzscj1YkKJaCNhdO
	WWPq9EMcJNGYXMyot87JjPUHJKR+WnYjGCLAQsUE=
Content-Type: multipart/mixed; boundary="===============7397973217240285423=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 242 SUCCEEDED
Message-ID: <01010188c2544ef3-573a958f-fb00-4424-a1f9-4dfa938a3c72-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182979

--===============7397973217240285423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *242* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-236-242.patch
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
From 2ccb6375ab99dd41699bef518495d00d4555383c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 23:22:55 +0000
Subject: [PATCH] diffoscope: upgrade 236 -> 242

---
 .../diffoscope/{diffoscope_236.bb => diffoscope_242.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_236.bb => diffoscope_242.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_236.bb b/meta/recipes-support/diffoscope/diffoscope_242.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_236.bb
rename to meta/recipes-support/diffoscope/diffoscope_242.bb
index 9f89f35c11..4b0d518edc 100644
--- a/meta/recipes-support/diffoscope/diffoscope_236.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_242.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "84c46840dafffe0223056718e4250ceb52484452a992b85e345e3cf8a2cf7d4b"
+SRC_URI[sha256sum] = "d858c591d2c8d42b2b29eb6d229408607b1cd8a4e7ade72d0cd002db6d1c2a6e"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.39.2


--===============7397973217240285423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1802 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:cce58a2f190348a3c02deb535686e268eb4f578d"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 88 Local 41 Mirrors 0 Missed 47 Current 860 (46% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 888 of 948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 889 of 948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 896 of 948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/at-spi2-core/2.48.0-r0/temp/log.do_packagedata_setscene.4143299
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 947 of 948 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_package_setscene)
NOTE: Running task 2344 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_fetch)
NOTE: Running task 2392 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_fetch)
NOTE: Running task 2456 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2457 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_fetch)
NOTE: Running task 2458 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2460 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2461 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2626 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: Running task 2631 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Started
NOTE: recipe diffoscope-242-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-242-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.40-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: Running task 2668 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_unpack)
NOTE: Running task 2669 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_unpack)
NOTE: Running task 2670 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Started
NOTE: Running task 2671 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2672 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2673 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.40-r0: task do_fetch: Succeeded
NOTE: Running task 2674 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: Running task 2675 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-242-r0: task do_unpack: Started
NOTE: Running task 2676 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_unpack)
NOTE: Running task 2677 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Started
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2741 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 2800 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2801 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: Running task 2810 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Started
NOTE: Running task 2835 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_collect_spdx_deps)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.40-r0: task do_unpack: Started
NOTE: recipe diffoscope-242-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2836 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 2837 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 2870 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_collect_spdx_deps)
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: Running task 2871 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_patch)
NOTE: Running task 2872 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_collect_spdx_deps)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2873 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_collect_spdx_deps)
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: Running task 2874 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_collect_spdx_deps)
NOTE: Running task 2876 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_patch)
NOTE: Running task 2877 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe diffoscope-242-r0: task do_patch: Started
NOTE: recipe diffoscope-242-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2887 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_create_spdx)
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2888 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_configure)
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffoscope-242-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2889 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2890 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_deploy_source_date_epoch)
NOTE: Running task 2891 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic)
NOTE: recipe diffoscope-242-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2892 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe debugedit-5.0-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2893 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: Running task 2894 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_collect_spdx_deps)
NOTE: Running task 2895 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic unihash changed to 7d6306108161b8f1f6a7ee340a359459db45c79fff5265b21624f385f6e7fe8b
NOTE: recipe squashfs-tools-4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2896 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2897 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2913 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata)
NOTE: recipe diffoscope-242-r0: task do_configure: Started
NOTE: Running task 2915 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2917 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe diffoscope-242-r0: task do_configure: Succeeded
NOTE: Running task 2918 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Started
NOTE: Running task 2919 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Succeeded
NOTE: Running task 2920 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Started
NOTE: Running task 2921 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-242-r0: task do_compile: Started
NOTE: Running task 2922 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe vim-9.0.1592-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2923 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_configure)
NOTE: Running task 2924 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2925 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_patch: Succeeded
NOTE: Running task 2931 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2932 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2933 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe diffoscope-242-r0: task do_compile: Succeeded
NOTE: Running task 2934 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_install)
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-242-r0: task do_install: Started
NOTE: recipe binutils-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 2935 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_patch)
NOTE: Running task 2936 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_collect_spdx_deps)
NOTE: recipe binutils-2.40-r0: task do_patch: Started
NOTE: recipe binutils-2.40-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2937 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: Running task 2938 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe binutils-2.40-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_install: Succeeded
NOTE: Running task 2939 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_package)
NOTE: Running task 2940 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_sysroot)
NOTE: recipe diffoscope-242-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2941 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe binutils-2.40-r0: task do_patch: Succeeded
NOTE: Running task 2942 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2943 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: Running task 2944 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2945 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: Running task 2946 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe binutils-2.40-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2947 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_create_spdx)
NOTE: Running task 2948 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: Running task 2949 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_create_spdx)
NOTE: Running task 2950 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_create_spdx: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_create_spdx: Succeeded
NOTE: recipe diffoscope-242-r0: task do_package: Succeeded
NOTE: Running task 2951 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_packagedata)
NOTE: recipe diffoscope-242-r0: task do_packagedata: Started
NOTE: recipe diffoscope-242-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2952 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_create_spdx)
NOTE: recipe diffoscope-242-r0: task do_create_spdx: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-242-r0: task do_create_spdx: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2953 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe debugedit-5.0-r0: task do_configure: Succeeded
NOTE: Running task 2954 of 2990 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe debugedit-5.0-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Failed
NOTE: recipe debugedit-5.0-r0: task do_compile: Succeeded
NOTE: recipe binutils-2.40-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2954 tasks of which 2875 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 117 ERROR messages, returning a non-zero exit code.
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ab went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-af went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-am went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ar went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-az went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be+latin went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ckb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cy went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-dz went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en+shaw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hy went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-is went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ka went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ku went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-li went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mai went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ps went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-rw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-si went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+ije went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-th went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-wa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-xh went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-yi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-src went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dbg went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-staticdev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-doc went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-locale went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/squashfs-tools/4.5.1-r0/temp/log.do_packagedata.4168421
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata) failed with exit code '1'

--===============7397973217240285423==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-236-242.patch"

RnJvbSAyY2NiNjM3NWFiOTlkZDQxNjk5YmVmNTE4NDk1ZDAwZDQ1NTUzODNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMjM6MjI6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDIzNiAtPiAyNDIKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjM2LmJiID0+IGRpZmZvc2NvcGVfMjQyLmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yMzYuYmIgPT4gZGlmZm9zY29wZV8y
NDIuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzIzNi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yNDIuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzIzNi5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI0Mi5iYgppbmRleCA5Zjg5ZjM1
YzExLi40YjBkNTE4ZWRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjM2LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yNDIuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiODRjNDY4NDBkYWZmZmUwMjIzMDU2NzE4ZTQyNTBjZWI1MjQ4NDQ1MmE5OTJiODVlMzQ1
ZTNjZjhhMmNmN2Q0YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJkODU4YzU5MWQyYzhkNDJiMmIy
OWViNmQyMjk0MDg2MDdiMWNkOGE0ZTdhZGU3MmQwY2QwMDJkYjZkMWMyYTZlIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiYmludXRpbHMgdmltIHNxdWFzaGZzLXRvb2xzIHB5dGhvbjMtbGliYXJjaGl2
ZS1jIHB5dGhvbjMtbWFnaWMgcHl0aG9uMy1ycG0iCiAKLS0gCjIuMzkuMgoK

--===============7397973217240285423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1406019 to 1408047 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 236 [default] to 242 [default]
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-236.tar.gz;downloadfilename=diffoscope-236.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-242.tar.gz;downloadfilename=diffoscope-242.tar.gz"
packages/core2-32-poky-linux/diffoscope: PV changed from "236" to "242"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 236 [default] to 242 [default]
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-236.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-242.dist-info

--===============7397973217240285423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 53 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:cce58a2f190348a3c02deb535686e268eb4f578d"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 89 Local 42 Mirrors 0 Missed 47 Current 853 (47% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 882 of 942 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 883 of 942 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 890 of 942 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2327 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/at-spi2-core/2.48.0-r0/temp/log.do_packagedata_setscene.34553
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 941 of 942 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_package_setscene)
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2374 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_fetch)
NOTE: Running task 2377 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_unpack)
NOTE: Running task 2439 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2440 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2442 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2443 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2444 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_fetch)
NOTE: Running task 2498 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Started
NOTE: Running task 2610 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe diffoscope-242-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: Running task 2615 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-242-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: Running task 2616 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_unpack)
NOTE: Running task 2617 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.40-r0: task do_fetch: Started
NOTE: Running task 2618 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2619 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2621 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2622 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.40-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: Running task 2751 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_unpack)
NOTE: Running task 2752 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2785 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-242-r0: task do_unpack: Started
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2798 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2799 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2811 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: Running task 2813 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_collect_spdx_deps)
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2846 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_patch)
NOTE: Running task 2847 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe binutils-2.40-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: Running task 2848 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_collect_spdx_deps)
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Started
NOTE: recipe diffoscope-242-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Started
NOTE: Running task 2849 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 2850 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 2851 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2852 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_collect_spdx_deps)
NOTE: Running task 2853 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_patch)
NOTE: Running task 2854 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_collect_spdx_deps)
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe diffoscope-242-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2865 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_create_spdx)
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe diffoscope-242-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2866 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_configure)
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-242-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-242-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 2867 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_deploy_source_date_epoch)
NOTE: Running task 2868 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2869 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2870 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2871 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: Running task 2872 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_collect_spdx_deps)
NOTE: Running task 2873 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic unihash changed to 7d6306108161b8f1f6a7ee340a359459db45c79fff5265b21624f385f6e7fe8b
NOTE: recipe squashfs-tools-4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2874 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2875 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_configure)
NOTE: Running task 2876 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2877 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe diffoscope-242-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2878 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2879 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2880 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_configure)
NOTE: recipe diffoscope-242-r0: task do_configure: Succeeded
NOTE: Running task 2881 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Started
NOTE: Running task 2882 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_compile)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2898 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Succeeded
NOTE: Running task 2901 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe diffoscope-242-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Started
NOTE: Running task 2902 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe vim-9.0.1592-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2903 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe vim-9.0.1592-r0: task do_patch: Succeeded
NOTE: Running task 2904 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2910 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: Running task 2911 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe diffoscope-242-r0: task do_compile: Succeeded
NOTE: Running task 2912 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_install)
NOTE: recipe diffoscope-242-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2913 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe binutils-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 2914 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_patch)
NOTE: Running task 2915 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: Running task 2916 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_collect_spdx_deps)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe binutils-2.40-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe binutils-2.40-r0: task do_collect_spdx_deps: Started
NOTE: recipe binutils-2.40-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffoscope-242-r0: task do_install: Succeeded
NOTE: Running task 2917 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_package)
NOTE: Running task 2918 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_sysroot)
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-242-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2919 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: Running task 2920 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2921 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe binutils-2.40-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: Running task 2922 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2923 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_create_spdx)
NOTE: Running task 2924 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_create_spdx)
NOTE: Running task 2925 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: Running task 2926 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2927 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_create_spdx: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Started
NOTE: Running task 2928 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-2.40-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-242-r0: task do_package: Succeeded
NOTE: Running task 2929 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-242-r0: task do_packagedata: Started
NOTE: recipe diffoscope-242-r0: task do_packagedata: Succeeded
NOTE: Running task 2930 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_create_spdx)
NOTE: recipe diffoscope-242-r0: task do_create_spdx: Started
NOTE: recipe diffoscope-242-r0: task do_create_spdx: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_configure: Succeeded
NOTE: Running task 2931 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_compile: Started
NOTE: Running task 2932 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Failed
NOTE: recipe debugedit-5.0-r0: task do_compile: Succeeded
NOTE: recipe binutils-2.40-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2932 tasks of which 2853 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 117 ERROR messages, returning a non-zero exit code.
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ab went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-af went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-am went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ar went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-az went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be+latin went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ckb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cy went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-dz went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en+shaw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hy went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-is went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ka went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ku went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-li went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mai went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ps went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-rw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-si went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+ije went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-th went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-wa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-xh went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-yi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-src went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dbg went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-staticdev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-doc went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-locale went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/squashfs-tools/4.5.1-r0/temp/log.do_packagedata.60809
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata) failed with exit code '1'

--===============7397973217240285423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 69 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:cce58a2f190348a3c02deb535686e268eb4f578d"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 89 Local 42 Mirrors 0 Missed 47 Current 853 (47% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 882 of 942 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 883 of 942 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 890 of 942 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/at-spi2-core/2.48.0-r0/temp/log.do_packagedata_setscene.186278
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 941 of 942 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_package_setscene)
NOTE: Running task 2325 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_fetch)
NOTE: Running task 2374 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_fetch)
NOTE: Running task 2438 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2439 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2440 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2441 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2442 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_fetch)
NOTE: Running task 2610 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Started
NOTE: Running task 2613 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe diffoscope-242-r0: task do_fetch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-242-r0: task do_fetch: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Started
NOTE: recipe binutils-2.40-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: Running task 2614 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_unpack)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2615 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_unpack)
NOTE: Running task 2616 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.40-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Succeeded
NOTE: Running task 2617 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2618 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2619 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: Running task 2620 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2621 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_unpack)
NOTE: Running task 2622 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2623 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Started
NOTE: Running task 2624 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2625 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2626 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Started
NOTE: recipe diffoscope-242-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe binutils-2.40-r0: task do_unpack: Started
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Started
NOTE: Running task 2788 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2815 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_collect_spdx_deps)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2816 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 2847 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_collect_spdx_deps)
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-242-r0: task do_unpack: Succeeded
NOTE: Running task 2848 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 2849 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_collect_spdx_deps)
NOTE: Running task 2850 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_patch)
NOTE: Running task 2851 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_collect_spdx_deps)
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2852 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: Running task 2853 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_patch)
NOTE: Running task 2854 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe diffoscope-242-r0: task do_patch: Started
NOTE: recipe diffoscope-242-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2865 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_create_spdx)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Started
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2866 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_configure)
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2867 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: Running task 2868 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_collect_spdx_deps)
NOTE: recipe debugedit-5.0-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-242-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffoscope-242-r0: task do_patch: Succeeded
NOTE: Running task 2869 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2870 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_deploy_source_date_epoch)
NOTE: Running task 2871 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2872 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2873 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2874 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic unihash changed to 7d6306108161b8f1f6a7ee340a359459db45c79fff5265b21624f385f6e7fe8b
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2875 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_configure)
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 2876 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe diffoscope-242-r0: task do_configure: Started
NOTE: Running task 2892 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2894 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2895 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: Running task 2897 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Started
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-242-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Started
NOTE: Running task 2898 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: Running task 2899 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe diffoscope-242-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2900 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2901 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: Running task 2902 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: Running task 2903 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_patch: Succeeded
NOTE: Running task 2909 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2910 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2911 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe diffoscope-242-r0: task do_compile: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: Running task 2912 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_install)
NOTE: recipe binutils-2.40-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-242-r0: task do_install: Started
NOTE: Running task 2913 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_patch)
NOTE: Running task 2914 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_collect_spdx_deps)
NOTE: recipe binutils-2.40-r0: task do_patch: Started
NOTE: recipe binutils-2.40-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2915 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe binutils-2.40-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2916 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_install: Succeeded
NOTE: Running task 2917 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_package)
NOTE: Running task 2918 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_sysroot)
NOTE: recipe diffoscope-242-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2919 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2920 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2921 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: Running task 2922 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe binutils-2.40-r0: task do_patch: Succeeded
NOTE: Running task 2923 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2924 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_create_spdx)
NOTE: Running task 2925 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_configure)
NOTE: Running task 2926 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_create_spdx)
NOTE: Running task 2927 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: Running task 2928 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_create_spdx: Started
NOTE: recipe binutils-2.40-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Succeeded
NOTE: recipe diffoscope-242-r0: task do_package: Succeeded
NOTE: Running task 2929 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_packagedata)
NOTE: recipe diffoscope-242-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-242-r0: task do_packagedata: Succeeded
NOTE: Running task 2930 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_create_spdx)
NOTE: recipe diffoscope-242-r0: task do_create_spdx: Started
NOTE: recipe debugedit-5.0-r0: task do_configure: Succeeded
NOTE: Running task 2931 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_compile)
NOTE: recipe diffoscope-242-r0: task do_create_spdx: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2932 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe debugedit-5.0-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Failed
NOTE: recipe debugedit-5.0-r0: task do_compile: Succeeded
NOTE: recipe binutils-2.40-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2932 tasks of which 2853 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 117 ERROR messages, returning a non-zero exit code.
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ab went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-af went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-am went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ar went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-az went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be+latin went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ckb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cy went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-dz went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en+shaw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hy went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-is went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ka went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ku went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-li went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mai went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ps went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-rw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-si went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+ije went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-th went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-wa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-xh went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-yi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-src went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dbg went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-staticdev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-doc went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-locale went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/squashfs-tools/4.5.1-r0/temp/log.do_packagedata.209507
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata) failed with exit code '1'

--===============7397973217240285423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-236.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-242.dist-info

--===============7397973217240285423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 63 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:cce58a2f190348a3c02deb535686e268eb4f578d"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 83 Local 42 Mirrors 0 Missed 41 Current 859 (50% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 885 of 942 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 886 of 942 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 892 of 942 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2325 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_fetch)
NOTE: Running task 2373 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_fetch)
NOTE: Running task 2438 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2439 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 2440 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2441 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_fetch)
NOTE: Running task 2443 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2608 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Started
NOTE: recipe diffoscope-242-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-242-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/at-spi2-core/2.48.0-r0/temp/log.do_packagedata_setscene.118553
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: Running setscene task 941 of 942 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_package_setscene)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe binutils-2.40-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2609 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_unpack)
NOTE: Running task 2610 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_unpack)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.40-r0: task do_fetch: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: Running task 2611 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2612 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: Running task 2613 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2614 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2615 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_unpack)
NOTE: Running task 2616 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2617 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2622 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2623 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2624 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2626 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Started
NOTE: recipe diffoscope-242-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Started
NOTE: recipe binutils-2.40-r0: task do_unpack: Started
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2820 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_collect_spdx_deps)
NOTE: Running task 2821 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 2822 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe diffoscope-242-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2857 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_collect_spdx_deps)
NOTE: Running task 2859 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2860 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_patch)
NOTE: Running task 2861 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_collect_spdx_deps)
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: Running task 2875 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_patch)
NOTE: Running task 2876 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe diffoscope-242-r0: task do_patch: Started
NOTE: recipe diffoscope-242-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2877 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe binutils-2.40-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2878 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: Running task 2879 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_collect_spdx_deps)
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-242-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2880 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2881 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-242-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe diffoscope-242-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2882 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_deploy_source_date_epoch)
NOTE: Running task 2883 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 2884 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 2885 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-242-r0: task do_populate_lic: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_lic unihash changed to 7d6306108161b8f1f6a7ee340a359459db45c79fff5265b21624f385f6e7fe8b
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2886 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2887 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe diffoscope-242-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2888 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Succeeded
NOTE: Running task 2889 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe diffoscope-242-r0: task do_configure: Started
NOTE: Running task 2890 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2906 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata)
NOTE: recipe vim-9.0.1592-r0: task do_unpack: Succeeded
NOTE: Running task 2907 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-242-r0: task do_configure: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: Running task 2910 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_compile)
NOTE: Running task 2911 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: Running task 2912 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe diffoscope-242-r0: task do_compile: Started
NOTE: recipe vim-9.0.1592-r0: task do_patch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2913 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe vim-9.0.1592-r0: task do_patch: Succeeded
NOTE: Running task 2914 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.1592-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2920 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2921 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe diffoscope-242-r0: task do_compile: Succeeded
NOTE: Running task 2922 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_install)
NOTE: recipe diffoscope-242-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2923 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2924 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe binutils-2.40-r0: task do_unpack: Succeeded
NOTE: Running task 2925 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_patch)
NOTE: Running task 2926 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_collect_spdx_deps)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe binutils-2.40-r0: task do_patch: Started
NOTE: recipe binutils-2.40-r0: task do_collect_spdx_deps: Started
NOTE: recipe diffoscope-242-r0: task do_install: Succeeded
NOTE: recipe binutils-2.40-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2927 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_package)
NOTE: Running task 2928 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_populate_sysroot)
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-242-r0: task do_package: Started
NOTE: recipe diffoscope-242-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2929 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2930 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: Running task 2931 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe binutils-2.40-r0: task do_patch: Succeeded
NOTE: Running task 2932 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2933 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: Running task 2934 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_create_spdx)
NOTE: Running task 2935 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Started
NOTE: Running task 2936 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_create_spdx)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: Running task 2937 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_create_spdx: Started
NOTE: recipe binutils-2.40-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2938 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.40.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-2.40-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_create_spdx: Succeeded
NOTE: recipe diffoscope-242-r0: task do_package: Succeeded
NOTE: Running task 2939 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_packagedata)
NOTE: recipe diffoscope-242-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-242-r0: task do_packagedata: Succeeded
NOTE: Running task 2940 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_242.bb:do_create_spdx)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-242-r0: task do_create_spdx: Started
NOTE: recipe diffoscope-242-r0: task do_create_spdx: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2941 of 2968 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Failed
NOTE: recipe binutils-2.40-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2941 tasks of which 2868 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 117 ERROR messages, returning a non-zero exit code.
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ab went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-af went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-am went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ar went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-az went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be+latin went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ckb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cy went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-dz went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en+shaw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hy went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-is went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ka went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ku went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-li went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mai went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ps went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-rw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-si went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+ije went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-th went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-wa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-xh went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-yi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-src went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dbg went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-staticdev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-dev went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-doc went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools-locale went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: QA Issue: Package version for package squashfs-tools went backwards which would break package feeds (from 0:4.6.1-r0 to 0:4.5.1-r0) [version-going-backwards]
ERROR: squashfs-tools-4.5.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/squashfs-tools/4.5.1-r0/temp/log.do_packagedata.138703
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata) failed with exit code '1'

--===============7397973217240285423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 47 skipped, 0 masked, 0 errors.
Removing 99 recipes from the core2-32 sysroot...done.
Removing 123 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============7397973217240285423==--

