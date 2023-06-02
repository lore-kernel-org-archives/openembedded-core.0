Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0865C88CBE
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:43 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.7636.1685693433378827513
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=E9shGliQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101887b288aed-ffb0203c-939b-4140-8286-5d17dc539e6c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693434;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0aJo6GVPBG5zbo/sAi8o9TujfGFjNyDZk0Y9KJt8BQ4=;
	b=E9shGliQoElJVTYVwYykAq+qUUmG/G4nbQD8mMw6y0xCXQOd+bB9YKOlo0fZAtkm
	q04Ec6Oi6EWxOQoex0cfFIpKWz9DH1iTmVg7lCgg1KDhIbNneFY9JHwUipZ0tp+N1Dl
	gL1Lgl9mxE82HeXnQXhXwXbqiwveWXZx/8HB1AMM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693434;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0aJo6GVPBG5zbo/sAi8o9TujfGFjNyDZk0Y9KJt8BQ4=;
	b=DGMVT5ktuo/Ut6BumW4ABPbKY+5QqGPHRhdvroWSDfBhK+akLoskva4h7Uqn9LzN
	KkVullGhl18+iTBIblCMNI7fJXDwOW1lt0vM7TSoJSl/5N64ezxucD8liJiRP8qzKl3
	AEFtgxx9Nsr+EZXx8EM14X3bhjVoiZjidDYS63yo=
Content-Type: multipart/mixed; boundary="===============1647162058792101051=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 5036601c43fff63f7be5cd8ad7b319a5c1f6652c
 SUCCEEDED
Message-ID: <010101887b288aed-ffb0203c-939b-4140-8286-5d17dc539e6c-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182239

--===============1647162058792101051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *5036601c43fff63f7be5cd8ad7b319a5c1f6652c* has Succeeded.

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
--===============1647162058792101051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:821460a37dfb5e3b183426d36a894719025aff2a"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 50 Local 23 Mirrors 0 Missed 27 Current 498 (46% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 532 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/mesa/2_23.0.3-r0/temp/log.do_packagedata_setscene.1059347
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 547 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_package_setscene)
NOTE: Running task 1482 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1540 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_fetch)
NOTE: Running task 1625 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1679 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_write_config)
NOTE: Running task 1681 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1682 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_fetch)
NOTE: Running task 1712 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Running task 1779 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Started
NOTE: Running task 1857 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1883 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_unpack)
NOTE: Running task 1884 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1885 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: Running task 1886 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_unpack)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_fetch: Succeeded
NOTE: Running task 1887 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1888 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1889 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1890 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1891 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1892 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_patch)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1893 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure_ptest_base)
NOTE: recipe waffle-1.7.2-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1894 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile)
NOTE: recipe waffle-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 1895 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Started
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1896 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1897 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_unpack: Succeeded
NOTE: Running task 1898 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_patch: Started
NOTE: Running task 1899 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1900 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_compile)
NOTE: recipe mesa-2_23.0.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1912 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: Running task 1913 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1914 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_patch: Succeeded
NOTE: Running task 1915 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1916 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1917 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1918 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_generate_toolchain_file: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 30e1b7a6a92d8f424c334d47cb971010328e70dfebd7e00a6990c8fee6474738
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1919 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1920 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile_ptest_base)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1921 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1922 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install)
NOTE: recipe waffle-1.7.2-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Succeeded
NOTE: Running task 1923 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1924 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1925 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1926 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package)
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 1927 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_packagedata)
NOTE: Running task 1928 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_compile)
NOTE: Running task 1929 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.2-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1930 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.2-r0: task do_compile: Succeeded
NOTE: Running task 1931 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_install)
NOTE: recipe waffle-1.7.2-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_install: Succeeded
NOTE: Running task 1932 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_package)
NOTE: Running task 1933 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.2-r0: task do_package: Started
NOTE: recipe waffle-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_package: Succeeded
NOTE: Running task 1934 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_packagedata)
NOTE: recipe waffle-1.7.2-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1935 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1936 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe waffle-1.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe waffle-1.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1937 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1938 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1939 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1940 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1941 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1942 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1943 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1944 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1945 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1946 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1947 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1948 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1949 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_configure: Succeeded
NOTE: Running task 1950 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_compile: Succeeded
NOTE: Running task 1951 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_install: Succeeded
NOTE: Running task 1952 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1953 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package: Succeeded
NOTE: Running task 1954 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_packagedata: Succeeded
NOTE: Running task 1955 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1956 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1957 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1957 tasks of which 1884 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 34 ERROR messages, returning a non-zero exit code.
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-tools went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1647162058792101051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:821460a37dfb5e3b183426d36a894719025aff2a"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 24 Mirrors 0 Missed 27 Current 497 (47% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 532 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/mesa/2_23.0.3-r0/temp/log.do_packagedata_setscene.1149548
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 547 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_package_setscene)
NOTE: Running task 1482 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1540 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_fetch)
NOTE: Running task 1625 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1679 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_write_config)
NOTE: Running task 1682 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_fetch)
NOTE: Running task 1683 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1712 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Running task 1780 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1851 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1883 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_unpack)
NOTE: Running task 1884 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1885 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: Running task 1886 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_unpack)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_fetch: Succeeded
NOTE: Running task 1887 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1888 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1889 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: Running task 1890 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure)
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_package_setscene: Started
NOTE: Running task 1891 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1892 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure_ptest_base)
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1893 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_patch)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1894 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile)
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1895 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 1896 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1897 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_configure)
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Started
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1898 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_unpack: Succeeded
NOTE: Running task 1899 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe mesa-2_23.0.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Started
NOTE: Running task 1911 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata)
NOTE: Running task 1912 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1913 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1914 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_patch: Succeeded
NOTE: Running task 1915 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1916 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1917 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1918 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_lic: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 30e1b7a6a92d8f424c334d47cb971010328e70dfebd7e00a6990c8fee6474738
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1919 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1920 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile_ptest_base)
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1921 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1922 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install)
NOTE: recipe waffle-1.7.2-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1923 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_install)
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Succeeded
NOTE: Running task 1924 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1925 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1926 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package)
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Started
NOTE: recipe waffle-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 1927 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1928 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata)
NOTE: Running task 1929 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_packagedata)
NOTE: recipe waffle-1.7.2-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1930 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.2-r0: task do_compile: Succeeded
NOTE: Running task 1931 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_install)
NOTE: recipe waffle-1.7.2-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_install: Succeeded
NOTE: Running task 1932 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_package)
NOTE: Running task 1933 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.2-r0: task do_package: Started
NOTE: recipe waffle-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_package: Succeeded
NOTE: Running task 1934 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_packagedata: Started
NOTE: Running task 1935 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe waffle-1.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1936 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1937 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1938 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1939 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1940 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1941 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1942 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1943 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1944 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1945 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1946 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1947 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_configure: Succeeded
NOTE: Running task 1948 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1949 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1950 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_compile: Succeeded
NOTE: Running task 1951 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_install: Succeeded
NOTE: Running task 1952 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1953 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package: Succeeded
NOTE: Running task 1954 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_packagedata: Succeeded
NOTE: Running task 1955 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1956 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1957 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1957 tasks of which 1884 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There was 1 WARNING message.
Summary: There were 34 ERROR messages, returning a non-zero exit code.
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-tools went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1647162058792101051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1800 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1800 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:821460a37dfb5e3b183426d36a894719025aff2a"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 177 Local 170 Mirrors 0 Missed 7 Current 371 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1641 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_fetch: Succeeded
NOTE: Running task 1943 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1944 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_unpack: Succeeded
NOTE: Running task 1945 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_patch: Succeeded
NOTE: Running task 1946 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1947 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1948 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_lic: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1949 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_configure: Succeeded
NOTE: Running task 1950 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_compile: Succeeded
NOTE: Running task 1951 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_install: Succeeded
NOTE: Running task 1952 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1953 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package: Succeeded
NOTE: Running task 1954 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1954 tasks of which 1941 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: piglit-1.0+gitrAUTOINC+5036601c43-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+c39bc6062a-r0 to 0:1.0+gitr0+5036601c43-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+5036601c43-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+c39bc6062a-r0 to 0:1.0+gitr0+5036601c43-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+5036601c43-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+c39bc6062a-r0 to 0:1.0+gitr0+5036601c43-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+5036601c43-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+c39bc6062a-r0 to 0:1.0+gitr0+5036601c43-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+5036601c43-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+c39bc6062a-r0 to 0:1.0+gitr0+5036601c43-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+5036601c43-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+c39bc6062a-r0 to 0:1.0+gitr0+5036601c43-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+5036601c43-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+c39bc6062a-r0 to 0:1.0+gitr0+5036601c43-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+5036601c43-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+c39bc6062a-r0 to 0:1.0+gitr0+5036601c43-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+5036601c43-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/piglit/1.0+gitrAUTOINC+5036601c43-r0/temp/log.do_packagedata.1052817
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============1647162058792101051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+c39bc6062a to 1.0+gitr0+5036601c43
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+c39bc6062a to 1.0+gitr0+5036601c43
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+c39bc6062a to 1.0+gitr0+5036601c43
packages/core2-32-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+c39bc6062a-r0'])", added "piglit (['= 1.0+gitr0+5036601c43-r0'])"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+c39bc6062a to 1.0+gitr0+5036601c43
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+c39bc6062a to 1.0+gitr0+5036601c43
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+c39bc6062a to 1.0+gitr0+5036601c43
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+c39bc6062a-r0'])", added "piglit-dev (['= 1.0+gitr0+5036601c43-r0'])"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+c39bc6062a to 1.0+gitr0+5036601c43
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+c39bc6062a to 1.0+gitr0+5036601c43
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/arb_clear_texture-supported-formats /usr/lib/piglit/tests/spec/arb_fragment_program_shadow/tex-shadow2dnotdepth.shader_test /usr/lib/piglit/bin/glx-make-current-other-thread /usr/lib/piglit/bin/glx-copy-context-dest-current"

--===============1647162058792101051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 48 skipped, 0 masked, 0 errors.
Removing 71 recipes from the core2-32 sysroot...done.
Removing 80 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:821460a37dfb5e3b183426d36a894719025aff2a"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 332 Local 306 Mirrors 0 Missed 26 Current 198 (92% match, 95% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 199 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 204 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 205 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 206 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 231 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 234 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 235 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 237 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 239 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 240 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 241 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 252 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 823 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 827 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_fetch)
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 841 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_fetch)
NOTE: Running task 842 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running setscene task 254 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 255 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata_setscene)
NOTE: Running task 853 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_write_config)
NOTE: Running task 855 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_fetch)
NOTE: Running task 856 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 894 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe python3-pygments-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 262 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_fetch: Started
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 947 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_unpack)
NOTE: Running setscene task 265 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 270 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 272 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 273 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 276 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 952 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 953 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_unpack)
NOTE: Running task 954 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_fetch: Succeeded
NOTE: Running task 955 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_unpack)
NOTE: Running task 956 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/mesa/2_23.0.3-r0/temp/log.do_packagedata_setscene.1868618
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 279 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_package_setscene)
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Started
NOTE: Running task 961 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 291 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running task 969 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 978 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_patch)
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 303 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1007 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1008 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1024 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.2-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 321 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 1041 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_package_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 325 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_unpack: Succeeded
NOTE: Running task 1050 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_patch: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1059 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_patch: Succeeded
NOTE: Running task 1060 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1061 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1062 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1063 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_lic: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 30e1b7a6a92d8f424c334d47cb971010328e70dfebd7e00a6990c8fee6474738
NOTE: Running setscene task 338 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 343 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 354 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 357 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 360 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 363 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 365 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 369 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 372 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 376 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 381 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 384 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 387 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 390 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 396 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 400 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 402 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 408 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 409 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 414 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 431 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 434 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 436 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 444 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 446 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 458 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 467 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 468 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 478 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 492 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 495 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 496 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 498 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 500 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 507 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 508 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 515 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 517 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 524 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 527 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 528 of 530 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1691 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata)
NOTE: Running task 1701 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1727 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1743 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1783 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1845 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1846 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1847 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Started
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1848 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1849 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure_ptest_base)
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1850 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_compile)
NOTE: recipe waffle-1.7.2-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1851 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1852 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile_ptest_base)
NOTE: Running task 1853 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1854 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Started
NOTE: recipe waffle-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 1855 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_compile)
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Succeeded
NOTE: Running task 1856 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package)
NOTE: Running task 1857 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install_ptest_base)
NOTE: recipe waffle-1.7.2-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1858 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Started
NOTE: recipe waffle-1.7.2-r0: task do_compile: Succeeded
NOTE: Running task 1859 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_install)
NOTE: recipe waffle-1.7.2-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1860 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Succeeded
NOTE: Running task 1861 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata)
NOTE: recipe waffle-1.7.2-r0: task do_install: Succeeded
NOTE: Running task 1862 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_package)
NOTE: Running task 1863 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_populate_sysroot)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.2-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1864 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_package: Succeeded
NOTE: Running task 1865 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_packagedata)
NOTE: recipe waffle-1.7.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1866 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe waffle-1.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1867 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1868 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1869 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1870 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1871 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1872 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1873 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1874 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1875 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1876 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1877 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1878 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1879 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1880 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_configure: Succeeded
NOTE: Running task 1881 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_compile: Succeeded
NOTE: Running task 1882 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_install: Succeeded
NOTE: Running task 1883 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1884 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package: Succeeded
NOTE: Running task 1885 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_packagedata: Succeeded
NOTE: Running task 1886 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1887 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1888 of 1888 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1888 tasks of which 1812 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There was 1 WARNING message.
Summary: There were 34 ERROR messages, returning a non-zero exit code.
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-tools went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1647162058792101051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 64 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:821460a37dfb5e3b183426d36a894719025aff2a"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 24 Mirrors 0 Missed 27 Current 493 (47% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 528 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 530 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/mesa/2_23.0.3-r0/temp/log.do_packagedata_setscene.1231117
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 543 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_package_setscene)
NOTE: Running task 1472 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1530 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_fetch)
NOTE: Running task 1614 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1667 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_write_config)
NOTE: Running task 1669 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1670 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_fetch)
NOTE: Running task 1700 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Running task 1765 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1826 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1869 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_unpack)
NOTE: Running task 1870 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1871 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1872 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_unpack)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_fetch: Succeeded
NOTE: Running task 1873 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: Running task 1874 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1875 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1876 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_package_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1877 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1878 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure_ptest_base)
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1879 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_patch)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1880 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile)
NOTE: recipe waffle-1.7.2-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1881 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 1882 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1883 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_configure)
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1895 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata)
NOTE: Running task 1896 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1897 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_unpack: Succeeded
NOTE: Running task 1898 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1899 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_patch: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1900 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_patch: Succeeded
NOTE: Running task 1901 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1902 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1903 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_lic: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1904 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1905 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 30e1b7a6a92d8f424c334d47cb971010328e70dfebd7e00a6990c8fee6474738
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1906 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile_ptest_base)
NOTE: Running task 1907 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe waffle-1.7.2-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1908 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1909 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_install)
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Succeeded
NOTE: Running task 1910 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1911 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_package)
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1912 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Started
NOTE: recipe waffle-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 1913 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_compile)
NOTE: recipe waffle-1.7.2-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1914 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata)
NOTE: Running task 1915 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1916 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.2-r0: task do_compile: Succeeded
NOTE: Running task 1917 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_install)
NOTE: recipe waffle-1.7.2-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_install: Succeeded
NOTE: Running task 1918 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_package)
NOTE: Running task 1919 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.2-r0: task do_package: Started
NOTE: recipe waffle-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_package: Succeeded
NOTE: Running task 1920 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1921 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe waffle-1.7.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe waffle-1.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1922 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1923 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1924 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1925 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1926 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1927 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1928 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1929 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1930 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1931 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1932 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1933 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1934 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_configure: Succeeded
NOTE: Running task 1935 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1936 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_compile: Succeeded
NOTE: Running task 1937 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_install: Succeeded
NOTE: Running task 1938 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1939 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package: Succeeded
NOTE: Running task 1940 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_packagedata: Succeeded
NOTE: Running task 1941 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1942 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1943 of 1943 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1943 tasks of which 1870 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 34 ERROR messages, returning a non-zero exit code.
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-tools went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1647162058792101051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1801 targets, 70 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:821460a37dfb5e3b183426d36a894719025aff2a"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 24 Mirrors 0 Missed 27 Current 497 (47% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 532 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/mesa/2_23.0.3-r0/temp/log.do_packagedata_setscene.1313033
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 547 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_package_setscene)
NOTE: Running task 1482 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1540 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_fetch)
NOTE: Running task 1625 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1679 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_write_config)
NOTE: Running task 1681 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1682 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_fetch)
NOTE: Running task 1710 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Running task 1779 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1833 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1883 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_unpack)
NOTE: Running task 1884 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1885 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe waffle-1.7.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: Running task 1886 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_unpack)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_fetch: Succeeded
NOTE: Running task 1887 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe waffle-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1888 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1889 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: Running task 1890 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure)
NOTE: recipe mesa-2_23.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1891 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1892 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_configure_ptest_base)
NOTE: recipe waffle-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1893 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_patch)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1894 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile)
NOTE: recipe waffle-1.7.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1895 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 1896 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1897 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_configure)
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Started
NOTE: recipe waffle-1.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1898 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_compile)
NOTE: recipe mesa-2_23.0.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1910 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata)
NOTE: Running task 1911 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1912 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_unpack: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1913 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1914 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_patch: Succeeded
NOTE: Running task 1915 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: Running task 1916 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1917 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1918 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_lic: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1919 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_lic: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 30e1b7a6a92d8f424c334d47cb971010328e70dfebd7e00a6990c8fee6474738
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1920 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1921 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_compile_ptest_base)
NOTE: recipe waffle-1.7.2-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1922 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1923 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_install)
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install: Succeeded
NOTE: Running task 1924 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1925 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1926 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package)
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Started
NOTE: recipe waffle-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 1927 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_compile)
NOTE: recipe waffle-1.7.2-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_package: Succeeded
NOTE: Running task 1928 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1929 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1930 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.2-r0: task do_compile: Succeeded
NOTE: Running task 1931 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_install)
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.2-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_install: Succeeded
NOTE: Running task 1932 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_package)
NOTE: Running task 1933 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.2-r0: task do_package: Started
NOTE: recipe waffle-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.7.2-r0: task do_package: Succeeded
NOTE: Running task 1934 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_packagedata)
NOTE: recipe waffle-1.7.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1935 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe waffle-1.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1936 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.2.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe waffle-1.7.2-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1937 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1938 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1939 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1940 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1941 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1942 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1943 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1944 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1945 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1946 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1947 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1948 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1949 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_configure: Succeeded
NOTE: Running task 1950 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_compile: Succeeded
NOTE: Running task 1951 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_install: Succeeded
NOTE: Running task 1952 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1953 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package: Succeeded
NOTE: Running task 1954 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_packagedata: Succeeded
NOTE: Running task 1955 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1956 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5036601c43-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1957 of 1957 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1957 tasks of which 1884 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 34 ERROR messages, returning a non-zero exit code.
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglx-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-tools went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:23.1.1-r0 to 2:23.0.3-r0) [version-going-backwards]
ERROR: mesa-2_23.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1647162058792101051==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSA1YWJmODg0MGEzNDI4N2QxZWYyZTlhM2IxMGM1ODkwZGRmZTg0NjE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMiBKdW4gMjAyMyAwMToxOTo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBp
Z2xpdDogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3BpZ2xpdC9waWdsaXRfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWds
aXRfZ2l0LmJiCmluZGV4IDYyNjQ0ODNiZjYuLmNkOTdlZTUzNTQgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKQEAgLTE0LDcgKzE0LDcgQEAgU1JDX1VSSSA9
ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvcGlnbGl0LmdpdDtwcm90b2NvbD1o
dHRwczticmFuY2g9bWEKICAgICAgICAgICAgIgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIx
IgogCi1TUkNSRVYgPSAiYzM5YmM2MDYyYTM3M2MzNzFkOWM4MDc2YTY2YWNiYjI2YzY2MTQ3MSIK
K1NSQ1JFViA9ICI1MDM2NjAxYzQzZmZmNjNmN2JlNWNkOGFkN2IzMTlhNWMxZjY2NTJjIgogIyAo
d2hlbiBQViBnb2VzIGFib3ZlIDEuMCByZW1vdmUgdGhlIHRyYWlsaW5nIHIpCiBQViA9ICIxLjAr
Z2l0ciR7U1JDUFZ9IgogCi0tIAoyLjM5LjIKCg==

--===============1647162058792101051==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+c39bc6062a [default] to 1.0+gitrAUTOINC+5036601c43 [default]
packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+c39bc6062a" to "1.0+gitrAUTOINC+5036601c43"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+c39bc6062a to 1.0+gitr0+5036601c43
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+c39bc6062a" to "1.0+gitrAUTOINC+5036601c43"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+c39bc6062a to 1.0+gitr0+5036601c43
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+c39bc6062a" to "1.0+gitrAUTOINC+5036601c43"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+c39bc6062a to 1.0+gitr0+5036601c43
packages/core2-32-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+c39bc6062a-r0'])", added "piglit (['= 1.0+gitr0+5036601c43-r0'])"
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+c39bc6062a" to "1.0+gitrAUTOINC+5036601c43"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+c39bc6062a to 1.0+gitr0+5036601c43
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+c39bc6062a" to "1.0+gitrAUTOINC+5036601c43"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+c39bc6062a to 1.0+gitr0+5036601c43
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+c39bc6062a" to "1.0+gitrAUTOINC+5036601c43"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+c39bc6062a to 1.0+gitr0+5036601c43
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+c39bc6062a" to "1.0+gitrAUTOINC+5036601c43"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+c39bc6062a to 1.0+gitr0+5036601c43
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+c39bc6062a-r0'])", added "piglit-dev (['= 1.0+gitr0+5036601c43-r0'])"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+c39bc6062a" to "1.0+gitrAUTOINC+5036601c43"
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/arb_fragment_program_shadow/tex-shadow2dnotdepth.shader_test /usr/lib/piglit/bin/glx-make-current-other-thread /usr/lib/piglit/bin/glx-copy-context-dest-current /usr/lib/piglit/bin/arb_clear_texture-supported-formats"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+c39bc6062a to 1.0+gitr0+5036601c43
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2050680448 to 2050727412 (+0%)
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+c39bc6062a" to "1.0+gitrAUTOINC+5036601c43"

--===============1647162058792101051==--

