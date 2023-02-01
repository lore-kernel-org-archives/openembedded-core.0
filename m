Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1511DC77B77
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.30355.1675272854493522198
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=NYtlc5WY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101860e0b28f5-18a440ac-cb45-4018-926d-2dfb571b908f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272858;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WgCOUKJZJm0tQo2rKWE3pZ5hjfbEQAjwrAi6Uwo43JM=;
	b=NYtlc5WYbtmEuu9w8Qy9b8IW1oj+ILWAlnRioJ4vE4VjsSzxAEcvmfSoXMbuEiPv
	mp389cFBvFXMMFBsM+Hf15XQghz9kJpDsUW04W4LbmSxhnDocdf0HONLRjjUBO/2BoP
	9a9NRF6g24OsS1tToZ6jwl3W7+nYCZmVhBd+K28w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272858;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WgCOUKJZJm0tQo2rKWE3pZ5hjfbEQAjwrAi6Uwo43JM=;
	b=IXU61VPccv2U+9qzfY4KklTg6AeUE4JaxNCwCj2YOdNfMTC/nUGLHhQ8Mu86PX0S
	yA0uxHzMpnqYzlkdvRhams6QAu+XY44SJ4HBZexuOhVbWW3YVrwaJaw9YMNC6kt1BV9
	NwCvx6YUac0TxNKgTOvwnzZn6bok2drXHwSwY6lA=
Content-Type: multipart/mixed; boundary="===============2261722473965393107=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to acc0e009d0f7e843148205d03fda53ad5f1b7c8c
 SUCCEEDED
Message-ID: <010101860e0b28f5-18a440ac-cb45-4018-926d-2dfb571b908f-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176640

--===============2261722473965393107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *acc0e009d0f7e843148205d03fda53ad5f1b7c8c* has Succeeded.

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
--===============2261722473965393107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 75 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2f2957efa1684430df9e3dadf06ae927dcf61310"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 88 Local 8 Mirrors 0 Missed 80 Current 464 (9% match, 85% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1131 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: Running task 1132 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 1141 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_fetch)
NOTE: Running task 1149 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: Running task 1152 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 1181 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_fetch)
NOTE: Running task 1186 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_fetch)
NOTE: Running task 1198 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_fetch)
NOTE: Running task 1203 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: Running task 1204 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: Running task 1205 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: Running task 1206 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: Running task 1231 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_fetch)
NOTE: Running task 1298 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_write_config)
NOTE: Running task 1357 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_write_config)
NOTE: Running task 1386 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_fetch: Started
NOTE: Running task 1439 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: Running task 1496 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: Running task 1509 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: Running task 1510 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: Running task 1511 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_fetch: Started
NOTE: Running task 1512 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1513 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 1514 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.114-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_fetch: Started
NOTE: Running task 1515 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_unpack)
NOTE: Running task 1516 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_write_config: Started
NOTE: Running task 1517 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_unpack)
NOTE: Running task 1518 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Running task 1519 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_unpack)
NOTE: Running task 1520 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: Running task 1521 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_fetch: Succeeded
NOTE: Running task 1522 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: Running task 1523 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: Running task 1524 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_unpack)
NOTE: Running task 1525 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_22.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1526 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_unpack)
NOTE: Running task 1527 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_write_config: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: Running task 1528 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.114-r0: task do_write_config: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: Running task 1586 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1588 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1589 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_fetch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: Running task 1620 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure)
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1687 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_unpack: Started
NOTE: Running task 1711 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: recipe libdrm-2.4.114-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1747 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1764 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_configure)
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 1788 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: Running task 1789 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1790 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: Running task 1791 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1792 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Succeeded
NOTE: Running task 1793 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: Running task 1794 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_patch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_unpack: Started
NOTE: Running task 1795 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1796 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Started
NOTE: Running task 1797 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_unpack)
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1798 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: Running task 1799 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_unpack: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: Running task 1800 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: Running task 1801 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: Running task 1802 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: Running task 1803 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure_ptest_base)
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1804 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_patch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_patch: Started
NOTE: Running task 1805 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: Running task 1806 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1807 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_compile)
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1808 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1809 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.114-r0: task do_patch: Succeeded
NOTE: Running task 1810 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1811 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_deploy_source_date_epoch)
NOTE: Running task 1812 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1813 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1814 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1815 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1816 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_patch)
NOTE: recipe libdrm-2.4.114-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1817 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1818 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1819 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1820 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: recipe libdrm-2.4.114-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1821 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_patch: Succeeded
NOTE: Running task 1822 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 1823 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_configure)
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1824 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1825 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1826 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_configure)
NOTE: Running task 1827 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1828 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1829 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1830 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_configure)
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1831 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1832 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_configure: Succeeded
NOTE: Running task 1833 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_compile)
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_unpack: Succeeded
NOTE: Running task 1834 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1835 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 1836 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_unpack: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_patch: Succeeded
NOTE: Running task 1837 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_patch)
NOTE: Running task 1838 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: Running task 1839 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1840 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1841 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_generate_toolchain_file: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_populate_lic: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1842 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile_ptest_base)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 82da922bf9bc2330f0e37545ce664d46f83e27db515d6f5e148660e3b901df93
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1843 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1844 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install)
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_install: Succeeded
NOTE: Running task 1845 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_install)
NOTE: Running task 1846 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_populate_sysroot)
NOTE: Running task 1847 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_patch: Succeeded
NOTE: Running task 1848 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_package: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Succeeded
NOTE: Running task 1849 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install_ptest_base)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1850 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1851 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_install)
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1852 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_package: Succeeded
NOTE: Running task 1853 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_packagedata: Started
NOTE: Running task 1854 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package)
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Succeeded
NOTE: Running task 1855 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Failed
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1855 tasks of which 1741 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-src went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-dbg went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-ptest went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-staticdev went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-dev went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-doc went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-locale went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-markupsafe/2.1.1-r0/temp/log.do_packagedata.18809
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata) failed with exit code '1'

--===============2261722473965393107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1698 targets, 52 skipped, 0 masked, 0 errors.
Removing 73 recipes from the core2-32 sysroot...done.
Removing 82 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2f2957efa1684430df9e3dadf06ae927dcf61310"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 324 Local 228 Mirrors 0 Missed 96 Current 200 (70% match, 81% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 205 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 208 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 209 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 213 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 214 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 215 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 239 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 240 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 251 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 252 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 253 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 284 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 289 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 308 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 320 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 322 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 328 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 339 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 345 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 693 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_fetch)
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 748 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_write_config)
NOTE: Running task 749 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: Running task 750 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 751 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_fetch)
NOTE: Running task 752 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: Running task 753 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 757 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_fetch)
NOTE: Running task 759 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_fetch)
NOTE: Running task 762 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_fetch)
NOTE: Running task 763 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: Running task 764 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: Running task 765 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: Running task 766 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: Running task 777 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_fetch)
NOTE: Running task 800 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_write_config)
NOTE: Running task 843 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_write_config)
NOTE: Running task 844 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_fetch)
NOTE: Running task 853 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 855 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_fetch)
NOTE: Running task 858 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 861 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_fetch)
NOTE: Running task 880 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_fetch)
NOTE: Running task 881 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 894 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_write_config)
NOTE: Running task 895 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 897 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 898 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_fetch)
NOTE: recipe make-4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 356 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 905 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_write_config)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 938 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_fetch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: Running task 941 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 989 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_unpack)
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: Running task 991 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_fetch: Succeeded
NOTE: Running task 992 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_unpack)
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 993 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: Running task 994 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_fetch: Succeeded
NOTE: Running task 995 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 996 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 997 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: Running task 998 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_unpack)
NOTE: Running task 999 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Started
NOTE: Running task 1000 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.37-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Started
NOTE: Running task 1001 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Started
NOTE: Running task 1002 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_write_config: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: Running task 1003 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_unpack)
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1004 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_fetch: Succeeded
NOTE: Running task 1005 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 1006 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_unpack)
NOTE: Running task 1007 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_unpack)
NOTE: Running task 1008 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_unpack)
NOTE: Running task 1009 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_unpack)
NOTE: Running task 1010 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_unpack)
NOTE: recipe mesa-2_22.3.3-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1011 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_unpack)
NOTE: Running task 1016 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.114-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.114-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Started
NOTE: Running task 1021 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_write_config: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_unpack: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 367 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: Running setscene task 368 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 369 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.11-r0: task do_unpack: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1030 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_patch)
NOTE: Running task 1031 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1032 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_patch)
NOTE: recipe mesa-2_22.3.3-r0: task do_unpack: Started
NOTE: Running task 1033 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 1034 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: Running task 1035 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1036 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_patch)
NOTE: Running task 1037 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: recipe libdrm-2.4.114-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 1038 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1039 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_patch)
NOTE: Running task 1040 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: Running task 1041 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1042 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: Running setscene task 376 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1043 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_unpack: Succeeded
NOTE: Running task 1044 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe eudev-3.2.11-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe wayland-1.21.0-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: Running task 1046 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_patch)
NOTE: recipe libdrm-2.4.114-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 400 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 402 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 410 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata_setscene)
NOTE: Running task 1063 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 414 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 415 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 421 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 422 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1069 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1072 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1073 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running task 1075 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1076 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_deploy_source_date_epoch)
NOTE: Running task 1077 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_patch)
NOTE: Running task 1078 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1079 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: Running task 1080 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Started
NOTE: Running task 1081 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1087 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: Running task 1089 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_patch)
NOTE: Running task 1090 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1094 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1095 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_patch)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_patch: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: Running task 1096 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_patch: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1097 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_deploy_source_date_epoch)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Started
NOTE: Running task 1098 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_patch: Succeeded
NOTE: Running task 1103 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1104 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 1105 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 430 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 434 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1111 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 1112 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 444 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 451 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1166 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_package_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_unpack: Succeeded
NOTE: Running task 1175 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_patch: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_unpack: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1176 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_patch)
NOTE: Running task 1177 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 464 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_patch: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_package_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_patch: Succeeded
NOTE: Running task 1182 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1183 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running setscene task 469 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1184 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_generate_toolchain_file: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_populate_lic: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1185 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 82da922bf9bc2330f0e37545ce664d46f83e27db515d6f5e148660e3b901df93
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_patch: Succeeded
NOTE: Running task 1202 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 484 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 494 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 501 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 511 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 518 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 521 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 522 of 524 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1487 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1501 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1514 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1533 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1534 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1545 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1568 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1589 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1601 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1626 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1649 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1677 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1698 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm)
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Started
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1701 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1702 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_configure)
NOTE: Running task 1703 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_configure)
NOTE: Running task 1704 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1705 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1706 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_configure)
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Started
NOTE: Running task 1707 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Started
NOTE: recipe eudev-3.2.11-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1708 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1709 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure)
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1710 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_configure)
NOTE: recipe python3-pygments-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1711 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_configure)
NOTE: recipe wayland-1.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1712 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_configure)
NOTE: recipe xkeyboard-config-2.37-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_configure: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Started
NOTE: Running task 1713 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_compile)
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Started
NOTE: recipe wayland-1.21.0-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_compile: Started
NOTE: Running task 1714 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure_ptest_base)
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1715 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_compile)
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1716 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 1717 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1718 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_install: Succeeded
NOTE: Running task 1719 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_populate_sysroot)
NOTE: Running task 1720 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_package)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_configure: Succeeded
NOTE: Running task 1721 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_compile)
NOTE: recipe xkeyboard-config-2.37-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1722 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_install)
NOTE: Running task 1723 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile_ptest_base)
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1724 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_install)
NOTE: recipe xkeyboard-config-2.37-r0: task do_compile: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1725 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_install)
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Started
NOTE: Running task 1726 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_package: Succeeded
NOTE: Running task 1727 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_packagedata: Started
NOTE: recipe wayland-1.21.0-r0: task do_configure: Succeeded
NOTE: Running task 1728 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_configure_ptest_base)
NOTE: recipe wayland-1.21.0-r0: task do_configure_ptest_base: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_packagedata: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1729 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Succeeded
NOTE: Running task 1730 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1731 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package)
NOTE: recipe wayland-1.21.0-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1732 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_install: Succeeded
NOTE: Running task 1733 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_populate_sysroot)
NOTE: Running task 1734 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_package)
NOTE: recipe xkeyboard-config-2.37-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_package: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1735 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package)
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_compile: Succeeded
NOTE: Running task 1736 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_compile_ptest_base)
NOTE: recipe wayland-1.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1737 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_install)
NOTE: Running task 1738 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Started
NOTE: recipe wayland-1.21.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Succeeded
NOTE: Running task 1739 of 1864 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Failed
NOTE: recipe wayland-1.21.0-r0: task do_install: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Succeeded
NOTE: recipe xkeyboard-config-2.37-r0: task do_package: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_configure: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1739 tasks of which 1583 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-src went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-dbg went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-ptest went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-staticdev went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-dev went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-doc went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-locale went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-markupsafe/2.1.1-r0/temp/log.do_packagedata.53580
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata) failed with exit code '1'

--===============2261722473965393107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1697 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2f2957efa1684430df9e3dadf06ae927dcf61310"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 175 Local 168 Mirrors 0 Missed 7 Current 377 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1632 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_fetch: Succeeded
NOTE: Running task 1950 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1951 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_unpack: Succeeded
NOTE: Running task 1952 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_patch: Succeeded
NOTE: Running task 1953 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1954 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1955 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_populate_lic: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1956 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_configure: Succeeded
NOTE: Running task 1957 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_compile: Succeeded
NOTE: Running task 1958 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_install: Succeeded
NOTE: Running task 1959 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1960 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_package: Succeeded
NOTE: Running task 1961 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1961 tasks of which 1948 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: piglit-1.0+gitrAUTOINC+acc0e009d0-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+e300648a80-r0 to 0:1.0+gitr0+acc0e009d0-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+acc0e009d0-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+e300648a80-r0 to 0:1.0+gitr0+acc0e009d0-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+acc0e009d0-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+e300648a80-r0 to 0:1.0+gitr0+acc0e009d0-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+acc0e009d0-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+e300648a80-r0 to 0:1.0+gitr0+acc0e009d0-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+acc0e009d0-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+e300648a80-r0 to 0:1.0+gitr0+acc0e009d0-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+acc0e009d0-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+e300648a80-r0 to 0:1.0+gitr0+acc0e009d0-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+acc0e009d0-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+e300648a80-r0 to 0:1.0+gitr0+acc0e009d0-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+acc0e009d0-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+e300648a80-r0 to 0:1.0+gitr0+acc0e009d0-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+acc0e009d0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/piglit/1.0+gitrAUTOINC+acc0e009d0-r0/temp/log.do_packagedata.4143309
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============2261722473965393107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 58 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2f2957efa1684430df9e3dadf06ae927dcf61310"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 88 Local 8 Mirrors 0 Missed 80 Current 464 (9% match, 85% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1131 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: Running task 1132 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 1141 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_fetch)
NOTE: Running task 1149 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: Running task 1152 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 1181 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_fetch)
NOTE: Running task 1186 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_fetch)
NOTE: Running task 1198 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_fetch)
NOTE: Running task 1203 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: Running task 1204 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: Running task 1205 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: Running task 1206 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: Running task 1231 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_fetch)
NOTE: Running task 1298 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_write_config)
NOTE: Running task 1357 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_write_config)
NOTE: Running task 1386 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1439 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: Running task 1496 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1552 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: Running task 1553 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: Running task 1554 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.114-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Succeeded
NOTE: Running task 1555 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: Running task 1556 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: Running task 1557 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 1558 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_unpack)
NOTE: Running task 1559 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.114-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_fetch: Started
NOTE: Running task 1560 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_unpack)
NOTE: Running task 1561 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_fetch: Succeeded
NOTE: Running task 1562 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_unpack)
NOTE: Running task 1563 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.114-r0: task do_write_config: Started
NOTE: Running task 1564 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: Running task 1565 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Running task 1566 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_unpack)
NOTE: Running task 1567 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: Running task 1568 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1569 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_22.3.3-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1570 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_unpack)
NOTE: Running task 1571 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 1586 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: Running task 1589 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1590 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_fetch)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_fetch: Started
NOTE: Running task 1620 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure)
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.114-r0: task do_write_config: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1688 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_write_config: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1754 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1763 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_configure)
NOTE: recipe libdrm-2.4.114-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: Running task 1785 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: Running task 1788 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_unpack: Started
NOTE: Running task 1789 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1790 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1791 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1792 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: Running task 1793 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_patch)
NOTE: Running task 1794 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1795 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: Running task 1796 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1797 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: Running task 1798 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: Running task 1799 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_unpack)
NOTE: Running task 1800 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.114-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Started
NOTE: Running task 1801 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: Running task 1802 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: Running task 1803 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure_ptest_base)
NOTE: recipe libdrm-2.4.114-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1804 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1805 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1806 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1807 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1808 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_patch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1809 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1810 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1811 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1812 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1813 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1814 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_patch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running task 1815 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1816 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_patch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1817 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1818 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1819 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_patch: Succeeded
NOTE: Running task 1820 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1821 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Started
NOTE: Running task 1822 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_patch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1823 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 1824 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1825 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_configure)
NOTE: recipe libdrm-2.4.114-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1826 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1827 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1828 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_configure)
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1829 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Started
NOTE: Running task 1830 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1831 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_configure: Succeeded
NOTE: Running task 1832 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_configure)
NOTE: Running task 1833 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_unpack: Succeeded
NOTE: Running task 1834 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_patch: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1835 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 1836 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_install)
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_patch: Started
NOTE: Running task 1837 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_patch: Succeeded
NOTE: Running task 1838 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1839 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1840 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1841 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_compile)
NOTE: Running task 1842 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_populate_lic: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1843 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile_ptest_base)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 82da922bf9bc2330f0e37545ce664d46f83e27db515d6f5e148660e3b901df93
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1844 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1845 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_22.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1846 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_install: Succeeded
NOTE: Running task 1847 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_populate_sysroot)
NOTE: Running task 1848 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Succeeded
NOTE: Running task 1849 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1850 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1851 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_package: Succeeded
NOTE: Running task 1852 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1853 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_install)
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1854 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package)
NOTE: Running task 1855 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Failed
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1855 tasks of which 1741 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-src went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-dbg went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-ptest went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-staticdev went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-dev went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-doc went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-locale went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-markupsafe/2.1.1-r0/temp/log.do_packagedata.4171722
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata) failed with exit code '1'

--===============2261722473965393107==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSAxNGVkN2NjNjU4MGQ4ZTkwZTFjNmNkMGEwZDk3Nzg0YzUwMjBhZTE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNTozNDo0NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBp
Z2xpdDogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3BpZ2xpdC9waWdsaXRfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWds
aXRfZ2l0LmJiCmluZGV4IDc4NThmYTBiMDguLmIxMmRkNDZlYTAgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKQEAgLTEzLDcgKzEzLDcgQEAgU1JDX1VSSSA9
ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvcGlnbGl0LmdpdDtwcm90b2NvbD1o
dHRwczticmFuY2g9bWEKICAgICAgICAgICAgIgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIx
IgogCi1TUkNSRVYgPSAiZTMwMDY0OGE4MDVkNjIxMDFkZTM0MTIzMmQ5OWJmZWMxY2NlNzhjNSIK
K1NSQ1JFViA9ICJhY2MwZTAwOWQwZjdlODQzMTQ4MjA1ZDAzZmRhNTNhZDVmMWI3YzhjIgogIyAo
d2hlbiBQViBnb2VzIGFib3ZlIDEuMCByZW1vdmUgdGhlIHRyYWlsaW5nIHIpCiBQViA9ICIxLjAr
Z2l0ciR7U1JDUFZ9IgogCi0tIAoyLjM3LjMKCg==

--===============2261722473965393107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+e300648a80" to "1.0+gitrAUTOINC+acc0e009d0"
packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+e300648a80 [default] to 1.0+gitrAUTOINC+acc0e009d0 [default]
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+e300648a80" to "1.0+gitrAUTOINC+acc0e009d0"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+acc0e009d0
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+e300648a80" to "1.0+gitrAUTOINC+acc0e009d0"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+acc0e009d0
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+e300648a80" to "1.0+gitrAUTOINC+acc0e009d0"
packages/core2-32-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+e300648a80-r0'])", added "piglit (['= 1.0+gitr0+acc0e009d0-r0'])"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+acc0e009d0
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+e300648a80" to "1.0+gitrAUTOINC+acc0e009d0"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+acc0e009d0
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+e300648a80" to "1.0+gitrAUTOINC+acc0e009d0"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+acc0e009d0
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+e300648a80" to "1.0+gitrAUTOINC+acc0e009d0"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+acc0e009d0
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+e300648a80-r0'])", added "piglit-dev (['= 1.0+gitr0+acc0e009d0-r0'])"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+e300648a80" to "1.0+gitrAUTOINC+acc0e009d0"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+acc0e009d0
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+e300648a80" to "1.0+gitrAUTOINC+acc0e009d0"
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/cl/program/execute/non-entry-block-alloca.cl /usr/lib/piglit/tests/spec/glsl-1.10/execution/variable-indexing/vs-output-array-vec2-index-wr-no-unroll.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/vs-loop-complex-no-unroll.shader_test"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+acc0e009d0
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2048217950 to 2048227639 (+0%)

--===============2261722473965393107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1697 targets, 40 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2f2957efa1684430df9e3dadf06ae927dcf61310"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 89 Local 8 Mirrors 0 Missed 81 Current 463 (8% match, 85% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1131 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: Running task 1132 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 1141 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_fetch)
NOTE: Running task 1149 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: Running task 1152 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 1181 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_fetch)
NOTE: Running task 1186 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_fetch)
NOTE: Running task 1198 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_fetch)
NOTE: Running task 1203 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: Running task 1204 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: Running task 1205 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: Running task 1206 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: Running task 1231 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_fetch)
NOTE: Running task 1298 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_write_config)
NOTE: Running task 1357 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_write_config)
NOTE: Running task 1386 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: Running task 1439 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Started
NOTE: Running task 1496 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: Running task 1523 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: Running task 1524 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: Running task 1525 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Succeeded
NOTE: Running task 1526 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: Running task 1527 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: Running task 1528 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 1529 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_unpack)
NOTE: Running task 1530 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.114-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_fetch: Started
NOTE: Running task 1531 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_unpack)
NOTE: Running task 1532 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: Running task 1533 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: Running task 1534 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_write_config: Started
NOTE: Running task 1535 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: Running task 1536 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Running task 1537 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_unpack)
NOTE: Running task 1538 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_22.3.3-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_fetch: Succeeded
NOTE: Running task 1539 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_unpack)
NOTE: Running task 1540 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_write_config: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: Running task 1541 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_unpack)
NOTE: Running task 1542 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.114-r0: task do_write_config: Succeeded
NOTE: Running task 1586 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1588 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_fetch)
NOTE: Running task 1590 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: Running task 1620 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_write_config: Succeeded
NOTE: Running task 1688 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_unpack: Started
NOTE: Running task 1740 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1751 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_fetch: Succeeded
NOTE: Running task 1774 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1787 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: recipe mesa-2_22.3.3-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: Running task 1788 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: Running task 1789 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1790 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: Running task 1791 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_unpack)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Started
NOTE: Running task 1792 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1793 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 1794 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: Running task 1795 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1796 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: Running task 1797 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1798 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: recipe libdrm-2.4.114-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: Running task 1799 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: Running task 1800 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: Running task 1801 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1802 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_patch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: Running task 1803 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1804 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure_ptest_base)
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: Running task 1805 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 1806 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_deploy_source_date_epoch)
NOTE: Running task 1807 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1808 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_configure)
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: Running task 1809 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1810 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1811 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1812 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1813 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_deploy_source_date_epoch)
NOTE: Running task 1814 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1815 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running task 1816 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1817 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_patch)
NOTE: Running task 1818 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Started
NOTE: Running task 1819 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_compile)
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1820 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_configure)
NOTE: Running task 1821 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 1822 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1823 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_configure)
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_patch: Succeeded
NOTE: Running task 1824 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 1825 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1826 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_configure)
NOTE: Running task 1827 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1828 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1829 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1830 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1831 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1832 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1833 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_unpack: Succeeded
NOTE: Running task 1834 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_configure: Succeeded
NOTE: Running task 1835 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_compile: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1836 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 1837 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_patch: Succeeded
NOTE: Running task 1838 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1839 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: Running task 1840 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1841 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1842 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_generate_toolchain_file: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1843 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile_ptest_base)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 82da922bf9bc2330f0e37545ce664d46f83e27db515d6f5e148660e3b901df93
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1844 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1845 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_install: Succeeded
NOTE: Running task 1846 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_populate_sysroot)
NOTE: Running task 1847 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1848 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_install)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Succeeded
NOTE: Running task 1849 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1850 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_package)
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1851 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1852 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package)
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_package: Succeeded
NOTE: Running task 1853 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1854 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package)
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Succeeded
NOTE: Running task 1855 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Failed
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1855 tasks of which 1740 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-src went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-dbg went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-ptest went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-staticdev went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-dev went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-doc went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-locale went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-markupsafe/2.1.1-r0/temp/log.do_packagedata.4150485
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata) failed with exit code '1'

--===============2261722473965393107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 68 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:2f2957efa1684430df9e3dadf06ae927dcf61310"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 88 Local 8 Mirrors 0 Missed 80 Current 460 (9% match, 85% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1131 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_fetch)
NOTE: Running task 1132 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_fetch)
NOTE: Running task 1141 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_fetch)
NOTE: Running task 1148 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_fetch)
NOTE: Running task 1151 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 1178 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_fetch)
NOTE: Running task 1183 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_fetch)
NOTE: Running task 1195 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_fetch)
NOTE: Running task 1200 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: Running task 1201 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_fetch)
NOTE: Running task 1202 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_fetch)
NOTE: Running task 1203 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_fetch)
NOTE: Running task 1225 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_fetch)
NOTE: Running task 1290 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_write_config)
NOTE: Running task 1349 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_write_config)
NOTE: Running task 1376 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1429 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: Running task 1485 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Started
NOTE: Running task 1533 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 1534 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_unpack)
NOTE: Running task 1535 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.114-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_fetch: Succeeded
NOTE: Running task 1536 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_unpack)
NOTE: Running task 1537 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: Running task 1538 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1539 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_unpack)
NOTE: Running task 1540 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.114-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_fetch: Started
NOTE: Running task 1541 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_unpack)
NOTE: Running task 1542 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: Running task 1543 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_unpack)
NOTE: Running task 1544 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_write_config: Started
NOTE: Running task 1545 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_unpack)
NOTE: Running task 1546 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Running task 1547 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_unpack)
NOTE: Running task 1548 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_fetch: Succeeded
NOTE: Running task 1549 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_unpack)
NOTE: Running task 1550 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_22.3.3-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_write_config: Started
NOTE: Running task 1560 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_unpack)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1561 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: Running task 1574 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1576 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_fetch)
NOTE: Running task 1577 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_write_config: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Started
NOTE: Running task 1657 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure_ptest_base)
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: Running task 1674 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_write_config: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: Running task 1745 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.114-r0: task do_unpack: Started
NOTE: Running task 1746 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1774 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: Running task 1775 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: recipe python3-mako-1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1776 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_unpack)
NOTE: Running task 1777 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1778 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_patch)
NOTE: Running task 1779 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_patch)
NOTE: Running task 1780 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1781 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: Running task 1782 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.17-r0: task do_unpack: Succeeded
NOTE: Running task 1783 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: Running task 1784 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_patch)
NOTE: Running task 1785 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_patch)
NOTE: recipe libxshmfence-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1786 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_unpack: Started
NOTE: Running task 1787 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.114-r0: task do_unpack: Succeeded
NOTE: Running task 1788 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_patch)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1789 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1790 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_patch)
NOTE: recipe python3-pygments-2.14.0-r0: task do_configure: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: Running task 1791 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 1792 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_compile)
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 1793 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: Running task 1794 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1795 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.11-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_patch: Started
NOTE: Running task 1796 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1797 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1798 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_deploy_source_date_epoch)
NOTE: Running task 1799 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1800 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1801 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1802 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1803 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_patch)
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running task 1804 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.114-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1805 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1806 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 1807 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1808 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_configure)
NOTE: Running task 1809 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_patch: Succeeded
NOTE: Running task 1810 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 1811 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1812 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: recipe libxshmfence-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1813 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1814 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_configure)
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1815 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1816 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1817 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1818 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1819 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_configure: Succeeded
NOTE: Running task 1820 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_unpack: Succeeded
NOTE: Running task 1821 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_compile: Succeeded
NOTE: Running task 1822 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_install)
NOTE: recipe mesa-2_22.3.3-r0: task do_unpack: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_patch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1823 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_patch)
NOTE: Running task 1824 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: Running task 1825 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1826 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1827 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile_ptest_base)
NOTE: Running task 1828 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_populate_lic: Started
NOTE: recipe mesa-2_22.3.3-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1829 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1830 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 82da922bf9bc2330f0e37545ce664d46f83e27db515d6f5e148660e3b901df93
NOTE: recipe piglit-1.0+gitrAUTOINC+acc0e009d0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1831 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_install: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1832 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_populate_sysroot)
NOTE: Running task 1833 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_package)
NOTE: recipe mesa-2_22.3.3-r0: task do_patch: Succeeded
NOTE: Running task 1834 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Succeeded
NOTE: Running task 1835 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install_ptest_base)
NOTE: recipe mesa-2_22.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1836 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_package)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1837 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_install)
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1838 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.4.bb:do_package)
NOTE: recipe python3-pygments-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1839 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.14.0.bb:do_package)
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Started
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_package: Succeeded
NOTE: Running task 1840 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Succeeded
NOTE: Running task 1841 of 1950 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Failed
NOTE: recipe python3-mako-1.2.4-r0: task do_package: Succeeded
NOTE: recipe python3-pygments-2.14.0-r0: task do_package: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_configure: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_configure: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_configure: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1841 tasks of which 1728 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-src went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-dbg went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-ptest went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-staticdev went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-dev went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-doc went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe-locale went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: QA Issue: Package version for package python3-markupsafe went backwards which would break package feeds (from 0:2.1.2-r0 to 0:2.1.1-r0) [version-going-backwards]
ERROR: python3-markupsafe-2.1.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-markupsafe/2.1.1-r0/temp/log.do_packagedata.4191813
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata) failed with exit code '1'

--===============2261722473965393107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+acc0e009d0
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+acc0e009d0
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+acc0e009d0
packages/core2-32-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+e300648a80-r0'])", added "piglit (['= 1.0+gitr0+acc0e009d0-r0'])"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+acc0e009d0
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+acc0e009d0
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+acc0e009d0
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+e300648a80-r0'])", added "piglit-dev (['= 1.0+gitr0+acc0e009d0-r0'])"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+acc0e009d0
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+acc0e009d0
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/cl/program/execute/non-entry-block-alloca.cl /usr/lib/piglit/tests/spec/glsl-1.10/execution/variable-indexing/vs-output-array-vec2-index-wr-no-unroll.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/vs-loop-complex-no-unroll.shader_test"

--===============2261722473965393107==--

