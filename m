Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7353FCCA481
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.616.1654100323854989287
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Uv7heh8R;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 01010181200fee08-29e398b3-86eb-458f-8e3b-090ed5b423f0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QPjIFE3eaEy3uUcqQo3WOyfvdbyw+z9tHL5k6v2ZKK4=;
	b=Uv7heh8RaPq4D3G8/GWVfNwPXRF7IqDftZ5I0b97vvxLhCfyYfOVu+UsmZBcx2Jo
	96Q7AiKEEffIyZrZoCe0vQMd7ByWO1yhRWTaC3QjqRDvXOPqzJoNivKNYNRWiWrgban
	zNT3v189lHg0T8wiIH+iR820r2btZ34W7V0PC+RM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QPjIFE3eaEy3uUcqQo3WOyfvdbyw+z9tHL5k6v2ZKK4=;
	b=aKat9x0fuODlAAc6azRqTfY1Jj3XzFIzeTH0e+sa/3HKMpebg6QGamakeaLQYxDh
	jTZa/wkTirpcFVDoOCnqLDLEv06bmvo3NeKZ/gT9krAckQ+uGR49Lu9bNSEjOutaefU
	naBASlXQN3ovTUGWII81EzQYGLqglLNhQ5E+xMos=
Content-Type: multipart/mixed; boundary="===============2249933854796429385=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to a1a1824b38f1d7bfe851633db416c6bed84ba557
 SUCCEEDED
Message-ID: 
 <01010181200fee08-29e398b3-86eb-458f-8e3b-090ed5b423f0-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:43 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166421

--===============2249933854796429385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *a1a1824b38f1d7bfe851633db416c6bed84ba557* has Succeeded.

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
--===============2249933854796429385==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

From da3d1f92d1616edf35b09a92ef5dc436f2f07e1f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jun 2022 14:07:15 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 28f76fed37..08f664ca61 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "65892137809f7d0d4d7d65dd84af59902b3e7f1e"
+SRCREV = "a1a1824b38f1d7bfe851633db416c6bed84ba557"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.31.1


--===============2249933854796429385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 883 .bb files complete (0 cached, 883 parsed). 1642 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-a961af59372c3ae87ef21849933fb3aa5f341c9c"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a961af59372c3ae87ef21849933fb3aa5f341c9c"
workspace            = "master:95066dde6861ee08fdb505ab3e0422156cc24fae"

Initialising tasks...done.
Sstate summary: Wanted 53 Local 12 Mirrors 0 Missed 41 Current 512 (22% match, 92% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 545 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1408 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1454 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/mesa/2_22.0.3-r0/temp/log.do_packagedata_setscene.2920231
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 564 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_package_setscene)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1494 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 1511 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1513 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_fetch)
NOTE: Running task 1516 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 1534 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1584 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_fetch)
NOTE: Running task 1597 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1636 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1671 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1675 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_fetch)
NOTE: Running task 1676 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_fetch)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_fetch: Started
NOTE: Running task 1800 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_unpack)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_fetch: Started
NOTE: recipe glew-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1854 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_unpack)
NOTE: Running task 1881 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1882 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1883 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 1884 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: recipe glew-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1885 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_patch)
NOTE: Running task 1886 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1887 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_patch)
NOTE: Running task 1888 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_unpack)
NOTE: Running task 1889 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_unpack)
NOTE: Running task 1890 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe glew-2.2.0-r0: task do_patch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1893 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_patch)
NOTE: Running task 1894 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1895 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1896 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glew-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1897 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1898 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1899 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1900 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1901 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1902 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1903 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to e82d54167de6cd911b786b0426fa4bccc1e380bc20788e2233d6300b4af50fa7
NOTE: Running task 1909 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_configure)
NOTE: recipe mesa-2_22.0.3-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: Running task 1921 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1922 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1923 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1924 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_unpack: Succeeded
NOTE: Running task 1925 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1926 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1927 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_patch)
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_patch: Succeeded
NOTE: Running task 1928 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1929 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1930 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Running task 1931 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 1b54e8aa8aee5d3ea5b54e008297ee7bbf3b94e85d7a3a78822315f8cc4766e6
NOTE: Running task 1934 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 14b9a3bea08b17d728499d376c1a689cb3e4811e8aff2bdc8adcf0ce69c823bd
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1935 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1936 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1937 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_install)
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1938 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1939 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1940 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 1941 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1942 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1943 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: Running task 1944 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1945 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1946 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1947 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1948 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1949 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1950 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: Running task 1951 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1952 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1953 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1954 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1955 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 1956 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1957 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1958 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1959 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_configure)
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1960 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_configure: Succeeded
NOTE: Running task 1961 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1962 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1963 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_install)
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 1964 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 1965 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package)
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1966 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1967 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1968 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_compile)
NOTE: recipe glew-2.2.0-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 1969 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_packagedata)
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1970 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 1971 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package)
NOTE: Running task 1972 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_populate_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1973 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1974 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 1975 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_packagedata)
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1976 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1977 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Succeeded
NOTE: Running task 1978 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Succeeded
NOTE: Running task 1979 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1980 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_compile: Succeeded
NOTE: Running task 1981 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_install: Succeeded
NOTE: Running task 1982 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1983 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package: Succeeded
NOTE: Running task 1984 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_packagedata: Succeeded
NOTE: Running task 1985 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1986 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1987 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1987 tasks of which 1885 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2249933854796429385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+6589213780 [default] to 1.0+gitrAUTOINC+a1a1824b38 [default]
packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+6589213780" to "1.0+gitrAUTOINC+a1a1824b38"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+6589213780 to 1.0+gitr0+a1a1824b38
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+6589213780" to "1.0+gitrAUTOINC+a1a1824b38"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+6589213780 to 1.0+gitr0+a1a1824b38
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+6589213780" to "1.0+gitrAUTOINC+a1a1824b38"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+6589213780 to 1.0+gitr0+a1a1824b38
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+6589213780" to "1.0+gitrAUTOINC+a1a1824b38"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+6589213780 to 1.0+gitr0+a1a1824b38
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+6589213780" to "1.0+gitrAUTOINC+a1a1824b38"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+6589213780 to 1.0+gitr0+a1a1824b38
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+6589213780" to "1.0+gitrAUTOINC+a1a1824b38"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+6589213780 to 1.0+gitr0+a1a1824b38
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+6589213780" to "1.0+gitrAUTOINC+a1a1824b38"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+6589213780 to 1.0+gitr0+a1a1824b38
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+6589213780" to "1.0+gitrAUTOINC+a1a1824b38"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+6589213780 to 1.0+gitr0+a1a1824b38
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2042453456 to 2042452974 (-0%)
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+6589213780" to "1.0+gitrAUTOINC+a1a1824b38"

--===============2249933854796429385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+6589213780 to 1.0+gitr0+a1a1824b38
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+6589213780 to 1.0+gitr0+a1a1824b38
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+6589213780 to 1.0+gitr0+a1a1824b38
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+6589213780 to 1.0+gitr0+a1a1824b38
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+6589213780 to 1.0+gitr0+a1a1824b38
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+6589213780 to 1.0+gitr0+a1a1824b38
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+6589213780 to 1.0+gitr0+a1a1824b38
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+6589213780 to 1.0+gitr0+a1a1824b38

--===============2249933854796429385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 883 .bb files complete (0 cached, 883 parsed). 1642 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-a961af59372c3ae87ef21849933fb3aa5f341c9c"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a961af59372c3ae87ef21849933fb3aa5f341c9c"
workspace            = "master:95066dde6861ee08fdb505ab3e0422156cc24fae"

Initialising tasks...done.
Sstate summary: Wanted 52 Local 11 Mirrors 0 Missed 41 Current 509 (21% match, 92% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 542 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1399 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1444 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 1500 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1501 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_fetch)
NOTE: Running task 1521 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1523 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/mesa/2_22.0.3-r0/temp/log.do_packagedata_setscene.2795691
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 560 of 561 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_package_setscene)
NOTE: Running task 1524 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 1569 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1570 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_unpack)
NOTE: Running task 1575 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_fetch)
NOTE: Running task 1588 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1626 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1661 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1664 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_fetch)
NOTE: Running task 1665 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_fetch)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: Running task 1867 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_fetch: Started
NOTE: recipe glew-2.2.0-r0: task do_fetch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe glew-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_fetch: Succeeded
NOTE: Running task 1869 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1870 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 1871 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1872 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: Running task 1873 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1874 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_unpack)
NOTE: Running task 1875 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_unpack)
NOTE: Running task 1876 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_unpack)
NOTE: Running task 1877 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1879 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1880 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1881 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1882 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1883 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_patch)
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1884 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glew-2.2.0-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1885 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1886 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1887 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1888 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1889 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1890 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 4ab42ede2677cce4212c466b3ef30574fd6175351b72ab958f0221ab510b8ca7
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1896 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_compile)
NOTE: recipe mesa-2_22.0.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_unpack: Succeeded
NOTE: Running task 1908 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata)
NOTE: Running task 1909 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1910 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: Running task 1911 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_patch: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1912 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1913 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_patch: Succeeded
NOTE: Running task 1914 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1915 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1916 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1917 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 79d1bd3af41b691337b63d14f116451371696bde00710abdb7b8f2249dbf033a
NOTE: Running task 1920 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 14b9a3bea08b17d728499d376c1a689cb3e4811e8aff2bdc8adcf0ce69c823bd
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1921 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1922 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1923 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_install)
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1924 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package)
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1925 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1926 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 1927 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1928 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1929 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1930 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1931 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1932 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1933 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1934 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1935 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1936 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: Running task 1937 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1938 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1939 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1940 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1941 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 1942 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1943 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1944 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1945 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_configure)
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1946 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_configure: Succeeded
NOTE: Running task 1947 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1948 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1949 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_install)
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 1950 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 1951 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package)
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1952 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1953 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1954 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_compile)
NOTE: recipe glew-2.2.0-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 1955 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_packagedata)
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1956 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 1957 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package)
NOTE: Running task 1958 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_populate_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1959 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1960 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 1961 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_packagedata)
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1962 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1963 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Succeeded
NOTE: Running task 1964 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Succeeded
NOTE: Running task 1965 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1966 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_compile: Succeeded
NOTE: Running task 1967 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_install: Succeeded
NOTE: Running task 1968 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1969 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package: Succeeded
NOTE: Running task 1970 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_packagedata: Succeeded
NOTE: Running task 1971 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1972 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1973 of 1973 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1973 tasks of which 1871 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2249933854796429385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 883 .bb files complete (882 cached, 1 parsed). 1642 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-a961af59372c3ae87ef21849933fb3aa5f341c9c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a961af59372c3ae87ef21849933fb3aa5f341c9c"
workspace            = "master:95066dde6861ee08fdb505ab3e0422156cc24fae"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 11 Mirrors 0 Missed 40 Current 514 (21% match, 92% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 546 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/mesa/2_22.0.3-r0/temp/log.do_packagedata_setscene.2538616
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 564 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_package_setscene)
NOTE: Running task 1408 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1454 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 1510 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1511 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_fetch)
NOTE: Running task 1531 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1582 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_fetch)
NOTE: Running task 1595 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1668 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1671 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_fetch)
NOTE: Running task 1673 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_fetch)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Started
NOTE: Running task 1875 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 1877 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_fetch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Started
NOTE: Running task 1878 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1879 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_unpack)
NOTE: Running task 1880 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1881 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1882 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: Running task 1883 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1884 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_unpack)
NOTE: Running task 1885 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_unpack)
NOTE: Running task 1886 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_unpack)
NOTE: Running task 1887 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1890 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1891 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1892 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_patch)
NOTE: recipe glew-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Started
NOTE: Running task 1893 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1894 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Started
NOTE: recipe glew-2.2.0-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1895 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1896 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1897 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1898 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe glew-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1899 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1900 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1901 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1902 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b0c61aea22dce8f624b85304ab204c1e9684ae296da75745f49b90a50579929e
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1908 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1909 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_unpack: Succeeded
NOTE: Running task 1910 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1911 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_compile)
NOTE: recipe mesa-2_22.0.3-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1923 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Started
NOTE: Running task 1924 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1925 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1926 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_patch: Succeeded
NOTE: Running task 1927 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1928 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1929 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Running task 1930 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_patch)
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 56fac8ee0c7d26483246c4fcb01cc0878f40f2b7f8798514e2447802eab20187
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 14b9a3bea08b17d728499d376c1a689cb3e4811e8aff2bdc8adcf0ce69c823bd
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1934 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1935 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1936 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1937 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_install)
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1938 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1939 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package)
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1940 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1941 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1942 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 1943 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1944 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1945 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1946 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1947 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1948 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1949 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: Running task 1950 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: Running task 1951 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1952 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1953 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1954 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1955 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1956 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 1957 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1958 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1959 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_configure)
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1960 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_configure: Succeeded
NOTE: Running task 1961 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1962 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1963 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_install)
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 1964 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 1965 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package)
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1966 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1967 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1968 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_compile)
NOTE: recipe glew-2.2.0-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 1969 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_packagedata)
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1970 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 1971 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package)
NOTE: Running task 1972 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_populate_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1973 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1974 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 1975 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_packagedata)
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1976 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1977 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Succeeded
NOTE: Running task 1978 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Succeeded
NOTE: Running task 1979 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1980 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_compile: Succeeded
NOTE: Running task 1981 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_install: Succeeded
NOTE: Running task 1982 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1983 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package: Succeeded
NOTE: Running task 1984 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_packagedata: Succeeded
NOTE: Running task 1985 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1986 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1987 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1987 tasks of which 1886 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2249933854796429385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 883 .bb files complete (0 cached, 883 parsed). 1643 targets, 49 skipped, 0 masked, 0 errors.
Removing 77 recipes from the core2-32 sysroot...done.
Removing 86 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-a961af59372c3ae87ef21849933fb3aa5f341c9c"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a961af59372c3ae87ef21849933fb3aa5f341c9c"
workspace            = "master:95066dde6861ee08fdb505ab3e0422156cc24fae"

Initialising tasks...done.
Sstate summary: Wanted 341 Local 293 Mirrors 0 Missed 48 Current 194 (85% match, 91% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 197 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 200 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 205 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 206 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.34.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 207 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 214 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 218 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 238 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 239 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 244 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 246 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 247 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 248 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 256 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 260 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 266 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running task 745 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_fetch)
NOTE: Running task 776 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 777 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_fetch)
NOTE: Running task 782 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 786 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 787 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_fetch)
NOTE: Running task 801 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_fetch)
NOTE: Running task 802 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 813 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 815 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_fetch)
NOTE: Running task 816 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_fetch)
NOTE: recipe python3-pygments-2.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe perl-5.34.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Started
NOTE: recipe kmod-29-r0: task do_fetch: Started
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 880 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_fetch: Started
NOTE: Running task 881 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 882 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_unpack)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Started
NOTE: Running task 883 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe glew-2.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_fetch: Succeeded
NOTE: Running task 884 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_unpack)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 274 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_setscene)
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 277 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe glew-2.2.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 281 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 283 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 286 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 889 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_unpack)
NOTE: Running task 893 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 901 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 910 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 912 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_patch)
NOTE: Running task 921 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_unpack)
NOTE: Running task 922 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_unpack)
NOTE: Running task 926 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 931 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/mesa/2_22.0.3-r0/temp/log.do_packagedata_setscene.3095008
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 300 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_package_setscene)
NOTE: Running task 933 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 934 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_patch)
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe kmod-29-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 939 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_patch)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 944 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 945 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 305 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 957 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 959 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 314 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 316 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 968 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glew-2.2.0-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 974 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 976 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 322 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_packagedata_setscene)
NOTE: Running task 980 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_unpack: Succeeded
NOTE: Running task 982 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Succeeded
NOTE: Running task 983 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 984 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Started
NOTE: Running setscene task 335 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_package_setscene: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 1001 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 340 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running task 1006 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe mesa-2_22.0.3-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1007 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe kmod-29-r0: task do_patch: Succeeded
NOTE: Running task 1008 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_patch: Started
NOTE: Running setscene task 342 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_patch: Succeeded
NOTE: Running task 1013 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_unpack: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1018 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe bash-5.1.16-r0: task do_package_setscene: Succeeded
NOTE: Running task 1019 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: Running setscene task 345 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_patch: Started
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1024 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_patch)
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 347 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_patch: Succeeded
NOTE: Running task 1029 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1030 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1031 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_populate_lic: Succeeded
NOTE: recipe mesa-2_22.0.3-r0: task do_package_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 14b9a3bea08b17d728499d376c1a689cb3e4811e8aff2bdc8adcf0ce69c823bd
NOTE: Running setscene task 354 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 357 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 359 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 361 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 363 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 365 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1045 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 370 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 372 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 378 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 379 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 380 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 389 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 392 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 398 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 402 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 409 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe libx11-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.34.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 412 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.bb:do_populate_sysroot_setscene)
NOTE: Running task 1105 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libx11-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 416 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 419 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Running setscene task 432 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 433 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 434 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 435 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 440 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5e235ef605e849b9e3390b401e97e2494932de8e374032ed4d9ccbf36bcba727
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 445 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 449 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 450 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 452 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.38.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 473 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 477 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 483 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 490 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 491 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 498 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 499 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2022.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 512 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 514 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 517 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 522 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 523 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 529 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 532 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 533 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1641 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata)
NOTE: Running task 1642 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1650 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1661 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1746 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1805 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: Running task 1806 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1809 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_configure)
NOTE: Running task 1810 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe kmod-29-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1811 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_configure)
NOTE: Running task 1812 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1813 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_compile)
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1814 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_install)
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1815 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package)
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 1816 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1817 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1818 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe kmod-29-r0: task do_configure: Succeeded
NOTE: Running task 1819 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_compile)
NOTE: recipe kmod-29-r0: task do_compile: Started
NOTE: recipe kmod-29-r0: task do_compile: Succeeded
NOTE: Running task 1820 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_install)
NOTE: recipe kmod-29-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1821 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe kmod-29-r0: task do_install: Succeeded
NOTE: Running task 1822 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_populate_sysroot)
NOTE: Running task 1823 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_package)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-29-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1824 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: Running task 1825 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: recipe kmod-29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1826 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1827 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_configure: Started
NOTE: recipe kmod-29-r0: task do_package: Succeeded
NOTE: Running task 1828 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_packagedata)
NOTE: recipe kmod-29-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1829 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe kmod-29-r0: task do_packagedata: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1830 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1831 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 1832 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 1833 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1834 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1835 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_configure)
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1836 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_configure: Succeeded
NOTE: Running task 1837 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_compile)
NOTE: recipe eudev-3.2.11-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1838 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1839 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_install)
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 1840 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 1841 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package)
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1842 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.11-r0: task do_compile: Succeeded
NOTE: Running task 1843 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.11-r0: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1844 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1845 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_compile)
NOTE: recipe glew-2.2.0-r0: task do_compile: Started
NOTE: recipe eudev-3.2.11-r0: task do_install: Succeeded
NOTE: Running task 1846 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot)
NOTE: Running task 1847 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_package)
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.11-r0: task do_package: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1848 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1849 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1850 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe eudev-3.2.11-r0: task do_package: Succeeded
NOTE: Running task 1851 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata)
NOTE: recipe eudev-3.2.11-r0: task do_packagedata: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1852 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1853 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1854 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1855 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1856 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1857 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_configure: Started
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1858 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1859 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe glew-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1860 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 1861 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package)
NOTE: Running task 1862 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_populate_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1863 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1864 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 1865 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_packagedata)
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_configure: Succeeded
NOTE: Running task 1866 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1867 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1868 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Succeeded
NOTE: Running task 1869 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Succeeded
NOTE: Running task 1870 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1871 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_compile: Succeeded
NOTE: Running task 1872 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_install: Succeeded
NOTE: Running task 1873 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1874 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package: Succeeded
NOTE: Running task 1875 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_packagedata: Succeeded
NOTE: Running task 1876 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1877 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1878 of 1878 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1878 tasks of which 1749 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2249933854796429385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 883 .bb files complete (0 cached, 883 parsed). 1642 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-a961af59372c3ae87ef21849933fb3aa5f341c9c"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a961af59372c3ae87ef21849933fb3aa5f341c9c"
workspace            = "master:95066dde6861ee08fdb505ab3e0422156cc24fae"

Initialising tasks...done.
Sstate summary: Wanted 52 Local 11 Mirrors 0 Missed 41 Current 513 (21% match, 92% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 546 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1407 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1454 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 1510 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1512 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_fetch)
NOTE: Running task 1531 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe libxmu-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1533 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 1534 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/mesa/2_22.0.3-r0/temp/log.do_packagedata_setscene.2687278
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 564 of 565 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_package_setscene)
NOTE: Running task 1580 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1582 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_unpack)
NOTE: Running task 1586 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_fetch)
NOTE: Running task 1599 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1638 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1673 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1676 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_fetch)
NOTE: Running task 1677 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_fetch)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe glew-2.2.0-r0: task do_fetch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe glew-2.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1881 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_fetch: Started
NOTE: Running task 1882 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_fetch: Succeeded
NOTE: Running task 1883 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_patch)
NOTE: Running task 1884 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1885 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_unpack)
NOTE: Running task 1886 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_unpack)
NOTE: Running task 1887 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_unpack)
NOTE: Running task 1888 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1889 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 1890 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1893 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1894 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: Running task 1895 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_22.0.3-r0: task do_package_setscene: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1896 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Started
NOTE: recipe glew-2.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1897 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_patch)
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1898 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glew-2.2.0-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1899 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1900 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1901 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1902 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1903 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1904 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 3000313df6bda1abdc7383cb1934a1e02bdc4614c2c371572e118046c755cd76
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_unpack: Succeeded
NOTE: Running task 1910 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-mako-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1911 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_patch: Started
NOTE: recipe mesa-2_22.0.3-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 1923 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.3.bb:do_packagedata)
NOTE: Running task 1924 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1925 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_patch: Succeeded
NOTE: Running task 1926 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1927 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1928 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: Running task 1929 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1930 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_generate_toolchain_file: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 14b9a3bea08b17d728499d376c1a689cb3e4811e8aff2bdc8adcf0ce69c823bd
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1931 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.0.3-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e8d93026dbeccfd3e4330a21e6653ae4d7cd62eb97959ec91da1f8f8ed8d1b0d
NOTE: Running task 1934 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1935 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1936 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1937 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_install)
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 1938 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package)
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1939 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1940 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 1941 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1942 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1943 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1944 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe python3-mako-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1945 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1946 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1947 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1948 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1949 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1950 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: Running task 1951 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1952 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1953 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1954 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1955 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: Running task 1956 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: Running task 1957 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1958 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1959 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_configure)
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 1960 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_configure: Succeeded
NOTE: Running task 1961 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1962 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_compile)
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1963 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_install)
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_install: Succeeded
NOTE: Running task 1964 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_populate_sysroot)
NOTE: Running task 1965 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_package)
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1966 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1967 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_configure)
NOTE: recipe glew-2.2.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1968 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_compile)
NOTE: recipe glew-2.2.0-r0: task do_compile: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_package: Succeeded
NOTE: Running task 1969 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxmu_1.1.3.bb:do_packagedata)
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Started
NOTE: recipe libxmu-1_1.1.3-r0: task do_packagedata: Succeeded
NOTE: recipe glew-2.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1970 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_install)
NOTE: recipe glew-2.2.0-r0: task do_install: Started
NOTE: recipe glew-2.2.0-r0: task do_install: Succeeded
NOTE: Running task 1971 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_package)
NOTE: Running task 1972 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_populate_sysroot)
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Started
NOTE: recipe glew-2.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1973 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1974 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_configure)
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Started
NOTE: recipe glew-2.2.0-r0: task do_package: Succeeded
NOTE: Running task 1975 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glew/glew_2.2.0.bb:do_packagedata)
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Started
NOTE: recipe glew-2.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1976 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_compile)
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1977 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_install)
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_install: Succeeded
NOTE: Running task 1978 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package: Succeeded
NOTE: Running task 1979 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1980 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.4.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_compile: Succeeded
NOTE: Running task 1981 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_install: Succeeded
NOTE: Running task 1982 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1983 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package: Succeeded
NOTE: Running task 1984 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_packagedata: Succeeded
NOTE: Running task 1985 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1986 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+a1a1824b38-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1987 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1987 tasks of which 1885 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.0-r0 to 2:22.0.3-r0) [version-going-backwards]
ERROR: mesa-2_22.0.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2249933854796429385==--

