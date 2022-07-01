Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305A4CCA48B
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web08.39316.1656687064591022961
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=j8ar9ktw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 01010181ba3e6ffb-abc4b522-6063-4b28-aec7-cbb997b8b71a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687064;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=n8ssZ8kPsFY7fPQgPYVXNx76CyvWtYq0SQe0I7Dp3tk=;
	b=j8ar9ktw8PHQszS8wYLYfda6nfpHZdmxtcHNzfcxc3mq7uFdwc/GksjUdaozcRnF
	+a28PKRH76hruRO9TD7a8sr7HfgKHa8jxNfCXbiU0IwcwjK9jlVqn2ftoE+zHOwr0CS
	OJXMGLxWDOO+aZv3EflL1UOuLUcKcAbCVsQUiLGM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687064;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=n8ssZ8kPsFY7fPQgPYVXNx76CyvWtYq0SQe0I7Dp3tk=;
	b=JFOpPYCPv9E1Bq/RjAPFwLHnEK9IemM+MxxY7jQl5Sks3kMs2Uee2OQ4I/lRNQ1y
	j48e6N8lrIqwj3ZFdygRe15pvHHoMizSaCq5rjypvXDgSj3xMuVbQDjYG7k+CZyX/pb
	MCyybX5etbKF1QZkFy2WPmKRsfeKcybQ5Rh8ODrg=
Content-Type: multipart/mixed; boundary="===============5632098405021074359=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 479b0002d004bc99514d186724b5a4fbfe543370
 SUCCEEDED
Message-ID: 
 <01010181ba3e6ffb-abc4b522-6063-4b28-aec7-cbb997b8b71a-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:03 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167520

--===============5632098405021074359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *479b0002d004bc99514d186724b5a4fbfe543370* has Succeeded.

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
--===============5632098405021074359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1654 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1654 targets, 36 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-7ed334d5727788e605bfa6cbe63ae41a7ae6f7cc"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7ed334d5727788e605bfa6cbe63ae41a7ae6f7cc"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 166 Local 159 Mirrors 0 Missed 7 Current 371 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1579 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_fetch: Succeeded
NOTE: Running task 1897 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1898 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_unpack: Succeeded
NOTE: Running task 1899 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_patch: Succeeded
NOTE: Running task 1900 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1901 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1902 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_populate_lic: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1903 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_configure: Succeeded
NOTE: Running task 1904 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_compile: Succeeded
NOTE: Running task 1905 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_install: Succeeded
NOTE: Running task 1906 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1907 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_package: Succeeded
NOTE: Running task 1908 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1908 tasks of which 1895 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: piglit-1.0+gitrAUTOINC+479b0002d0-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+b84975ef45-r0 to 0:1.0+gitr0+479b0002d0-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+479b0002d0-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+b84975ef45-r0 to 0:1.0+gitr0+479b0002d0-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+479b0002d0-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+b84975ef45-r0 to 0:1.0+gitr0+479b0002d0-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+479b0002d0-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+b84975ef45-r0 to 0:1.0+gitr0+479b0002d0-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+479b0002d0-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+b84975ef45-r0 to 0:1.0+gitr0+479b0002d0-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+479b0002d0-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+b84975ef45-r0 to 0:1.0+gitr0+479b0002d0-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+479b0002d0-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+b84975ef45-r0 to 0:1.0+gitr0+479b0002d0-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+479b0002d0-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+b84975ef45-r0 to 0:1.0+gitr0+479b0002d0-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+479b0002d0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/piglit/1.0+gitrAUTOINC+479b0002d0-r0/temp/log.do_packagedata.2158327
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============5632098405021074359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 70 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-7ed334d5727788e605bfa6cbe63ae41a7ae6f7cc"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7ed334d5727788e605bfa6cbe63ae41a7ae6f7cc"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 36 Local 9 Mirrors 0 Missed 27 Current 501 (25% match, 94% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 527 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1435 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1492 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1514 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: Running task 1515 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe mesa-2_22.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/mesa/2_22.1.2-r0/temp/log.do_packagedata_setscene.2193885
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 536 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_package_setscene)
NOTE: Running task 1554 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1565 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1629 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1631 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1633 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_fetch)
NOTE: Running task 1728 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1835 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1836 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_unpack)
NOTE: Running task 1837 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1838 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: Running task 1839 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1840 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1841 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1842 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1843 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1844 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_package_setscene: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1845 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1846 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1847 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1848 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: Running task 1849 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 24e7bbdb90fcd4b475610092eb7faada85d7d9355d2cd4f7125251b99c42e3bd
NOTE: recipe mesa-2_22.1.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1866 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_packagedata)
NOTE: Running task 1867 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1868 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1869 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_patch: Succeeded
NOTE: Running task 1870 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1871 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1872 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 00ae3e140bff9d4bf56992e3f0254ef198d912fbbea86803225031f7bc9e726e
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1873 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1874 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1875 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f21dc99d20ac7d87594cf6f890075c0c2a720b47039a37779f6a3cf7d22d0088
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1879 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1880 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_install)
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1881 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package)
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1882 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1883 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 1884 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Failed
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1884 tasks of which 1843 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 39 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-mako/1.2.0-r0/temp/log.do_packagedata.2200517
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata) failed with exit code '1'

--===============5632098405021074359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+b84975ef45" to "1.0+gitrAUTOINC+479b0002d0"
packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+b84975ef45 [default] to 1.0+gitrAUTOINC+479b0002d0 [default]
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+b84975ef45" to "1.0+gitrAUTOINC+479b0002d0"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+b84975ef45 to 1.0+gitr0+479b0002d0
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+b84975ef45" to "1.0+gitrAUTOINC+479b0002d0"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+b84975ef45 to 1.0+gitr0+479b0002d0
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+b84975ef45" to "1.0+gitrAUTOINC+479b0002d0"
packages/core2-32-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+b84975ef45-r0'])", added "piglit (['= 1.0+gitr0+479b0002d0-r0'])"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+b84975ef45 to 1.0+gitr0+479b0002d0
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+b84975ef45" to "1.0+gitrAUTOINC+479b0002d0"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+b84975ef45 to 1.0+gitr0+479b0002d0
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+b84975ef45" to "1.0+gitrAUTOINC+479b0002d0"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+b84975ef45 to 1.0+gitr0+479b0002d0
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+b84975ef45" to "1.0+gitrAUTOINC+479b0002d0"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+b84975ef45 to 1.0+gitr0+479b0002d0
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+b84975ef45" to "1.0+gitrAUTOINC+479b0002d0"
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+b84975ef45-r0'])", added "piglit-dev (['= 1.0+gitr0+479b0002d0-r0'])"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+b84975ef45 to 1.0+gitr0+479b0002d0
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/acos.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdxCoarse.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/tanh.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/mid3.vert /usr/lib/piglit/tests/spec/glsl-1.10/execution/vs-loop-complex-with-else-break.shader_test /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/atanh-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/mod.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdxCoarse-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/bu
 iltin-functions/angle-and-trigonometry/tan.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/atanh-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdxFine-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/mod-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/greaterThan-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/exp-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/max3-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/normalize.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/acosh.vert /usr/lib/piglit/tests/spec/amd_gpu_
 shader_half_float/compiler/builtin-functions/vector-relational/equal-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/roundEven-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/tan-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/degrees-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/lessThan-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/degrees-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/frexp.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/min3-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigo
 nometry/asin-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/floor.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/faceforward-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/atan-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidthFine-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/smoothstep-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/asin-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/mix.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidthCoarse-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functio
 ns/angle-and-trigonometry/atanh-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/sign-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidthFine.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidth-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/step.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/log2-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/pow.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/roundEven-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/acosh-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivativ
 e/dFdy-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdyCoarse-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/frexp-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/roundEven.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/trunc-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/conversions-int64.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/lessThanEqual-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/length-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/min3-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/trunc.vert /usr/l
 ib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/notEqual-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/log2-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/floor-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/ldexp-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/normalize-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/roundEven-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/mid3-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/log-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidth.frag /u
 sr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/distance-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/ldexp.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/greaterThanEqual-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/ceil-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/cos.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/equal-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/fract-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtSample.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry
 /asinh-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/round-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/frexp-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/sqrt.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/acosh-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/mix-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidth-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdxFine-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidthCoarse.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minma
 x/min3-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/abs-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidthFine-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/tanh-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/tan-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/step-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/radians-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/reflect.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/smoothstep.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/an
 gle-and-trigonometry/cos-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtOffset-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdy.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdx-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/implicit-conversions-doubles.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdxCoarse-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidthCoarse-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/fract-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/max.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relat
 ional/greaterThanEqual-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/fma.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/sinh-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/dot-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/sin-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/clamp.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/refract-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/lessThanEqual-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/log-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-func
 tions/exponential/inversesqrt-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/inversesqrt.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtCentroid-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/greaterThanEqual-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/pow-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdx-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/lessThan-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/mid3-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/modf-f16vec2.vert /usr/lib/piglit/tests
 /spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdyFine-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdyCoarse-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/sqrt-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/tanh-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/matrix/inverse.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/distance.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/matrix/outerProduct.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/cosh-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/length-f16vec2.vert /usr/lib/piglit/tes
 ts/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/acos-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/faceforward-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/sign-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtOffset-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/cosh-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/mix-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/asinh.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/modf-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidthCoarse-
 f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/max3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidthFine-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/exp2-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/floor-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/pack_float16.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/cosh-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/max-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/pow-f16vec2.vert /usr/lib/piglit/tests/spec/glsl-1.10/execution/loops/glsl-fs-loop-vec4-counter.shader_test /usr/lib/pigli
 t/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/isnan.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/cosh.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/tan-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/degrees-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/asinh-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdx.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/abs-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/reflect-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/acosh-f16vec2.v
 ert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/atan-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdy-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtOffset.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/lessThan-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/min-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/min-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/exp2-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/length.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/notEqu
 al-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/ceil-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/round.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/refract.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/smoothstep-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/cos-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/clamp-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/unpack_float16.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/refract-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtSample-f16vec4.frag 
 /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/mid3-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/refract-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdx-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/sinh-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/isnan-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/normalize-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdyCoarse-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/sin-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-function
 s/common/round-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/sign.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtSample-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/sinh-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/sinh.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/faceforward.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/acos-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/atan.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/smoothstep-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compil
 er/builtin-functions/angle-and-trigonometry/atanh.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/ceil-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/sqrt-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/exp-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/matrix/matrixCompMult.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/isnan-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/acos-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/suffix.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/mod-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/ldexp-f16vec2.vert 
 /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/log-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/ldexp-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/preprocessor/extension-if-1.shader_test /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/matrix/determinant.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/exp2-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/exp.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/asin-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidth-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/log2.vert /usr/lib/piglit/tests/spec/amd_gpu_shade
 r_half_float/compiler/builtin-functions/angle-and-trigonometry/sin.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/frexp-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/isinf-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/dot-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/greaterThan-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/isinf-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/ceil.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/fract.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/equal-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/bui
 ltin-functions/geometric/faceforward-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/trunc-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtOffset-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtCentroid.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdyCoarse.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/min-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/exp2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/dot.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdxFine.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functi
 ons/angle-and-trigonometry/asinh-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/inversesqrt-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/lessThanEqual-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/round-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/sin-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/notEqual-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/isinf-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/min.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/distance-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_fl
 oat/compiler/builtin-functions/interpolation/interpolateAtCentroid-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/min3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/clamp-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdyFine-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/cos-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/reflect-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/reflect-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/mix-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/modf-f16vec3.vert /usr/lib/piglit/tests/spec/amd_
 gpu_shader_half_float/compiler/builtin-functions/derivative/dFdxCoarse-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtCentroid-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtSample-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/isnan-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/cross.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/isinf.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/greaterThan-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/radians-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/de
 grees.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/pow-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/inversesqrt-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/log.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/max-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/abs-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/fma-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/asin.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/atan-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/matrix/transpose.vert /usr/lib/pi
 glit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/trunc-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/conversions.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/abs.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/implicit-conversions.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/sign-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/fract-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/floor-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/max3-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdyFine.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/fma-f1
 6vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdy-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdxFine-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/radians.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/normalize-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/exp-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/mod-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/fma-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/log2-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/max-f16vec4.vert /usr
 /lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/sqrt-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/step-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/clamp-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/tanh-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/step-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/length-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/radians-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/distance-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/dot-f16vec2.vert /
 usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdyFine-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/modf.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/max3-f16vec2.vert"
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+b84975ef45" to "1.0+gitrAUTOINC+479b0002d0"
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2042452991 to 2042567695 (+0%)
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+b84975ef45 to 1.0+gitr0+479b0002d0

--===============5632098405021074359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1654 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1654 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-7ed334d5727788e605bfa6cbe63ae41a7ae6f7cc"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7ed334d5727788e605bfa6cbe63ae41a7ae6f7cc"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 37 Local 10 Mirrors 0 Missed 27 Current 500 (27% match, 94% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 526 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1435 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1492 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1512 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: Running task 1513 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.1.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/mesa/2_22.1.2-r0/temp/log.do_packagedata_setscene.2161699
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 536 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_package_setscene)
NOTE: Running task 1554 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1565 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1629 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1631 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1632 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_fetch)
NOTE: Running task 1728 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1835 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1836 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_unpack)
NOTE: Running task 1837 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_fetch: Succeeded
NOTE: Running task 1838 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1839 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1840 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1841 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1842 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1843 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1844 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_package_setscene: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1845 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1846 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Started
NOTE: Running task 1847 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_unpack: Succeeded
NOTE: Running task 1848 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_compile)
NOTE: Running task 1849 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to ceacde96a943d5e36c69eaeecad218c8f6bf77ab868ef4c4f4c40b6376bbdffe
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1855 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_patch: Succeeded
NOTE: Running task 1856 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1857 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1858 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_populate_lic: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_package_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1870 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_packagedata)
NOTE: Running task 1871 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1872 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1873 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1874 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 00ae3e140bff9d4bf56992e3f0254ef198d912fbbea86803225031f7bc9e726e
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 68885898fa42694decaaa93fb8f5351a974266272251ec3d900503cb2ba7f9b5
NOTE: recipe mesa-2_22.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1878 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1879 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1880 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_install)
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1881 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package)
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1882 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 1883 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1884 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Failed
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1884 tasks of which 1843 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 39 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-mako/1.2.0-r0/temp/log.do_packagedata.2165777
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata) failed with exit code '1'

--===============5632098405021074359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1655 targets, 49 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-7ed334d5727788e605bfa6cbe63ae41a7ae6f7cc"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7ed334d5727788e605bfa6cbe63ae41a7ae6f7cc"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 313 Local 279 Mirrors 0 Missed 34 Current 196 (89% match, 93% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 198 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 200 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 227 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 230 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 232 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 233 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 236 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 237 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 242 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 243 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 244 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running task 753 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_fetch)
NOTE: Running task 785 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_fetch)
NOTE: Running task 790 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 794 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 808 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 819 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 821 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_fetch)
NOTE: Running task 822 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 854 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe python3-pygments-2.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Started
NOTE: recipe kmod-29-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 887 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 888 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_unpack)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 889 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 248 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: Running task 890 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 891 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_fetch: Succeeded
NOTE: Running task 892 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_unpack)
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: Running setscene task 253 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 254 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 255 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 256 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running task 901 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_patch)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 263 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 917 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-29-r0: task do_unpack: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 268 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_22.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 922 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/mesa/2_22.1.2-r0/temp/log.do_packagedata_setscene.2211308
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 275 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_package_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: Running task 927 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 928 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 929 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 930 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_unpack: Succeeded
NOTE: Running task 934 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_patch)
NOTE: Running task 939 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 292 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe kmod-29-r0: task do_patch: Started
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: Running task 966 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 967 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_patch: Succeeded
NOTE: Running task 976 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_deploy_source_date_epoch)
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 977 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_unpack)
NOTE: Running setscene task 304 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 306 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 308 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 983 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 312 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 988 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: Running task 989 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Succeeded
NOTE: Running task 990 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 995 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1004 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe mesa-2_22.1.2-r0: task do_package_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe eudev-3.2.11-r0: task do_patch: Succeeded
NOTE: Running task 1005 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_patch: Succeeded
NOTE: Running task 1006 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1007 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1008 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1009 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1010 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_populate_lic: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 00ae3e140bff9d4bf56992e3f0254ef198d912fbbea86803225031f7bc9e726e
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 321 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.1.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 330 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.111.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 333 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 335 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.111-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 344 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 346 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 351 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.111-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 352 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 357 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 358 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.111-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 363 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 367 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 373 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 375 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 378 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running task 1071 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 383 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 384 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 6728b82399c51746d3fb26f9f0cd45942f82befd320f14c8b0368e7fe1dc57bf
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 388 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 391 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 399 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 400 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 401 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 404 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 405 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 407 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 409 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 412 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 415 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 425 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 433 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 444 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 446 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 449 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 450 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 461 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 468 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 476 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 481 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 486 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 491 of 509 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
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
NOTE: Running task 1623 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_packagedata)
NOTE: Running task 1628 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1699 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_22.1.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1762 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_configure)
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1763 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1764 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe kmod-29-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1765 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_compile)
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1766 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_install)
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1767 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package)
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 1768 of 1811 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Failed
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: recipe kmod-29-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1768 tasks of which 1716 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 39 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-mako/1.2.0-r0/temp/log.do_packagedata.2226052
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata) failed with exit code '1'

--===============5632098405021074359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 63 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-7ed334d5727788e605bfa6cbe63ae41a7ae6f7cc"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7ed334d5727788e605bfa6cbe63ae41a7ae6f7cc"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 35 Local 8 Mirrors 0 Missed 27 Current 498 (22% match, 94% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 524 of 533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1425 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1482 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1504 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: Running task 1505 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe mesa-2_22.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/mesa/2_22.1.2-r0/temp/log.do_packagedata_setscene.2183342
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 532 of 533 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_package_setscene)
NOTE: Running task 1543 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1554 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1617 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1619 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_fetch)
NOTE: Running task 1620 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1714 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1821 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: Running task 1822 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_unpack)
NOTE: Running task 1823 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_fetch: Succeeded
NOTE: Running task 1824 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1825 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1826 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1827 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1828 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1829 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_22.1.2-r0: task do_package_setscene: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1830 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1831 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1832 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1833 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_unpack: Succeeded
NOTE: Running task 1834 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1835 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 1847 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_packagedata)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5a87bce771979224b08661aca9e0f2c5a3c9278fb6b3f8becbeb8c95beab0433
NOTE: Setscene tasks completed
NOTE: Running task 1852 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1854 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1855 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_patch: Succeeded
NOTE: Running task 1856 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1857 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1858 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_populate_lic: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 00ae3e140bff9d4bf56992e3f0254ef198d912fbbea86803225031f7bc9e726e
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1859 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1860 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1861 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to fc785bd9401961ddf48c66e20cc7d64b01053c2960c2558eeebb4f01a6ac1297
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1865 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1866 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_install)
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1867 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1868 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1869 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 1870 of 1897 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Failed
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1870 tasks of which 1829 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 39 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-mako/1.2.0-r0/temp/log.do_packagedata.2187476
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata) failed with exit code '1'

--===============5632098405021074359==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

From 8862221fe31836516470354ede01fde72a24c777 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 10:52:19 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 7b8dc5f0b4..38ededfcf8 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "b84975ef4575d8121dbc50fca72341aad4572cdc"
+SRCREV = "479b0002d004bc99514d186724b5a4fbfe543370"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.31.1


--===============5632098405021074359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1654 targets, 53 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-7ed334d5727788e605bfa6cbe63ae41a7ae6f7cc"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7ed334d5727788e605bfa6cbe63ae41a7ae6f7cc"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 37 Local 10 Mirrors 0 Missed 27 Current 500 (27% match, 94% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 526 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1435 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: recipe mesa-2_22.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1492 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1513 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/mesa/2_22.1.2-r0/temp/log.do_packagedata_setscene.2173401
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 536 of 537 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_package_setscene)
NOTE: Running task 1515 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 1554 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1565 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1629 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1631 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1632 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_fetch)
NOTE: Running task 1728 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1835 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: Running task 1836 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_unpack)
NOTE: Running task 1837 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 1838 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_fetch: Succeeded
NOTE: Running task 1839 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: Running task 1840 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1841 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1842 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1843 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1844 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_22.1.2-r0: task do_package_setscene: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1845 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1846 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1847 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_unpack: Succeeded
NOTE: Running task 1848 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1849 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1850 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 687ea4f02cf2520d1e4f6f05acf6a7c02d4c00ce54cbb04ee3ff9a790a9b0d36
NOTE: recipe mesa-2_22.1.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1867 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.2.bb:do_packagedata)
NOTE: Running task 1868 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1869 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_patch: Succeeded
NOTE: Running task 1870 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1871 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1872 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_22.1.2-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_populate_lic: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1873 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1874 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 00ae3e140bff9d4bf56992e3f0254ef198d912fbbea86803225031f7bc9e726e
NOTE: recipe piglit-1.0+gitrAUTOINC+479b0002d0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1875 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 6b884e10bab8744614c446ec2af7b2429353d31ec97ee2b6763a153ee41e4951
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1879 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1880 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_install)
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1881 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package)
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1882 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1883 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 1884 of 1911 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Failed
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1884 tasks of which 1843 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 39 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.3-r0 to 2:22.1.2-r0) [version-going-backwards]
ERROR: mesa-2_22.1.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.2.1-r0 to 0:1.2.0-r0) [version-going-backwards]
ERROR: python3-mako-1.2.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-mako/1.2.0-r0/temp/log.do_packagedata.2177977
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata) failed with exit code '1'

--===============5632098405021074359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+b84975ef45 to 1.0+gitr0+479b0002d0
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+b84975ef45 to 1.0+gitr0+479b0002d0
packages/core2-32-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+b84975ef45-r0'])", added "piglit (['= 1.0+gitr0+479b0002d0-r0'])"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+b84975ef45 to 1.0+gitr0+479b0002d0
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+b84975ef45 to 1.0+gitr0+479b0002d0
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+b84975ef45 to 1.0+gitr0+479b0002d0
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+b84975ef45 to 1.0+gitr0+479b0002d0
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+b84975ef45-r0'])", added "piglit-dev (['= 1.0+gitr0+479b0002d0-r0'])"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+b84975ef45 to 1.0+gitr0+479b0002d0
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+b84975ef45 to 1.0+gitr0+479b0002d0
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/max3-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtSample-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/distance.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/acos-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/log2-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/normalize-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/smoothstep-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/mix-f16vec2.vert /usr/lib/piglit/tests/s
 pec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/asinh-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/dot.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdyCoarse.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/greaterThan-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/fma.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/asinh-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdyCoarse-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/cosh-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/radians-f16v
 ec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/cross.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/modf-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/exp2-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/matrix/outerProduct.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/tan.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/atanh-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/trunc-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/round-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/reflect.vert /usr/lib/piglit/te
 sts/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/frexp-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/sqrt-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidthFine.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/lessThan-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/atan-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/max-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/radians-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/notEqual-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/ldexp-f16vec4.ve
 rt /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdy-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/exp-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/radians-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/fract-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/ceil.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdyCoarse-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/ldexp.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/isnan-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/tan-f16vec3.vert /usr/lib/p
 iglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/cosh-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/mod-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/fma-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/lessThan-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/greaterThan-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdx-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/greaterThanEqual-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/floor-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/frexp
 .vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/abs-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/acosh-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidthCoarse.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/implicit-conversions.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/min3-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/clamp-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/length-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/reflect-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/min3-f16vec
 2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/radians.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/acos-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/mix.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/lessThanEqual-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/matrix/matrixCompMult.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidthCoarse-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/roundEven-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/acos-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functio
 ns/common/smoothstep-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtCentroid.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/matrix/inverse.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/isnan.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdxFine-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/max3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/pack_float16.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/ldexp-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/modf-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/isinf-f16vec4.vert 
 /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/log2-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdyFine-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/conversions.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/acosh-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/degrees-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/mix-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/sinh-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/dot-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/asinh.vert /us
 r/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/round-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/roundEven-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/asinh-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/ldexp-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/mix-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/round.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/log-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidth-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/tanh-f16vec4.vert /usr/lib/pigl
 it/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/normalize-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/faceforward-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/degrees-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/frexp-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/abs-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/exp-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/log-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/cosh-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtCe
 ntroid-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdy.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/tan-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/trunc.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidthFine-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/conversions-int64.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/atan-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdx.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/sqrt-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/max-f16vec4.vert /usr/lib/piglit/tests/
 spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/acosh-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/exp2-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/distance-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/equal-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/faceforward-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/implicit-conversions-doubles.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/atanh-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/acosh.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/matrix/determinant.vert /usr/li
 b/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/equal-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/isinf-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/sqrt-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/notEqual-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdxFine.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/refract.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/asin-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtCentroid-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/min-f1
 6vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/notEqual-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/fract-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/modf-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/cos-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/floor.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/lessThanEqual-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/dot-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/log-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/in
 terpolateAtOffset-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/step-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/ceil-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/normalize.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/abs-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/sign-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/fract.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtSample.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/ceil-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/refract-f16vec4.vert /usr/lib/
 piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/normalize-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/mod.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdyFine-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/sin-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/log.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/max3-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/min-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtCentroid-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/floor-f16vec4.vert 
 /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/min3-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdyCoarse-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/sign.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/max.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdx-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/atan.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/sinh-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/preprocessor/extension-if-1.shader_test /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/pow.vert /usr/lib/piglit/tests/spec/a
 md_gpu_shader_half_float/compiler/builtin-functions/common/floor-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/refract-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/lessThanEqual-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/dot-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/pow-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/step-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/sinh.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/matrix/transpose.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidthFine-f16vec4.frag /usr/lib/piglit/tests/spec/amd_g
 pu_shader_half_float/compiler/builtin-functions/common/round-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/exp.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/length.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/cosh.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/sqrt.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtOffset-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/distance-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/trunc-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtOffset.frag /usr/lib/piglit/tests/spec/amd_gpu_shader
 _half_float/compiler/builtin-functions/angle-and-trigonometry/cos-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/frexp-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/isinf-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/log2-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdxFine-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidthFine-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/mid3-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/cos.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/exp-f16vec3.vert /usr/lib/piglit/tests/s
 pec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidthCoarse-f16vec3.frag /usr/lib/piglit/tests/spec/glsl-1.10/execution/loops/glsl-fs-loop-vec4-counter.shader_test /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/asin-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdx-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/max3-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/sinh-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/mid3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/fma-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/fract-f16vec3.vert /usr/lib/pi
 glit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/inversesqrt-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/mod-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdyFine-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/min3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdyFine.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/roundEven-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/inversesqrt-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/tan-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/ata
 n-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdxCoarse-f16vec3.frag /usr/lib/piglit/tests/spec/glsl-1.10/execution/vs-loop-complex-with-else-break.shader_test /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidth.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtSample-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/smoothstep-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/clamp.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/reflect-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/greaterThanEqual-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/modf.vert /
 usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/pow-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/mid3-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidth-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/faceforward-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/unpack_float16.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidth-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/inversesqrt-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdxCoarse.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/s
 in.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/ceil-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/clamp-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/roundEven.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/pow-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/length-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/AMD_shader_trinary_minmax/mid3-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/mod-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtOffset-f16vec3.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/length-f16ve
 c4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/acos.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/clamp-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/distance-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/equal-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/cos-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/log2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/greaterThanEqual-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/sin-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-f
 unctions/derivative/dFdxCoarse-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/fwidthCoarse-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/smoothstep.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/isinf.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/asin.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/isnan-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/tanh.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/abs.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/atanh-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geome
 tric/faceforward.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdy-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/asin-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/fma-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/step.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/degrees.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/degrees-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/interpolation/interpolateAtSample-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdy-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builti
 n-functions/geometric/refract-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdxCoarse-f16vec4.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/exp2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/geometric/reflect-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/trunc-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/derivative/dFdxFine-f16vec2.frag /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/sign-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/isnan-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/tanh-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-funct
 ions/exponential/exp2-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/lessThan-f16vec4.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/step-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/min-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/tanh-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/atanh.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/suffix.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/angle-and-trigonometry/sin-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/vector-relational/greaterThan-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/c
 ommon/sign-f16vec2.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/min.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/common/max-f16vec3.vert /usr/lib/piglit/tests/spec/amd_gpu_shader_half_float/compiler/builtin-functions/exponential/inversesqrt.vert"

--===============5632098405021074359==--

