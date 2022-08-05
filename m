Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E043C32763
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:38 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web08.3856.1659679407730960984
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CKGh7sug;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 010101826c9a0051-bcd53a51-619a-4026-9104-cd6b18a4acf5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PdWvUP71laOvV2mEHIcfwL/cZEHfBwNtQuESfjDBgDM=;
	b=CKGh7sugwBA0n0lH4cYUSszDX0LWawGVmkSuIacGp6yPKExD1rAGs3UcWMmxFArk
	djZLsvgq50OsbHfB1ZMSoas8XCpoAIqfEumuTZesIO7szQiWd0l20GdHUEAQvoPtSSr
	8adL42gHwKakNkj/myOpV6/Jz6ETDCkgBLfnQXnQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PdWvUP71laOvV2mEHIcfwL/cZEHfBwNtQuESfjDBgDM=;
	b=OLTwLhQmI6s//N+E5dK8asN9zem22QFXXem0JJ/xd7njUhvORxi/YuxyD8HgtESq
	7kcaYCNs4Qr947H0bEQWSegyxJa9NvJ3xxJKRyoolekS2h1h9pgru6HofE0EWUr2rz1
	2sQNol9OPxpGgZFjyqbrUo1vtfJdEVzvFdKmmuxY=
Content-Type: multipart/mixed; boundary="===============8152009028242550630=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to b95782f470ca2915b0d9b9079f9cd6d81bae092c
 SUCCEEDED
Message-ID: 
 <010101826c9a0051-bcd53a51-619a-4026-9104-cd6b18a4acf5-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:28 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168912

--===============8152009028242550630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *b95782f470ca2915b0d9b9079f9cd6d81bae092c* has Succeeded.

Next steps:
    - apply the patch: git am 0001-piglit-upgrade-to-latest-revision.patch
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
--===============8152009028242550630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1659 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-e95a21a74e4eb628742e226dee0eb3d48523fc63"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e95a21a74e4eb628742e226dee0eb3d48523fc63"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 17 Mirrors 0 Missed 33 Current 489 (34% match, 93% complete)
Removing 3 stale sstate objects for arch cortexa15t2hf-neon...done.
Removing 5 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 495 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 525 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1444 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1501 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1523 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: Running task 1524 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/mesa/2_22.1.3-r0/temp/log.do_packagedata_setscene.753332
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 538 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_package_setscene)
NOTE: Running task 1563 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1574 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1638 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1640 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_fetch)
NOTE: Running task 1642 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1738 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: Running task 1829 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1830 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package)
NOTE: recipe python3-mako-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: Running task 1831 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1832 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: Running task 1833 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1834 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_unpack)
NOTE: Running task 1835 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1836 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1845 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe make-4.3-r0: task do_package: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_package_setscene: Started
NOTE: Running task 1848 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1849 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.1-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1850 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1851 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1852 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1853 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_22.1.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1865 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_packagedata)
NOTE: Running task 1866 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_unpack: Succeeded
NOTE: Running task 1867 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 31aeafc9bdefb849a0d9799a7a1cf5dd0a031fa6b225e0337804f44f7a3a2263
NOTE: Running task 1873 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1874 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1875 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe python3-mako-1.2.1-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1876 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_patch: Succeeded
NOTE: Running task 1877 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1878 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1879 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1880 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: Running task 1881 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.1-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1882 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 6a45a44c3b39672a86abd0332d915a7798cf7de2174cf87d11dbe9cc42e975ac
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b2218f556211d104deaba5f8560d1304b0f810691e2f5684aa350a9247ccff14
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1885 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe make-4.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package unihash changed to 1cbaa047247ecbfd882d3aeae880d2f39d159fb888c949c3573c2bc917fe277e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata became valid
NOTE: Running setscene task 539 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1886 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_install)
NOTE: recipe python3-mako-1.2.1-r0: task do_install: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-mako-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1888 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_package)
NOTE: recipe python3-mako-1.2.1-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1889 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1890 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.1-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1891 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe python3-mako-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1892 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1893 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1894 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe python3-mako-1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1895 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1896 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1897 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1898 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1899 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1900 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1901 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1902 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1903 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1904 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1905 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1906 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1907 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1908 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_configure: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1909 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: Running task 1910 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1911 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package unihash changed to 29b98899560913aa58383fd8cee11235898104acab0f89373483af4a19854fc2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata became valid
NOTE: Running setscene task 539 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1913 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm unihash changed to 60ebc3e871959885f0d5399f35ce1d95da7a5e8b5d31c96afa43085cb33bfd5c
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_compile: Succeeded
NOTE: Running task 1914 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_install: Succeeded
NOTE: Running task 1915 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1916 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_package: Succeeded
NOTE: Running task 1917 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_packagedata: Succeeded
NOTE: Running task 1918 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1919 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1920 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1920 tasks of which 1848 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8152009028242550630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1659 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1659 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-e95a21a74e4eb628742e226dee0eb3d48523fc63"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e95a21a74e4eb628742e226dee0eb3d48523fc63"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 17 Mirrors 0 Missed 33 Current 489 (34% match, 93% complete)
Removing 3 stale sstate objects for arch core2-64...done.
Removing 5 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 495 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 525 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1412 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1463 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1485 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-3.10.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/mesa/2_22.1.3-r0/temp/log.do_packagedata_setscene.154662
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 538 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_package_setscene)
NOTE: Running task 1524 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 1563 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1574 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1638 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1640 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_fetch)
NOTE: Running task 1641 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1737 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: Running task 1829 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package)
NOTE: recipe python3-mako-1.2.1-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1830 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1831 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: Running task 1832 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1833 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_unpack)
NOTE: Running task 1834 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1835 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1836 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package)
NOTE: Running task 1845 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_package_setscene: Started
NOTE: Running task 1848 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_patch)
NOTE: recipe make-4.3-r0: task do_package: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.1-r0: task do_patch: Started
NOTE: Running task 1849 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1850 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe perl-5.36.0-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1851 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1852 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1853 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 0cb395d3538a9407268bc0b3afe0fcee44c439360721ee60d8257140abbfcb76
NOTE: recipe python3-mako-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1859 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_unpack: Succeeded
NOTE: Running task 1860 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-mako-1.2.1-r0: task do_configure: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_patch: Started
NOTE: Running task 1872 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_packagedata)
NOTE: Running task 1873 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1874 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1875 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1876 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: Running task 1877 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe mesa-2_22.1.3-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_patch: Succeeded
NOTE: Running task 1878 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1879 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1880 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_generate_toolchain_file: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1881 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 363e0d1bb995f81bceb8d8e9d6d721c4c6eec23d0d2d5e0a2bbfe50c79d95211
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_populate_lic: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 6a45a44c3b39672a86abd0332d915a7798cf7de2174cf87d11dbe9cc42e975ac
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1884 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1885 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe make-4.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package unihash changed to 4079cd770c3cf27ddc6ebc7a8df9d4d98ffbe004dff67623f97c008f6e7ffd01
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata became valid
NOTE: Running setscene task 539 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-mako-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1887 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_install)
NOTE: recipe python3-mako-1.2.1-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1888 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_package)
NOTE: recipe python3-mako-1.2.1-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1889 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1890 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.1-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1891 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe python3-mako-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1892 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: recipe python3-mako-1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1893 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1894 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1895 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1896 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1897 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1898 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1899 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1900 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1901 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1902 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1903 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1904 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1905 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1906 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1907 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1908 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1909 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1910 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_configure: Succeeded
NOTE: Running task 1911 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package unihash changed to 2ac7930bf80b5f39961002bbc5b3e898deb3c60eace11b4b2dbd7a22f803449b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata became valid
NOTE: Running setscene task 539 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1913 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm unihash changed to dfe4e29d34dd2cb936bfeea74217bbbfd0cdf4aa53512c3db86eabefea0e65cd
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_compile: Succeeded
NOTE: Running task 1914 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_install: Succeeded
NOTE: Running task 1915 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1916 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_package: Succeeded
NOTE: Running task 1917 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_packagedata: Succeeded
NOTE: Running task 1918 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1919 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1920 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1920 tasks of which 1848 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8152009028242550630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+c107462e4e to 1.0+gitr0+b95782f470
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+c107462e4e to 1.0+gitr0+b95782f470
packages/core2-32-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+c107462e4e-r0'])", added "piglit (['= 1.0+gitr0+b95782f470-r0'])"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+c107462e4e to 1.0+gitr0+b95782f470
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+c107462e4e to 1.0+gitr0+b95782f470
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+c107462e4e to 1.0+gitr0+b95782f470
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+c107462e4e to 1.0+gitr0+b95782f470
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+c107462e4e-r0'])", added "piglit-dev (['= 1.0+gitr0+b95782f470-r0'])"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+c107462e4e to 1.0+gitr0+b95782f470
packages/core2-32-poky-linux/piglit/piglit: FILELIST: removed "/usr/lib/piglit/bin/arb_sample_shading-builtin-gl-sample-mask-mrt-alpha-to-coverage-combinations /usr/lib/piglit/bin/same-attachment-glFramebufferRenderbuffer-GL_DEPTH_STENCIL_ATTACHMENT /usr/lib/piglit/bin/same-attachment-glFramebufferTexture2D-GL_DEPTH_STENCIL_ATTACHMENT", added "/usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-array-mat4x4.shader_test /usr/lib/piglit/generate
 d_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-array-mat3x3.shader_test /usr/lib/piglit/generated_
 tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-mat2x4-and-column_major-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec
 /arb_uniform_buffer_object/execution/std140-#column_major-array-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-mat4x4.shader_test /usr/lib/piglit/generated
 _tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-mat2x3-and-column_major-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-mat4x3-and-column_major-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-mat2x2.shader_test /usr/lib/pigl
 it/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-mat2x3.shader_test /usr/lib/piglit/bin/same-attachment-tex2d-depth_stencil /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_m
 ajor-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-mat3x4-and-column_major-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-mat2x4-and-column_major-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-mat3x4-and-column_major-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/ar
 b_uniform_buffer_object/execution/std140-row_major-array-struct-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-array-mat4x2.shader_test /usr/lib/piglit/generat
 ed_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-array-struct-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-mat2x4-and-column_major-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-array-struct-array-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-array-struct-array-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-mat4x3.shader_test /usr/lib/piglit/generated_tes
 ts/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-mat2x3.shader_test /usr/lib/piglit/generated_tes
 ts/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-struct-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-struct-array-array-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-mat2x3-and-column_major-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buff
 er_object/execution/std140-#column_major-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-mat4x3-and-column_major-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-struct-array-array-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-mat2x2.shader_test /usr/lib/piglit/generated_test
 s/spec/arb_uniform_buffer_object/execution/std140-row_major-array-mat2x3-and-column_major-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-array-array-struct-array.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-mat3x3.shader_test /usr/lib/piglit/gen
 erated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-mat4x2-and-column_major-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_
 buffer_object/execution/shared-struct-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_m
 ajor-mat3x4-and-column_major-mat3x4.shader_test /usr/lib/piglit/bin/same-attachment-renderbuffer-depth_stencil /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-mat3x2-and-column_major-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-mat2x2-and-column_major-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-ma
 t3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-mat3x2-and-column_major-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-mat3x3-and-column_major-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_maj
 or-mat3x3-and-column_major-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-array-struct-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-mat4x2-and-column_major-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-struct-array-array-array.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_
 major-array-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-mat3x3-and-column_major-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-mat4x3-and-column_major-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-mat2x2-and-column_major-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-mat4x3-and-column_major-array-mat4x3.shader_test /usr/li
 b/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-mat4x4-and-column_major-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-array-mat4x3.shader_tes
 t /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-mat3x3-and-column_major-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-mat2x2-and-column_major-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-s
 truct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-mat4x2-and-column_major-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-mat4x2-and-column_major-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execu
 tion/shared-column_major-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer
 _object/execution/std140-row_major-array-mat4x4-and-column_major-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-struct-array-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spe
 c/arb_uniform_buffer_object/execution/shared-#column_major-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-mat4x4-and-column_major-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-struct-array-array-array.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-array-array-struct-array.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-struct-struct-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-mat2x3-and-column_major-array-mat2x3.shader_test /usr/lib/piglit/genera
 ted_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-mat3x2-and-column_major-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-array-mat3x3.shader_te
 st /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-array-mat3x3.shade
 r_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-array-mat2x3.shader_test /usr/lib/piglit/bin/arb_sample_shading-builtin-gl-sample-mask-mrt-alpha-to-coverage /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-mat2x4-and-column_major-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-mat3x2-and-column_major-mat3x2.shader_test /usr/lib/pi
 glit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-struct-array-array-array-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-array-mat2x4.shader_te
 st /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-mat3x4.shader_test /us
 r/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-struct-struct-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-array-mat2x4.shader_test /usr/lib/piglit/generated_tests
 /spec/arb_uniform_buffer_object/execution/shared-column_major-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-struct-array-array-array-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-mat3x4-and-column_major-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spe
 c/arb_uniform_buffer_object/execution/std140-column_major-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_test
 s/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb
 _uniform_buffer_object/execution/shared-struct-array-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-mat2x2-and-column_major-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-mat4x4-and-column_major-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-mat2x2.shader_test"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+c107462e4e to 1.0+gitr0+b95782f470

--===============8152009028242550630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+c107462e4e" to "1.0+gitrAUTOINC+b95782f470"
packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+c107462e4e [default] to 1.0+gitrAUTOINC+b95782f470 [default]
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+c107462e4e to 1.0+gitr0+b95782f470
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+c107462e4e" to "1.0+gitrAUTOINC+b95782f470"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+c107462e4e to 1.0+gitr0+b95782f470
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+c107462e4e" to "1.0+gitrAUTOINC+b95782f470"
packages/core2-32-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+c107462e4e-r0'])", added "piglit (['= 1.0+gitr0+b95782f470-r0'])"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+c107462e4e to 1.0+gitr0+b95782f470
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+c107462e4e" to "1.0+gitrAUTOINC+b95782f470"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+c107462e4e to 1.0+gitr0+b95782f470
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+c107462e4e" to "1.0+gitrAUTOINC+b95782f470"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+c107462e4e to 1.0+gitr0+b95782f470
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+c107462e4e" to "1.0+gitrAUTOINC+b95782f470"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+c107462e4e to 1.0+gitr0+b95782f470
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+c107462e4e" to "1.0+gitrAUTOINC+b95782f470"
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+c107462e4e-r0'])", added "piglit-dev (['= 1.0+gitr0+b95782f470-r0'])"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+c107462e4e to 1.0+gitr0+b95782f470
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+c107462e4e" to "1.0+gitrAUTOINC+b95782f470"
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2042597292 to 2048047151 (+0%)
packages/core2-32-poky-linux/piglit/piglit: FILELIST: removed "/usr/lib/piglit/bin/same-attachment-glFramebufferRenderbuffer-GL_DEPTH_STENCIL_ATTACHMENT /usr/lib/piglit/bin/arb_sample_shading-builtin-gl-sample-mask-mrt-alpha-to-coverage-combinations /usr/lib/piglit/bin/same-attachment-glFramebufferTexture2D-GL_DEPTH_STENCIL_ATTACHMENT", added "/usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-mat4x3-and-column_major-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-struct-array-array-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-array-mat3x2.shader_test /usr/lib/piglit/g
 enerated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-array-mat3x3.shader_test /usr/lib/piglit
 /generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-mat2x4-and-column_major-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-mat3x3-and-column_major-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-mat3x3-and-column_major-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-arr
 ay-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-array-struct-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column
 _major-struct-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-mat2x2-and-column_major-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-mat3x4-and-column_major-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-mat4x4-and-column_major-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/e
 xecution/std140-#column_major-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execut
 ion/std140-#column_major-array-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-struct-array-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#colu
 mn_major-array-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-ar
 ray-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-mat4x3-and-column_major-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_m
 ajor-array-struct-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-struct-array-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-stru
 ct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-array-struct-array-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-mat4x3.shader_test 
 /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-mat3x3-and-column_major-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-mat2x2-and-column_major-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_ma
 jor-array-mat2x4-and-column_major-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-struct-array-array-array.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/st
 d140-#column_major-array-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-mat4x2-and-column_major-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-struct-struct-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-struct-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-s
 truct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-array-struct-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-mat4x2-and-column_major-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-array-struct-array-
 struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-struct-array-array-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-ar
 ray-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-struct-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-mat3x2-and-column_major-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-mat4x2-and-colu
 mn_major-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-array-mat2
 x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-mat4x4-and-column_major-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-mat4x4-and-column_major-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-mat2x2-and-column_major-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-array-array-struct-array.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/
 execution/std140-#column_major-array-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-struct-array-array-array.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffe
 r_object/execution/std140-column_major-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-mat3x4-and-column_major-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-mat3x4-and-column_major-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-mat2x3-and-column_major-array-mat2x3.shader_test /usr/lib/p
 iglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-mat4x3-and-column_major-array-mat4x3.shader_
 test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-mat4x4-and-column_major-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-mat4x2-and-column_major-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/share
 d-#column_major-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-mat2x2-and-column_major-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution
 /shared-#column_major-array-struct-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-struct-struct-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-mat3x3-and-column_major-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/exec
 ution/std140-row_major-struct-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-mat3x2-and-column_major-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_ma
 jor-array-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-struct-array-mat2x2.shader_test /usr/lib/piglit/bin/same-attachment-renderbuffer-depth_stencil /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-mat2x3-and-column_major-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-mat2x3-and-column_major-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-array-mat4x2.shader_test /us
 r/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-mat2x3-and-column_major-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-mat2x4.shader_test /usr/lib/piglit/
 generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-array-array-struct-array.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-mat4x3-and-column_major-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-array-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-array-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-array-struct-array-mat4x3.shader_te
 st /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-array-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-mat3x3.shader_test /usr/lib/piglit/bin/same-attachment-tex2d-depth_stencil /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_maj
 or-array-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-array-mat2x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-struct-array-array-array-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-column_major-array-struct-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-mat4x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_majo
 r-array-struct-array-mat2x2.shader_test /usr/lib/piglit/bin/arb_sample_shading-builtin-gl-sample-mask-mrt-alpha-to-coverage /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-mat3x2-and-column_major-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-struct-array-array-array-struct.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-array-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-array-mat
 2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-#column_major-array-struct-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-struct-array-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-arra
 y-mat3x4-and-column_major-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-column_major-array-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-mat2x4-and-column_major-mat2x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-mat3x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-struct-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-mat3x2-and-column_major-mat3x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-mat2x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/ex
 ecution/std140-row_major-array-struct-array-mat4x2.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-struct-array-mat4x3.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-#column_major-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/std140-row_major-array-struct-array-mat3x4.shader_test /usr/lib/piglit/generated_tests/spec/arb_uniform_buffer_object/execution/shared-row_major-array-mat2x4-and-column_major-array-mat2x4.shader_test"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+c107462e4e to 1.0+gitr0+b95782f470
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+c107462e4e" to "1.0+gitrAUTOINC+b95782f470"

--===============8152009028242550630==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSBiYjc3ODFkYzgwNTQ3ZWM2MTRmYjk4ZGIwN2U2MmYyZjY3YWQ4MjdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNSBBdWcgMjAyMiAwMjowOToxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBp
Z2xpdDogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3BpZ2xpdC9waWdsaXRfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWds
aXRfZ2l0LmJiCmluZGV4IDkzMmYyOTI4YTAuLmIxZTk0OGVhNjkgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKQEAgLTE0LDcgKzE0LDcgQEAgU1JDX1VSSSA9
ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvcGlnbGl0LmdpdDtwcm90b2NvbD1o
dHRwczticmFuY2g9bWEKICAgICAgICAgICAgIgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIx
IgogCi1TUkNSRVYgPSAiYzEwNzQ2MmU0ZTQyOWZhMWNmNmRhYWMzOTE2ODY3NGMxYzBjOWZkNCIK
K1NSQ1JFViA9ICJiOTU3ODJmNDcwY2EyOTE1YjBkOWI5MDc5ZjljZDZkODFiYWUwOTJjIgogIyAo
d2hlbiBQViBnb2VzIGFib3ZlIDEuMCByZW1vdmUgdGhlIHRyYWlsaW5nIHIpCiBQViA9ICIxLjAr
Z2l0ciR7U1JDUFZ9IgogCi0tIAoyLjMxLjEKCg==

--===============8152009028242550630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1659 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-e95a21a74e4eb628742e226dee0eb3d48523fc63"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e95a21a74e4eb628742e226dee0eb3d48523fc63"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 13 Mirrors 0 Missed 37 Current 485 (26% match, 93% complete)
Removing 5 stale sstate objects for arch qemumips...done.
Removing 3 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 491 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_package_write_rpm_setscene)
NOTE: Running task 1207 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_fetch)
NOTE: Running task 1375 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_write_config)
NOTE: recipe python3-3.10.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1404 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1455 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1477 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe mesa-2_22.1.3-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_write_config: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_write_config: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1506 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_unpack)
NOTE: Running task 1510 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1519 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 1556 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1567 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1630 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1633 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1634 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_fetch)
NOTE: Running task 1728 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: Running task 1822 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package)
NOTE: recipe mesa-2_22.1.3-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_fetch: Started
NOTE: Running task 1823 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package)
NOTE: recipe python3-mako-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: Running task 1824 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1825 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: Running task 1826 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1827 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1828 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_unpack)
NOTE: Running task 1829 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1835 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe make-4.3-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1838 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1839 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.1-r0: task do_patch: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1840 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1841 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1842 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1843 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-mako-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 1844 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_configure)
NOTE: recipe mesa-2_22.1.3-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to e2665d5f03cb6fc520c75cd2518639a763c662566b293b9f3dcb58f2c6be1e08
NOTE: Running task 1850 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_patch)
NOTE: recipe python3-mako-1.2.1-r0: task do_configure: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1851 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_unpack: Succeeded
NOTE: Running task 1852 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1853 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: Running task 1854 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1855 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_patch: Succeeded
NOTE: Running task 1856 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1857 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1858 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe mesa-2_22.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1859 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 309b648185e6cc4f5620a0968a1a475507070ebf20b3816503c836a3a5695faf
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_populate_lic: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 6a45a44c3b39672a86abd0332d915a7798cf7de2174cf87d11dbe9cc42e975ac
NOTE: Running task 1862 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe make-4.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package unihash changed to 406549a261c80b7313f4612ef543c4d4e4e0eaa6482ea035e72de4bc2f01913f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata became valid
NOTE: Running setscene task 534 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1863 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_install)
NOTE: recipe python3-mako-1.2.1-r0: task do_install: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-mako-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1865 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_package)
NOTE: recipe python3-mako-1.2.1-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1866 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.1-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1867 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1868 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_compile)
NOTE: recipe mesa-2_22.1.3-r0: task do_compile: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1869 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_install)
NOTE: recipe mesa-2_22.1.3-r0: task do_install: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_install: Succeeded
NOTE: Running task 1870 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_populate_sysroot)
NOTE: Running task 1871 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_package)
NOTE: recipe mesa-2_22.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_package: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1872 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1873 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1874 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1875 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1876 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1877 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1878 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_package: Succeeded
NOTE: Running task 1879 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_packagedata)
NOTE: recipe mesa-2_22.1.3-r0: task do_packagedata: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_packagedata: Failed
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1879 tasks of which 1822 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/mesa/2_22.1.3-r0/temp/log.do_packagedata.1677975
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_packagedata) failed with exit code '1'

--===============8152009028242550630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1660 targets, 49 skipped, 0 masked, 0 errors.
Removing 70 recipes from the core2-32 sysroot...done.
Removing 79 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-e95a21a74e4eb628742e226dee0eb3d48523fc63"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e95a21a74e4eb628742e226dee0eb3d48523fc63"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 318 Local 266 Mirrors 0 Missed 52 Current 193 (83% match, 89% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 197 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 200 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 207 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 210 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 211 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 218 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 237 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 240 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.112.bb:do_packagedata_setscene)
NOTE: Running setscene task 243 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 245 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 247 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.112.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 251 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 253 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 254 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 257 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 261 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 263 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 273 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 275 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running task 738 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_fetch)
NOTE: Running task 763 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_fetch)
NOTE: Running task 795 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_write_config)
NOTE: Running task 796 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_fetch)
NOTE: Running task 801 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 803 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_fetch)
NOTE: Running task 806 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 809 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_fetch)
NOTE: Running task 821 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 832 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_write_config)
NOTE: Running task 833 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 835 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 836 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_fetch)
NOTE: Running task 842 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_write_config)
NOTE: Running task 869 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.112-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.112-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: Running task 902 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 903 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_fetch)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe perl-5.36.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 904 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_fetch)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe kmod-30-r0: task do_fetch: Started
NOTE: Running task 905 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe python3-3.10.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_write_config: Started
NOTE: recipe python3-pygments-2.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_fetch: Succeeded
NOTE: recipe python3-mako-1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_write_config: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: Running task 910 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_unpack)
NOTE: Running setscene task 284 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_write_config: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_write_config: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_fetch: Succeeded
NOTE: recipe make-4.3-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_fetch: Succeeded
NOTE: recipe make-4.3-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.112-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.112-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 291 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_unpack: Succeeded
NOTE: Running setscene task 292 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 302 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 306 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 309 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 319 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 931 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_unpack)
NOTE: Running task 940 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_unpack)
NOTE: Running task 942 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: Running task 943 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_patch)
NOTE: Running task 950 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 952 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_unpack)
NOTE: Running task 955 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_unpack)
NOTE: Running task 958 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 963 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 964 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_unpack)
NOTE: Running task 967 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_unpack)
NOTE: Running task 968 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 971 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe kmod-30-r0: task do_unpack: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: Running task 972 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_deploy_source_date_epoch)
NOTE: recipe make-4.3-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 977 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-mako-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 325 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 328 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running task 990 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_patch)
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 996 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_patch)
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 336 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_setscene)
NOTE: recipe xkeyboard-config-2.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe make-4.3-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_patch: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1001 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_patch)
NOTE: Running task 1006 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1011 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 343 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: Running task 1012 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 346 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe make-4.3-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1021 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe kmod-30-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1022 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 351 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 355 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1032 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-mako-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1041 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 366 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 369 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 370 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.1.16-r0: task do_package_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Succeeded
NOTE: Running task 1046 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_unpack)
NOTE: recipe kmod-30-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1051 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_deploy_source_date_epoch)
NOTE: Running task 1052 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 374 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Started
NOTE: recipe make-4.3-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 1062 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1063 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_patch)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running setscene task 383 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 384 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.36.0-r0: task do_patch: Started
NOTE: Running task 1068 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_patch: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 387 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_unpack: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1081 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_patch: Started
NOTE: recipe eudev-3.2.11-r0: task do_patch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_package_setscene: Succeeded
NOTE: Running task 1082 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 398 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1083 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 402 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_unpack: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_patch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 412 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 421 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 423 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 425 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 429 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1108 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_patch)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1109 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: Running task 1110 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1111 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: recipe perl-5.36.0-r0: task do_patch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 434 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 436 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 1125 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_generate_toolchain_file: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_populate_lic: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 442 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 444 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 451 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_populate_lic: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 6a45a44c3b39672a86abd0332d915a7798cf7de2174cf87d11dbe9cc42e975ac
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1163 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 473 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1180 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 481 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 486 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1195 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 492 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5a89c44da463ec41c5f401958d01582fe28bb9a0d7b3e33c212f155080793543
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 495 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 496 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 508 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 509 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1594 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1616 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1640 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1664 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1685 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1713 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1734 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe mesa-2_22.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1737 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_configure)
NOTE: recipe make-4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1738 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_configure)
NOTE: recipe perl-5.36.0-r0: task do_configure: Started
NOTE: recipe make-4.3-r0: task do_configure: Started
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1739 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_configure)
NOTE: recipe python3-mako-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1740 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_configure)
NOTE: recipe xkeyboard-config-2.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1741 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_configure)
NOTE: recipe kmod-30-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_configure: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1742 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_configure)
NOTE: recipe python3-mako-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1743 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_compile)
NOTE: recipe python3-mako-1.2.1-r0: task do_compile: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_configure: Succeeded
NOTE: Running task 1744 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_compile)
NOTE: recipe xkeyboard-config-2.36-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_compile: Succeeded
NOTE: Running task 1745 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_install)
NOTE: recipe xkeyboard-config-2.36-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1746 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_install)
NOTE: recipe python3-mako-1.2.1-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1747 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_package)
NOTE: recipe xkeyboard-config-2.36-r0: task do_install: Succeeded
NOTE: Running task 1748 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot)
NOTE: Running task 1749 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_package)
NOTE: recipe python3-mako-1.2.1-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1750 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1751 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1752 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_configure)
NOTE: recipe python3-mako-1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1753 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_package: Succeeded
NOTE: Running task 1754 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1755 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_compile)
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1756 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_install)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_install: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1757 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_compile)
NOTE: recipe mesa-2_22.1.3-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1758 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot)
NOTE: Running task 1759 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_package)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe make-4.3-r0: task do_configure: Succeeded
NOTE: Running task 1760 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_compile)
NOTE: recipe make-4.3-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1761 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata: Started
NOTE: recipe make-4.3-r0: task do_compile: Succeeded
NOTE: Running task 1762 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_install)
NOTE: recipe make-4.3-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe make-4.3-r0: task do_install: Succeeded
NOTE: Running task 1763 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package)
NOTE: recipe make-4.3-r0: task do_package: Started
NOTE: recipe kmod-30-r0: task do_configure: Succeeded
NOTE: Running task 1764 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_compile)
NOTE: recipe kmod-30-r0: task do_compile: Started
NOTE: recipe kmod-30-r0: task do_compile: Succeeded
NOTE: Running task 1765 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_install)
NOTE: recipe kmod-30-r0: task do_install: Started
NOTE: recipe kmod-30-r0: task do_install: Succeeded
NOTE: Running task 1766 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot)
NOTE: Running task 1767 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package)
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-30-r0: task do_package: Started
NOTE: recipe make-4.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package unihash changed to 18e3660e183f82e3b7a837b1fbfcfb3522bba116c36c6d0065ed4cf9e45c0497
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata became valid
NOTE: Running setscene task 511 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1769 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1770 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_configure)
NOTE: recipe eudev-3.2.11-r0: task do_configure: Started
NOTE: recipe kmod-30-r0: task do_package: Succeeded
NOTE: Running task 1771 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata)
NOTE: recipe kmod-30-r0: task do_packagedata: Started
NOTE: recipe kmod-30-r0: task do_packagedata: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_configure: Succeeded
NOTE: Running task 1772 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_compile)
NOTE: recipe eudev-3.2.11-r0: task do_compile: Started
NOTE: recipe eudev-3.2.11-r0: task do_compile: Succeeded
NOTE: Running task 1773 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_install)
NOTE: recipe eudev-3.2.11-r0: task do_install: Started
NOTE: recipe eudev-3.2.11-r0: task do_install: Succeeded
NOTE: Running task 1774 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot)
NOTE: Running task 1775 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_package)
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.11-r0: task do_package: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1776 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_install)
NOTE: recipe mesa-2_22.1.3-r0: task do_install: Started
NOTE: recipe eudev-3.2.11-r0: task do_package: Succeeded
NOTE: Running task 1777 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_install: Succeeded
NOTE: Running task 1778 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_populate_sysroot)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata: Succeeded
NOTE: Running task 1779 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_package)
NOTE: recipe mesa-2_22.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_package: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1780 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1781 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1782 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1783 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1784 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1785 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1786 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_configure: Succeeded
NOTE: Running task 1787 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_configure_ptest_base)
NOTE: recipe perl-5.36.0-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.36.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1788 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_compile)
NOTE: recipe perl-5.36.0-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1789 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_package: Succeeded
NOTE: Running task 1790 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_packagedata)
NOTE: recipe mesa-2_22.1.3-r0: task do_packagedata: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_packagedata: Failed
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1790 tasks of which 1668 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/mesa/2_22.1.3-r0/temp/log.do_packagedata.1964415
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_packagedata) failed with exit code '1'

--===============8152009028242550630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1659 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-e95a21a74e4eb628742e226dee0eb3d48523fc63"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e95a21a74e4eb628742e226dee0eb3d48523fc63"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 13 Mirrors 0 Missed 37 Current 489 (26% match, 93% complete)
Removing 3 stale sstate objects for arch ppc7400...done.
Removing 5 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 495 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_package_write_rpm_setscene)
NOTE: Running task 1213 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_fetch)
NOTE: recipe python3-3.10.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1383 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_write_config)
NOTE: Running task 1414 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1465 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1485 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe mesa-2_22.1.3-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_write_config: Started
NOTE: recipe python3-3.10.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_write_config: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1513 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_unpack)
NOTE: Running task 1517 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1526 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 1567 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1578 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1642 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1644 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_fetch)
NOTE: Running task 1645 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1741 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: Running task 1831 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package)
NOTE: recipe mesa-2_22.1.3-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1832 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: Running task 1833 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1834 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: Running task 1835 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1836 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_unpack)
NOTE: Running task 1837 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1838 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1849 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe make-4.3-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1852 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1853 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.1-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.36.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1854 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1855 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1856 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1857 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1858 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to cc1926fa9d57f281491422a9bd2d4f6e330abfd3c21cd9108fee7200caeb4829
NOTE: recipe python3-mako-1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1864 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_configure)
NOTE: recipe mesa-2_22.1.3-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_unpack: Succeeded
NOTE: Running task 1865 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-mako-1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1866 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1867 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1868 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe mesa-2_22.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1869 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_patch: Succeeded
NOTE: Running task 1870 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1871 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1872 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 1006c1302494e77886f06831cbd7fe5cb6aa2f4bc4e883ca4ef9716f85e10d63
NOTE: recipe mesa-2_22.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1875 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1876 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_populate_lic: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 6a45a44c3b39672a86abd0332d915a7798cf7de2174cf87d11dbe9cc42e975ac
NOTE: recipe mesa-2_22.1.3-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe make-4.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package unihash changed to 5f49d9d5aa329022f52ce271e3f31236716e4caafc01806ac593758247188762
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata became valid
NOTE: Running setscene task 538 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-mako-1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1878 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_install)
NOTE: recipe python3-mako-1.2.1-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1879 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_package)
NOTE: recipe python3-mako-1.2.1-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1880 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.1-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1881 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.1.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1882 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_compile)
NOTE: recipe mesa-2_22.1.3-r0: task do_compile: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1883 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_install)
NOTE: recipe mesa-2_22.1.3-r0: task do_install: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_install: Succeeded
NOTE: Running task 1884 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_populate_sysroot)
NOTE: Running task 1885 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_package)
NOTE: recipe mesa-2_22.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_package: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1886 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1887 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1888 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1889 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1890 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1891 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1892 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_22.1.3-r0: task do_package: Succeeded
NOTE: Running task 1893 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_packagedata)
NOTE: recipe mesa-2_22.1.3-r0: task do_packagedata: Started
NOTE: recipe mesa-2_22.1.3-r0: task do_packagedata: Failed
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1893 tasks of which 1836 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.5-r0 to 2:22.1.3-r0) [version-going-backwards]
ERROR: mesa-2_22.1.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/mesa/2_22.1.3-r0/temp/log.do_packagedata.1848992
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.3.bb:do_packagedata) failed with exit code '1'

--===============8152009028242550630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1659 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1659 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-e95a21a74e4eb628742e226dee0eb3d48523fc63"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e95a21a74e4eb628742e226dee0eb3d48523fc63"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 169 Local 162 Mirrors 0 Missed 7 Current 370 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1588 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_fetch: Succeeded
NOTE: Running task 1906 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1907 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_unpack: Succeeded
NOTE: Running task 1908 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_patch: Succeeded
NOTE: Running task 1909 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1910 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1911 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_populate_lic: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1912 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_configure: Succeeded
NOTE: Running task 1913 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_compile: Succeeded
NOTE: Running task 1914 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_install: Succeeded
NOTE: Running task 1915 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1916 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_package: Succeeded
NOTE: Running task 1917 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+b95782f470-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1917 tasks of which 1904 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: piglit-1.0+gitrAUTOINC+b95782f470-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+c107462e4e-r0 to 0:1.0+gitr0+b95782f470-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+b95782f470-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+c107462e4e-r0 to 0:1.0+gitr0+b95782f470-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+b95782f470-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+c107462e4e-r0 to 0:1.0+gitr0+b95782f470-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+b95782f470-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+c107462e4e-r0 to 0:1.0+gitr0+b95782f470-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+b95782f470-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+c107462e4e-r0 to 0:1.0+gitr0+b95782f470-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+b95782f470-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+c107462e4e-r0 to 0:1.0+gitr0+b95782f470-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+b95782f470-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+c107462e4e-r0 to 0:1.0+gitr0+b95782f470-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+b95782f470-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+c107462e4e-r0 to 0:1.0+gitr0+b95782f470-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+b95782f470-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/piglit/1.0+gitrAUTOINC+b95782f470-r0/temp/log.do_packagedata.145222
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============8152009028242550630==--

