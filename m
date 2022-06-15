Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4080CCA480
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:45 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web09.4391.1655298222872296006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=i/oh0n6f;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 0101018167766642-0fd16adc-0673-479e-8a66-0012e583dfb2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MWetLDfBFVAjerUAefryTpBRNnXe/NLDzdUVrESEGos=;
	b=i/oh0n6fQ7e2aWcdrNGE9m+23OKt1sxbpICpbyc24NZ/62JeLeTsagxdl9Fcyr6X
	J0chZyEYVpi8Uj3W60iaom5oXydJbJJoVYbbttMx2xidY+QYFK32CSUUME6q06W6BLq
	0n/s9rml6QcDYUFBDlUypBItGuuqQYz+JhBwkLH4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MWetLDfBFVAjerUAefryTpBRNnXe/NLDzdUVrESEGos=;
	b=clHUAPHQ9XseN3NOYf8RX8RTFTMrGsFzP8RN9FxOyUNOsTLmMqVcGNzybzFMm7sg
	/JBp+tYXueppbclBgw2FTcwLvIvq5tXNK5jYxsNrw3OlapfLCUULGPe4aRggU9K5Frf
	2TRerjyE/IXN0xAAw+PjVJo6tuXV3pnrCU2k+D8Q=
Content-Type: multipart/mixed; boundary="===============5772143740305938113=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 1d5899d94546ec83941c92f2e08258de0f98e392
 SUCCEEDED
Message-ID: 
 <0101018167766642-0fd16adc-0673-479e-8a66-0012e583dfb2-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166977

--===============5772143740305938113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *1d5899d94546ec83941c92f2e08258de0f98e392* has Succeeded.

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
--===============5772143740305938113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1642 targets, 63 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-4870b65897474546c671d379ebf887f9f2defb50"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4870b65897474546c671d379ebf887f9f2defb50"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 42 Local 10 Mirrors 0 Missed 32 Current 491 (23% match, 93% complete)
Removing 2 stale sstate objects for arch mips32r2...done.
Removing 4 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 496 of 533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 523 of 533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1393 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1444 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1464 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: Running task 1465 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/mesa/2_22.0.3-r0/temp/log.do_packagedata_setscene.3306330
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 532 of 533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_package_setscene)
NOTE: Running task 1543 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1554 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1617 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1620 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1621 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_fetch)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: Running task 1715 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: Running task 1806 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1807 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: Running task 1808 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1809 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1810 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_unpack)
NOTE: Running task 1811 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1812 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: Running task 1818 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.12.0.bb:do_packagedata)
NOTE: Running task 1823 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.12.0-r0: task do_packagedata: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1826 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1827 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Started
NOTE: recipe perl-5.36.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1828 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1829 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1830 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-pygments-2.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1831 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 65b17ebcffa94b7f2b9452d2bd205777f4276a38b65464b4d238b2a804cb2a4d
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1837 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_configure)
NOTE: recipe mesa-2_22.0.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1849 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata)
NOTE: Running task 1850 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1851 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_unpack: Succeeded
NOTE: Running task 1852 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1853 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1854 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1855 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Running task 1856 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1857 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1858 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 656728e8dec0d72a8fab5de1f4fa41bdbcc84231c5c7f67760b54a24cbeee47b
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1861 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1862 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 8725a69c473c86a7826b8ad1d46576fefe90eb36cef4b8e0922ed833b01d9cc3
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1863 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1864 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_install)
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1865 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1866 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package)
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1867 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 1868 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1869 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1870 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1871 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1872 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1873 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1874 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1875 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1876 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1877 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1878 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1879 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1880 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1881 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1882 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1883 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1884 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1885 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1886 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_configure: Succeeded
NOTE: Running task 1887 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1888 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package unihash changed to 5173534c188ee736c38398f404d36541823de57b399582bbc6898eed46d107d2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata became valid
NOTE: Running setscene task 532 of 533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1890 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm unihash changed to 3a9262dead09a9040def64279ddfac96e28433a28c31b83f796312fd6077edc3
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_compile: Succeeded
NOTE: Running task 1891 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_install: Succeeded
NOTE: Running task 1892 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1893 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package: Succeeded
NOTE: Running task 1894 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_packagedata: Succeeded
NOTE: Running task 1895 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1896 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1897 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1897 tasks of which 1825 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5772143740305938113==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

From d32dac582ceba774808652c459a63cf0e940eeb2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 12:11:52 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 08f664ca61..c2e4dcf373 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "a1a1824b38f1d7bfe851633db416c6bed84ba557"
+SRCREV = "1d5899d94546ec83941c92f2e08258de0f98e392"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.31.1


--===============5772143740305938113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1643 targets, 49 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-4870b65897474546c671d379ebf887f9f2defb50"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4870b65897474546c671d379ebf887f9f2defb50"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 313 Local 274 Mirrors 0 Missed 39 Current 196 (87% match, 92% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 198 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 200 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.12.0.bb:do_package_setscene)
NOTE: Running setscene task 202 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 207 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 210 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 211 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 218 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 237 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 241 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 243 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 244 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 246 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 247 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 252 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 254 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running task 753 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_fetch)
NOTE: Running task 785 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_fetch)
NOTE: Running task 790 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 794 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 808 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 819 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 821 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 822 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_fetch)
NOTE: Running task 854 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Started
NOTE: recipe kmod-29-r0: task do_fetch: Started
NOTE: Running task 887 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe perl-5.36.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 888 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_fetch)
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: Running task 889 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 890 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_unpack)
NOTE: recipe kmod-29-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_fetch: Succeeded
NOTE: Running task 891 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: Running setscene task 259 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_setscene)
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 892 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_unpack)
NOTE: Running task 893 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 894 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 264 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata_setscene)
NOTE: Running task 905 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 906 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Started
NOTE: Running setscene task 269 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.36.0-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe kmod-29-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 270 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 271 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 920 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: Running task 921 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 922 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_patch)
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/mesa/2_22.0.3-r0/temp/log.do_packagedata_setscene.3631173
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 277 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_package_setscene)
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Started
NOTE: recipe perl-5.36.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 931 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running task 932 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 941 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 284 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_setscene)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.12.0-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 948 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe kmod-29-r0: task do_unpack: Succeeded
NOTE: Running task 949 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: Running task 950 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_patch)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 291 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running setscene task 299 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 301 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 963 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe kmod-29-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 303 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 964 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 965 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 305 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pygments-2.12.0-r0: task do_package_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 978 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_deploy_source_date_epoch)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 314 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_unpack: Succeeded
NOTE: Running task 995 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_package_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Succeeded
NOTE: Running setscene task 319 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 996 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_unpack)
NOTE: recipe perl-5.36.0-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Started
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1001 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1002 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Succeeded
NOTE: Running task 1007 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1008 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe eudev-3.2.11-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe eudev-3.2.11-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_22.0.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 1009 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 322 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 333 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 336 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 338 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 1019 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1020 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1021 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.36.0-r0: task do_patch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1022 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 343 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 347 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 350 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 352 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 353 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 354 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_lic: Succeeded
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 8725a69c473c86a7826b8ad1d46576fefe90eb36cef4b8e0922ed833b01d9cc3
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 361 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 362 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 366 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 371 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 378 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 380 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 391 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 393 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1091 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 396 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 406 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 407 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 409 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 412 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 415 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 422 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 425 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 430 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 433 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 441 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f4dbf37d0910488479188d663f0d744ffe7d8ddc40ffece8c88dc02c11e5f966
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 458 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 467 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 470 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 473 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 477 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 479 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 482 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 484 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 491 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 496 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 503 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1611 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1623 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata)
NOTE: Running task 1628 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1670 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1697 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1748 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.12.0.bb:do_packagedata)
NOTE: Running task 1750 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata: Started
NOTE: recipe perl-5.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygments-2.12.0-r0: task do_packagedata: Started
NOTE: recipe perl-5.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1753 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_configure)
NOTE: recipe python3-pygments-2.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1754 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_configure)
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1755 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1756 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe kmod-29-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1757 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_compile)
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1758 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_install)
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1759 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package)
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 1760 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1761 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1762 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe kmod-29-r0: task do_configure: Succeeded
NOTE: Running task 1763 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_compile)
NOTE: recipe kmod-29-r0: task do_compile: Started
NOTE: recipe kmod-29-r0: task do_compile: Succeeded
NOTE: Running task 1764 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_install)
NOTE: recipe kmod-29-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1765 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe kmod-29-r0: task do_install: Succeeded
NOTE: Running task 1766 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_populate_sysroot)
NOTE: Running task 1767 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_package)
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: recipe kmod-29-r0: task do_package: Started
NOTE: Running task 1768 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1769 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1770 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1771 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1772 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.11-r0: task do_configure: Started
NOTE: recipe kmod-29-r0: task do_package: Succeeded
NOTE: Running task 1773 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1774 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe kmod-29-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe kmod-29-r0: task do_packagedata: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1775 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1776 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1777 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1778 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1779 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1780 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_configure: Succeeded
NOTE: Running task 1781 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_compile)
NOTE: recipe eudev-3.2.11-r0: task do_compile: Started
NOTE: recipe eudev-3.2.11-r0: task do_compile: Succeeded
NOTE: Running task 1782 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_install)
NOTE: recipe eudev-3.2.11-r0: task do_install: Started
NOTE: recipe eudev-3.2.11-r0: task do_install: Succeeded
NOTE: Running task 1783 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot)
NOTE: Running task 1784 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_package)
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.11-r0: task do_package: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1785 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1786 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe eudev-3.2.11-r0: task do_package: Succeeded
NOTE: Running task 1787 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1788 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1789 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1790 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1791 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1792 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1793 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_configure: Started
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1794 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1795 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.36.0-r0: task do_configure: Succeeded
NOTE: Running task 1796 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_configure_ptest_base)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_configure_ptest_base: Started
NOTE: recipe perl-5.36.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1797 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_compile)
NOTE: recipe perl-5.36.0-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_configure: Succeeded
NOTE: Running task 1798 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_compile: Started
NOTE: recipe perl-5.36.0-r0: task do_compile: Succeeded
NOTE: Running task 1799 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_compile_ptest_base)
NOTE: recipe perl-5.36.0-r0: task do_compile_ptest_base: Started
NOTE: recipe perl-5.36.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1800 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_install)
NOTE: recipe perl-5.36.0-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_compile: Succeeded
NOTE: Running task 1801 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_install: Started
NOTE: recipe perl-5.36.0-r0: task do_install: Succeeded
NOTE: Running task 1802 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_install_ptest_base)
NOTE: recipe perl-5.36.0-r0: task do_install_ptest_base: Started
NOTE: recipe perl-5.36.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1803 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package)
NOTE: recipe perl-5.36.0-r0: task do_package: Started
NOTE: recipe perl-5.36.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package unihash changed to f7196569be4373b1f4892b7419b740c3b2afa889a2ae025c8fc8e41efdefcc4d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata became valid
NOTE: Running setscene task 508 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1805 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm unihash changed to b0336711360db3868589d0028854d2dbb6ff2a13920d461aa22cc05196e5919b
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_install: Succeeded
NOTE: Running task 1806 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1807 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package: Succeeded
NOTE: Running task 1808 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_packagedata: Succeeded
NOTE: Running task 1809 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1810 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1811 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1811 tasks of which 1702 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5772143740305938113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1642 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-4870b65897474546c671d379ebf887f9f2defb50"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4870b65897474546c671d379ebf887f9f2defb50"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 43 Local 10 Mirrors 0 Missed 33 Current 494 (23% match, 93% complete)
Removing 2 stale sstate objects for arch core2-64...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 500 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 527 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1403 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1454 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1474 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/mesa/2_22.0.3-r0/temp/log.do_packagedata_setscene.2981785
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 536 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_package_setscene)
NOTE: Running task 1514 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 1554 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1565 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1629 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1631 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_fetch)
NOTE: Running task 1633 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1729 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: Running task 1820 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1821 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1822 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: Running task 1823 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1824 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_unpack)
NOTE: Running task 1825 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1826 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1831 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata)
NOTE: Running task 1832 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.12.0.bb:do_packagedata)
NOTE: Running task 1837 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-pygments-2.12.0-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1840 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1841 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1842 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.36.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pygments-2.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1843 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1844 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1845 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1846 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5ed870303c0f0e0c6c89ebd0b9380a1e9a66eea011259bf73fe3c430bec67250
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1852 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: Running task 1853 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1865 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata)
NOTE: Running task 1866 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1867 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1868 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1869 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_patch: Succeeded
NOTE: Running task 1870 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1871 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1872 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_generate_toolchain_file: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to b0e3b0d12ad862ed776625cc4e9c3615fd854e96416679a1d13b7b665f13755d
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1875 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 8725a69c473c86a7826b8ad1d46576fefe90eb36cef4b8e0922ed833b01d9cc3
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1876 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1877 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1878 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_install)
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1879 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1880 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package)
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1881 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 1882 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1883 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1884 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1885 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1886 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1887 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1888 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1889 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1890 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1891 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1892 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1893 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1894 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1895 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1896 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1897 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1898 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1899 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1900 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1901 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_configure: Succeeded
NOTE: Running task 1902 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package unihash changed to c047d0b74f5d0791b18d4fcd800d109c0e9ea554a57fb55662bfa6d9ed14ed81
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata became valid
NOTE: Running setscene task 537 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1904 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm unihash changed to 31bf31b058ef52fe5f8b90032b170d19d90550255ea6bd998adbbb306b645861
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_compile: Succeeded
NOTE: Running task 1905 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_install: Succeeded
NOTE: Running task 1906 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1907 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package: Succeeded
NOTE: Running task 1908 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_packagedata: Succeeded
NOTE: Running task 1909 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1910 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1911 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1911 tasks of which 1838 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5772143740305938113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+a1a1824b38 [default] to 1.0+gitrAUTOINC+1d5899d945 [default]
packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+a1a1824b38" to "1.0+gitrAUTOINC+1d5899d945"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+a1a1824b38 to 1.0+gitr0+1d5899d945
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+a1a1824b38" to "1.0+gitrAUTOINC+1d5899d945"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+a1a1824b38 to 1.0+gitr0+1d5899d945
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+a1a1824b38" to "1.0+gitrAUTOINC+1d5899d945"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+a1a1824b38 to 1.0+gitr0+1d5899d945
packages/core2-32-poky-linux/piglit/piglit-dev: RDEPENDS: removed "piglit (['= 1.0+gitr0+a1a1824b38-r0'])", added "piglit (['= 1.0+gitr0+1d5899d945-r0'])"
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+a1a1824b38" to "1.0+gitrAUTOINC+1d5899d945"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+a1a1824b38 to 1.0+gitr0+1d5899d945
packages/core2-32-poky-linux/piglit/piglit-doc: PKGSIZE changed from 23102 to 23133 (+0%)
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+a1a1824b38" to "1.0+gitrAUTOINC+1d5899d945"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+a1a1824b38 to 1.0+gitr0+1d5899d945
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+a1a1824b38" to "1.0+gitrAUTOINC+1d5899d945"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+a1a1824b38 to 1.0+gitr0+1d5899d945
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+a1a1824b38" to "1.0+gitrAUTOINC+1d5899d945"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+a1a1824b38 to 1.0+gitr0+1d5899d945
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+a1a1824b38-r0'])", added "piglit-dev (['= 1.0+gitr0+1d5899d945-r0'])"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+a1a1824b38" to "1.0+gitrAUTOINC+1d5899d945"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+a1a1824b38 to 1.0+gitr0+1d5899d945
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2042452974 to 2042454049 (+0%)
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/glsl-1.10/execution/vs-loop-complex-with-else-break.shader_test"
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+a1a1824b38" to "1.0+gitrAUTOINC+1d5899d945"

--===============5772143740305938113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1642 targets, 53 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-4870b65897474546c671d379ebf887f9f2defb50"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4870b65897474546c671d379ebf887f9f2defb50"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 43 Local 10 Mirrors 0 Missed 33 Current 494 (23% match, 93% complete)
Removing 2 stale sstate objects for arch cortexa15t2hf-neon...done.
Removing 4 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 500 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 527 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1403 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1454 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1475 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: Running task 1476 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/mesa/2_22.0.3-r0/temp/log.do_packagedata_setscene.3144121
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 536 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_package_setscene)
NOTE: Running task 1554 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1565 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1629 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1631 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_fetch)
NOTE: Running task 1632 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1728 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: Running task 1821 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1822 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: Running task 1823 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1824 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_unpack)
NOTE: Running task 1825 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1826 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1827 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: Running task 1831 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.12.0.bb:do_packagedata)
NOTE: Running task 1832 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata)
NOTE: Running task 1837 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.12.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1840 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_patch)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1841 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe perl-5.36.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1842 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1843 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1844 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1845 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to dc0d3db9dacec36b3d96867e3c562f4b22fb5604cc27df94b9d900531a55cd39
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1851 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_configure)
NOTE: recipe mesa-2_22.0.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1863 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata)
NOTE: Running task 1864 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1865 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Started
NOTE: Running task 1866 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1867 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_compile)
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1868 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1869 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_patch: Succeeded
NOTE: Running task 1870 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1871 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1872 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 101b7664e0b3bdada8186be4cb7cfc0075093b0291f572f9b5dc31a118d52e19
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1875 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: Running task 1876 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 8725a69c473c86a7826b8ad1d46576fefe90eb36cef4b8e0922ed833b01d9cc3
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1877 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1878 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_install)
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1879 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1880 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package)
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1881 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 1882 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Started
NOTE: Running task 1883 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1884 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1885 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1886 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1887 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1888 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1889 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1890 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1891 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1892 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1893 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1894 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1895 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1896 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1897 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1898 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1899 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1900 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_configure: Succeeded
NOTE: Running task 1901 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: Running task 1902 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package unihash changed to 26ed68060cac59aa11a2d33b5b3c718126b4a7ba6e0c301155fc43bb1588e62a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata became valid
NOTE: Running setscene task 536 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1904 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm unihash changed to f142918fc1690fc5fd39913f6c89ca7971e7e6599c49cb879e6b017a937f9066
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_compile: Succeeded
NOTE: Running task 1905 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_install: Succeeded
NOTE: Running task 1906 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1907 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package: Succeeded
NOTE: Running task 1908 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_packagedata: Succeeded
NOTE: Running task 1909 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1910 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1911 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1911 tasks of which 1838 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5772143740305938113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+a1a1824b38 to 1.0+gitr0+1d5899d945
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+a1a1824b38 to 1.0+gitr0+1d5899d945
packages/core2-32-poky-linux/piglit/piglit-dev: RDEPENDS: removed "piglit (['= 1.0+gitr0+a1a1824b38-r0'])", added "piglit (['= 1.0+gitr0+1d5899d945-r0'])"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+a1a1824b38 to 1.0+gitr0+1d5899d945
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+a1a1824b38 to 1.0+gitr0+1d5899d945
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+a1a1824b38 to 1.0+gitr0+1d5899d945
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+a1a1824b38 to 1.0+gitr0+1d5899d945
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+a1a1824b38-r0'])", added "piglit-dev (['= 1.0+gitr0+1d5899d945-r0'])"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+a1a1824b38 to 1.0+gitr0+1d5899d945
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+a1a1824b38 to 1.0+gitr0+1d5899d945
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/glsl-1.10/execution/vs-loop-complex-with-else-break.shader_test"

--===============5772143740305938113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1642 targets, 36 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-4870b65897474546c671d379ebf887f9f2defb50"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4870b65897474546c671d379ebf887f9f2defb50"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 165 Local 158 Mirrors 0 Missed 7 Current 372 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1579 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_fetch: Succeeded
NOTE: Running task 1897 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1898 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_unpack: Succeeded
NOTE: Running task 1899 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_patch: Succeeded
NOTE: Running task 1900 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1901 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1902 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_lic: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1903 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_configure: Succeeded
NOTE: Running task 1904 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_compile: Succeeded
NOTE: Running task 1905 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_install: Succeeded
NOTE: Running task 1906 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1907 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package: Succeeded
NOTE: Running task 1908 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1908 tasks of which 1895 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: piglit-1.0+gitrAUTOINC+1d5899d945-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+a1a1824b38-r0 to 0:1.0+gitr0+1d5899d945-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+1d5899d945-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+a1a1824b38-r0 to 0:1.0+gitr0+1d5899d945-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+1d5899d945-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+a1a1824b38-r0 to 0:1.0+gitr0+1d5899d945-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+1d5899d945-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+a1a1824b38-r0 to 0:1.0+gitr0+1d5899d945-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+1d5899d945-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+a1a1824b38-r0 to 0:1.0+gitr0+1d5899d945-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+1d5899d945-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+a1a1824b38-r0 to 0:1.0+gitr0+1d5899d945-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+1d5899d945-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+a1a1824b38-r0 to 0:1.0+gitr0+1d5899d945-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+1d5899d945-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+a1a1824b38-r0 to 0:1.0+gitr0+1d5899d945-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+1d5899d945-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/piglit/1.0+gitrAUTOINC+1d5899d945-r0/temp/log.do_packagedata.2981270
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============5772143740305938113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1642 targets, 70 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-4870b65897474546c671d379ebf887f9f2defb50"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4870b65897474546c671d379ebf887f9f2defb50"
workspace            = "master:ee0d001b8104419798fc129c3ed9769c98b0832c"

Initialising tasks...done.
Sstate summary: Wanted 42 Local 10 Mirrors 0 Missed 32 Current 495 (23% match, 94% complete)
Removing 2 stale sstate objects for arch ppc7400...done.
Removing 4 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 500 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 527 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 1403 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1454 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1476 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/mesa/2_22.0.3-r0/temp/log.do_packagedata_setscene.3468680
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 536 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_package_setscene)
NOTE: Running task 1516 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 1554 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1565 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1629 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1632 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_fetch)
NOTE: Running task 1633 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1729 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: Running task 1819 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1821 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: Running task 1822 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: Running task 1823 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1824 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_unpack)
NOTE: Running task 1825 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1826 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1833 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.12.0.bb:do_packagedata)
NOTE: Running task 1837 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.12.0-r0: task do_packagedata: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1840 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1841 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1842 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.36.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe python3-pygments-2.12.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1843 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1844 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1845 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1846 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 6592d480d8aaae170902a68ee445a1803e9df6f4b3484c7fd1c9bbf86134282f
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1863 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata)
NOTE: Running task 1864 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1865 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1866 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_unpack: Succeeded
NOTE: Running task 1867 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_patch: Started
NOTE: Running task 1868 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1869 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_patch: Succeeded
NOTE: Running task 1870 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: Running task 1871 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1872 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 08abae7ae8354982c1d0ddb8c615ca1c9dda908bb56086f651c88a0eb59290aa
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_generate_toolchain_file: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_lic: Started
NOTE: Running task 1875 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1876 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 8725a69c473c86a7826b8ad1d46576fefe90eb36cef4b8e0922ed833b01d9cc3
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1877 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1878 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_install)
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1879 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: Running task 1880 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package)
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1881 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 1882 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1883 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1884 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1885 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1886 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1887 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1888 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1889 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1890 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1891 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1892 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1893 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1894 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1895 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1896 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1897 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1898 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1899 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1900 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1901 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_configure: Succeeded
NOTE: Running task 1902 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package unihash changed to c520d2a44eaea4ea6643dece068d2d7eab51d08b69cc6af16f5d9187f463495b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata became valid
NOTE: Running setscene task 536 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1904 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm unihash changed to f49c3fcd6c014763bd34702765b9a0c015a3fc856c501a7852442e598880d199
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_compile: Succeeded
NOTE: Running task 1905 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_install: Succeeded
NOTE: Running task 1906 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1907 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package: Succeeded
NOTE: Running task 1908 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_packagedata: Succeeded
NOTE: Running task 1909 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1910 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+1d5899d945-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1911 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1911 tasks of which 1839 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.1-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5772143740305938113==--

