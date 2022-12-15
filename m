Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E509BC3DA7D
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:34 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.144497.1671136351519799536
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HchItKIy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010185177d1a00-5d3b7386-57e8-4b67-91d8-bcb8df9a03de-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7omwhW/e+75ZT13UG0UNxDILUZZKbpuyJBylWl931x0=;
	b=HchItKIyl0d5LB2VarBFFm4+vuL12SroNMytr5znUWyX6/kuc19WP7yFV9boksRk
	gO/rhbWYbek8ob1UPlkW1rW2Lw70llEwTGVc8y/PZb5KfUSMmSAzr1hCQ2hYIEhniAk
	/B/zpeupA1/kYK9MDO9QUig2W2ov9oR8BnDRzZP0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7omwhW/e+75ZT13UG0UNxDILUZZKbpuyJBylWl931x0=;
	b=ZKgxFPSg+1fMBrXmNbVNe8o7FwWhfHZq1UTmjTFjcFlxOzoHMBiDjqf5rqNQwFaq
	r7lm3d9xzcZB2J+eOj/kP5hA/uGFfEtH0qGaireVozHpU0FsGk3mpTAQ+xvTHp3w5ah
	aoRNzj+HRxufmI8/pcQsjtZVjiEiXELdZ/zIQ0eQ=
Content-Type: multipart/mixed; boundary="===============7625713025271865095=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to d9e0c5fc881fecc71e7c29651ef7c0487b2800eb
 SUCCEEDED
Message-ID: <01010185177d1a00-5d3b7386-57e8-4b67-91d8-bcb8df9a03de-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174687

--===============7625713025271865095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *d9e0c5fc881fecc71e7c29651ef7c0487b2800eb* has Succeeded.

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
--===============7625713025271865095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1672 targets, 71 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c2768ce0e401f0148c61b2c1bf26e57b90689029"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 65 Local 39 Mirrors 0 Missed 26 Current 483 (60% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 496 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_package_setscene)
NOTE: Running task 1474 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1531 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1604 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1672 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1674 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_fetch)
NOTE: Running task 1675 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1770 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Running task 1874 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1875 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 1876 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1877 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1878 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1879 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1880 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_unpack)
NOTE: Running task 1881 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1882 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.9-r0: task do_package_setscene: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1883 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: Running task 1884 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_patch)
NOTE: recipe python3-mako-1.2.3-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1885 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1886 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1887 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 548 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe bash-5.2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1888 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1889 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe bash-5.2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1903 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.3-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_configure: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_package_write_rpm: Started
NOTE: Running task 1906 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_unpack: Succeeded
NOTE: Running task 1907 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-mako-1.2.3-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1908 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1909 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_patch: Succeeded
NOTE: Running task 1910 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1911 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1912 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1913 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1914 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_populate_lic: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to fa7506fcb83d0e89ccab72e9ca138ab71916a101e672e5528ecc8ed3f7c41c4a
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1915 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_install)
NOTE: recipe python3-mako-1.2.3-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1916 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_package)
NOTE: recipe python3-mako-1.2.3-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1917 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1918 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1919 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1920 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe python3-mako-1.2.3-r0: task do_package: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: Running task 1921 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_packagedata: Failed
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1921 tasks of which 1881 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-mako/1.2.3-r0/temp/log.do_packagedata.767740
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_packagedata) failed with exit code '1'

--===============7625713025271865095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1672 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1672 targets, 36 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c2768ce0e401f0148c61b2c1bf26e57b90689029"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 65 Local 39 Mirrors 0 Missed 26 Current 483 (60% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 496 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_package_setscene)
NOTE: Running task 1474 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1531 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1604 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1672 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1675 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1676 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_fetch)
NOTE: Running task 1771 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Running task 1874 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: Running task 1875 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe python3-mako-1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: Running task 1876 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1877 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1878 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1879 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1880 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1881 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_unpack)
NOTE: Running task 1882 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1883 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe bash-5.2.9-r0: task do_package_setscene: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1884 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1885 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1886 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1887 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 548 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-mako-1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1888 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: Running task 1889 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_configure)
NOTE: recipe bash-5.2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.3-r0: task do_configure: Started
NOTE: Running task 1890 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1904 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_package_write_rpm)
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_configure: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1907 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1908 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_patch: Succeeded
NOTE: Running task 1909 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1910 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1911 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1912 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_generate_toolchain_file: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1913 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to fa7506fcb83d0e89ccab72e9ca138ab71916a101e672e5528ecc8ed3f7c41c4a
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1914 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1915 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_install)
NOTE: recipe python3-mako-1.2.3-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1916 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_package)
NOTE: recipe python3-mako-1.2.3-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1917 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1918 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_package: Succeeded
NOTE: Running task 1919 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.3-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1920 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1921 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_packagedata: Failed
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1921 tasks of which 1881 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-mako/1.2.3-r0/temp/log.do_packagedata.630710
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_packagedata) failed with exit code '1'

--===============7625713025271865095==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSAzNDgzOTVkZDc1Y2Q2ZDg5NDUyZmQ4NzRjYzlhZmUyZGE0NGNiZDdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTU6NTY6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
aWdsaXQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIC4uLm4tdC1lbmFibGUtR0xY
LWlmLXRlc3RzLWFyZS1kaXNhYmxlZC5wYXRjaCB8IDMyIC0tLS0tLS0tLS0tLS0tLS0tLS0KIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYiAgICB8ICAzICstCiAyIGZp
bGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzNCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdC8wMDA1LWNtYWtlLURv
bi10LWVuYWJsZS1HTFgtaWYtdGVzdHMtYXJlLWRpc2FibGVkLnBhdGNoCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAwNS1jbWFrZS1Eb24tdC1lbmFi
bGUtR0xYLWlmLXRlc3RzLWFyZS1kaXNhYmxlZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9waWdsaXQvcGlnbGl0LzAwMDUtY21ha2UtRG9uLXQtZW5hYmxlLUdMWC1pZi10ZXN0cy1hcmUt
ZGlzYWJsZWQucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGVmNmZkYTBmNGUu
LjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXQvMDAw
NS1jbWFrZS1Eb24tdC1lbmFibGUtR0xYLWlmLXRlc3RzLWFyZS1kaXNhYmxlZC5wYXRjaAorKysg
L2Rldi9udWxsCkBAIC0xLDMyICswLDAgQEAKLUZyb20gMTNmZjQzZmU3NjBhYzM0M2IzM2Q4ZThj
ODRiODk4ODZhYWMwNzExNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IFRvbSBIb2No
c3RlaW4gPHRvbS5ob2Noc3RlaW5AbnhwLmNvbT4KLURhdGU6IEZyaSwgMyBKdW4gMjAyMiAxMDo0
NDoyOSAtMDUwMAotU3ViamVjdDogW1BBVENIXSBjbWFrZTogRG9uJ3QgZW5hYmxlIEdMWCBpZiB0
ZXN0cyBhcmUgZGlzYWJsZWQKLQotQWxsb3cgYnVpbGRpbmcgZm9yIHN5c3RlbXMgdGhhdCBkb24n
dCBzdXBwb3J0IEdMWC4KLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL3BpZ2xpdC8tL21lcmdlX3JlcXVlc3RzLzcyMF0KLVNp
Z25lZC1vZmYtYnk6IFRvbSBIb2Noc3RlaW4gPHRvbS5ob2Noc3RlaW5AbnhwLmNvbT4KLS0tLQot
IENNYWtlTGlzdHMudHh0IHwgNSArLS0tLQotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgNCBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL0NNYWtlTGlzdHMudHh0IGIvQ01ha2VM
aXN0cy50eHQKLWluZGV4IGUxYWViNWRkZi4uODVlMTcxYWJhIDEwMDY0NAotLS0tIGEvQ01ha2VM
aXN0cy50eHQKLSsrKyBiL0NNYWtlTGlzdHMudHh0Ci1AQCAtMTM0LDEwICsxMzQsNyBAQCBpZihQ
SUdMSVRfQlVJTERfQ0xfVEVTVFMpCi0gZW5kaWYoUElHTElUX0JVSUxEX0NMX1RFU1RTKQotIAot
IElGKCR7Q01BS0VfU1lTVEVNX05BTUV9IE1BVENIRVMgIkxpbnV4IikKLS0JaWYoWDExX0ZPVU5E
IEFORCBPUEVOR0xfZ2xfTElCUkFSWSkKLS0JCSMgQXNzdW1lIHRoZSBzeXN0ZW0gaGFzIEdMWC4g
SW4gdGhlIGZ1dHVyZSwgc3lzdGVtcyBtYXkgZXhpc3QKLS0JCSMgd2l0aCBsaWJHTCBhbmQgbGli
WDExIGJ1dCBubyBHTFgsIGJ1dCB0aGF0IHdvcmxkIGhhc24ndAotLQkJIyBhcnJpdmVkIHlldC4K
LSsJaWYoWDExX0ZPVU5EIEFORCBPUEVOR0xfZ2xfTElCUkFSWSBBTkQgUElHTElUX0JVSUxEX0dM
WF9URVNUUykKLSAJCXNldChQSUdMSVRfSEFTX0dMWCBUcnVlKQotIAkJYWRkX2RlZmluaXRpb25z
KC1EUElHTElUX0hBU19HTFgpCi0gCWVuZGlmKCkKLS0tIAotMi4xNy4xCi0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYiBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYgppbmRleCA4ZDY2ZGY0ZTA5Li4xMTkyMDcw
MWFhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiCkBAIC0x
MCwxMSArMTAsMTAgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21l
c2EvcGlnbGl0LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWEKICAgICAgICAgICAgZmlsZTov
LzAwMDEtY21ha2UtaW5zdGFsbC1iYXNoLWNvbXBsZXRpb25zLWluLXRoZS1yaWdodC1wbGFjZS5w
YXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLWNtYWtlLXVzZS1wcm9wZXItV0FZTEFORF9J
TkNMVURFX0RJUlMtdmFyaWFibGUucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMy10ZXN0
cy11dGlsLXBpZ2xpdC1zaGFkZXIuYy1kby1ub3QtaGFyZGNvZGUtYnVpbGQtcGF0LnBhdGNoIFwK
LSAgICAgICAgICAgZmlsZTovLzAwMDUtY21ha2UtRG9uLXQtZW5hYmxlLUdMWC1pZi10ZXN0cy1h
cmUtZGlzYWJsZWQucGF0Y2ggXAogICAgICAgICAgICAiCiBVUFNUUkVBTV9DSEVDS19DT01NSVRT
ID0gIjEiCiAKLVNSQ1JFViA9ICIxY2Q3MTYxODBjZmI2ZWYwYzFmYzU0NzAyNDYwZWY0OWU1MTE1
NzkxIgorU1JDUkVWID0gImQ5ZTBjNWZjODgxZmVjYzcxZTdjMjk2NTFlZjdjMDQ4N2IyODAwZWIi
CiAjICh3aGVuIFBWIGdvZXMgYWJvdmUgMS4wIHJlbW92ZSB0aGUgdHJhaWxpbmcgcikKIFBWID0g
IjEuMCtnaXRyJHtTUkNQVn0iCiAKLS0gCjIuMzcuMwoK

--===============7625713025271865095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1672 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c2768ce0e401f0148c61b2c1bf26e57b90689029"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 65 Local 39 Mirrors 0 Missed 26 Current 479 (60% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 492 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_package_setscene)
NOTE: Running task 1464 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1521 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1593 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1660 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1663 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_fetch)
NOTE: Running task 1664 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1757 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: Running task 1860 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-mako-1.2.3-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1861 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: Running task 1862 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1863 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1864 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1865 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1866 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_unpack)
NOTE: Running task 1867 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1868 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe bash-5.2.9-r0: task do_package_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1869 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe python3-mako-1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1870 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1871 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe python3-mako-1.2.3-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1872 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1873 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1874 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1875 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe bash-5.2.9-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-mako-1.2.3-r0: task do_configure: Started
NOTE: Running setscene task 544 of 544 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_unpack: Succeeded
NOTE: Running task 1876 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe bash-5.2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_configure: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_patch: Started
NOTE: Running task 1877 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1878 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-mako-1.2.3-r0: task do_compile: Started
NOTE: Running task 1892 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_package_write_rpm)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.9-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_patch: Succeeded
NOTE: Running task 1895 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1896 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1897 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1898 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1899 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to fa7506fcb83d0e89ccab72e9ca138ab71916a101e672e5528ecc8ed3f7c41c4a
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1900 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1901 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_install)
NOTE: recipe python3-mako-1.2.3-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1902 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_package)
NOTE: recipe python3-mako-1.2.3-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1903 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1904 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_package: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1905 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1906 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: Running task 1907 of 1932 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_packagedata: Failed
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1907 tasks of which 1867 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-mako/1.2.3-r0/temp/log.do_packagedata.727166
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_packagedata) failed with exit code '1'

--===============7625713025271865095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+1cd716180c" to "1.0+gitrAUTOINC+d9e0c5fc88"
packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+1cd716180c [default] to 1.0+gitrAUTOINC+d9e0c5fc88 [default]
packages/core2-32-poky-linux/piglit: SRC_URI changed from "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=main file://0001-cmake-install-bash-completions-in-the-right-place.patch file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch file://0005-cmake-Don-t-enable-GLX-if-tests-are-disabled.patch" to "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=main file://0001-cmake-install-bash-completions-in-the-right-place.patch file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+1cd716180c" to "1.0+gitrAUTOINC+d9e0c5fc88"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+d9e0c5fc88
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+1cd716180c" to "1.0+gitrAUTOINC+d9e0c5fc88"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+d9e0c5fc88
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+1cd716180c" to "1.0+gitrAUTOINC+d9e0c5fc88"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+d9e0c5fc88
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+1cd716180c" to "1.0+gitrAUTOINC+d9e0c5fc88"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+d9e0c5fc88
packages/core2-32-poky-linux/piglit/piglit-doc: PKGSIZE changed from 23007 to 22875 (-1%)
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+1cd716180c" to "1.0+gitrAUTOINC+d9e0c5fc88"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+d9e0c5fc88
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+1cd716180c" to "1.0+gitrAUTOINC+d9e0c5fc88"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+d9e0c5fc88
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+1cd716180c" to "1.0+gitrAUTOINC+d9e0c5fc88"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+d9e0c5fc88
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+1cd716180c" to "1.0+gitrAUTOINC+d9e0c5fc88"
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/line-smooth-stipple /usr/lib/piglit/bin/line-smooth-coverage"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+d9e0c5fc88
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2048190259 to 2048217950 (+0%)

--===============7625713025271865095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1673 targets, 49 skipped, 0 masked, 0 errors.
Removing 72 recipes from the core2-32 sysroot...done.
Removing 81 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c2768ce0e401f0148c61b2c1bf26e57b90689029"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 343 Local 317 Mirrors 0 Missed 26 Current 177 (92% match, 95% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 179 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 180 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 182 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 184 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 185 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 186 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 187 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 214 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 215 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 218 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 220 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 221 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 222 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 223 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 224 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 779 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 783 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 797 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 808 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 810 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_fetch)
NOTE: Running task 811 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 843 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-mako-1.2.3-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-mako-1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 876 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: Running task 877 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_unpack)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 896 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_fetch: Succeeded
NOTE: Running setscene task 248 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_setscene)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-mako-1.2.3-r0: task do_unpack: Started
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 250 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe make-4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 251 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 254 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 255 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 258 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 267 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 269 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 270 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 271 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 275 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 276 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 277 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 281 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 285 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 915 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: Running task 918 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 924 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 928 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-mako-1.2.3-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 951 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 293 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.231.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 295 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running task 952 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 297 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 299 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 301 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 305 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-mako-1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 316 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 324 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 330 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_package_setscene)
NOTE: recipe python3-mako-1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 332 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 334 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 335 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 338 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.231.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1022 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 355 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 364 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 369 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Started
NOTE: recipe bash-5.2.9-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1056 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 378 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 381 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 384 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 385 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1069 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_unpack: Succeeded
NOTE: Running task 1074 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1079 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 393 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 397 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 398 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 400 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 401 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 410 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 412 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: Running task 1096 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 418 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1109 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1110 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 421 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 429 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 430 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 434 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 436 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.2.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 438 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_generate_toolchain_file: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_populate_lic: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_populate_lic: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 442 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to fa7506fcb83d0e89ccab72e9ca138ab71916a101e672e5528ecc8ed3f7c41c4a
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 449 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 454 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 457 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 472 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 474 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 477 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 487 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 492 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 494 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 496 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 499 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 504 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 505 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 510 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 515 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 516 of 520 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1671 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1693 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1749 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1807 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: Running task 1808 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.2.9-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1811 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe python3-mako-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1812 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1813 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1814 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe python3-mako-1.2.3-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1815 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe python3-mako-1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1816 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1817 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_package)
NOTE: recipe python3-mako-1.2.3-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1818 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1819 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1820 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_package: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1821 of 1846 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.3-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_packagedata: Failed
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1821 tasks of which 1781 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-mako/1.2.3-r0/temp/log.do_packagedata.897068
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_packagedata) failed with exit code '1'

--===============7625713025271865095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1672 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c2768ce0e401f0148c61b2c1bf26e57b90689029"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 65 Local 39 Mirrors 0 Missed 26 Current 483 (60% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 496 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_package_setscene)
NOTE: Running task 1474 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1531 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1604 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1672 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1674 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1675 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_fetch)
NOTE: Running task 1770 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: Running task 1874 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: Running task 1875 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-mako-1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1876 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: Running task 1877 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1878 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1879 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1880 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1881 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_unpack)
NOTE: Running task 1882 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_unpack: Started
NOTE: recipe bash-5.2.9-r0: task do_package_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1883 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe python3-mako-1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1884 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1885 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1886 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.3-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1887 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.2.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 548 of 548 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1888 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe python3-mako-1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1889 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_configure)
NOTE: recipe bash-5.2.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: Running task 1903 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.3-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_unpack: Succeeded
NOTE: Running task 1906 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_patch: Started
NOTE: recipe bash-5.2.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1907 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1908 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.3-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1909 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_patch: Succeeded
NOTE: Running task 1910 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1911 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1912 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1913 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1914 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to fa7506fcb83d0e89ccab72e9ca138ab71916a101e672e5528ecc8ed3f7c41c4a
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d9e0c5fc88-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1915 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_install)
NOTE: recipe python3-mako-1.2.3-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1916 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_package)
NOTE: recipe python3-mako-1.2.3-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1917 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1918 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_package: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1919 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_packagedata)
NOTE: Running task 1920 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1921 of 1946 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe python3-mako-1.2.3-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-mako-1.2.3-r0: task do_packagedata: Failed
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1921 tasks of which 1881 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-src went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-dbg went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-staticdev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-dev went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-doc went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako-locale went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: QA Issue: Package version for package python3-mako went backwards which would break package feeds (from 0:1.2.4-r0 to 0:1.2.3-r0) [version-going-backwards]
ERROR: python3-mako-1.2.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-mako/1.2.3-r0/temp/log.do_packagedata.681321
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.3.bb:do_packagedata) failed with exit code '1'

--===============7625713025271865095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+d9e0c5fc88
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+d9e0c5fc88
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+d9e0c5fc88
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+d9e0c5fc88
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+d9e0c5fc88
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+d9e0c5fc88
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+d9e0c5fc88
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/line-smooth-coverage /usr/lib/piglit/bin/line-smooth-stipple"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+1cd716180c to 1.0+gitr0+d9e0c5fc88

--===============7625713025271865095==--

